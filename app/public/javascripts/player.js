var player;

function onYouTubeIframeAPIReady() {
	player = new YT.Player('player', {
		height: '360',
		width: '640',
		videoId: v,
		playerVars: {
			'listType': 'playlist',
			'list': list
		},
		events: {
			'onReady': onPlayerReady,
			'onStateChange': onPlayerStateChange
		}
	});
}

function onPlayerReady(event) {
	event.target.playVideo();
}

var done = false;
function onPlayerStateChange(event) {
	// nothing yet
}
function stopVideo() {
	player.stopVideo();
}