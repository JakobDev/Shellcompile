if arg[1] == nil then
	print("Use shellcompile <Shellscript> to compile your Script")
	return
end
scriptre = io.open(arg[1],"r")
writefi = io.open("/tmp/code.c","w")
writefi:write("void main() {\nsystem(\"")
for name in scriptre:lines() do
if not(name=="#!/bin/bash") then
if not(name:find("#")==1) then
name = name:gsub('"','\\"')
writefi:write(name)
writefi:write("\\n")
end
end
end
writefi:write('");\n}')
scriptre:close()
writefi:close()
os.execute("gcc -w -o "..arg[1]..".run /tmp/code.c > /dev/null")
os.execute("rm /tmp/code.c")
