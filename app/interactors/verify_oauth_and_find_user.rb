class VerifyOauthAndFindUser
  include Interactor::Organizer

  organize VerifyOauth, FindUserByOauth, FindUserByEmail, CreateUser
end
