var express = require('express');
var router = express.Router();
var controller = require('../controllers/playerController');

router.get('/', controller.watch);

router.get('/link', controller.from_link);

router.get('/v', controller.from_id);

module.exports = router;
