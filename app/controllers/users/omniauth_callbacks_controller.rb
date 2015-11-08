class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    puts 'start'
    @user = User.from_omniauth(request.env["omniauth.auth"])
    puts 'found user'

    puts 'signing in'
    puts sign_in(@user).inspect
    puts 'signed in'

    if @user.persisted?
      #this will throw if @user is not activated
      sign_in_and_redirect @user, :event => :authentication

      set_flash_message(:notice, :success, :kind => "Github") if is_navigational_format?
    else
      # session["devise.github_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end
