package Katie::Web::Controller::Routes;
use Moose;
use namespace::autoclean;
use JSON::XS;

BEGIN { extends 'Catalyst::Controller' }

sub base :Chained('/') :PathPrefix :CaptureArgs(0) {
    my ( $self, $ctx ) = @_;
}

sub list :Chained('base') :PathPart('') :GET :Args(0) {
    my ( $self, $ctx ) = @_;

    my $i = 0;
    my $routes = $ctx->model->routes;

    $ctx->stash(
        routes => [
            map {
              {
                  id    => $i++,
                  title => $_->{name},
                  image => $_->{items}[3]{image},
              }
            } @$routes
        ],
    );
}

sub show :Chained('base') :PathPart('') :GET :Args(1) {
    my ( $self, $ctx, $route ) = @_;

    $route = $ctx->model->routes->[int $route];

    $ctx->stash(
        route => $route,
        route_json => encode_json $route,
    );
}

sub custom :Chained('base') :GET :Args(0) {
    my ( $self, $ctx ) = @_;
}

__PACKAGE__->meta->make_immutable;

1;
