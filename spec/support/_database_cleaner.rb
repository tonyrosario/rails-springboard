# See:
# http://platformonrails.wordpress.com/2013/02/27/a-path-to-fast-and-honest-tests-rspec-and-database-cleaner
# http://devblog.avdi.org/2012/08/31/configuring-database_cleaner-with-rails-rspec-capybara-and-selenium/
# http://www.bignerdranch.com/blog/reasonable-rspec-config-for-clean-and-slightly-faster-specs/
# http://stackoverflow.com/questions/10904996/difference-between-truncation-transaction-and-deletion-database-strategies

require "database_cleaner"

RSpec.configure do |config|
  config.use_transactional_fixtures = false

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.before(:all) do
    DatabaseCleaner.start
  end

  config.after(:all) do
    DatabaseCleaner.clean
  end
end
