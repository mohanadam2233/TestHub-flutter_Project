const Product = require('../models/Product');
const asyncHandler = require('../utils/asyncHandler');

exports.list = asyncHandler(async (req, res) => {
  const { q, category } = req.query;
  const filter = { isActive: true };

  if (category) filter.category = category;
  if (q) {
    filter.$or = [
      { name: { $regex: q, $options: 'i' } },
      { subtitle: { $regex: q, $options: 'i' } },
      { category: { $regex: q, $options: 'i' } }
    ];
  }

  const items = await Product.find(filter)
    .sort({ createdAt: -1 })
    .limit(200);

  return res.json({ items });
});

exports.getOne = asyncHandler(async (req, res) => {
  const p = await Product.findById(req.params.id);
  if (!p || !p.isActive) return res.status(404).json({ message: 'Product not found' });
  return res.json({ item: p });
});
