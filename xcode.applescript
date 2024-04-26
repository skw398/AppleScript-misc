tell application "Xcode"
	set currentProjectPath to path of active workspace document
end tell

set AppleScript's text item delimiters to "/"
set pathItems to text items of currentProjectPath
set projectRootPath to "/" & (items 1 through -2 of pathItems as string)

tell application "Terminal"
	activate
	do script "cd " & quoted form of projectRootPath
end tell