# The first thing you need to configure is which modules you need in your app.
# The default is nothing which will include only core features (password encryption, login/logout).
# Available submodules are: :user_activation, :http_basic_auth, :remember_me,
# :reset_password, :session_timeout, :brute_force_protection, :activity_logging, :external
Rails.application.config.sorcery.submodules = [:external]

# Here you can configure each submodule's features.
Rails.application.config.sorcery.configure do |config|
  config.external_providers = [:facebook]

  config.facebook.key = ENV['facebook_key']
  config.facebook.secret = ENV['facebook_secret']
  config.facebook.callback_url = "https://banana-sundae.herokuapp.com/oauth/callback?provider=facebook"
  config.facebook.user_info_mapping = {:email => "email"}
  config.facebook.user_info_path = "me?fields=email"
  config.facebook.scope = "email"
  config.facebook.display = "popup"

  # --- user config ---
  config.user_config do |user|
    # -- core --
    # specify username attributes, for example: [:username, :email].
    # Default: `[:email]`
    #
    # user.username_attribute_names =

    # change *virtual* password attribute, the one which is used until an encrypted one is generated.
    # Default: `:password`
    #
    # user.password_attribute_name =

    # downcase the username before trying to authenticate, default is false
    # Default: `false`
    #
    # user.downcase_username_before_authenticating =

    # change default email attribute.
    # Default: `:email`
    #
    # user.email_attribute_name =

    # change default crypted_password attribute.
    # Default: `:crypted_password`
    #
    # user.crypted_password_attribute_name =

    # what pattern to use to join the password with the salt
    # Default: `""`
    #
    # user.salt_join_token =

    # change default salt attribute.
    # Default: `:salt`
    #
    # user.salt_attribute_name =

    # how many times to apply encryption to the password.
    # Default: 1 in test env, `nil` otherwise
    #
    user.stretches = 1 if Rails.env.test?

    # encryption key used to encrypt reversible encryptions such as AES256.
    # WARNING: If used for users' passwords, changing this key will leave passwords undecryptable!
    # Default: `nil`
    #
    # user.encryption_key =

    # use an external encryption class.
    # Default: `nil`
    #
    # user.custom_encryption_provider =

    # encryption algorithm name. See 'encryption_algorithm=' for available options.
    # Default: `:bcrypt`
    #
    # user.encryption_algorithm =

    # make this configuration inheritable for subclasses. Useful for ActiveRecord's STI.
    # Default: `false`
    #
    # user.subclasses_inherit_config =

    # -- remember_me --
    # How long in seconds the session length will be
    # Default: `604800`
    #
    # user.remember_me_for =

    # when true sorcery will persist a single remember me token for all
    # logins/logouts (supporting remembering on multiple browsers simultaneously).
    # Default: false
    #
    # user.remember_me_token_persist_globally =

    # -- user_activation --
    # the attribute name to hold activation state (active/pending).
    # Default: `:activation_state`
    #
    # user.activation_state_attribute_name =

    # the attribute name to hold activation code (sent by email).
    # Default: `:activation_token`
    #
    # user.activation_token_attribute_name =

    # the attribute name to hold activation code expiration date.
    # Default: `:activation_token_expires_at`
    #
    # user.activation_token_expires_at_attribute_name =

    # how many seconds before the activation code expires. nil for never expires.
    # Default: `nil`
    #
    # user.activation_token_expiration_period =

    # your mailer class. Required.
    # Default: `nil`
    #
    # user.user_activation_mailer =

    # when true sorcery will not automatically
    # email activation details and allow you to
    # manually handle how and when email is sent.
    # Default: `false`
    #
    # user.activation_mailer_disabled =

    # method to send email related
    # options: `:deliver_later`, `:deliver_now`, `:deliver`
    # Default: :deliver (Rails version < 4.2) or :deliver_now (Rails version 4.2+)
    #
    # user.email_delivery_method =

    # activation needed email method on your mailer class.
    # Default: `:activation_needed_email`
    #
    # user.activation_needed_email_method_name =

    # activation success email method on your mailer class.
    # Default: `:activation_success_email`
    #
    # user.activation_success_email_method_name =

    # do you want to prevent or allow users that did not activate by email to login?
    # Default: `true`
    #
    # user.prevent_non_active_users_to_login =

    # -- reset_password --
    # reset password code attribute name.
    # Default: `:reset_password_token`
    #
    # user.reset_password_token_attribute_name =

    # expires at attribute name.
    # Default: `:reset_password_token_expires_at`
    #
    # user.reset_password_token_expires_at_attribute_name =

    # when was email sent, used for hammering protection.
    # Default: `:reset_password_email_sent_at`
    #
    # user.reset_password_email_sent_at_attribute_name =

    # mailer class. Needed.
    # Default: `nil`
    #
    # user.reset_password_mailer =

    # reset password email method on your mailer class.
    # Default: `:reset_password_email`
    #
    # user.reset_password_email_method_name =

    # when true sorcery will not automatically
    # email password reset details and allow you to
    # manually handle how and when email is sent
    # Default: `false`
    #
    # user.reset_password_mailer_disabled =

    # how many seconds before the reset request expires. nil for never expires.
    # Default: `nil`
    #
    # user.reset_password_expiration_period =

    # hammering protection, how long in seconds to wait before allowing another email to be sent.
    # Default: `5 * 60`
    #
    # user.reset_password_time_between_emails =

    # access counter to a reset password page attribute name
    # Default: `:access_count_to_reset_password_page`
    #
    # user.reset_password_page_access_count_attribute_name =

    # -- magic_login --
    # magic login code attribute name.
    # Default: `:magic_login_token`
    #
    # user.magic_login_token_attribute_name =


    # expires at attribute name.
    # Default: `:magic_login_token_expires_at`
    #
    # user.magic_login_token_expires_at_attribute_name =


    # when was email sent, used for hammering protection.
    # Default: `:magic_login_email_sent_at`
    #
    # user.magic_login_email_sent_at_attribute_name =


    # mailer class. Needed.
    # Default: `nil`
    #
    # user.magic_login_mailer_class =


    # magic login email method on your mailer class.
    # Default: `:magic_login_email`
    #
    # user.magic_login_email_method_name =


    # when true sorcery will not automatically
    # email magic login details and allow you to
    # manually handle how and when email is sent
    # Default: `true`
    #
    # user.magic_login_mailer_disabled =


    # how many seconds before the request expires. nil for never expires.
    # Default: `nil`
    #
    # user.magic_login_expiration_period =


    # hammering protection, how long in seconds to wait before allowing another email to be sent.
    # Default: `5 * 60`
    #
    # user.magic_login_time_between_emails =

    # -- brute_force_protection --
    # Failed logins attribute name.
    # Default: `:failed_logins_count`
    #
    # user.failed_logins_count_attribute_name =

    # This field indicates whether user is banned and when it will be active again.
    # Default: `:lock_expires_at`
    #
    # user.lock_expires_at_attribute_name =

    # How many failed logins allowed.
    # Default: `50`
    #
    # user.consecutive_login_retries_amount_limit =

    # How long the user should be banned. in seconds. 0 for permanent.
    # Default: `60 * 60`
    #
    # user.login_lock_time_period =

    # Unlock token attribute name
    # Default: `:unlock_token`
    #
    # user.unlock_token_attribute_name =

    # Unlock token mailer method
    # Default: `:send_unlock_token_email`
    #
    # user.unlock_token_email_method_name =

    # when true sorcery will not automatically
    # send email with unlock token
    # Default: `false`
    #
    # user.unlock_token_mailer_disabled = true

    # Unlock token mailer class
    # Default: `nil`
    #
    # user.unlock_token_mailer = UserMailer

    # -- activity logging --
    # Last login attribute name.
    # Default: `:last_login_at`
    #
    # user.last_login_at_attribute_name =

    # Last logout attribute name.
    # Default: `:last_logout_at`
    #
    # user.last_logout_at_attribute_name =

    # Last activity attribute name.
    # Default: `:last_activity_at`
    #
    # user.last_activity_at_attribute_name =

    # How long since last activity is the user defined logged out?
    # Default: `10 * 60`
    #
    # user.activity_timeout =

    # -- external --
    # Class which holds the various external provider data for this user.
    # Default: `nil`
    #
    user.authentications_class = Authentication

    # User's identifier in authentications class.
    # Default: `:user_id`
    #
    # user.authentications_user_id_attribute_name =

    # Provider's identifier in authentications class.
    # Default: `:provider`
    #
    # user.provider_attribute_name =

    # User's external unique identifier in authentications class.
    # Default: `:uid`
    #
    # user.provider_uid_attribute_name =
  end

  # This line must come after the 'user config' block.
  # Define which model authenticates with sorcery.
  config.user_class = 'User'
end
