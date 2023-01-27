# frozen_string_literal: true

require "hanami_helper"

RSpec.describe Tasks::Actions::Patch, :db do
  subject(:action) { described_class.new }

  describe "#call" do
    let(:task) { Factory[:task] }

    it "answers 200 OK status with ID only" do
      response = action.call id: task.id
      expect(response.status).to eq(200)
    end

    it "answers 200 OK status with ID and complete date/time" do
      response = action.call id: task.id, task: {completed: "2023-01-27T22:50:37+00:00"}
      expect(response.status).to eq(200)
    end

    it "answers errors with no ID" do
      response = action.call id: nil
      expect(response.status).to eq(422)
    end
  end
end
