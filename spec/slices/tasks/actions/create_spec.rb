# frozen_string_literal: true

require "hanami_helper"

RSpec.describe Tasks::Actions::Create, :db do
  subject(:action) { described_class.new }

  describe "#call" do
    let(:user) { Factory[:user] }

    it "answers 200 OK status with valid parameters" do
      response = action.call task: {user_id: user.id, description: "Test"}
      expect(response.status).to eq(200)
    end

    it "answers errors with invalid parameters" do
      response = action.call task: {}
      expect(response.body.to_s).to include("is missing")
    end
  end
end
