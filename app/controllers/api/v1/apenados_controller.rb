module Api
  module V1
    class ApenadosController < ApplicationController
       def index
         @apenados = current_user.unidade.apenados
       end
    end
  end
end