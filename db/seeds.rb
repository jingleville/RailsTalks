Chat.delete_all
Message.delete_all
User.delete_all

10.times do
  user = User.create! email: FFaker::Internet.email, password: 'paroll'
  puts "Created a new user: #{user.email}"
end

10.times do
	chat = Chat.create!(
	  name: FFaker::Book.title
	)
	puts "Created a chat: #{chat.name}"

	10.times do
		message = chat.messages.build(
			author: User.all.pluck(:email).map{|email| email.split('@')[0] }.sample,
			body: FFaker::CheesyLingo.sentence
		)
		message.save
	end
end