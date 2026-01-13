function notFound(req, res, next) {
  res.status(404).json({ message: 'Route not found' });
}

// eslint-disable-next-line no-unused-vars
function errorHandler(err, req, res, next) {
  const status = err.statusCode || 500;
  res.status(status).json({
    message: err.message || 'Server error',
    stack: process.env.NODE_ENV === 'production' ? undefined : err.stack,
  });
}

module.exports = { notFound, errorHandler };
