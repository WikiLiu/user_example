return {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
        opts.commands.copy_path = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            path = node.type == "directory" and path or vim.fn.fnamemodify(path, ":h")
            
            -- 设置寄存器
            local register = '*'
            vim.cmd('let @' .. register .. ' = ' .. vim.fn.string(path))
            require('telescope.builtin').live_grep({search_dirs = {path}})
        end
        
        opts.window.mappings.L = "copy_path & grep in"
    end
}
