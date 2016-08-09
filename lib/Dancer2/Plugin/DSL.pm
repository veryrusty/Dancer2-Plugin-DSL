package Dancer2::Plugin::DSL;
use Dancer2::Plugin;

sub BUILD {
    my $plugin = shift;
    my $app_class = ref( $plugin->app );

    Scalar::Util::weaken( my $dsl = $plugin->dsl );
    {
        no strict 'refs';
        no warnings 'redefine';
        *{"${app_class}::dsl"} = sub { $dsl };
    }

}

1;

__END__

=pod

=head1 NAME

Dancer2::Plugin::DSL - expose Dancer2 DSL to app instances

=head1 SYNOPSIS

  package MyApp;
  use Dancer2;
  use Dancer2::Plugin::DSL;

  get '/foo/bar' => sub { goto &MyApp::Controller::Foo::bar; };

  1;

  package MyApp::Controller::Foo;
  use warnings;
  use strict;

  sub bar { 
    my $app = shift;
    $app->dsl->status(200);
    return 'buzz';
  };

  1;

=head1 DESCRIPTION

YAGNI - until you need it. Requires Dancer2 v0.202000

=cut

