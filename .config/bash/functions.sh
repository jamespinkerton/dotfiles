claudex() (
    local data_disk=${DATA_DISK:-/mnt/disks/scratch/$USER/app_cache}
    local cliproxy_key
    cliproxy_key="$(
        sed -n '/^api-keys:/,/^[^[:space:]]/ {
            s/^[[:space:]]*-[[:space:]]*"\(sk-[^"]*\)".*/\1/p
        }' "$data_disk/cli-proxy-api/config.yaml" | head -n 1
    )"
    if [ -z "$cliproxy_key" ]; then
        echo "claudex: no proxy API key found in $data_disk/cli-proxy-api/config.yaml" >&2
        return 1
    fi

    unset CLAUDE_CODE_SUBAGENT_MODEL
    unset CLAUDE_CODE_ENABLE_GATEWAY_MODEL_DISCOVERY
    export ANTHROPIC_BASE_URL=http://127.0.0.1:8317
    export ANTHROPIC_AUTH_TOKEN="$cliproxy_key"
    unset ANTHROPIC_CUSTOM_MODEL_OPTION
    unset ANTHROPIC_CUSTOM_MODEL_OPTION_NAME
    unset ANTHROPIC_CUSTOM_MODEL_OPTION_DESCRIPTION
    export CLAUDE_CODE_ALWAYS_ENABLE_EFFORT=1
    export CLAUDE_CODE_MAX_TOOL_USE_CONCURRENCY=3
    export CLAUDE_CODE_AUTO_COMPACT_WINDOW=372000
    export ENABLE_TOOL_SEARCH=false
    echo command claude "$@"
    command claude "$@"
)

vcsv() {
    /usr/bin/perl -pe 's/((?<=,)|(?<=^)),/ ,/g;' "$@" |
        column -t -s, |
        less -F -S -X -K -N
}
