class PostNotifier

	def self.trigger_with(message, img_url)
		Pusher.trigger(	'user_notifications', 
										'post-added', 
										{ message: message, 
											img_url: img_url } )
	end

end