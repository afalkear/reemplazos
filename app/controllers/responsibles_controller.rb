class ResponsiblesController < ApplicationController
  before_action :authenticate_user!

  def create
    r = Responsible.new(responsible_params)
    r.user_id = current_user.id

    respond_to do |format|
      if r.save
        format.json { render json: r, status: :created }
      else
        format.json { render json: r.errors.full_messages,
                      status: :unprocessable_entity
        }
      end
    end
  end

  private
  def responsible_params
    params.require(:responsible).permit(:name, :email)
  end
end
