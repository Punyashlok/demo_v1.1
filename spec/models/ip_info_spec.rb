require "rails_helper"

RSpec.describe IpInfo, type: :model do
    describe "relationships" do
        it { is_expected.to belong_to :url }
    end
end

