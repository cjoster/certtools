#!/usr/bin/env bash

set -euo pipefail

function install_bins {
	local dir="${1}"

	local err=0
	for b in bin/*; do
		[ -f "${b}" ] && [ -x "${b}" ] && { install "${b}" "${dir}" || err=1; } || true
	done

	[ "${err}" == "0" ] && return 0

	>&2 echo "WARNING: There were errors in the installation. See output from above."
	return 1
}

[ -z "${DEBUG+x}" ] || { >&2 echo "DEBUG environment variable set. Enabling debugging."; set -x; }

ppath="/usr/local/bin:${PATH}"

i=1
while dir="$(echo "${ppath}" | cut -d: -f "${i}")" && [ -n "${dir}" ] && [ "${dir}" != "${ppath}" ]; do
	i=$((i+1))
	[ -w "${dir}" ] && { install_bins "${dir}" && >&2 echo "Tools isntalled successfully into \"${dir}\"." || true; exit 0; }
done
