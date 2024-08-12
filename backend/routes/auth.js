var express = require('express');
const { login } = require('../controller/UserController');

const router = express.Router();

router.post('/login',login)
/* GET list user */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

module.exports = router;
