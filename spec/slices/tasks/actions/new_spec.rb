# frozen_string_literal: true

require "hanami_helper"

RSpec.describe Tasks::Actions::New, :db do
  subject(:action) { described_class.new }

  describe "#call" do
    it "answers 200 OK status" do
      response = action.call Hash.new
      expect(response.status).to eq(200)
    end
  end
end
