-- Helper function for platform detection (uncomment and modify as needed)
local function get_platform()
    -- RUNTIME object is provided by mise/vfox
    -- RUNTIME.osType: "Windows", "Linux", "Darwin"
    -- RUNTIME.archType: "amd64", "386", "arm64", etc.

    local os_name = RUNTIME.osType:lower()
    local arch = RUNTIME.archType

    -- Map to your tool's platform naming convention
    -- Adjust these mappings based on how your tool names its releases
    local platform_map = {
        ["darwin"] = {
            ["amd64"] = "macos-x86_64",
            ["arm64"] = "macos-aarch64",
        },
        ["linux"] = {
            ["amd64"] = "linux-musl-x86_64",
            ["arm64"] = "linux-musl-aarch64",
        },
        ["windows"] = {
            ["amd64"] = "windows-x86_64",
        },
    }

    local os_map = platform_map[os_name]
    if os_map then
        return os_map[arch] or "linux-amd64" -- fallback
    end

    -- Default fallback
    return "linux-amd64"
end

--- Returns download information for a specific version
--- Documentation: https://mise.jdx.dev/tool-plugin-development.html#preinstall-hook
--- @param ctx {version: string, runtimeVersion: string} Context
--- @return table Version and download information
function PLUGIN:PreInstall(ctx)
    local version = ctx.version
    local platform = get_platform()

    local url = "https://github.com/amber-lang/amber/releases/download/"
        .. version
        .. "/amber-"
        .. platform
        .. ".tar.xz"

    return {
        version = version,
        url = url,
        note = "Downloading amber lang " .. version,
    }
end
