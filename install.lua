-- Easy Installer for computercraft-github by Eric Wieser
-- https://github.com/eric-wieser/computercraft-github

local repo, tree = select(1,...)
if not repo then
  repo = 'eric-wieser/computercraft-github'
if not tree then
  tree = 'master'
end

local REPO_BASE = ('https://raw.githubusercontent.com/%s/%s/'):format(repo, tree)

local FILES = {
  'apis/dkjson',
  'apis/github',
  'programs/github',
  'github'
}

local function request(url_path)
  local request = http.get(REPO_BASE..url_path)
  status = request.getResponseCode()
  response = request.readAll()
  request.close()
  return status, response
end

local function makeFile(file_path, data)
 local file = fs.open('github.rom/'..file_path,'w')
 file.write(data)
 file.close()
end

local function rewriteDofiles()
  for _, file in pairs(FILES) do
    local filename = ('github.rom/%s'):format(file)
    local r = fs.open(filename, 'r')
    local data = r.readAll()
    r.close()
    local w = fs.open(filename, 'w')
    data = data:gsub('dofile%("', 'dofile("github.rom/')
    w.write(data)
    w.close()
  end
end

-- install github
for key, path in pairs(FILES) do
  local try = 0
  local status, response = request(path)
  while status ~= 200 and try <= 3 do
    status, response = request(path)
    try = try + 1
  end
  if status then
    makeFile(path, response)
  else
    printError(('Unable to download %s'):format(path))
    fs.delete('github.rom')
    fs.delete('github')
    break
  end
end

rewriteDofiles()
fs.move('github.rom/github', 'github')
print("github by Eric Wieser installed!")
dofile('github')
