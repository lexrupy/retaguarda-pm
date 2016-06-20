module Api
  module V1
    class OposController < ApplicationController
      def index
        @opos = current_user.unidade.opos.where("? between (data_inicio - interval '1 day') and data_fim", Date.today);
      end
    end
  end
end