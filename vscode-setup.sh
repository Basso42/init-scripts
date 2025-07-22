#!/bin/bash

# Download files
### Copilot
wget --retry-on-http-error=429 https://marketplace.visualstudio.com/_apis/public/gallery/publishers/GitHub/vsextensions/copilot/1.270.0/vspackage -O copilot.vsix.gz
wget --retry-on-http-error=429 https://marketplace.visualstudio.com/_apis/public/gallery/publishers/GitHub/vsextensions/copilot-chat/0.23.0/vspackage -O copilot-chat.vsix.gz

# Install extensions
gunzip copilot.vsix.gz 
code-server --install-extension copilot.vsix
rm copilot.vsix

gunzip copilot-chat.vsix.gz 
code-server --install-extension copilot-chat.vsix
rm copilot-chat.vsix

### Shortcuts
echo '[
    {
        "key": "cmd+shift+c",
        "command": "workbench.action.createTerminalEditor",
        "when": "terminalProcessSupported"
    },
    {
        "key": "ctrl+d",
        "command": "editor.action.deleteLines",  # Delete a line
        "when": "editorTextFocus"
    }
]' > "$HOME/.local/share/code-server/User/keybindings.json"
