import os
import ycm_core

flags = [
    '-Wall',
    '-DNDEBUG',
    '-std=c11',
    '-x', 'c',
    '-isystem', '/usr/include/',
    '-I', '.'
]

SOURCE_EXTENSIONS = ['.c']

def FlagsForFile(filename, **kwargs):
    return {
            'flags': flags,
            'do_cache': True
    }
