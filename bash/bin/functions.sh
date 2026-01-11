function dt() {
  if [[ $# -ne 1 ]]; then
    echo >&2 "usage: dt NAME"
    return 1
  fi

  local -r sessions_dir="${HOME}/.dtach_sessions"
  local -r sessions_name="${1}"

  mkdir -p "${sessions_dir}"
  dtach -A "${sessions_dir}/${sessions_name}" bash
}

function dtl() {
  local -r sessions_dir="${HOME}/.dtach_sessions"
  ls "${sessions_dir}"
}
