# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
#session_root "~/Projects/rust"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "rust"; then
    new_window "editor"
    new_window "development"
    new_window "production"
    select_window 1
    run_cmd /bin/cargo --version
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
