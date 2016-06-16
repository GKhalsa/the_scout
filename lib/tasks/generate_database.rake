namespace :generate do
  desc "sets up initial database"
  task database: :environment do
    ItemRunner.generate_database
  end

  desc "refreshed database"
  task refresh: :environment do
    ItemRunner.reset_database
  end
end
