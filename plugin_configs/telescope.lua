require('telescope').setup {
	defaults = {
		file_ignore_patterns = { 'node_modules', 'coverage' },
    history = {
      path = '~/.local/share/nvim/databases/telescope_history.sqlite3',
      limit = 100,
    }
	}
}

require('telescope').load_extension('smart_history')
