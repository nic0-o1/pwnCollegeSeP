#!/usr/bin/perl

open(DATA, "</flag") or die "Couldn't open file file.txt, $!";

while(<DATA>) {
   print "$_";
}