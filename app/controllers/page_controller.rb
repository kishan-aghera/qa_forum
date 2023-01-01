# frozen_string_literal: true

class PageController < ApplicationController
  before_action :authenticate_user!, only: [:change]

  def home; end

  def change
    @current_user = current_user
  end
end
