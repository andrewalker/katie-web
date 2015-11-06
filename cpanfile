requires 'Catalyst::Runtime' => '5.90101';
requires 'Catalyst::Plugin::ConfigLoader';
requires 'Catalyst::Plugin::Static::Simple';
requires 'Catalyst::Action::RenderView';
requires 'Moose';
requires 'namespace::autoclean';
requires 'Config::General';
requires 'JSON::XS';
requires 'Template';
requires 'Catalyst::View::TT';
requires 'Gazelle';

on test => sub {
    requires 'Test::More' => '0.88';
};
