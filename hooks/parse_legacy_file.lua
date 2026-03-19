function PLUGIN:ParseLegacyFile(ctx)
    local filename = ctx.filename
    local filepath = ctx.filepath
    local file = require("file")

    -- Read file content
    local content = file.read(filepath)
    if not content then
        error("Failed to read " .. filepath)
    end

    -- Parse version from different file formats
    local version = nil

    if filename == ".nvmrc" then
        -- .nvmrc can contain version with or without 'v' prefix
        version = content:match("v?([%d%.]+)")
    elseif filename == ".node-version" then
        -- .node-version typically contains just the version number
        version = content:match("([%d%.]+)")
    end

    -- Remove any whitespace
    if version then
        version = version:gsub("%s+", "")
    end

    return {
        version = version,
    }
end
