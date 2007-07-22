module RR
  # RR::StubProbeCreator uses RR::StubProbeCreator#method_missing to create
  # a Scenario that acts like a stub with probing capabilities.
  #
  # Passing a block allows you to intercept the return value.
  # The return value can be modified, validated, and/or overridden by
  # passing in a block. The return value of the block will replace
  # the actual return value.
  #
  #   probe_stub(subject).method_name(arg1, arg2) do |return_value|
  #     return_value.method_name.should == :return_value
  #     my_return_value
  #   end
  #
  #   probe_stub(User) do |m|
  #     m.find do |user|
  #       mock(user).valid? {false}
  #       user
  #     end
  #   end
  #
  #   user = User.find('4')
  #   user.valid? # false
  class StubProbeCreator < ScenarioCreator
    def transform(scenario, *args, &after_call)
      scenario.implemented_by_original_method
      scenario.any_number_of_times
      if args.empty?
        scenario.with_any_args
      else
        scenario.with(*args)
      end
      scenario.after_call(&after_call) if after_call
    end
  end
end