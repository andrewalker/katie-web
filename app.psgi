use strict;
use warnings;
use Katie::Web;

my $app = Katie::Web->apply_default_middlewares(Katie::Web->psgi_app);

$app;
