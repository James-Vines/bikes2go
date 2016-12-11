class UserMailer < ApplicationMailer
	default from: "jimv76@googlemail.com"

	def contact_form(email, name, message)
		@name = name
		@email = email
		@message = message
			mail(:from => email,
				:to => 'jimv76@googlemail.com',
				:subject => "A new contact form message from #{name}")
	end
end
