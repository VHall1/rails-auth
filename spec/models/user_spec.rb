require 'rails_helper'

RSpec.describe User do
  let(:user) { create(:user) }

  it 'formats emails before saving' do
    email = 'TeSt@eXaMpLe.CoM'
    user = create(:user, email:)

    expect(user.email).to eq(email.downcase)
  end

  it 'raises an error if user provides long username' do
    username = 'thisisaverylongusernameexamplethatshouldtriggeravalidationerror'
    user = build(:user, username:)

    expect { user.save! }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'hashes and populates the password_digest field' do
    expect(user.password_digest).not_to be_empty()
  end
end
