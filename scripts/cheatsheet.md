
# gh
Do all github related stuff from terminal.
```
gh pr create --base $PARENT
```
- *Create PR for the current branch and base it on $PARENT branch

# rsync
Sync files between locations (git without formalities).

```
rsync -avzP --exlude=".*" src dest
```
- a: recursive copy, preserve metadata (e.g. permissions)
- v: give feedback :)
- z: compress data while being transmitted
- P: (--progress) display progress of transfer, and (--partial) allow partially downloaded files
- --dry-run: don't actually make changes, just make sure this works
- --exclude="{regex}": exclude filename by regex
- --delete: delete anything in dest which does not exist in src 

**Complexity of paths and slashes:**
- src (no slash): copy folder to destination
- src/ (wiht slash): copy folder **contents** to destination

**If copying through ssh:**
- dest = username@ipAddr:/path/to/file

**Recommended check before rsync:**
```
rsync --dry-run -ai --exclude=".*" --delete src dest

# how to read:
--------------------------------------------------------------------------------
The output string usually has 11 characters (e.g., <f.st....).
Each position corresponds to a specific file attribute.

POS  ATTRIBUTE       COMMON CODES & MEANINGS
--------------------------------------------------------------------------------
 1   Update Type     <  : File is being transferred to the local host (Download)
                     >  : File is being transferred to the remote host (Upload)
                     c  : Local change/creation (e.g., creating a directory)
                     h  : Hard link
                     .  : No item update (only attributes changed)

 2   File Type       f  : File
                     d  : Directory
                     L  : Symlink
                     D  : Device
                     S  : Special file

 3   Checksum        c  : Checksum differs (content has changed)
                     +  : Newly created item
                     .  : Checksum is identical

 4   Size            s  : File size differs
                     .  : Size is identical

 5   Timestamp       t  : Modification time differs
                     .  : Time is identical

 6   Permissions     p  : Permissions differ
                     .  : Permissions are identical

 7   Owner           o  : Owner differs
                     .  : Owner is identical

 8   Group           g  : Group differs
                     .  : Group is identical

 9   ACLs            a  : ACL information changed (Access Control Lists)
                     .  : No change

10   Ext. Attr       x  : Extended attributes changed
                     .  : No change
--------------------------------------------------------------------------------
```
