use strict;
use warnings;
use lib 't/lib';

use Test::More;
use Plack::Test;
use HTTP::Request::Common;

use MyApp;
my $test = Plack::Test->create(MyApp->to_app);

my $res = $test->request( GET '/foo/bar' );
ok( $res->is_success );

done_testing;

