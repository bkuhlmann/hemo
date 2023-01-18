# frozen_string_literal: true

require "hanami_helper"

RSpec.describe "Tasks", :db, :js, :web do
  let(:user) { Factory[:user, name: "Jane Doe", email: "jdoe@example.com"] }
  let(:task) { Factory[:task, user:, description: "A test task"] }
  let(:tasks_path) { Hanami.app["routes"].path :tasks_root }

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

    select "Jane Doe", from: "task[user_id]"
    fill_in "task[description]", with: "This is a test"
    click_button "Save"

    expect(page).to have_content("This is a test")
  end

  it "fails to create task with errors" do
    user
    visit tasks_path
    click_link "New"

    select "Jane Doe", from: "task[user_id]"
    click_button "Save"

    expect(page).to have_content("must be filled")
  end

  it "returns to index when canceling new task" do
    visit tasks_path
    click_link "New"
    click_link "Cancel"
    sleep 0.5  # For htmx swap delay.

    expect(page).to have_no_content("Cancel")
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
    fill_in "task[description]", with: "An edited task"
    click_button "Save"

    expect(page).to have_content("An edited task")
  end

  it "is unable to edit a task with errors" do
    task
    visit tasks_path
    click_link "Edit"
    fill_in "task[description]", with: nil
    click_button "Save"

    expect(page).to have_content("must be filled")
  end

  it "successfully destroys a task" do
    task
    visit tasks_path
    click_button "Delete"
    sleep 0.3  # For htmx swap delay.

    expect(page).to have_no_content(task.description)
  end
end
