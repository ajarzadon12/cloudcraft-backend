class UserArchitecturesController < ApplicationController
  def get_architecture_list
    arch_names = UserArchitecture.where(user_id: params[:user_id]).pluck(:name)
    render json: { success: true, architecture_names: arch_names }
  end

  def load_architecture
    arch = UserArchitecture.where(user_id: params[:user_id], name: params[:name]).last
    if arch
      render json: { success: true, architecture_json: arch.architecture_json }
    else
      render json: { success: false }
    end
  end

  def save_architecture
    arch = UserArchitecture.where( user_id: params[:user_id],
                                   name: params[:name] ).last
    if arch.nil?
      arch = UserArchitecture.new( user_id: params[:user_id],
                                   name: params[:name],
                                   architecture_json: params[:architecture_json].to_unsafe_h )
    else
      arch.architecture_json = params[:architecture_json].to_unsafe_h
    end
    if arch.save
      render json: { success: true }
    else
      render json: { success: false }
    end
  end
end
