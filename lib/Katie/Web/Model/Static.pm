package Katie::Web::Model::Static;
use Moose;
use namespace::autoclean;
use JSON::XS;

extends 'Catalyst::Model';

has routes_file => (
    is => 'ro',
    isa => 'Str',
);

has museums_file => (
    is => 'ro',
    isa => 'Str',
);

has routes => (
    is => 'ro',
    lazy => 1,
    default => sub {
        my $self = shift;

        open my $fh, '<', $self->routes_file;
        my $routes = decode_json do {  local $/ = <$fh> };
        close $fh;

        my @result;

        for my $route (@$routes) {
            push @result, {
                name => $route->{name},
                items => [
                    map {
                      # merge hashes
                      +{
                        %{ $self->museums->{ $_->{trcid} } },
                        %{ $_ }
                      }
                    } @{ $route->{items} }
                ],
            };
        }

        return \@result;
    },
);

has museums => (
    is => 'ro',
    lazy => 1,
    default => sub {
        my $self = shift;

        open my $fh, '<', $self->museums_file;
        my $museums = decode_json do {  local $/ = <$fh> };
        close $fh;

        my %result;

        for my $museum (@$museums) {
            next unless lc($museum->{location}{city} || '') eq 'amsterdam';
            $museum->{location}{latitude}  =~ s[,][\.];
            $museum->{location}{longitude} =~ s[,][\.];
            $result{ $museum->{trcid} } = {
                title             => $museum->{details}{en}{title},
                short_description => $museum->{details}{en}{shortdescription},
                long_description  => $museum->{details}{en}{longdescription},
                location          => $museum->{location},
                image             => $museum->{media}->[0]->{url},
            };
        }

        return \%result;
    },
);

__PACKAGE__->meta->make_immutable;

1;
