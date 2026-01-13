const mongoose = require('mongoose');

const productSchema = new mongoose.Schema(
  {
    name: { type: String, required: true, trim: true },
    subtitle: { type: String, trim: true },
    category: { type: String, required: true, trim: true },
    price: { type: Number, required: true },
    rating: { type: Number, default: 4.5 },
    imageUrl: { type: String, required: true },
    description: { type: String, default: '' },
    isActive: { type: Boolean, default: true }
  },
  { timestamps: true }
);

module.exports = mongoose.model('Product', productSchema);
