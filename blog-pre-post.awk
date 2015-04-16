# usage: awk -f blog-pre-post.awk test-me-template.html >an-index.html 
#		targeted at productions from layout.erb

BEGIN {
headier="blog-preinsert.html"

# Note this is not happening here, but is good for putting in nav:
bodier="foobar.txt"

footier="blog-postinsert.html"
}

/\$PREINSERT\$/ {
	while (getline x < headier >0){
		print x}{next;}
		}

/\$INSERT\$/ {
	q= match ($0, /\$INSERT\$/)
    startpattern= index($0,"$INSERT$")
	# print before the pattern
	print substr($0, 0, startpattern-1)
	while (getline x < bodier >0){
		print x}
		# print the remainder of line occurring after the pattern
		print substr($0, RSTART+RLENGTH)
		{next;}
		
	
}

/\$POSTINSERT\$/ {
	while (getline x < footier >0){
		print x} {next;}
	}

{ print }