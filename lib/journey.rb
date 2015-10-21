class Journey
  attr_reader :list_of_journeys, :history

  def initialize
    @list_of_journeys = {}
    @history = []
  end

  def set_entry_station(station)
    @list_of_journeys[:entry_station] = station.name
    @list_of_journeys[:exit_station] = nil
    @history << list_of_journeys.dup
  end

  def set_exit_station(station)
    @list_of_journeys[:exit_station] = station.name
    @history << list_of_journeys.dup
  end

  def check_in_use
    list_of_journeys[:entry_station] != nil
  end


end
