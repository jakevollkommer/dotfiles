# .zshenv is sourced on all invocations of the shell, unless the -f option is set.
# It should contain commands to set the command search path, plus other important environment variables.
# .zshenv' should not contain commands that produce output or assume the shell is attached to a tty.

export DOTFILES="$HOME/.dotfiles"

# Write functions
function exists() {
    # `command -v` is similar to `which`
    command -v $1 >/dev/null 2>&1
}
. "$HOME/.cargo/env"
