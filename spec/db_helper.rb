module CleanDatabase
  def before_setup
    super
    # ProjectRepository.clear
    # MetricRepository.clear
  end

  def after_teardown
    # ProjectRepository.clear
    # MetricRepository.clear
  end
end

class MiniTest::Spec
  include CleanDatabase
end
