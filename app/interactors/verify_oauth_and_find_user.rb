class VerifyOauthAndFindUser
  include Interactor::Organizer

  organize VerifyOauth, FindOrCreateUser
end
