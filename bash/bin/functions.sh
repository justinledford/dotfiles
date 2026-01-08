function dtach_new() {
  if [[ $# -ne 1 ]]; then
    echo >&2 "usage: dtach-new name"
    return 1
  fi

  local -r sessions_dir="${HOME}/.dtach_sessions"
  local -r sessions_name="${1}"

  mkdir -p "${sessions_dir}"
  dtach -c "${sessions_dir}/${sessions_name}" bash
}

function dtach_attach() {
  if [[ $# -ne 1 ]]; then
    echo >&2 "usage: dtach-attach name"
    return 1
  fi

  local -r sessions_dir="${HOME}/.dtach_sessions"
  local -r sessions_name="${1}"

  mkdir -p "${sessions_dir}"
  dtach -a "${sessions_dir}/${sessions_name}"
}

function dtach_list() {
  local -r sessions_dir="${HOME}/.dtach_sessions"

  ls "${sessions_dir}"
}
