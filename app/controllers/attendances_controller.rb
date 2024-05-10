# app/controllers/attendances_controller.rb
class AttendancesController < ApplicationController
  before_action :authenticate_user!

  def new
    @event = Event.find(params[:event_id])
    @attendance = current_user.attendances.build(event_id: @event.id)
  end

  def create
    @event = Event.find(params[:event_id])
    @attendance = current_user.attendances.build(event_id: @event.id)
    if @attendance.save
      redirect_to @event, notice: "Inscription à l'événement réussie."
    else
      flash.now[:alert] = "Erreur lors de l'inscription à l'événement."
      render :new
    end
  end
end
