if which gcloud > /dev/null 2>&1; then
  export GOOGLE_WORKSPACE_CLI_TOKEN="$(gcloud auth print-access-token)"
fi
