require "rails_helper"

RSpec.describe Url, type: :model do
    describe "relationships" do
        it { is_expected.to have_many :ip_infos }
    end

    describe "validations" do
        it { is_expected.to validate_presence_of(:long_url) }
        it { should_not allow_value("https://google.com").for(:long_url) }
    end
end