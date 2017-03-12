-- Easy installer. Bootstrapped by http://pastebin.com/p8PJVxC4

local base_url, dest = select(1,...)
dest = dest or 'computercraft-github'

print("Downloading from %s":format(base_url))

local FILES = {
	'apis/dkjson',
	'apis/github',
	'programs/github',
	'github'
}

local function request(url_path)
	local request = http.get(base_url..'/'..url_path)
	local status = request.getResponseCode()
	local response = request.readAll()
	request.close()
	return status, response
end

local function makeFile(file_path, data)
	local file = fs.open(dest..'/'..file_path,'w')
	file.write(data)
	file.close()
end

-- download github
for key, path in pairs(FILES) do
	local try = 0
	repeat
		local status, response
		if try >= 3 then
			printError(('Unable to download %s - status of %s'):format(path, status))
			printError(response)
			fs.delete(dest)
			return
		end
		status, response = request(path)
		try = try + 1
	until status ~= 200
end

print('Downloaded')
shell.setDir(dest)
loadfile('install.lua', getfenv())()
