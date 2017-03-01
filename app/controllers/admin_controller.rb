class AdminController < ApplicationController
  def index
    @users=User.all
    @options=Option.all
    @questions=Question.all
  end
end
