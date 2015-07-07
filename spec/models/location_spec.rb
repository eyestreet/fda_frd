require File.dirname(__FILE__) + '/../spec_helper'
require 'rails_helper'

describe Location do

  it "should be valid on new" do
    location = FactoryGirl.build(:location)
    expect(location).to be_valid
  end

  it "should be valid on new" do
    location = FactoryGirl.build(:location, coordinates: [ ], long_name: 'Montana', short_name: 'MT')
    expect(location).to be_valid
  end

  it "should be invalid with nil coordinates" do
    location = FactoryGirl.build(:location)
    location.coordinates = nil
    expect(location).to be_valid
  end

  it "should be invalid without a long_name" do
    location = FactoryGirl.build(:location, long_name: nil)
    expect(location).to be_valid
  end

  it "should be invalid without a short_name" do
    location = FactoryGirl.build(:location, short_name: nil)
    expect(location).to be_valid
  end

  it "should be invalid with a blank long_name" do
    location = FactoryGirl.build(:location, long_name: '')
    expect(location).to be_valid
  end

  it "should be invalid with a blank short_name" do
    location = FactoryGirl.build(:location, short_name: '')
    expect(location).to be_valid
  end

end

