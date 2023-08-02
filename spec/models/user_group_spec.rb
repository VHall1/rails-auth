require 'rails_helper'

RSpec.describe UserGroup do
  let(:user) { create(:user) }
  let(:group) { create(:group) }
  let!(:user_group) { create(:user_group, user:, group:) }

  it 'correctly assigns users to groups' do
    expect(user.groups).to include(group)
  end

  it 'prevents users from being assigned to the same group twice' do
    user_group2 = build(:user_group, user:, group:)
    expect { user_group2.save! }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
