package Katie::Web::Controller::Routes;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

sub base :Chained('/') :PathPrefix :CaptureArgs(0) {
    my ( $self, $ctx ) = @_;
}

sub list :Chained('base') :PathPart('') :GET :Args(0) {
    my ( $self, $ctx ) = @_;
}

sub show :Chained('base') :PathPart('') :GET :Args(1) {
    my ( $self, $ctx, $route ) = @_;
}

sub custom :Chained('base') :GET :Args(0) {
    my ( $self, $ctx ) = @_;
}

__PACKAGE__->meta->make_immutable;

1;
