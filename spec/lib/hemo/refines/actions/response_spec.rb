# frozen_string_literal: true

require "hanami_helper"

RSpec.describe Hemo::Refines::Actions::Response do
  using described_class

  subject(:response) { Hanami::Action::Response.new request:, config: {} }

  let :request do
    Rack::MockRequest.env_for("/").then { |env| Hanami::Action::Request.new env:, params: {} }
  end

  describe "#with" do
    it "answers response with given body and status" do
      expect(response.with(body: "Danger!", status: 400)).to have_attributes(
        body: ["Danger!"],
        status: 400
      )
    end

    it "answers itself" do
      expect(response.with(body: "Danger!", status: 400)).to be_a(Hanami::Action::Response)
    end
  end
end
