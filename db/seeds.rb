super_user = User.create!(name: 'Rodrigo Toledo', username: 'rtoledo', email: 'rodrigo@rtoledo.inf.br', password: 'password', password_confirmation: 'password')
20.times do
  user = User.create!(name: Faker::Name.name_with_middle, username: Faker::Internet.username, email: Faker::Internet.email, password: 'password', password_confirmation: 'password')
  conversation = Conversation.create
  ConversationUser.create!(user_id: super_user.id, conversation_id: conversation.id)
  ConversationUser.create!(user_id: user.id, conversation_id: conversation.id)
  10.times.each do
    rand(6).times do
      Message.create!(user_id: user.id, message: Faker::Lorem.sentences.join(' '), conversation_id: conversation.id)
      rand(5).times do
        Message.create!(user_id: super_user.id, message: Faker::Lorem.sentences.join(' '), conversation_id: conversation.id)
      end
    end
  end
end