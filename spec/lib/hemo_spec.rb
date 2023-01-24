# frozen_string_literal: true

require "hemo"
require "spec_helper"

RSpec.describe Hemo do
  describe ".htmxify" do
    it "answers hash with mixed attributes" do
      attributes = described_class.htmxify name: "test", hx: {get: "/tasks", trigger: "click"}
      expect(attributes).to eq(name: "test", "hx-get" => "/tasks", "hx-trigger" => "click")
    end

    it "answers hash with no HTMX attributes" do
      attributes = described_class.htmxify name: "test"
      expect(attributes).to eq(name: "test")
    end

    it "answers hash with empty HTMX attributes removed" do
      attributes = described_class.htmxify name: "test", hx: {}
      expect(attributes).to eq(name: "test")
    end

    it "answers empty hash with no attributes" do
      attributes = described_class.htmxify
      expect(attributes).to eq({})
    end
  end
end
