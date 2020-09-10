var express = require('express');
var router = express.Router();
var playRouter = require('./player');

/* GET home page. */
router.get('/', function(req, res, next) {
  var hostUrl = req.get('host');
  console.log(hostUrl);
  res.render('index', { hostUrl: hostUrl });
});

module.exports = router;
