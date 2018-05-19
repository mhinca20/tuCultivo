class ReportMailer < ApplicationMailer
    default from: "tucultivo1997@gmail.com"
    
    def sample_email(user)
        @user = user
        mail(to: user, subject: 'Sample Email')
    end
end
