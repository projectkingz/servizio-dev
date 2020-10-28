# Noty

A bookmarks and snippets manager, stores bookmarks as YAML files and nippets as plain text, utilizes "Ag silver searcher" fast search to search your files when you need to open or copy a snippet, that makes its searching capabilities so enourmouse as it's inherited from AG.

Noty is smart, so it react depending on your input, so provide URL and it'll create a bookmark, provide some text and it will search for it in all bookmarks and snippets, if it didn't find any files it will prompt you to create a snippet.

Some common usages could be, bookmarking URL, save snippet of text you liked, save some canned responses and quickly copy it when needed.

## Installation

```bash
$ gem install noty
```

## Requirements

1. ag : silver searcher https://github.com/ggreer/the_silver_searcher

### For Linux:
1. xsel : could be found on most distros official repositories
2. xdg-open : should be installed with most opendesktop compatible desktop environments

## Environment

by default Noty saves your files in `~/.notes` if you want to change that path, define an Environment variable in your shell init file `.bashrc` or `.zshrc`

```bash
export NOTES_PATH=/path/to/your/notes/dir
```


## Usage

Snippets and bookmarks manager.

**Usage:**
```bash
  noty inputs
```

**Input types:**

1. **url:** e.g "http://www.example.com", add URL as a bookmark file
2. **keyword:** search bookmarks and perform action on it, a single word of multiple words or regex, it is passed to "ag silver searcher"
3. **snippet text:** any multiword text, it will search first if no files contain this text you'll be asked if you want to create a snippet for it

## Examples

Add a bookmark
```bash
noty https://www.youtube.com
```

Search for bookmark
```bash
noty youtube
```

Add a snippet text
```bash
noty this is a long text that I need to save in my stash
```

Search for a snippet (same as searching for bookmarks)
```bash
noty need
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/blazeeboy/noty.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
