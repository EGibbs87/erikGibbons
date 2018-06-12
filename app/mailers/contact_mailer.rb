class ContactMailer < ApplicationMailer
	default from: 'erik.w.gibbons@gmail.com'
	
	def contact(msg_hash)
		@inquiry = msg_hash['inquiry']
		@msg = msg_hash['msg']
		@email = msg_hash['email']
		@name = msg_hash['name']
		mail(to: @email, subject: @inquiry)
	end
end