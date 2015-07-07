require File.dirname(__FILE__) + '/../spec_helper'
require 'rails_helper'


describe RecallEvent do

  it "should be valid on new" do
    recall_event = FactoryGirl.build(:recall_event)
    expect(recall_event).to be_valid
  end

  it "should not be valid on new with nil classification" do
    recall_event = FactoryGirl.build(:recall_event, classification: nil)
    expect(recall_event).to be_invalid
  end

  it "should not be valid on new with invalid classification" do
    recall_event = FactoryGirl.build(:recall_event, classification: 'foo')
    expect(recall_event).to be_invalid
  end

  it "should not be valid on new with blank distribution_pattern" do
    recall_event = FactoryGirl.build(:recall_event, distribution_pattern: nil)
    expect(recall_event).to be_invalid
  end

  it "should not be valid on new with blank event_id" do
    recall_event = FactoryGirl.build(:recall_event, event_id: nil)
    expect(recall_event).to be_invalid
  end

  it "should not be valid on new with blank initiated_by" do
    recall_event = FactoryGirl.build(:recall_event, initiated_by: nil)
    expect(recall_event).to be_invalid
  end

  it "should not be valid on new with blank product_description" do
    recall_event = FactoryGirl.build(:recall_event, product_description: nil)
    expect(recall_event).to be_invalid
  end

  it "should not be valid on new with blank product_description" do
    recall_event = FactoryGirl.build(:recall_event, product_description: nil)
    expect(recall_event).to be_invalid
  end

  it "should not be valid on new with blank recall_number" do
    recall_event = FactoryGirl.build(:recall_event, recall_number: nil)
    expect(recall_event).to be_invalid
  end

  it "should not be valid on new with blank recalliing_firm" do
    recall_event = FactoryGirl.build(:recall_event, recalling_firm: nil)
    expect(recall_event).to be_invalid
  end

  it "should not be valid on new with blank status" do
    recall_event = FactoryGirl.build(:recall_event, status: nil)
    expect(recall_event).to be_invalid
  end

  it "should not be valid on new with invalid status" do
    recall_event = FactoryGirl.build(:recall_event, status: 'foo')
    expect(recall_event).to be_invalid
  end

  it "should not be valid on new with blank code_info" do
    recall_event = FactoryGirl.build(:recall_event, code_info: nil)
    expect(recall_event).to be_invalid
  end

  it "should not be valid on new with blank status" do
    recall_event = FactoryGirl.build(:recall_event, status: nil)
    expect(recall_event).to be_invalid
  end

  it "should not be valid on new with invalid status" do
    recall_event = FactoryGirl.build(:recall_event, status: 'foo')
    expect(recall_event).to be_invalid
  end

  it "should not be valid on new with invalid status" do
    recall_event = FactoryGirl.build(:recall_event, status: 'foo')
    expect(recall_event).to be_invalid
  end

end

