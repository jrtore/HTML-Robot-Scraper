package HTML::Robot::Scrapper::Reader::TestReader;
use Moo;
with 'HTML::Robot::Scrapper::Reader';
#use Moose::Role;
use Data::Printer;
use Digest::SHA qw(sha1_hex);

has startpage => (
    is => 'rw',
#   isa => 'Str',
    default => sub { return 'http://www.bbc.co.uk/'} ,
);

sub on_start {
    my ( $self, $self->robot ) = @_;
#   $self->append( search => $self->startpage );
    $self->append( search => 'http://www.zap.com.br/' ); #iso-8859-1
    $self->append( search => 'http://www.uol.com.br/' );
    $self->append( search => 'http://www.google.com/' );
    warn p $self->robot;
#   warn p $self->url_list;
}

sub search {
    my ( $self, $self->robot ) = @_;
    my $title = $self->robot->parser->engine->tree->findvalue( '//title' );
#   my $title = $self->robot->parser->engine->tree->findnodes( '//title' );
#   warn p $self->robot->parser->engine->tree;
    warn $title;
    warn $title;
    warn $title;
    warn $self->current_page;
#   $self->writer->url( $self->robot->instance->current_page );
#   $self->writer->html( sha1_hex($self->html_content) );
#   $self->writer->save();
#   my $news = $self->tree->findnodes( '//div[@class="detalhes"]/h1/a' );
#   foreach my $item ( $news->get_nodelist ) {
#        my $url = $item->attr( 'href' );
#        $self->prepend( detail => $url ); #  append url on end of list
#   }
}

sub on_link {
    my ( $self, $url ) = @_;
#   warn '  ==> '.$url;
    if ( $url =~ m{^http://www.bbc.co.uk}ig ) {
        $self->prepend( search => $url ); #  append url on end of list
    }
}


sub detail {
    my ( $self ) = @_;
    warn $self->tree->findvalue( '//h1' );
#   $self->data->author( $self->tree->findvalue( '//div[@class="bb-md-noticia-autor"]' ) );
#   $self->data->webpage( $self->current_page );
#   $self->data->content( $content );
#   $self->data->title( $self->tree->findvalue( '//title' ) );
#   $self->data->meta_keywords( $self->tree->findvalue( '//meta[@name="keywords"]/@content' ) );
#   $self->data->meta_description( $self->tree->findvalue( '//meta[@name="description"]/@content' ) );
#   $self->data->save;
}

sub on_finish {
    my ( $self ) = @_;
    warn "=> on_finish()";
}

1;