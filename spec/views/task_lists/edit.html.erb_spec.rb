require 'rails_helper'

RSpec.describe "task_lists/edit", type: :view do
  let(:task_list) {
    TaskList.create!(
      title: "MyString",
      description: "MyText"
    )
  }

  before(:each) do
    assign(:task_list, task_list)
  end

  it "renders the edit task_list form" do
    render

    assert_select "form[action=?][method=?]", task_list_path(task_list), "post" do

      assert_select "input[name=?]", "task_list[title]"

      assert_select "textarea[name=?]", "task_list[description]"
    end
  end
end
