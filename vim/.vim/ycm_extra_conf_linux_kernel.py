import os
import ycm_core

flags = [
    '-Wall',
    '-Wundef',
    '-Wstrict-prototypes',
    '-Wno-trigraphs',
    '-fno-strict-aliasing',
    '-fno-common',
    '-Werror-implicit-function-declaration',
    '-Wno-format-security',
    '-D__KERNEL__',
    '-DMODULE',
    '-x', 'c',
    '-std=gnu89',
    '-nostdinc',
    #'--sysroot=/path-to-linux-src',
    #'-isystem', '/path-to-linux-src/include/',
    #'-I', '/path-to-linux-src/include/',
    #'-I', '/path-to-linux-src/arch/arm/include/',
    #'-include', '/path-to-linux-src/include/linux/kconfig.h'
]

SOURCE_EXTENSIONS = ['.c']

def FlagsForFile(filename, **kwargs):
    return {
            'flags': flags,
            'do_cache': True
    }
