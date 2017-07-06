# Require this file
require_relative "./spec_helper"
require "yaml"
require "json"

LoadFixture = Struct.new("LoadFixture", :extension, :processor)

class Minitest::Spec
  ADAPTERS = {
    yaml: LoadFixture.new(
      "yml",
      ->(file_path) { YAML.load_file(file_path) }
    ),
    json: LoadFixture.new(
      "json",
      ->(file_path) { File.open(file_path, "r") { |file| JSON.load(file) } }
    )
  }

  def load_fixture(caller_file_path, name, type = :yaml)
    file_path = File.join(
      File.dirname(caller_file_path),
      "fixtures",
      "#{name}.#{ADAPTERS[type].extension}"
    )
    raise RuntimeError.new("Fixture #{name} doesn't exits") unless File.exists? file_path
    # YAML.load_file(file_path)
    ADAPTERS[type].processor.call(file_path)
  end
end
