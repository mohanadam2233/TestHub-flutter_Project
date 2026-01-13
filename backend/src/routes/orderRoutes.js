const express = require('express');
const { create, myOrders, getOne } = require('../controllers/orderController');
const { auth } = require('../middleware/auth');

const router = express.Router();

router.use(auth);
router.post('/', create);
router.get('/', myOrders);
router.get('/:id', getOne);

module.exports = router;
