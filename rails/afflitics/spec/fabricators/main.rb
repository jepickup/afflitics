Fabricator(:test_user, :from => :user) do
  name 'Test User'
  email 'user@test.com'
  password 'please'
  password_confirmation 'please'
end

Fabricator(:affiliate_window_sub, :from => :subscription) do
end

Fabricator(:affiliate_window, :from => :network) do
  name 'Affiliate Window'
  after_build { |network| network.services << Fabricate(:affiliate_window_rest_1) }
end

Fabricator(:affiliate_window_rest_1, :from => :service) do
  url 'http://api.affiliatewindow.com/v3/AffiliateService?wsdl'
  type 'SOAP'
  after_build { |service| service.functions << Fabricate(:affiliate_window_rest_1_getClickStats) }
end

Fabricator(:affiliate_window_rest_1_getClickStats, :from => :function) do
  request_str 'get_click_stats'
  function_str 'getClickStats'
end
