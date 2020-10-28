# -*- encoding: utf-8 -*-
# stub: noty 0.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "noty".freeze
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Emad Elsaid".freeze]
  s.bindir = "exe".freeze
  s.date = "2017-05-05"
  s.description = "# Noty\n\nA bookmarks and snippets manager, stores bookmarks as YAML files and nippets as plain text, utilizes \"Ag silver searcher\" fast search to search your files when you need to open or copy a snippet, that makes its searching capabilities so enourmouse as it's inherited from AG.\n\nNoty is smart, so it react depending on your input, so provide URL and it'll create a bookmark, provide some text and it will search for it in all bookmarks and snippets, if it didn't find any files it will prompt you to create a snippet.\n\nSome common usages could be, bookmarking URL, save snippet of text you liked, save some canned responses and quickly copy it when needed.\n\n## Installation\n\n```bash\n$ gem install noty\n```\n\n## Requirements\n\n1. ag : silver searcher https://github.com/ggreer/the_silver_searcher\n\n### For Linux:\n1. xsel : could be found on most distros official repositories\n2. xdg-open : should be installed with most opendesktop compatible desktop environments\n\n## Environment\n\nby default Noty saves your files in `~/.notes` if you want to change that path, define an Environment variable in your shell init file `.bashrc` or `.zshrc`\n\n```bash\nexport NOTES_PATH=/path/to/your/notes/dir\n```\n\n\n## Usage\n\nSnippets and bookmarks manager.\n\n**Usage:**\n```bash\n  noty inputs\n```\n\n**Input types:**\n\n1. **url:** e.g \"http://www.example.com\", add URL as a bookmark file\n2. **keyword:** search bookmarks and perform action on it, a single word of multiple words or regex, it is passed to \"ag silver searcher\"\n3. **snippet text:** any multiword text, it will search first if no files contain this text you'll be asked if you want to create a snippet for it\n\n## Examples\n\nAdd a bookmark\n```bash\nnoty https://www.youtube.com\n```\n\nSearch for bookmark\n```bash\nnoty youtube\n```\n\nAdd a snippet text\n```bash\nnoty this is a long text that I need to save in my stash\n```\n\nSearch for a snippet (same as searching for bookmarks)\n```bash\nnoty need\n```\n\n## Contributing\n\nBug reports and pull requests are welcome on GitHub at https://github.com/blazeeboy/noty.\n\n## License\n\nThe gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).\n".freeze
  s.email = ["emad.elsaid@blacklane.com".freeze]
  s.executables = ["noty".freeze]
  s.files = ["exe/noty".freeze]
  s.homepage = "https://www.github.com/blazeeboy/noty".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Terminal storage for bookmarks or snippets".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.14"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<minitest>.freeze, ["~> 5.0"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.14"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<minitest>.freeze, ["~> 5.0"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.14"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<minitest>.freeze, ["~> 5.0"])
  end
end
