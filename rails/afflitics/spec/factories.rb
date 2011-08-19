require 'factory_girl'

Factory.define :user do |u|
    u.name 'Test User'
    u.email 'user@test.com'
    u.password 'please'
    u.password_confirmation 'please'
end

