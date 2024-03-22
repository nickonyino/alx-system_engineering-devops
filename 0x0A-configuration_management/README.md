Whether (and how) file content should be backed up before being replaced. This attribute works best as a resource default in the site manifest (File { backup => main }), so it can affect all file resources.

If set to false, file content won’t be backed up.
If set to a string beginning with ., such as .puppet-bak, Puppet will use copy the file in the same directory with that value as the extension of the backup. (A value of true is a synonym for .puppet-bak.)
If set to any other string, Puppet will try to back up to a filebucket with that title. See the filebucket resource type for more details. (This is the preferred method for backup, since it can be centralized and queried.)
Whether the file should exist, and if so what kind of file it should be. Possible values are present, absent, file, directory, and link.

present accepts any form of file existence, and creates a normal file if the file is missing. (The file will have no content unless the content or source attribute is used.)
absent ensures the file doesn’t exist, and deletes it if necessary.
file ensures it’s a normal file, and enables use of the content or source attribute.
directory ensures it’s a directory, and enables use of the source, recurse, recurselimit, ignore, and purge attributes.

