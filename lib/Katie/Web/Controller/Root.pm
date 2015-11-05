package Katie::Web::Controller::Root;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

__PACKAGE__->config(namespace => '');

sub index :Path :Args(0) {
    my ( $self, $ctx ) = @_;

    $ctx->stash(template => 'home.tt2');
}

sub routes :Local :Args(0) {
    my ( $self, $ctx ) = @_;

    $ctx->stash(template => 'routes.tt2');
}

sub diy :Local :Args(0) {
    my ( $self, $ctx ) = @_;

    $ctx->stash(template => 'diy.tt2');
}

sub selected_route :Path('routes') :Args(1) {
    my ( $self, $ctx, $route ) = @_;

    $ctx->stash(template => 'selected-route.tt2');
}

sub default :Path {
    my ( $self, $ctx ) = @_;
    $ctx->res->body( 'Page not found' );
    $ctx->res->status(404);
}

sub end : ActionClass('RenderView') {}

__PACKAGE__->meta->make_immutable;

1;
