const express = require('express');
const cors = require('cors');
const helmet = require('helmet');
const morgan = require('morgan');
const rateLimit = require('express-rate-limit');

const authRoutes = require('./routes/authRoutes');
const productRoutes = require('./routes/productRoutes');
const orderRoutes = require('./routes/orderRoutes');
const { notFound, errorHandler } = require('./middleware/errorHandler');

function createApp() {
  const app = express();

  app.use(helmet());
  app.use(cors({ origin: process.env.CORS_ORIGIN || '*' }));
  app.use(express.json({ limit: '1mb' }));
  app.use(morgan('dev'));

  app.use(
    rateLimit({
      windowMs: 15 * 60 * 1000,
      limit: 300,
      standardHeaders: true,
      legacyHeaders: false
    })
  );

  app.get('/', (req, res) => {
    res.json({
      name: 'TasteHub API',
      status: 'ok',
      version: '1.0.0',
      endpoints: {
        auth: '/api/auth',
        products: '/api/products',
        orders: '/api/orders'
      }
    });
  });

  app.use('/api/auth', authRoutes);
  app.use('/api/products', productRoutes);
  app.use('/api/orders', orderRoutes);

  app.use(notFound);
  app.use(errorHandler);

  return app;
}

module.exports = { createApp };
