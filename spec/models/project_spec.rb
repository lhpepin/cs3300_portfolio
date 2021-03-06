require "rails_helper"

RSpec.describe 'Project', type: :model do

  #testing to ensure project validation with description and title testing as well as a valid project
  context "validations tests" do
    let(:user){ login_user }

    it "ensures the description is present" do
      project = Project.new(description: "Content of the description")
      expect(project.valid?).to eq(false)
    end

    it "ensures the title is present" do
        project = Project.new(title: "Title")
        expect(project.valid?).to eq(false)
    end
    
    it "should be able to save project" do
      project = Project.new(title: "Title", description: "Some description content goes here")
      expect(project.save).to eq(true)
    end
  end

  #create three projects with test parameters and make sure they all appear in the database
  context "scopes tests" do
    let(:user){ login_user }
    let(:params) { { title: "Title", description: "some description" } }
    
    before(:each) do
      Project.create(params)
      Project.create(params)
      Project.create(params)
    end

    it "should return all projects" do
      expect(Project.count).to eq(3)
    end
  end
end

