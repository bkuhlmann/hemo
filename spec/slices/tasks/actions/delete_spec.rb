# frozen_string_literal: true

require "hanami_helper"

RSpec.describe Tasks::Actions::Delete, :db do
  subject(:action) { described_class.new }

  describe "#call" do
    it "answers 200 OK status and blank body with valid parameters" do
      response = action.call id: Factory[:task].id
      expect(response).to have_attributes(status: 200, body: [""])
    end

    it "answers 422 Unprocessable Entity with invalid parameters" do
      response = action.call Hash.new
      expect(response.status).to eq(422)
    end
  end
end
