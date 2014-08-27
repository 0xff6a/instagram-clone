class PostNotifier

	def self.trigger_with(message)
		Pusher.trigger(	'user_notifications', 
										'post-added', 
										{ message: message} )
	end

end