# frozen_string_literal: true

require "hanami_helper"
require "htmx"

RSpec.describe Tasks::Actions::Index, :db do
  subject(:action) { described_class.new }

  describe "#call" do
    before { Factory[:task] }

    it "answers 200 OK status" do
      response = action.call Hash.new
      expect(response.status).to eq(200)
    end

    it "answers HTMX Push URL response header when search query is blank" do
      response = Rack::MockRequest.new(action).get "/tasks",
                                                   "HTTP_HX_TRIGGER" => "search",
                                                   params: {query: ""}

      expect(response.headers).to include("HX-Push-Url" => "/tasks")
    end

    it "answers no HTMX response headers when search query is filled" do
      response = Rack::MockRequest.new(action).get "/tasks",
                                                   "HTTP_HX_TRIGGER" => "search",
                                                   params: {query: "test"}

      headers = HTMX::Headers::Response.for(**response.headers)
      expect(headers).to eq(HTMX::Headers::Response.new)
    end
  end
end
