package UserLib::Auth;
use strict;
use warnings;
use autodie;

use File::KeePass;

sub new {
	unless ($ENV{KEEPASS_DB} && -e $ENV{KEEPASS_DB}) {
		die "FATAL: need to set KEEPASS_DB in bashrc";
	}

	return bless({
		db => File::KeePass->load_db($ENV{KEEPASS_DB}, $_[1])
	}, $_[0]);
}

sub get {

	my %dataset = (
		ssh => $_[0]->{db}->find_group({
			title=>'ssh',
			level=>1
		})->{entries},

		mysql => $_[0]->{db}->find_group({
			title=>'mysql',
			level=>1
		})->{entries},

		psql => $_[0]->{db}->find_group({
			title=>'psql',
			level=>1
		})->{entries}
	);

	my %entry = (
		host => $_[1],
		ssh => undef,
		mysql => undef,
		psql => undef
	);


	foreach(@{$dataset{ssh}}) {
		if ($_->{title} eq $_[1]) {
			$entry{ssh} = {
				u => $_->{username},
				p => $_[0]->{db}->locked_entry_password($_)
			};
			last;
		}
	}

	foreach(@{$dataset{mysql}}) {
		if ($_->{title} eq $_[1]) {
			$entry{mysql} = {
				u => $_->{username},
				p => $_[0]->{db}->locked_entry_password($_)
			};
			last;
		}
	}

	foreach(@{$dataset{psql}}) {
		if ($_->{title} eq $_[1]) {
			$entry{psql} = {
				u => $_->{username},
				p => $_[0]->{db}->locked_entry_password($_)
			};
			last;
		}
	}

	return \%entry;
}

1;
