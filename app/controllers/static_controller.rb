class StaticController < ApplicationController
  def home
    render html: 'root'
  end
end
