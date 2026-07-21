
my $batang = $ARGV[0] =~ /Batang/ ? 1 : 0;

# HCR v2.120: jungseong/jongseong variants uni1161.y0 .. uniD7FB.y4,
# then tone mark vert/other glyphs at the end; Dotum-Bold interleaves
# two full-width glyphs there, skipped by the height==0 guard
my ($start,$stop,$tmvstart, $tmvstop) = (63274,64629,65204,65211);
if ($batang) {
  $start = 62830;
  $stop = 64185;
  $tmvstart = 64762;
  $tmvstop = 64767;
}

while(<>) {
  if (/name="glyph(\d+)"\s+height="0"\s+tsb="([\-\d]+)"/) {
    my ($glyph,$tsb) = ($1,$2);
    if ( ($glyph >= $start and $glyph <= $stop)
        or ($glyph >= $tmvstart and $glyph <= $tmvstop) ) {
      $tsb = $tsb - 1050 ; # 1050 is total height
      s/tsb="[\-\d]+"/tsb="$tsb"/;
    }
  }
  print;
}

