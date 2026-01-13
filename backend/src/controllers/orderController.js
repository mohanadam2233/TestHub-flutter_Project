const Order = require('../models/Order');
const Product = require('../models/Product');
const asyncHandler = require('../utils/asyncHandler');

function calcTotals(items) {
  const subtotal = items.reduce((sum, it) => sum + it.price * it.qty, 0);
  const delivery = subtotal > 25 ? 0 : 2.99;
  const tax = +(subtotal * 0.05).toFixed(2);
  const total = +(subtotal + delivery + tax).toFixed(2);
  return { subtotal: +subtotal.toFixed(2), delivery, tax, total };
}

exports.create = asyncHandler(async (req, res) => {
  const { items, phone, address } = req.body || {};
  if (!Array.isArray(items) || items.length === 0) {
    return res.status(400).json({ message: 'Items are required' });
  }

  // Validate items against DB (price/name snapshot)
  const normalized = [];
  for (const it of items) {
    const productId = it.productId || it.product || it.id;
    const qty = Number(it.qty || 1);
    if (!productId || !Number.isFinite(qty) || qty <= 0) {
      return res.status(400).json({ message: 'Invalid cart item' });
    }

    const p = await Product.findById(productId);
    if (!p || !p.isActive) {
      return res.status(400).json({ message: 'One or more products are invalid' });
    }

    normalized.push({
      product: p._id,
      name: p.name,
      price: p.price,
      qty
    });
  }

  const totals = calcTotals(normalized);

  const order = await Order.create({
    user: req.user.id,
    items: normalized,
    phone: (phone || '').toString().trim(),
    address: (address || '').toString().trim(),
    status: 'pending',
    ...totals
  });

  return res.status(201).json({ order });
});

exports.myOrders = asyncHandler(async (req, res) => {
  const orders = await Order.find({ user: req.user.id })
    .sort({ createdAt: -1 })
    .limit(100);

  return res.json({ items: orders });
});

exports.getOne = asyncHandler(async (req, res) => {
  const order = await Order.findOne({ _id: req.params.id, user: req.user.id });
  if (!order) return res.status(404).json({ message: 'Order not found' });
  return res.json({ item: order });
});
