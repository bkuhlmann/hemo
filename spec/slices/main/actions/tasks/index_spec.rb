# frozen_string_literal: true

require "hanami_helper"

RSpec.describe Main::Actions::Tasks::Index do
  subject(:action) { described_class.new }

  describe "#call" do
    it "answers 200 OK status" do
      Test::Factory[:task]
      response = action.call Hash.new

      expect(response.status).to eq(200)
    end
  end
end
