class TableController < ApplicationController
  def index

    file = File.read("db/data.json")
    data = JSON.parse(file)

    @periodic_table = PeriodicTableService.new(data).call
  end
end
