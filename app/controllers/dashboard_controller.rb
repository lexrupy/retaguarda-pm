class DashboardController < ApplicationController
  def show
    @programas = Programa.where("data_inicio <= ? and data_fim > ?", Date.today, Date.today)
  end
end
