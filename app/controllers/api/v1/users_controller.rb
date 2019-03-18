# require 'pry'
class Api::V1::UsersController < ApplicationController

before_action :authenticate_request!, only: [:profile]

  def index
    @users = User.all
    render json: @users
  end

  def profile
    @user = User.find(@current_user.id)
    render json: @user
  end

  def create
    user = User.new(user_params)
     if user.save
       auth_token = JsonWebToken.encode({user_id: @user.id})
       render json: {status: 'User created successfully'}, status: 201
     else
       render json: {error: user.errors.full_messages }, status:
       :bad_request
     end
  end

  def login
    user = User.find_by(email: params[:email].to_s.downcase)
    if user && user.authenticate(params[:password])
      auth_token = JsonWebToken.encode({user_id: user.id})
      render json: {auth_token: auth_token, user: user}, status: 201
    else
      render json: {error: 'Invalid username or password'}, status:
      :unauthorized
    end
  end


  private
  def user_params
    params.permit(:email, :password)
  end

end
