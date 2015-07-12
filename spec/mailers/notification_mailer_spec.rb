require "rails_helper"

RSpec.describe NotificationMailer, type: :mailer do
  
  describe '#notify' do
    let(:user) { create(:user) }
    let(:notification) { create(:notification) }
    let!(:browser_info) {create(:browser_info, notification_id: notification.id)}
    
    let(:mail) { NotificationMailer.notify(user, notification) }
 
    it 'renders the subject' do
      expect(mail.subject).to eql("WMB nova notificacão [#{notification.project.name}] [log]")
    end
 
    it 'renders the receiver email' do
      expect(mail.to).to eql([user.email])
    end
 
    it 'assigns @email' do
      expect(mail.body.encoded).to match(user.email)
    end

  end
end
