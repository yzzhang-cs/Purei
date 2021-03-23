var express = require('express');
var router = express.Router();
var playRouter = require('./player');

/* GET home page. */
router.get('/', function(req, res, next) {
  var hostUrl = req.get('host');
  res.render('index', { hostUrl: hostUrl });
});

// if the user replace the Youtube url, use the playerController to handle the arguments
router.get('/watch', playRouter.handle_replaced_url);

module.exports = router;
