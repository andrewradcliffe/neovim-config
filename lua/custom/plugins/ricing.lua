-- Plugins that are purely for aesthetic purposes
return {
    {
        'nvzone/showkeys',
        cmd = 'ShowkeysToggle',
        opts = {
            timeout = 3,
            maxkeys = 5,
            show_count = true,
            excluded_modes = { 'i' },
        },
    },
}
