# Manage a Project's contributors
class Projects::ContributorsController < Projects::BaseController
  before_action :authenticate

  def destroy
    @contributor = @project.contributors.find(params[:id])
    authorize! :remove_contributor, @contributor

    @project.contributors.destroy(current_user)

    redirect_to root_path, notice: _('You have left the project.')
  end

  private

  def authenticate
    authenticated?(
      web: _('To join this project'),
      email: _('Then you can join this project'),
      email_subject: _('Confirm your account on {{site_name}}',
                       site_name: site_name)
    )
  end
end
