
local actions = require('telescope.actions')

local check_1 = function() return false end
local check_2 = function() return true end
local check_3 = function() return false end
local check_4 = function() return true end

-- Scenario 1...

-- This...
actions.goto_file_selection_edit:replace_map {
  check_1 = actions.goto_file_selection_split,
  check_2 = function() print("Check 2 selected") end,
}

-- And then...
actions.goto_file_selection_edit:replace(function() print ("Override?") end)

-- Scenario 2
-- now this, happens somewhere else
actions.goto_file_selection_edit:replace(function() print ("Overriding the default thing") end)

-- and then that... ... but NONE PASS.
-- We should probably do the override...? Yes
actions.goto_file_selection_edit:replace_map {
  [check_1] = actions.goto_file_selection_split,
  [check_2] = function() print("Check 2 selected") end,
}

actions.goto_file_selection_edit:replace_map {
  [check_3] = actions.goto_file_selection_split,
  [check_4] = function() print("Check 2 selected") end,
}
