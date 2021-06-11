#!/bin/bash

awk '{print $1, $2 "\t" $5, $6}' $1"_Dealer_schedule" | grep "$2 $3"
