{
    package MyApp;
    use Dancer2;
    use Dancer2::Plugin::DSL;

    get '/foo/bar' => sub { goto &MyApp::Controller::Foo::bar; };

}

{
    package MyApp::Controller::Foo;
    use warnings;
    use strict;

    sub bar {
      my $app = shift;
      $app->dsl->status(200);
      return 'buzz';
    };
}

1;
