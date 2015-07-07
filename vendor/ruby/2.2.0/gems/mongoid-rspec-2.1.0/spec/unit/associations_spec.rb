require 'spec_helper'

RSpec.describe "Associations" do
  describe User do
    it { is_expected.to have_many(:articles).with_foreign_key(:author_id).ordered_by(:title) }

    it { is_expected.to have_one(:record).with_autobuild }

    it { is_expected.to have_many(:comments).with_dependent(:destroy).with_autosave }

    it { is_expected.to embed_one(:profile) }

    it { is_expected.to have_and_belong_to_many(:children).of_type(User) }
  end

  describe Profile do
    it { is_expected.to be_embedded_in(:user).as_inverse_of(:profile) }
  end

  describe Article do
    it { is_expected.to belong_to(:author).of_type(User).as_inverse_of(:articles).with_index }
    it { is_expected.to embed_many(:comments).with_cascading_callbacks }
    it { is_expected.to embed_one(:permalink) }
  end

  describe Comment do
    it { is_expected.to be_embedded_in(:article).as_inverse_of(:comments).with_polymorphism }
    it { is_expected.to belong_to(:user).as_inverse_of(:comments) }
  end

  describe Record do
    it { is_expected.to belong_to(:user).as_inverse_of(:record) }
  end

  describe Permalink do
    it { is_expected.to be_embedded_in(:linkable).as_inverse_of(:link) }
  end

  describe Site do
    it { is_expected.to have_many(:users).as_inverse_of(:site).ordered_by(:email.desc).with_counter_cache }
  end
end
