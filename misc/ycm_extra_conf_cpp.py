import os
import ycm_core

flags = [
    '-Wall',
    '-Wextra',
    '-Werror',
    '-Wno-long-long',
    '-Wno-variadic-macros',
    '-fexceptions',
    '-DNDEBUG',
    '-std=c++11',
    '-x', 'c++',
    '-isystem', '/usr/include/',
    '-I', '.'
]

SOURCE_EXTENSIONS = ['.cpp']

def FlagsForFile(filename, **kwargs):
    return {
            'flags': flags,
            'do_cache': True
    }
