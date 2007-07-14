require "examples/example_helper"

module RR
module Expectations
  describe TimesCalledExpectation, ' with AtLeastMatcher', :shared => true do
    it_should_behave_like "RR::Expectations::TimesCalledExpectation"
    
    before do
      @times = 3
      @at_least = TimesCalledMatchers::AtLeastMatcher.new(@times)
      @expectation = TimesCalledExpectation.new(@at_least)
    end
  end

  describe TimesCalledExpectation, "#verify! with AtLeastMatcher" do
    it_should_behave_like "RR::Expectations::TimesCalledExpectation with AtLeastMatcher"

    it "passes when times called > times" do
      4.times {@expectation.attempt!}
      @expectation.verify!
    end

    it "passes when times called == times" do
      3.times {@expectation.attempt!}
      @expectation.verify!
    end

    it "raises error when times called < times" do
      @expectation.attempt!
      proc do
        @expectation.verify!
      end.should raise_error(
        RR::Errors::TimesCalledError,
        "Called 1 time.\nExpected at least 3 times."
      )
    end
  end

  describe TimesCalledExpectation, "#attempt? with AtLeastMatcher" do
    it_should_behave_like "RR::Expectations::TimesCalledExpectation with AtLeastMatcher"

    it "returns true when attempted less than expected times" do
      2.times {@expectation.attempt!}
      @expectation.should be_attempt
    end

    it "returns false when attempted expected times" do
      3.times {@expectation.attempt!}
      @expectation.should_not be_attempt
    end

    it "returns false when attempted more than expected times" do
      4.times {@expectation.attempt!}
      @expectation.should_not be_attempt
    end
  end

  describe TimesCalledExpectation, "#attempt! with AtLeastMatcher" do
    it_should_behave_like "RR::Expectations::TimesCalledExpectation with AtLeastMatcher"
    
    it "passes when times called more than times" do
      4.times {@expectation.attempt!}
    end

    it "passes when times called == times" do
      3.times {@expectation.attempt!}
    end

    it "passes when times called < times" do
      @expectation.attempt!
    end
  end
end
end