require 'addressable/uri'
require 'rest-client'

# bin/my_script.rb
def create_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.json'
  ).to_s

  puts RestClient.post(
    url,
    { user: { name: "Gizmo" } }
  )
end

def show_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/1.json'
  ).to_s

  puts RestClient.get(url)
end

def delete_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/2.json'
  ).to_s

  puts RestClient.delete(url)
end

def update_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/1.json'
  ).to_s

  puts RestClient.patch(url, { user: { email: "jeff@new.com" } })
end

def create_contact
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/contacts'
  ).to_s

  puts RestClient.post(url, { contact: { name: "jeffrey", email: "jeff@new.com", user_id: 5 } })
end

def delete_contact
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/contacts/5'
  ).to_s

  puts RestClient.delete(url)
end

def update_contact
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/contacts/4'
  ).to_s

  puts RestClient.patch(url, { contact: { email: "j@new.com" } })
end

def create_comment
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: 'users/5/comments'
  ).to_s

  puts RestClient.post(url, { comment: { content: "jeffrey is coolest"} })
end

def favorite_comment
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: 'contacts/1/favorite'
  ).to_s

  puts RestClient.patch(url, "nothing")
end

favorite_comment