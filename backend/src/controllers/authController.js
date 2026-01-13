const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const User = require('../models/User');
const asyncHandler = require('../utils/asyncHandler');

function signToken(user) {
  return jwt.sign(
    { id: user._id.toString(), email: user.email },
    process.env.JWT_SECRET,
    { expiresIn: process.env.JWT_EXPIRES_IN || '7d' }
  );
}

exports.register = asyncHandler(async (req, res) => {
  const { name, email, password } = req.body || {};

  const cleanName = (name || '').toString().trim();
  if (!cleanName || cleanName.length < 2) {
    return res.status(400).json({ message: 'Name is required' });
  }

  if (!email || typeof email !== 'string' || !email.includes('@')) {
    return res.status(400).json({ message: 'Invalid email' });
  }
  if (!password || typeof password !== 'string' || password.length < 6) {
    return res.status(400).json({ message: 'Password must be at least 6 characters' });
  }

  const exists = await User.findOne({ email: email.toLowerCase() });
  if (exists) {
    return res.status(409).json({ message: 'Email already registered' });
  }

  const salt = await bcrypt.genSalt(10);
  const passwordHash = await bcrypt.hash(password, salt);

  const user = await User.create({
    name: cleanName,
    email: email.toLowerCase().trim(),
    passwordHash,
  });

  const token = signToken(user);
  return res.status(201).json({
    token,
    user: { id: user._id, name: user.name, email: user.email },
  });
});


exports.login = asyncHandler(async (req, res) => {
  const { email, password } = req.body || {};

  if (!email || typeof email !== 'string' || !email.includes('@')) {
    return res.status(400).json({ message: 'Invalid email' });
  }
  if (!password || typeof password !== 'string') {
    return res.status(400).json({ message: 'Invalid password' });
  }

  const user = await User.findOne({ email: email.toLowerCase().trim() });
  if (!user) {
    return res.status(401).json({ message: 'Wrong email or password' });
  }

  const ok = await bcrypt.compare(password, user.passwordHash);
  if (!ok) {
    return res.status(401).json({ message: 'Wrong email or password' });
  }

  const token = signToken(user);
  return res.json({
    token,
    user: { id: user._id, name: user.name, email: user.email }
  });
});

exports.me = asyncHandler(async (req, res) => {
  const user = await User.findById(req.user.id).select('_id name email createdAt');
  if (!user) return res.status(404).json({ message: 'User not found' });
  return res.json({ user });
});
