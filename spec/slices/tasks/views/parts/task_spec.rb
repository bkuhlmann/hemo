# frozen_string_literal: true

require "hanami_helper"

RSpec.describe Tasks::Views::Parts::Task do
  subject(:part) { described_class.new value: task }

  let(:task) { Factory.structs[:task, id: 1, user:] }
  let(:user) { Factory.structs[:user, name: "Jane Doe"] }

  describe "#assignee" do
    it "answers user" do
      expect(part.assignee).to eq("Jane Doe")
    end
  end

  describe "#checked" do
    it "answers checked when completed" do
      allow(task).to receive(:completed_at).and_return(Time.now.utc)
      expect(part.checked).to eq("checked")
    end

    it "answers nil when not completed" do
      expect(part.checked).to be(nil)
    end
  end

  describe "#css_class" do
    it "answers completed when completed" do
      allow(task).to receive(:completed_at).and_return(Time.now.utc)
      expect(part.css_class).to eq("task task-completed")
    end

    it "answers default class when not completed" do
      expect(part.css_class).to eq("task")
    end
  end
end
