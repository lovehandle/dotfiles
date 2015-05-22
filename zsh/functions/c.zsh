c() {
  # Check if CODE is set
  if [[ -z "$PROJECTS" ]]; then
    echo "ERROR: PROJECTS is not set"
    return 1
  fi

  # If no argument is provided, just go to CODE
  if [[ -z "$1" ]]; then
    cd "$PROJECTS"
    return
  fi

  # Check if target directory exists
  if [[ ! -d "$PROJECTS/$1" ]]; then
    echo "ERROR: Directory $PROJECTS/$1 does not exist"
    return 1
  fi

  cd "$PROJECTS/$1"
} 