class ConfigManager
  def initialize(default_config, config)
    @default_config_file_path = default_config;
    @config_file_path = config
  end
  def getConfig
    require 'yaml'
    require 'pathname'

    vagrant_config = YAML::load_file(@default_config_file_path)

    unless File.exists?(@config_file_path)
    	return vagrant_config
    end

    user_config = YAML::load_file(@config_file_path)

    user_config.each do |k, v|
      vagrant_config[k] = v
    end

    verifyConfig(vagrant_config)

    vagrant_config
  end

  def verifyConfig(config)
  	# check for required options here...
  end
end