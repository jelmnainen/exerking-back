require 'rails_helper'

RSpec.describe "exercises/index", type: :view do
  before(:each) do
    assign(:exercises, [
      Exercise.create!(
        :text => "Text"
      ),
      Exercise.create!(
        :text => "Text"
      )
    ])
  end

  it "renders a list of exercises" do
    render
    assert_select "tr>td", :text => "Text".to_s, :count => 2
  end
end
