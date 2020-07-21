class SendMailer < ApplicationMailer
  layout 'bootstrap-mailer'

  def joined_work_event(user_id, work_event_id)
    @user = User.find(user_id)
    @work_event = WorkEvent.find(work_event_id)
    start_time = @work_event.start_time.strftime("%a %^b-%d @ %H:%M")
    make_bootstrap_mail(to: @user.email, subject: "#{start_time} | #{@work_event.title}")
  end
end