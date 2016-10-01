require "shrine"
require "shrine/storage/file_system"
require "shrine/storage/uploadcare"

uploadcare_options = {
  public_key:  ENV["UPLOADCARE_PUBLIC_KEY"],
  private_key: ENV["UPLOADCARE_SECRET_KEY"]
}

storages = if Rails.env.production?
  {
    cache: Shrine::Storage::Uploadcare.new(**uploadcare_options),
    store: Shrine::Storage::Uploadcare.new(**uploadcare_options)
  }
else
  {
    cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"),
    store: Shrine::Storage::FileSystem.new("public", prefix: "uploads/store")
  }
end

Shrine.storages = storages
