# Spaceship plugin for Infra Tower

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_TOWER_SHOW="${SPACESHIP_TOWER_SHOW=true}"
SPACESHIP_TOWER_ASYNC="${SPACESHIP_TOWER_ASYNC=true}"
SPACESHIP_TOWER_PREFIX="${SPACESHIP_TOWER_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_TOWER_SUFFIX="${SPACESHIP_TOWER_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_TOWER_SYMBOL="${SPACESHIP_TOWER_SYMBOL="😍 "}"
SPACESHIP_TOWER_COLOR="${SPACESHIP_TOWER_COLOR="yellow"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show tower status
# spaceship_ prefix before section's name is required!
# Otherwise this section won't be loaded.
spaceship_foobar() {
  # If SPACESHIP_TOWER_SHOW is false, don't show tower section
  [[ $SPACESHIP_TOWER_SHOW == false ]] && return

  # Check if tower command is available for execution
  spaceship::exists tower || return

  # Show tower section only when there are tower-specific files in current
  # working directory.

  # spaceship::upsearch utility helps finding files up in the directory tree.
  local is_foobar_context="$(spaceship::upsearch tower.conf)"
  # Here glob qualifiers are used to check if files with specific extension are
  # present in directory. Read more about them here:
  # http://zsh.sourceforge.net/Doc/Release/Expansion.html
  [[ -n "$is_foobar_context" || -n *.foo(#qN^/) || -n *.bar(#qN^/) ]] || return

  local foobar_version="$(tower --version)"

  # Check if tool version is correct
  [[ $foobar_version == "system" ]] && return

  # Display tower section
  # spaceship::section utility composes sections. Flags are optional
  spaceship::section::v4 \
    --color "$SPACESHIP_TOWER_COLOR" \
    --prefix "$SPACESHIP_TOWER_PREFIX" \
    --suffix "$SPACESHIP_TOWER_SUFFIX" \
    --symbol "$SPACESHIP_TOWER_SYMBOL" \
    "$foobar_version"
}
