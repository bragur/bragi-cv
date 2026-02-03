#!/usr/bin/env bash
set -euo pipefail

if [ -f .env ]; then
  source .env
fi

args=(compile)

if [ -n "${PHONE:-}" ]; then
  args+=(--input "phone=$PHONE")
fi

typst "${args[@]}" bragi_bergthorsson_cv.typ
