#!/bin/bash

cd ~/streamalert && ./manage.py configure aws_account_id $1
cd ~/streamalert && ./manage.py configure prefix $2
cd ~/streamalert && ./manage.py init
