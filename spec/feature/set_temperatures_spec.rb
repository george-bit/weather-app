require 'rails_helper'

RSpec.feature 'Set Temperatures' do
  scenario 'User can update temperatures for' do
    when_i_visit_the_set_temperatures_page
    then_i_can_see_the_relevant_page_content

    when_i_fill_in_the_temperatures
    and_i_submit
    then_i_should_return_to_the_home_page
  end

  def when_i_visit_the_set_temperatures_page
    visit '/set-temperatures'
  end

  def then_i_can_see_the_relevant_page_content
    expect(page).to have_content "Input your temperature thresholds to define 'Cold', 'Warm' and 'Hot'"
  end

  def when_i_fill_in_the_temperatures
    fill_in :max_cold_temp, with: '13'
    fill_in :min_hot_temp, with: '26'

  end

  def and_i_submit
    click_button 'Submit'
  end

  def then_i_should_return_to_the_home_page
    expect(page).to have_current_path(root_path)
  end
end
