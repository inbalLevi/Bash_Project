#!/bin/bash

# Environment variables definitions such as: string from the user, reasons for condition failures,
# colors and OK status.
# Run the script: ./password-validator.sh '[password]'

#the first input argument 
PASS=$1
REASON=""
ISGOOD=0
RED=`tput setaf 1`
GREEN=`tput setaf 2`

# Check if string is less than 10 characters
if [ ${#PASS} -ge 10 ]; then ((ISGOOD++))
else REASON+="your password does not include 10 or more characters\n"; fi


# Check if string include lowercase letters
if [[ $PASS =~ [a-z] ]]; then ((ISGOOD++))
else REASON+="your password does not include lowercase letters\n"; fi

# Check if string include uppercase letters
if [[ $PASS =~ [A-Z] ]]; then ((ISGOOD++))   
else REASON+="your password does not include uppercase letters\n"; fi

# Check if string include digits
if [[ $PASS =~ [0-9] ]]; then ((ISGOOD++))
else REASON+="your password does not include digits\n"; fi

# Check ISGOOD status, if ISGOOD doesn't equal to 4, it means that password isn't good enough 
# since it doesn't meet the conditions above
if [ $ISGOOD == 4 ]; then echo "${GREEN}Your password is awesome!"; exit 0
else echo -e "${RED}Weak Password\n$REASON"; fi
