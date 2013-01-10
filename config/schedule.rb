set :output, {:error => 'log/cron.log', :standard => 'log/cron.log'}

every 1.day, :at => '3:00' do
  command "cp /home/shaoshing/app/shared/sqlite3/production.sqlite3  /home/shaoshing/backup/sqlite3/`date +%Y.%m.%d-%H:%M`.sqlite3"
end
