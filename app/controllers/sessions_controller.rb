class SessionsController < ApplicationController
    def omniauth
        user = User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.username = auth['info']['name']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(16)
        end

        if user.valid?
            session[:user_id] = user.id
            redirect_to new_recipe_path
        else
            flash[:message] = user.errors.full_messages.join("")
            redirect_to recipes_path
        end
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end
