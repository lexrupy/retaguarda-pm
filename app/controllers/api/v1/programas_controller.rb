module Api
  module V1
    class ProgramasController < ApplicationController
      def index
        @programas = current_user.unidade.programas.where("data_inicio <= ? and data_fim > ?", Date.today, Date.today)
      end
    end
  end
end