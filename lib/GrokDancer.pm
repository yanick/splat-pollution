package GrokDancer;
use Dancer ':syntax';

our $VERSION = '0.1';

get qr{(.*)} => sub {
    my $report = "Parameters received:\n";
    foreach (keys %{&params}) {
        $report .= sprintf "*   %s => '%s'\n", $_, params->{$_};
    }
    return $report;
};

true;
