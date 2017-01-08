function ls
    command ls --color=auto -N $argv
end

function irc
    command ssh -t capybara 'tmux a'
end
