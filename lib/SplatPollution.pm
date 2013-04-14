package SplatPollution;
use Dancer ':syntax';

our $VERSION = '0.1';

get qr{(.*)} => sub {
    my $report;

    $report .= "Parameters received via `params()`:\n";
    foreach (keys %{&params}) {
        $report .= sprintf "*   %s => '%s'\n", $_, params->{$_};
    }

    $report .= "Parameters received via `request->params('query')`:\n";
    my $real_params = request->params('query');
    foreach (keys %{$real_params}) {
        $report .= sprintf "*   %s => '%s'\n", $_, $real_params->{$_};
    }

    return $report;
};

true;
