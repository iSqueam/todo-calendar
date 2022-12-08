require 'rails_helper'

RSpec.describe "task_lists/index", type: :view do
  before(:each) do
    assign(:task_lists, [
      TaskList.create!(
        title: "Title",
        description: "MyText"
      ),
      TaskList.create!(
        title: "Title",
        description: "MyText"
      )
    ])
  end

  it "renders a list of task_lists" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  end
end
