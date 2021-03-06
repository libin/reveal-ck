module RevealCK
  #
  # Public: This class is home to a simple algorithm for looking up
  # files in a series of directories. Directory order matters, and the
  # first match for the file will be returned. It'll raise if it can't
  # find the file you've asked for.
  #
  class TemplateFinder

    attr_reader :paths

    def initialize(args={})
      @paths = args[:paths] || default_paths
    end

    def default_paths
      pwd = Dir.pwd
      pwd_templates = File.join Dir.pwd, 'templates'
      reveal_ck_templates =
        File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'templates'))

      [pwd, pwd_templates, reveal_ck_templates]
    end

    def find(template_name)
      paths.each do |path|
        glob_pattern = "#{File.join(path, template_name)}*"
        matching_templates = Dir.glob glob_pattern
        return matching_templates[0] unless matching_templates.empty?
      end
      raise "Unable to find #{template_name} in #{paths}"
    end

  end
end
