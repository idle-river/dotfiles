function genpasswd
    read --silent --prompt-str "Password: " password
    echo

    set -l salt (head -c 20 /dev/random | base64)
    echo -n "$password" | nix run nixpkgs#libargon2 -- $salt -e | pbcopy

    echo "Secret copied..."
end
