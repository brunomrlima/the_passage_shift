namespace :emails do
  desc 'Send Emails requesting help for event works that are not filled yet'
  task send_batch_helper_emails: :environment do
    puts 'Start sending emails...'
    work_events = WorkEvent.fetch_work_events_with_not_enough_helpers_today_and_tomorrow
    if work_events.present?
      User.find_each do |user|
        SendMailer.send_work_event_help(user.id, work_events).deliver_now
      end
    end
    puts 'Done!'
  end
end
