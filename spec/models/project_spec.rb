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
end
