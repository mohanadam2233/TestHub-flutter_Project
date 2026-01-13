require('dotenv').config();

const { createApp } = require('./app');
const { connectDB } = require('./config/db');

const PORT = process.env.PORT || 4000;

async function start() {
  if (!process.env.MONGO_URI) {
    throw new Error('MONGO_URI is missing in .env');
  }
  if (!process.env.JWT_SECRET) {
    throw new Error('JWT_SECRET is missing in .env');
  }

  await connectDB(process.env.MONGO_URI);

  const app = createApp();
  app.listen(PORT, () => {
    console.log(`TasteHub API running on http://localhost:${PORT}`);
  });
}

start().catch((err) => {
  console.error(err);
  process.exit(1);
});
