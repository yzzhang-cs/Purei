exports.watch = function(req, res) {
    var query = req.query;
    res.render('../views/player/index.ejs', {query: query});
};

exports.from_link = function(req, res) {
    var link = req.query.link;
    var arr = link.split('/');
    var tail = arr[arr.length - 1];
    var location = "youtube/" + tail;
    // host/play/youtube/watch?v=xxxxxx.....
    res.redirect('/play/' + location);
}

exports.from_id = function(req, res) {
    var query = {};
    query.v = req.query.vid;
    query.list = req.query.lid;
    res.render('../views/player/index.ejs', {query: query});
}