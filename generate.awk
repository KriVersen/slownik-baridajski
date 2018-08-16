#!/bin/awk -f

BEGIN {
    # set column separator
    FS = ";"

    # set first section and print it
    section = "^A"
    print "\\section{" substr(section, 2, 2) "}"
}

# check for new section
$2 !~ tolower(section) { 
    # get new section letter
    section = "^"toupper(substr($2, 1, 1))

    # print it
    print "\n\\section{" substr(section, 2, 2) "}"
}

$1 == "noun" {
    # get appriopriate declension number
    if ($2 ~ /o$/)
        declen = "I"
    else if ($2 ~ /a$/)
        declen = "II"
    else if ($2 ~ /e$/)
        declen = "III"
    else if ($2 ~ /t$/)
        declen = "IV"
    else if ($2 ~ /d$/)
        declen = "V"
    else if ($2 ~ /th$/)
        declen = "VI"
    else
        declen = "VII"

    # print whole noun entry
    print "\\noun{" $2 "}{" $3 "}{" declen "}{\\entry{" $3 "}}"
}
