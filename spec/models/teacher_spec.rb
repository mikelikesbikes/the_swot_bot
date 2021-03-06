require 'spec_helper'

describe Teacher do

	before do
		FactoryGirl.create(:teacher)
	end

	it { should validate_presence_of(:title) }
	it { should validate_presence_of(:email) }
	it { should validate_uniqueness_of(:email) }

	it { should have_one(:identity) }
	it { should have_many(:courses) }
	it { should have_many(:enrollments) }
	it { should have_many(:students) }
	it { should have_many(:assignments) }
	it { should have_many(:phone_numbers) }
	it { should have_many(:announcements) }
end
