namespace :db do
  desc 'Full reset, populate fixtures data'

  task full_reset: :environment do
    system('rake db:drop db:create db:migrate')
  end
end
