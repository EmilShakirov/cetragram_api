class CreateImage
  include Interactor

  delegate :params, :user, to: :context
  delegate :images, to: :user

  def call
    context.fail! if image.invalid?
  end

  private

  def image
    context.image = images.create(params)
  end
end
