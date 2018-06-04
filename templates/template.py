#!/usr/bin/env python
# -*- coding: utf-8 -*-
""" Author  : David Calvert
    Purpose : ...
"""

import argparse

################################################################################
# Variables
################################################################################

DESCRIPTION = "..."
EPILOG = "Author : David Calvert"

################################################################################
# Application
################################################################################

def app():
    """Define app"""
    print "app"

################################################################################
# Application Selector
################################################################################

if __name__ == '__main__':
    PARSER = argparse.ArgumentParser(
        description=DESCRIPTION,
        epilog=EPILOG,
        formatter_class=argparse.RawDescriptionHelpFormatter)

    PARSER.add_argument(
        "-m", "--multi",
        help="...",
        nargs='*', action="store")

    PARSER.add_argument(
        "-s", "--single",
        help="...",
        action="store")

    ARGS = PARSER.parse_args()

    if ARGS.login:
        vault_login(ARGS.login[0], ARGS.login[1])
    elif ARGS.read:
        vault_read(ARGS.read)
    elif ARGS.write:
        vault_write(ARGS.write[0], ARGS.write[1])
    elif ARGS.delete:
        vault_delete(ARGS.delete)

# vim: tabstop=4 expandtab shiftwidth=4 softtabstop=4
