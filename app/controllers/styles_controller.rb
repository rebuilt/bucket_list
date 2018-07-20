class StylesController < ApplicationController
  def atoms
  end

  def molecules
  end

  def organisms
    @ideas = Idea.all
  end
end
