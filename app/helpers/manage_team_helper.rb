# This helper contains all functions associated with team management. 
# These include creating a new team, adding a new member to a team etc
# This helper is used by both sign_up_sheet controller and signup controller
module ManageTeamHelper

# Adds a user specified bu 'user' object to a team specified by 'team_id'
  def create_team_users(user, team_id)
#if user does not exist flash message
    if !user
      urlCreate = url_for :controller => 'users', :action => 'new'
      flash[:error] = "\"#{params[:user][:name].strip}\" is not defined. Please <a href=\"#{urlCreate}\">create</a> this user before continuing."
    end
#find the team with 'team_id' form database and add new user to team
    team = Team.find(team_id)
    team.add_member(user, team.parent_id)
  end
#check if the user specified by 'user' already belongs to team specified by 'team_id'
  def has_user(user, team_id)
    if TeamsUser.find_by_team_id_and_user_id(team_id, user.id)
      return true
    else
      return false
    end
  end

end