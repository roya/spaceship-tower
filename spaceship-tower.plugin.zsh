# Spaceship plugin for Infra Tower

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_TOWER_SHOW="${SPACESHIP_TOWER_SHOW=true}"
SPACESHIP_TOWER_ASYNC="${SPACESHIP_TOWER_ASYNC=false}"
SPACESHIP_TOWER_PREFIX="${SPACESHIP_TOWER_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_TOWER_SUFFIX="${SPACESHIP_TOWER_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_TOWER_SYMBOL="${SPACESHIP_TOWER_SYMBOL="🗼 "}"
SPACESHIP_TOWER_COLOR="${SPACESHIP_TOWER_COLOR="yellow"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show tower status
# spaceship_ prefix before section's name is required!
# Otherwise this section won't be loaded.
spaceship_tower() {
  # If SPACESHIP_TOWER_SHOW is false, don't show tower section
  [[ $SPACESHIP_TOWER_SHOW == false ]] && return

  # Check if tower command is available for execution
  spaceship::exists tower || return

  # Display tower section
  # spaceship::section utility composes sections. Flags are optional
  spaceship::section::v4 \
    --color "$SPACESHIP_TOWER_COLOR" \
    --prefix "$SPACESHIP_TOWER_PREFIX" \
    --suffix "$SPACESHIP_TOWER_SUFFIX" \
    --symbol "$SPACESHIP_TOWER_SYMBOL" \
    "$TOWER_INSTANCE:$TOWER_FOLDER"
}
