class Station

  attr_reader :name, :zone

  HASH = { 'Victoria' => 1, 'Euston' => 1, 'Barking' => 4, 'Upminster' => 6 }

  def initialize(name)
    raise "Invalid station" if HASH[name].nil?
    @name = name
    @zone = HASH[name]
  end

end
