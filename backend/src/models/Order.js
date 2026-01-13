const mongoose = require('mongoose');

const orderItemSchema = new mongoose.Schema(
  {
    product: { type: mongoose.Schema.Types.ObjectId, ref: 'Product', required: true },
    name: { type: String, required: true },
    price: { type: Number, required: true },
    qty: { type: Number, required: true }
  },
  { _id: false }
);

const orderSchema = new mongoose.Schema(
  {
    user: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
    items: { type: [orderItemSchema], required: true },
    phone: { type: String, default: '' },
    address: { type: String, default: '' },
    status: { type: String, enum: ['pending', 'paid', 'delivered', 'cancelled'], default: 'pending' },
    subtotal: { type: Number, required: true },
    delivery: { type: Number, default: 0 },
    tax: { type: Number, default: 0 },
    total: { type: Number, required: true }
  },
  { timestamps: true }
);

module.exports = mongoose.model('Order', orderSchema);
