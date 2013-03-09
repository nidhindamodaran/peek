require 'test_helper'

class Staff < Glimpse::Views::View
  def initialize(options = {})
    @username = options.delete(:username)
  end

  def username
    @username
  end

  def enabled?
    !!@username
  end
end

describe Glimpse do
  describe "views" do
    before do
      Glimpse.reset
    end

    it "should have none by default" do
      assert_equal [], Glimpse.views
    end

    it "should be able to append views" do
      Glimpse.into Staff, :username => 'dewski'
      assert_kind_of Staff, Glimpse.views.first
    end

    it "should be able to append views with options" do
      Glimpse.into Staff, :username => 'dewski'
      @staff = Glimpse.views.first
      assert_kind_of Staff, @staff
      assert_equal 'dewski', @staff.username
    end

    it "should only return enabled views" do
      Glimpse.into Staff, :username => false
      assert_equal [], Glimpse.views
    end
  end
end