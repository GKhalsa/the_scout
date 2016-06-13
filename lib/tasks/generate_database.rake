namespace :generate do
  desc "sets up initial database"
  task database: :environment do
    ItemRunner.generate_database
  end
end
