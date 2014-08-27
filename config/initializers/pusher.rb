Pusher.app_id = ENV['PUSHER_APP_ID']
Pusher.key = Rails.application.secrets.pusher_public_key
Pusher.secret = Rails.application.secrets.pusher_secret_key