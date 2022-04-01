-- https://github.com/numToStr/Comment.nvim

require('Comment').setup {
    toggler = {
        ---Line-comment toggle keymap
        line = '<A-C>',
        ---Block-comment toggle keymap
        block = '<A-V>',
    },
    opleader = {
        ---Line-comment toggle keymap
        line = '<A-c>',
        ---Block-comment toggle keymap
        block = '<A-v>',
    },
}

