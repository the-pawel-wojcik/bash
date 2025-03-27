#!/bin/bash

# Rotate third page by 90 degrees clockwise and leave others unchanged:
pdftk input.pdf cat 1-2 3east 4-end output new_00xx.pdf
