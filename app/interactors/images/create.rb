module Images
  class Create
    include Interactor

    delegate :params, :image, :user, to: :context
    delegate :images, to: :user

    def call
      context.image = images.create(params)

      context.fail! if image.invalid?
    end
  end
end
