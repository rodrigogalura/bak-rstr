Describe 'bakf.zsh'
    Include bakf.zsh

    It 'says backup processing if the source file exists'
        zip7z () { echo ""; }
        mkdir () { echo ""; }
        mv () { echo ""; }

        When call bakf $HOME/code/shellspec/bak-rstr/bakf.zsh "$(dirname $PWD)/fake-dropbox-dir" secret
        The output should eq "Backup processing..."
    End

    It 'says cannot backup if the source file not exists'
        When call bakf .foo
        The output should eq 'Cannot backup the file .foo. File is not exist'
    End

    It 'says cannot zip if the source file does not exists'
        When call zip7z secret foo.txt bar.txt
        The output should eq 'Cannot zip the file bar.txt. File is not exist'
    End
End


# spec/compress_spec.sh

# Describe 'Compression'
#   Before 'mock_7z'

#   mock_7z() {
#     double 'command 7z' 'echo "[MOCK] 7z $@"; return 0'
#   }

#   It 'compresses with 7z'
#     When call 7z a archive.7z file.txt
#     The output should include '[MOCK] 7z'
#     The status should be success
#   End
# End
