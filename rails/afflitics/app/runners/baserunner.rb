class BaseRunner

  @queue = :base

  def perform(network, req, user_config = {})

    #Check user_config passed
    if user_config.empty?
      raise "UserConfigEmptyError"
    end

    #Fetch network id
    network_doc = Network.where(name: network).all.first

    if network_doc == nil
      raise "InvalidNetworkError"
    end

    #Pick a service
    service_doc = network_doc.services.all.first

    if service_doc == nil
      raise "InvalidServiceError"
    end

    #Map request to function
    function_doc = service_doc.functions.where(request_str: req).all.first

    if function_doc == nil
      raise "InvalidRequestError"
    end

  end
  
end
