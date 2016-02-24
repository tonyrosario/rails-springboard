unless Rails.env.production?
  puts "Cleaning db..."
  DatabaseCleaner.clean_with(:truncation)

  puts "Creating <your_model_here>"
end

puts "Done!"
