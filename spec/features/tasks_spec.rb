# frozen_string_literal: true

require "hanami_helper"

RSpec.describe "Tasks", :db, :js, :web do
  let(:user) { Test::Factory[:user, name: "Jane Doe", email: "jdoe@example.com"] }
  let(:task) { Test::Factory[:task, user:, description: "A test task"] }
  let(:tasks_path) { Hanami.app["routes"].path :tasks }

  it "displays no tasks when there are none" do
    visit tasks_path
    expect(page).to have_content("Congratulations")
  end

  it "displays task" do
    task
    visit tasks_path
    expect(page).to have_content("A test task")
  end

  it "successfully creates a new task" do
    user
    visit tasks_path
    click_link "New"

    select "Jane Doe", from: "task_owner"
    fill_in "task_description", with: "This is a test"
    click_on "Save"

    expect(page).to have_content("This is a test")
  end

  it "fails to create task with errors" do
    user
    visit tasks_path
    click_link "New"

    select "Jane Doe", from: "task_owner"
    click_on "Save"

    expect(page).to have_content("must be filled")
  end

  it "returns to index when canceling new task" do
    visit tasks_path
    click_link "New"
    click_on "Cancel"
    sleep 0.5  # FIX: Workaround for HTMX delayed swap.

    expect(page).not_to have_content("Cancel")
  end

  it "successfully completes a task" do
    task
    visit tasks_path
    check "complete"

    expect(find(".task-completed").text).to include(task.description)
  end

  it "successfully edits a task" do
    task
    visit tasks_path
    click_link "Edit"
    fill_in "description", with: "An edited task"
    click_on "Save"

    expect(page).to have_content("An edited task")
  end

  it "is unable to edit a task with errors" do
    task
    visit tasks_path
    click_link "Edit"
    fill_in "description", with: nil
    click_on "Save"

    expect(page).to have_content("must be filled")
  end

  it "successfully destroys a task" do
    task
    visit tasks_path
    click_button "Delete"
    sleep 0.3  # FIX: Workaround for HTMX delayed swap.

    expect(page).not_to have_content(task.description)
  end
end
