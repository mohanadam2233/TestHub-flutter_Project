const jwt = require('jsonwebtoken');

function auth(req, res, next) {
  const header = req.headers.authorization || '';
  const parts = header.split(' ');
  const type = parts[0];
  const token = parts[1];

  if (type !== 'Bearer' || !token) {
    return res.status(401).json({ message: 'Unauthorized (missing token)' });
  }

  try {
    const payload = jwt.verify(token, process.env.JWT_SECRET);
    req.user = payload;
    return next();
  } catch (err) {
    return res.status(401).json({ message: 'Unauthorized (invalid token)' });
  }
}

module.exports = { auth };
