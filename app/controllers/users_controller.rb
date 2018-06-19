# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    redirect_to public_user_path unless user_signed_in?
  end

  def public; end
end
