#!/usr/bin/env bash
set -euo pipefail

if [ -f .env ]; then
  source .env
fi

args=(compile)

if [ -n "${PHONE:-}" ]; then
  args+=(--input "phone=$PHONE")
fi

if [ -n "${REFERENCE_1:-}" ]; then
  args+=(--input "ref1=$REFERENCE_1")
fi

if [ -n "${REFERENCE_2:-}" ]; then
  args+=(--input "ref2=$REFERENCE_2")
fi

if [ -n "${REFERENCE_3:-}" ]; then
  args+=(--input "ref3=$REFERENCE_3")
fi

typst "${args[@]}" bragi_bergthorsson_cv.typ
