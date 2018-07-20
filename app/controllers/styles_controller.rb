class StylesController < ApplicationController
  def atoms
  end

  def molecules
    @ideas = Idea.all
  end

  def organisms
    @ideas = Idea.all
  end
end
