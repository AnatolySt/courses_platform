require 'factory_bot_rails'

User.create(email: 'admin@test.com', password: 'qwerty')
FactoryBot.create_list(:course, 3, :with_groups)