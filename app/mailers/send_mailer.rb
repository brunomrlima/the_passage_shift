class SendMailer < ApplicationMailer
  layout 'mailer'

  def joined_work_event(user_id, work_event_id)
    @user = User.find(user_id)
    @work_event = WorkEvent.find(work_event_id)
    start_time = @work_event.start_time.strftime("%a %^b-%d @ %H:%M")
    mail(to: @user.email, subject: "#{start_time} | #{@work_event.title}")
  end

  def removed_work_event(user_id, work_event_id)
    @user = User.find(user_id)
    @work_event = WorkEvent.find(work_event_id)
    start_time = @work_event.start_time.strftime("%a %^b-%d @ %H:%M")
    mail(to: @user.email, subject: "[REMOVED] #{start_time} | #{@work_event.title}")
  end

  def send_work_event_help(user_id)
    @work_events = WorkEvent.where({start_time: DateTime.now..DateTime.tomorrow.end_of_day}).order(:start_time)
    @user = User.find(user_id)
    mail(to: @user.email, subject: "[HELP] Consider the Following Work Events")
  end
end