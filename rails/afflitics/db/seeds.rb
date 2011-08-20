puts 'Emptying database
'
Mongoid.master.collections.reject { |c| c.name =~ /^system/}.each(&:drop)


user = User.create! :name => 'Test User', :email => 'user@test.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << user.name

network = Network.create! :name => 'AffiliateWindow',
                          :services => [
                            {
                              :url       => "http://api.affiliatewindow.com/v3/AffiliateService?wsdl",
                              :type      => "SOAP",
                              :functions => [
                                {
                                  :request   => "get_click_stats",
                                  :function  => "getClickStats"
                                },
                                {
                                  :request   => "get_impression_stats",
                                  :function  => "getImpressionStats"
                                }
                             ]
                            }
                          ]
puts 'New network created: ' << network.name

subscription = Subscription.create!(:username => 'T', :password => 'P')
user.subscriptions.push(subscription)
network.subscriptions.push(subscription)

puts 'New subscription created: ' << subscription.username
