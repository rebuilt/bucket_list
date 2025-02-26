module RolesHelper
  def can_edit?(idea)
    case current_user.role
    when 'admin' then true
    when 'registered' then current_user == idea.user
    else false
    end
  end
end
