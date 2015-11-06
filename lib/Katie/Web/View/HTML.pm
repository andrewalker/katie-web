package Katie::Web::View::HTML;
use Moose;
use namespace::autoclean;

extends 'Catalyst::View::TT';

__PACKAGE__->config(TEMPLATE_EXTENSION => '.tt2', render_die => 1);

__PACKAGE__->meta->make_immutable(inline_constructor => 0);

1;
