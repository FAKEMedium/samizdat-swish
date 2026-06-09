use strict;
use warnings;
use Test::More;
use_ok('Samizdat::Model::Swish');
use_ok('Samizdat::Controller::Swish');
use_ok('Samizdat::Plugin::Swish');
use YAML::XS qw(LoadFile);
use File::Spec;
my ($d) = grep { -d } map { File::Spec->catdir($_, 'Samizdat','resources') } @INC;
ok($d, 'resources dir is on @INC');
my $schema = eval { LoadFile(File::Spec->catfile($d,'settings','swish','schema.yml')) };
ok(ref $schema eq 'HASH', 'swish settings schema loads')
  and is($schema->{'x-samizdat-audience'}, 'operator', 'audience is operator');
ok(-d File::Spec->catdir($d,'templates','swish'), 'swish templates ship');
ok(scalar(glob(File::Spec->catfile($d,'migrations','pg','*-swish.sql'))), 'swish pg migration ships');
done_testing;
