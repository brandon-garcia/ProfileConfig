package Profile::Auth;
use strict;
use warnings;
use autodie;

use File::KeePass;

sub new {
    my ($pkg, $keepass_dbpath, $master_pass) = @_;
    return bless({
        db => File::KeePass->load_db($keepass_dbpath, $master_pass)
    }, $pkg);
}

sub get {
    my ($self, $group, $entry_name) = @_;

    my $entries = $self->{db}->find_group({ title => $group, level => 1 })->{entries};

    for my $entry (@{ $entries }) {
        if ($entry->{title} eq $entry_name) {
            return [
                $entry->{username},
                $self->{db}->locked_entry_password($entry)
            ];
        }
    }
    return undef;
}

1;
