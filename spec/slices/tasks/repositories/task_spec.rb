# frozen_string_literal: true

require "hanami_helper"

RSpec.describe Tasks::Repositories::Task, :db do
  subject(:repository) { described_class.new }

  let(:task) { Factory[:task] }

  describe "#find" do
    it "answers record by ID" do
      expect(repository.find(task.id)).to eq(task)
    end

    it "answers nil for unknown ID" do
      expect(repository.find(13)).to be(nil)
    end
  end

  describe "#find_by_description" do
    it "answers record by description" do
      task = Factory[:task, description: "This is a test"]
      expect(repository.find_by_description("this")).to contain_exactly(task)
    end

    it "answers empty array unknown description" do
      expect(repository.find_by_description(13)).to eq([])
    end
  end

  describe "#all" do
    it "answers all records" do
      task
      expect(repository.all).to contain_exactly(task)
    end

    it "answers empty array when records don't exist" do
      expect(repository.all).to eq([])
    end
  end
end
