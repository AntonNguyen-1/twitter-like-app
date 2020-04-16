class UsersController < ApplicationController

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    user_id = params[:user_id]
    @user = User.find_by(id: user_id)
  end

  def follow
    following_user_id = params[:user_id]
    following_user_email = User.find_by(id: following_user_id).email

    if UsersHelper.user_following?(current_user, following_user_id)
      redirect_to "/users/#{following_user_id}", alert: 'Already following!'
    else
      following_user = build_followers(following_user_id, following_user_email)

      current_user.update!(following: following_user)
    end
  end

  def unfollow
    following_user_id = params[:user_id]

    if UsersHelper.user_following?(current_user, following_user_id)
      user_followers = current_user[:following].select { |follower| follower['user_id'] != following_user_id }

      current_user.update!(following: user_followers)
    else
      redirect_to "/users/#{following_user_id}", alert: 'You are not following this user'
    end
  end

  # GET /users/1/edit
  def edit
  end

  private

  def build_followers(following_user_id, following_user_email)
    current_user[:following].push({email: following_user_email, user_id: following_user_id})
  end

end
