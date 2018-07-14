class HogesController < ApplicationController
  def show
    authorize hoge
    render json: { hoge: { id: hoge.to_param, value: hoge.value } }
  end

  private

  def hoge
    @hoge ||= Hoge.find(params[:id])
  end
end
