let g:coc_global_extensions = ['coc-snippets', 'coc-css', 'coc-json', 'coc-yaml', 'coc-tabnine', 'coc-html', 'coc-tsserver', 'coc-solargraph']

" Add prettier integration if it set up in project
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

" Add eslint extension if it is setup in project
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

let jsconfig_file = findfile('tsconfig.json', '.;')
if len(jsconfig_file)
    let jsconfig_data = json_decode(join(readfile(jsconfig_file)))
    let compiler_options = get(jsconfig_data, 'compilerOptions', {})
    let &l:path = &path . ',' . substitute(substitute(get(compiler_options, 'baseUrl', '.'), '/$', '', ''), '$', '/', '')
endif
