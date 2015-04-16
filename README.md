# This is my readme

The general idea is to insert entire files at locations in a template file that looks like this:


$PREINSERT$

Some stuff

$INSERT$

A  whole bunch more stuff

$POSTINSERT$




based on awk rules that look like this:

/\$PREINSERT\$/ {
# This happens at rule 1
}

/\$INSERT\$/ {
    # this happens at rule 2
}

/\$POSTINSERT\$/ {
    # this happens at rule 3
}


The rules are expressed here as reg-ex, but this aspect is not exploited.


