-- lua/plugins/competitest.lua

return {
    'xeluxee/competitest.nvim',
    dependencies = {
        'muniftanjim/nui.nvim',
    },
    config = function()
        require('competitest').setup({
            -- Main configuration
            compile_directory = "build",
            compile_command = {
                cpp = { exec = "g++", args = { '-Wall', '-Wshadow', '-O2', '../$(FNAME)', '-o', '$(FNOEXT)' } },
            },
            run_command = {
                cpp = { exec = './build/$(FNOEXT)'}
            },
            view_output_diff = false,
            testcases_directory = 'testcases',
            testcases_use_single_file = false,
            testcases_input_file_format = "$(FNOEXT)_input_$(TCNUM).txt",
            testcases_output_file_format = "$(FNOEXT)_output_$(TCNUM).txt",

            -- External challenges
            template_file = {
                cpp = '../documentation/cpp/template.cpp',
            },
            evaluate_template_modifiers = true,
            received_file_extension = 'cpp',
            received_problems_path = '$(CWD)/$(JUDGE)/$(CONTEST)/$(JAVA_TASK_CLASS)/$(JAVA_TASK_CLASS).$(FEXT)'
        })
    end
}
