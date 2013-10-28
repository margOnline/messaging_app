RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
  
  #ensure users are reset for correct functionality
  config.after(:each) { Warden.test_reset! }
end
