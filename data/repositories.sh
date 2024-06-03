export GIT_REPOSITORIES_PATH="/home/$USER/repos/github"

export my_git_repositories=(
    "git@github.com:printfdebugging/dwm.git"
    "git@github.com:printfdebugging/dmenu.git"
    "git@github.com:printfdebugging/st.git"
    "git@github.com:printfdebugging/stdout.git"

    "git@github.com:printfdebugging/nvim.git"
    "git@github.com:printfdebugging/bin.git"
    "git@github.com:printfdebugging/files.git"
    "git@github.com:printfdebugging/gtk-application-developement.git"
    "git@github.com:printfdebugging/interpreters.git"
    "git@github.com:printfdebugging/lua-embedding.git"
    "git@github.com:printfdebugging/myplugin.git"
    "git@github.com:printfdebugging/neogit.git"
    "git@github.com:printfdebugging/neovim.git"
    "git@github.com:printfdebugging/notes.git"
    "git@github.com:printfdebugging/website.git"
    "git@github.com:printfdebugging/printfdebugging.git"
    "git@github.com:printfdebugging/ray-tracing-in-one-weekend.git"
    "git@github.com:printfdebugging/thunderbird.git"
    "git@github.com:printfdebugging/brave.git"
    "git@github.com:printfdebugging/ThemePrototypeExtension.git"
)

export forked_git_repositories=(

)

export other_git_repositories=(

)

export git_repositories=(
    "${my_git_repositories[@]}"
    "${forked_git_repositories[@]}"
    "${other_git_repositories[@]}"
)
