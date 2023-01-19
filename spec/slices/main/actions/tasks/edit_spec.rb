# frozen_string_literal: true

require "hanami_helper"

RSpec.describe Main::Actions::Tasks::Edit do
  subject(:action) { described_class.new }

  describe "#call" do
    it "answers 200 OK status with valid parameters" do
      response = action.call id: Test::Factory[:task].id
      expect(response.status).to eq(200)
    end

    it "answers errors with invalid parameters" do
      response = action.call Hash.new
      expect(response.status).to eq(422)
    end
  end
end
