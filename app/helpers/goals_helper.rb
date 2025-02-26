module GoalsHelper
  def has_goal?(goal)
    return false unless logged_in?

    # this resulted in n+1 problem
    # current_user.goals.include? goal
    #
    # this did not correct the n+1 problem, still created lots of requests
    # @goals ||= current_user.goals
    # @goals.include? goal
    #
    # this didn't work, resulted in undefinded method: includes
    # @user ||= User.find(session[:user_id]).includes(:goals)

    @goal_user ||= User.select(:id, :role).includes(:goals).select(:id).find(session[:user_id])
    @goal_user.goals.include? goal
  end
end
