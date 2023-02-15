class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
    @count = Schedule.count
    @today_date = Date.current
  end

  def new
    @schedule = Schedule.new
  end
 
  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title, :start_date, :end_date, :is_allday, :memo))
    if @schedule.save
      flash[:notice] = "新しいスケジュールを登録しました"
      redirect_to :schedules_index
    else
      flash[:alert] = "スケジュールの登録に失敗しました"
      render "schedules/new"
    end
  end
 
  def show
    @schedule = Schedule.find(params[:id])
  end
 
  def edit
    @schedule = Schedule.find(params[:id])
  end
 
  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(params.require(:schedule).permit(:title, :start_date, :end_date, :is_allday, :memo))
      flash[:notice] = "スケジュールを更新しました"
      redirect_to :schedules_index
    else
      flash[:alert] = "スケジュールの更新に失敗しました"
      render "schedules/edit"
    end
  end
 
  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    redirect_to :schedules_index
  end
end
