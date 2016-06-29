module Api
  module V1
    class VisitasController < ApplicationController
      def index
        @visitas = current_user.unidade.visits.where("data_visita >= ?", Date.yesterday);
      end
    end
  end
end