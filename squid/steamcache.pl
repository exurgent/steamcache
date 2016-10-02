#! /usr/local/bin/perl 

$|=1;
while (<>) 
{
    chomp;
	@X = split;
	

	if (@X[0] =~ m|^http://.*|)
	{
		$url = @X[0];
		$channelId = "";
	}
	else
	{
		$channelId = "@X[0]";
		$url = @X[1];
	}
	
	my $oldurl = $url;

	$url =~ s|http://valve[0-9]*\.cs\.steampowered\.com(.*?)\?.*|http://valveX\.cs\.steampowered\.com$1|;

        $url =~ s|http://valve[0-9]*\.steamcontent\.com(.*?)\?.*|http://valveX\.cs\.steamcontent\.com$1|;

	$url =~ s|http://content[1-8]\.steampowered\.com/|http://contentX\.steampowered\.com/|;

	
	if ( $channelId == "") 
	{ 
		print "OK store-id=$url\n" ;
	}
	else
	{ 
		print "$channelId OK store-id=$url\n" ;
	}
}

