class ConfigManager
  def initialize(default_config, config)
    @default_config_file_path = default_config;
    @config_file_path = config
  end

  def load
    require 'yaml'
    require 'pathname'

    vagrant_config = YAML::load_file(@default_config_file_path)

    if File.exists?(@config_file_path)
      user_config = YAML::load_file(@config_file_path)
      vagrant_config.merge!(user_config)
    end

    validate(vagrant_config)

    vagrant_config
  end

  def validate(config)
  	# check for required options here...
  end
end