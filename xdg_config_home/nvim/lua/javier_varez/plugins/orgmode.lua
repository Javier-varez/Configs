return {
    {
        'nvim-orgmode/orgmode',
        init = function()
            require('orgmode').setup_ts_grammar()
            require('orgmode').setup({
              org_agenda_files = { '~/Documents/orgs/**/*' },
              org_default_notes_file = '~/Documents/orgs/notes.org',
            })
        end
    }
}
