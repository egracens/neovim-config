lua << EOF
require("telescope").setup {
	defaults = {
		file_ignore_patterns = { 'node_modules', 'coverage' }
	}
}
EOF
