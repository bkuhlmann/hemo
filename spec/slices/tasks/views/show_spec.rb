# frozen_string_literal: true

require "hanami_helper"

RSpec.describe Tasks::Views::Show, :db do
  subject(:view) { described_class.new }

  describe "#call" do
    let(:task) { Factory.structs[:task, id: 1, user:] }
    let(:user) { Factory.structs[:user, name: "Jane Doe"] }

    it "renders view" do
      expect(view.call(task:).to_s).to include(%(<li id="1"))
    end
  end
end
