class TableController < ApplicationController
  
    def index
        data = load_data
        @periodic_table = PeriodicTableService.new(data).build
    end

    def show
        element_key = params[:id]
        data        = load_data
        data[element_key] or not_found
        @element = PeriodicTableService.new(data).element element_key
    end

    private

        def load_data
            data = JSON.parse(File.read("db/data.json"))
        end

        def not_found
            raise ActionController::RoutingError.new('Not Found')
        end

end
