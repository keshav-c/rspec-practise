require 'rails_helper'

RSpec.describe Note, type: :model do
  it "returns notes that match the search term" do
    user = User.create(
      first_name: "Ravi",
      last_name: "Ashwin",
      email: "r@a.c",
      password: "password"
    )
    project = user.projects.create(name: "Test Project")
    note1 = project.notes.create(
      message: "This is the first note.",
      user: user
    )
    note2 = project.notes.create(
      message: "This is the second note.",
      user: user
    )
    note3 = project.notes.create(
      message: "First, write me a lovely note.",
      user: user
    )
    expect(Note.search("first")).to include(note1, note3)    
    expect(Note.search("first")).not_to include(note2)    
  end
end
