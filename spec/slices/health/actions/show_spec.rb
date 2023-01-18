# frozen_string_literal: true

require "hanami_helper"

RSpec.describe Health::Actions::Show do
  subject(:action) { described_class.new }

  describe "#call" do
    it "answers 200 OK status with green background" do
      expect(action.call({})).to have_attributes(
        body: [%(<html><body style="background-color: green"></body></html>)],
        status: 200
      )
    end
  end
end
