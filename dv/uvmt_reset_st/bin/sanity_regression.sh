#! /bin/bash
########################################################################################################################
## Copyright 2021-2022 Datum Technology Corporation
## SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
########################################################################################################################


# Launched from uvma_reset project sim dir
mio sim     uvmt_reset_st -CE
mio sim     uvmt_reset_st -S -t rand_pulses -s 1 -c
mio results uvmt_reset_st results
mio cov     uvmt_reset_st
