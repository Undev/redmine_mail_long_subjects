Redmine::Plugin.register :redmine_mail_long_subjects do
  name 'Redmine mail long subjects'
  author 'nettsundere'
  description 'Redmine long subjects patch for redmine-1.4 mailer'
  version '0.0.1'
end

Dispatcher.to_prepare do
  Mailer.send(:include, RedmineMailLongSubjects::MailerPatch)
end
