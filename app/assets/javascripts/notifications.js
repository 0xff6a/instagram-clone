$(document).ready(function() {

	var pusher = new Pusher('6bca74cbbfc434766acc');
	var channel = pusher.subscribe('user_notifications');

	channel.bind('post-added', function(data) {

		$('#pusher-alert div').remove();
		$('#pusher-alert').prepend("<div class='alert alert-success' role='alert'><strong>" 
			+ data.message + "<strong></div>"); 
		$('#pusher-image-holder').show();
		$('#pusher-images').prepend("<div class='col-xs-3 col-md-2'><img src=" 
			+ data.img_url + "</img></div>").fadeIn();
	
	});

});


