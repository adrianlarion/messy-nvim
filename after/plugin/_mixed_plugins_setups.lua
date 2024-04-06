-- https://github.com/lukas-reineke/indent-blankline.nvim
require("ibl").setup()


-- EasyMotion
vim.cmd([[
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1 " US layout
]])


-- Gopher nvim
require("gopher").setup {
  commands = {
    go = "go",
    gomodifytags = "gomodifytags",
    gotests = "~/go/bin/gotests", -- also you can set custom command path
    impl = "impl",
    iferr = "iferr",
  },
}

-- TReesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",     
  highlight = {
    enable = true              
  },
}


-- whichkey
require("which-key").setup {
}

-- ZenMode
require("zen-mode").setup {
    window = {
        width = 90,
        options = {
            number = true,
            relativenumber = true,
        }
    },
}


-- startup nvim-dap-gui
require("dapui").setup()

--STARTUP dap-go
require('dap-go').setup {
  -- Additional dap configurations can be added.
  -- dap_configurations accepts a list of tables where each entry
  -- represents a dap configuration. For more details do:
  -- :help dap-configuration
  dap_configurations = {
    {
      -- Must be "go" or it will be ignored by the plugin
      type = "go",
      name = "Attach remote",
      mode = "remote",
      request = "attach",
    },
  },
  -- delve configurations
  delve = {
    -- the path to the executable dlv which will be used for debugging.
    -- by default, this is the "dlv" executable on your PATH.
    path = "dlv",
    -- time to wait for delve to initialize the debug session.
    -- default to 20 seconds
    initialize_timeout_sec = 20,
    -- a string that defines the port to start delve debugger.
    -- default to string "${port}" which instructs nvim-dap
    -- to start the process in a random available port
    port = "${port}",
    -- additional args to pass to dlv
    args = {},
    -- the build flags that are passed to delve.
    -- defaults to empty string, but can be used to provide flags
    -- such as "-tags=unit" to make sure the test suite is
    -- compiled during debugging, for example.
    -- passing build flags using args is ineffective, as those are
    -- ignored by delve in dap mode.
    build_flags = "",
  },
}


-- Startify
vim.cmd([[

    let g:startify_lists = [
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'files',     'header': ['   MRU']            },
          \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
          \ ]

    let g:startify_session_before_save = [ 'silent! tabdo NERDTreeClose' ]
    let g:startify_session_dir = '~/.config/nvim/usr_generated/sessions'
    let g:startify_session_sort = 1
    let g:startify_session_number = 20
    let g:startify_bookmarks = [ {'bashrc': '~/.bashrc'}, {'shipping_go':'~/temp/shipping'}, ]
  
    let g:startify_custom_header=[
\'                      888    888                    888                        888    ',
\'                      888    888                    888                        888    ',
\'                      888    888                    888                        888    ',
\'888  888 888d888      888888 88888b.   .d88b.       88888b.   .d88b.  .d8888b  888888 ',
\'888  888 888P"        888    888 "88b d8P  Y8b      888 "88b d8P  Y8b 88K      888    ',
\'888  888 888          888    888  888 88888888      888  888 88888888 "Y8888b. 888    ',
\'Y88b 888 888          Y88b.  888  888 Y8b.          888 d88P Y8b.          X88 Y88b.  ',
\' "Y88888 888           "Y888 888  888  "Y8888       88888P"   Y8888   88888P   Y888   ',
\ ]

]])


