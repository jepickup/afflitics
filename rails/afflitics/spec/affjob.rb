class AffJob

  @queue = :std_job

  attr_reader :network, :service, :configuration

  def self.perform( network, service, config = {} )

    @network = network
    @service = service

    @configuration = Hash.new
    
    config.each do |key, value|
      @configuration[key] = value
    end

  end

  def request
    ""
  end

end
