# frozen_string_literal: true

require "hanami_helper"

RSpec.describe Tasks::Views::Scopes::Description do
  subject(:scope) { described_class.new locals:, rendering: view.new.rendering }

  let(:locals) { {content: "Test", error: {description: ["Danger!"]}} }

  let :view do
    Class.new Hanami::View do
      config.paths = SPEC_ROOT
      config.template = "placeholder"
    end
  end

  describe "#value" do
    it "answers value" do
      expect(scope.value).to eq("Test")
    end
  end

  describe "#message" do
    it "answers error message when error description exists" do
      expect(scope.message).to eq("Danger!")
    end

    it "answers nil when error description doesn't exist" do
      locals[:error] = {}
      expect(scope.message).to be(nil)
    end
  end
end
