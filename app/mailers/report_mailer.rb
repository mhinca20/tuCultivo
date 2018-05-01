class ReportMailer < ApplicationMailer
    default from: "tucultivo1997@gmail.com"
    
    def sample_email(user)
        @user = user
        mail(to: 'msierragallego@gmail.com', subject: 'Sample Email')
      end
end
