if vim.g.loaded_number_represenation then
    return
end

vim.g.loaded_number_representation = 1

require("number-representation").get_representation()
