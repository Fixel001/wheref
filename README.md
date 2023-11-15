# Goal

## To have a script that finds the path to a folder/file with the desired name

The `where` command in Windows OS will search for and return the path of the specified file. `wheref`, however, is designed to search for a folder AND file instead of just a file.

## To be able to run `wheref` in command prompt

To use `wheref` in the command prompt, you can set up the script to be automatically accessible by adding it to the system's PATH variable.


## Syntax

Syntax                   | Description
-------------------------|---------------------------
`wheref [-a] [Dir] [Folder/FileName]`  | Searches for [Folder/FileName] in [Dir] using [-a] mode.
`wheref -h / --help`          | Displays this help menu.

## Examples

Command                               | Description
--------------------------------------|----------------------------------------
`wheref projectA.exe`                 | Searches for the file named `projectA.exe` starting from root directory and its subdirectories.
`wheref "C:\Program Files" projectB`  | Searches for the folder named `projectB` within `C:\Program Files` and its subdirectories.
`wheref -a "C:\Users" projectC`       | Searches for any instance that matches the folder named "projectC" within 'C:\Users' and its subdirectories.

### Specifications

- Capital letters do not matter.
- Batch script.
- Windows 11