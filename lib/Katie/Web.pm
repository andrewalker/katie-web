package Katie::Web;
use Moose;
use namespace::autoclean;
use Catalyst qw/
    ConfigLoader
    Static::Simple
/;

extends 'Catalyst';

our $VERSION = '0.01';

__PACKAGE__->config(
    # Disable deprecated behavior needed by old applications
    disable_component_resolution_regex_fallback => 1,
    root => '__path_to(share)__',
);

# Start the application
__PACKAGE__->setup();

1;
