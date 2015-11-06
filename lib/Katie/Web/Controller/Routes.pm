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

    $ctx->stash(
        locations => [
            {
                title   => 'Van Gogh Museum',
                image   => 'https://upload.wikimedia.org/wikipedia/commons/0/08/Van_Gogh_Museum_Amsterdam.jpg',
                address => 'Museumplein 6',
                rating  => 3,
                crowd   => 1,
                price   => 1,
                time    => 2,
            },
            {
                title   => 'Rijksmuseum',
                image   => 'http://www.iamsterdam.com/remote/ndtrc/Images/20101207/1d7707b0-2080-49e7-a34b-32f9a9ac6236.jpg',
                address => 'Museumstraat 1',
                rating  => 3,
                crowd   => 2,
                price   => 3,
                time    => 3,
            },
            {
                title   => 'Museum of Bags and Purses',
                image   => 'http://img1.10bestmedia.com/Images/Photos/105402/museum-of-bags-purses-amsterdam-tassenmuseum_54_990x660_201406011713.jpg',
                address => 'Herengracht 573',
                rating  => 1,
                crowd   => 0,
                price   => 1,
                time    => 1,
            },
            {
                title   => 'Amsterdam Dungeon',
                image   => 'http://www.kittehscupcakes.nl/wp-content/uploads/2013/10/amsdungeonbar1.png',
                address => 'Rokin 78',
                rating  => 2,
                crowd   => 0,
                price   => 1,
                time    => 1,
            },
        ],
    );
}

sub custom :Chained('base') :GET :Args(0) {
    my ( $self, $ctx ) = @_;
}

__PACKAGE__->meta->make_immutable;

1;
