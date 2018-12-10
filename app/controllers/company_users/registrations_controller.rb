# frozen_string_literal: true
class CompanyUsers::RegistrationsController < Devise::RegistrationsController

  def new
    @company = Company.new
  super
  end 

def create
   
    @company = Company.new(name: params[:company_user][:company][:name])
    if @company.save
    params[:company_user][:company_id] = @company.id


    @project_timeline = ProjectTimeline.new
    @project_timeline.company_id = @company.id
    @project_timeline.save

    end

      build_resource(sign_up_params)
      resource.save
      yield resource if block_given?
      if resource.persisted?
        if resource.active_for_authentication?
          set_flash_message! :notice, :signed_up
          sign_up(resource_name, resource)
          respond_with resource, location: after_sign_up_path_for(resource)
        else
          set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
          expire_data_after_sign_in!
          respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end
      else
        clean_up_passwords resource
        set_minimum_password_length
        respond_with resource
      end
    end

  private

  def sign_up_params
    params.require(:company_user).permit(:email, :company_id, :password, :password_confirmation)
  end
 

end