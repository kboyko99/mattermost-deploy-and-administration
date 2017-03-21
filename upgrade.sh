#!/bin/bash

source ./step-4-stop-everything.sh

source ./backup.sh

#на случай если latest перестанет быть 3.5.1
source ./step-2-select-and-prepare-mattermost-3.5.1.sh

source ./step-5-start-everything-again.sh