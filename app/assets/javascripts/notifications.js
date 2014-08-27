$(document).ready(function() {

	var pusher = new Pusher('6bca74cbbfc434766acc');
	var channel = pusher.subscribe('user_notifications');

	channel.bind('post-added', function(data) {
		
		$('#pusher-alert').prepend("<div class='alert alert-success' role='alert'><strong>" 
			+ data.message + "<strong></div>").slideDown();
		
		$('#pusher-alert div:gt(0)').fadeOut(function() {
			$(this).remove();
		});
	
	});

});


