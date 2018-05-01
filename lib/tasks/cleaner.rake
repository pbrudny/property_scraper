namespace :cleaner do
  desc 'Remove old loads'
  task remove_loads: :environment do
    old_loads = Load.where('created_at < ?', 5.days.ago)
    puts "* destroying #{old_loads.count} loads"
    old_loads.destroy_all
    puts '* done!'
  end
end

