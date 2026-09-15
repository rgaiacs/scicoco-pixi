import pathlib

p = pathlib.PurePath('/usr/local/bin/')

p.is_relative_to('/etc', 'local')