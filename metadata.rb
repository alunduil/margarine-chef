name "margarine"
version "1.0.0"
description "This tool adds features to an amalgamation of delicious, the social bookmarking application, and readability, the excellent web article renderer."
maintainer "Hart Hoover"
maintainer_email "hart.hoover@rackspace.com"

depends "python"
depends "apt"

supports "ubuntu"

recipe "margarine::default",
	"Installs and configures services that are common to each margarine service."

recipe "margarine::blend",
	"Installs the Blend service."

recipe "margarine::spread",
	"Installs the spread service."

recipe "margarine::tinge",
	"Installs the tinge service."

