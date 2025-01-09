local jdtls = require('jdtls')

local root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw', 'pom.xml'}, { upward = true })[1])

-- Create data directory if it doesn't exist
local data_dir = vim.fn.expand('~/.cache/jdtls/workspace/')
vim.fn.mkdir(data_dir, "p")

local config = {
    cmd = {
        'jdtls',
        '--data',  -- Changed from --jvm-arg=-data to --data
        data_dir .. vim.fn.fnamemodify(root_dir, ':p:h:t')
    },
    root_dir = root_dir,
}

jdtls.start_or_attach(config)
