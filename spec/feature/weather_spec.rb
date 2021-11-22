require 'rails_helper'

RSpec.feature 'Weather forecast' do
  scenario 'User views homepage' do
    when_i_visit_the_weather_home_page
    then_i_can_see_the_page_content
  end

  def when_i_visit_the_weather_home_page
    visit '/'
  end

  def then_i_can_see_the_page_content
    expect(page).to have_content 'Input your postcode below for today’s temperature forecast'
  end
end
