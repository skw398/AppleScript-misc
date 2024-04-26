tell application "Xcode"
	set currentProjectPath to path of active workspace document
end tell

set AppleScript's text item delimiters to "/"
set pathItems to text items of currentProjectPath
set projectRootPath to (items 1 through -2 of pathItems as string)

set grepCommand to "grep -E '^[a-zA-Z0-9_-]+:' '" & projectRootPath & "/Makefile'"
set sedCommand to "sed 's/:$//'"

set commandList to paragraphs of (do shell script grepCommand & " | " & sedCommand)

tell me to set selectedCommand to choose from list commandList with prompt "Select a Command" without multiple selections allowed
if selectedCommand is false then error number -128

tell application "Terminal"
	activate
	do script "cd " & quoted form of projectRootPath & "; make " & selectedCommand
end tell
