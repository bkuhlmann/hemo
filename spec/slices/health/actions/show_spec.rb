# frozen_string_literal: true

require "hanami_helper"

RSpec.describe Health::Actions::Show do
  subject(:action) { described_class.new }

  describe "#call" do
    it "answers green background" do
      expect(action.call({}).body.first).to include(
        %(<main style="background-color: green; height: 100vh;">\n</main>)
      )
    end
  end
end
