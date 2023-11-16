class Admin::DiariesController < ApplicationController
  
  def index
    @diaries = Diary.all
  end
  
end
