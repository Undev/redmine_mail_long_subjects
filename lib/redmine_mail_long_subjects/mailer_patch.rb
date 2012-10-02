module RedmineMailLongSubjects
  module MailerPatch
    class << self
      def included(base)
        base.class_eval do
          alias_method_chain :create_mail, :subject_fix
        end
      end
    end

    def create_mail_with_subject_fix
      encoding = @subject.encoding.to_s.downcase
      @subject = Base64.encode64(@subject) \
                 .split \
                 .map {|line| "=?#{encoding}?B?#{line}?=\r\n" } \
                 .join

      create_mail_without_subject_fix
    end
  end
end
