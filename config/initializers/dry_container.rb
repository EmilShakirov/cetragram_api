class Container
  extend Dry::Container::Mixin
end

Container.register(:imgur_session, memoize: true) do
  Imgurapi::Session.new(
    access_token: ENV["IMGUR_ACCESS_TOKEN"],
    client_id: ENV["IMGUR_ID"],
    client_secret: ENV["IMGUR_SECRET"],
    refresh_token: ENV["IMGUR_REFRESH_TOKEN"]
  )
end
