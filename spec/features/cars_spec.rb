require 'rails_helper'
require 'support/database_cleaner'

RSpec.feature "Cars", type: :feature, js: true do

  before :each do
      @car1 = Car.create!(
      make: Make.create!(make: 'Toyota'),
      model: Model.create!(model: 'Prius'),
      style: Style.create!(body_style: 'Extended Cab Pickup'),
      trim: Trim.create!(trim_level: 'XL'),
      year: 1985,
      colour: 'Coriander'
    )

    @car2 = Car.create!(
      make: Make.create!(make: 'Toyota'),
      model: Model.create!(model: 'Prius'),
      style: Style.create!(body_style: 'Extended Cab Pickup'),
      trim: Trim.create!(trim_level: 'Esi'),
      year: 2000,
      colour: 'Lavender'
    )

    @car3 = Car.create!(
      make: Make.create!(make: 'Dodge'),
      model: Model.create!(model: 'Accord'),
      style: Style.create!(body_style: 'Hatchback'),
      trim: Trim.create!(trim_level: 'XLE'),
      year: 1975,
      colour: 'Purple'
    )

  end

  skip "Visit the car page" do

    visit cars_path

    save_screenshot('visit_cars.png')

    expect(page).to have_text("All My Cars")


  end

  skip "It displays the list of cars" do

    visit cars_path

    expect(page).to have_css('.car', count: 3)
    expect(page).to have_text('Toyota Prius Extended Cab Pickup XL')
    expect(page).to have_text('Dodge Accord Hatchback XLE')

    save_screenshot('car_list.png')

  end

  scenario "It filters the list of cars according the the make" do


    visit cars_path

    within '.search-form' do

      select 'Dodge', from: 'Make'

      click_button 'Search!'
    end
      
      expect(page).to have_css('.car', count: 1)
      expect(page).to have_text('Dodge Accord Hatchback XLE')
      
      save_screenshot('filtered_cars.png')


  end

end
