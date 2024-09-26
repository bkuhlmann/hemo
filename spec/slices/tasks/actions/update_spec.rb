# frozen_string_literal: true

require "hanami_helper"

RSpec.describe Tasks::Actions::Update, :db do
  subject(:action) { described_class.new }

  describe "#call" do
    let(:task) { Factory[:task] }

    it "answers 200 OK status with user ID, description, and completed" do
      user = Factory[:user]
      response = action.call id: task.id,
                             task: {user_id: user.id, description: "Test", completed: "on"}
      expect(response.status).to eq(200)
    end

    it "answers 200 OK status with user ID and description only" do
      user = Factory[:user]
      response = action.call id: task.id, task: {user_id: user.id, description: "Test"}
      expect(response.status).to eq(200)
    end

    it "answers errors with missing description" do
      response = action.call id: task.id, task: {description: ""}
      expect(response.body.to_s).to include("must be filled")
    end

    it "answers error when given ID only" do
      response = action.call id: task.id
      expect(response.status).to eq(422)
    end
  end
end
