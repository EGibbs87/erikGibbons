class ContactMailer < ApplicationMailer
	default from: 'erik@erikgibbons.com'
	
	def contact(msg_hash)
		@inquiry = msg_hash['inquiry']
		@msg = msg_hash['msg']
		@email = msg_hash['email']
		@name = msg_hash['name']
		mail(to: "erik@erikgibbons.com", subject: @inquiry)
	end
end