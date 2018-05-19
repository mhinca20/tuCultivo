# Preview all emails at http://localhost:3000/rails/mailers/report_mailer
class ReportMailerPreview < ActionMailer::Preview
    def sample_mail_preview
        ExampleMailer.sample_email(User.first)
    end
end
