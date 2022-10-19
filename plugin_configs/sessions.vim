" Save session every window enter
lua << EOF
require("sessions").setup({
    events = { "WinEnter" },
    session_filepath = ".nvim/session",
})
EOF
