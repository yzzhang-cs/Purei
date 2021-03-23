var express = require('express');
var router = express.Router();
var controller = require('../controllers/playerController');

// base url: host/play

// host/play/youtube/
router.get('/youtube/watch', controller.watch);

// host/play/link
router.get('/link', controller.from_link);

// host/play/v
router.get('/v', controller.from_id);

router.handle_replaced_url = controller.watch;

module.exports = router;
