$(document).ready(function() {

	var pusher = new Pusher('6bca74cbbfc434766acc');
	var channel = pusher.subscribe('user_notifications');

	channel.bind('post-added', function(broadcast) {

		var content = {
			message : broadcast.message,
			img_url : broadcast.img_url
		};

		var alert = Mustache.render($('#alert-content').html(), content);
		var img = Mustache.render($('#alert-img').html(), content);

		$('#pusher-alert div').remove();
		$('#pusher-alert').prepend(alert); 
		$('#pusher-image-holder').show();
		$('#pusher-images').prepend(img).fadeIn();
	
	});

});


