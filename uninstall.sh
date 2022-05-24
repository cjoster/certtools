#!/usr/bin/env bash

set -euo pipefail

paths=()

function in_array {
	local needle="${1}"; shift
	local haystack=("${@}")
	local i

	if ((${#haystack[@]})); then
		for i in $(seq 0 "$(("${#haystack[@]}"-1))"); do
			[ "${haystack[${i}]:-}" != "${needle}" ] || return 0
		done
	fi

	return 1
}

function uninstall_bins {
	local dir="${1}"

	if ((${#paths[@]})) && in_array "${dir}" "${paths[@]}"; then
			return 0
	fi

	paths+=("${dir}")

	local err=0
	for b in bin/*; do
		local target="${dir}/$(basename "${b}")"
		[ -f "${b}" ] && [ -x "${b}" ] && [ -f "${target}" ] && [ -x "${target}" ] && { rm "${dir}/$(basename "${b}")" || err=1; } || true
	done

	[ "${err}" == "0" ] && return 0

	>&2 echo "WARNING: There were errors during uninstallation. Please see output from above."
	return 1
}

[ -z "${DEBUG+x}" ] || { >&2 echo "DEBUG environment variable set. Enabling debugging."; set -x; }

ppath="/usr/local/bin:${PATH}"

i=1
while dir="$(echo "${ppath}" | cut -d: -f "${i}")" && [ -n "${dir}" ] && [ "${dir}" != "${ppath}" ]; do
	i=$((i+1))
	[ -w "${dir}" ] && uninstall_bins "${dir}"
done
