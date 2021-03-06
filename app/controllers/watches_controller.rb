class WatchesController < ApplicationController

  def index
    @watches = Watch.all
  end

  def show
    @watch = Watch.find(params[:wt_id])
  end

  def new
    @watch = Watch.new
  end

  def edit
    @watch = Watch.find(params[:wt_id])
  end

  def create
    @watch = Watch.new(watch_params)

    if @watch.save
      redirect_to @watch
    else
      render 'new'
    end
  end

  def update
    @watch = Watch.find(params[:wt_id])

    if @watch.update(watch_params)
      redirect_to @watch
    else
      render 'edit'
    end
  end

  def destroy
    @watch = Watch.find(params[:wt_id])
    @watch.destroy

    redirect_to watches_path
  end

  private
    def watch_params
      params.require(:watch).permit(:developer, :manufacturer, :model, :description, :year, :resolution, :diagonal, :screen_type, :color_screen, :dpi, :touchscreen, :multitouch, :cpu, :cores, :frequency, :gpu, :inner_mem, :access_mem, :ram, :cam, :megapixels, :photo_res, :autofocus, :video_rec, :video_res, :fps, :finder, :calls, :email, :sms, :mms, :wifi, :bluetooth, :nfc, :gps, :gyroscope, :accelerometer, :barometer, :thermometer, :compass, :chronograph, :pedometer, :pulse_sensor, :fitness_tracker, :wireless_charge, :fast_charge, :battery, :standby_time, :clock_time, :os, :online_service, :compatibility, :speaker, :mic, :color, :weight, :dimensions, :material, :protection)
    end
end
