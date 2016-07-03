class DashboardController < ApplicationController
  def show
    @programas = current_user.unidade.programas.where("data_inicio <= ? and data_fim > ?", Date.today, Date.today)
  end
end
