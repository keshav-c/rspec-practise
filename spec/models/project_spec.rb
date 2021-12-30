require 'rails_helper'

RSpec.describe Project, type: :model do
  it "does not allow duplicate project names per user" do
    user = User.create(
      first_name: "Ram",
      last_name: "Chandra",
      email: "r@c.c",
      password: "password"
    )
    user.projects.create(name: "Test Project")
    new_project = user.projects.build(name: "Test Project")
    new_project.valid?
    expect(new_project.errors[:name]).to include("has already been taken")
  end

  it "allows two users to share a project name" do
    user = User.create(
      first_name: "Ram",
      last_name: "Chandra",
      email: "r@c.c",
      password: "password"
    )
    user.projects.create(name: "Test Project")
    other_user = User.create(
      first_name: "Krishna",
      last_name: "Vasudev",
      email: "k@v.c",
      password: "password"
    )
    other_project = other_user.projects.build(name: "Test Project")
    expect(other_project).to be_valid
  end

  # The be_late matcher is not built in. It is created and can be used
  # because of the late? method (* That returns a boolean *) defined on
  # the Project class

  describe "late status" do
    it "is late when the due date is past today" do
      project = FactoryBot.create(:project_due_yesterday)
      expect(project).to be_late
    end

    it "is on time when the due date is today" do
      project = FactoryBot.create(:project_due_today)
      expect(project).not_to be_late
    end

    it "is on time when the due date is in the future" do
      project = FactoryBot.create(:project_due_tomorrow)
      expect(project).not_to be_late
    end
  end
end
