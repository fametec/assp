FROM debian:9

MAINTAINER eduardo@fametec.com.br

RUN apt-get -y update

RUN apt-get -y install zip \
	gzip \
	zip \
	unzip \
	perl \
	openssl \
	make \
	gcc \
	libnet-ssleay-perl \
	libnet-smtp-ssl-perl \
	libio-socket-ssl-perl \
	libnet-http-perl \
	libnet-dns-perl \
	liblwp-protocol-https-perl \
	libencode-detect-perl \
	libmail-dkim-perl \
	libcompress-raw-zlib-perl \
	db5.3-util \
	libberkeleydb-perl \
	mariadb-client
	
RUN perl -MCPAN -e 'install App::cpanminus'
RUN perl -MCPAN -e 'install App::cpanoutdated'
RUN perl -MCPAN -e 'install Encode::Detect'
# RUN perl -MCPAN -e 'install Encode::HanExtra'
RUN perl -MCPAN -e 'install Time::ParseDate'
RUN perl -MCPAN -e 'install Time::CTime'
RUN perl -MCPAN -e 'install Time::DaysInMonth'
RUN perl -MCPAN -e 'install Time::JulianDay'
RUN perl -MCPAN -e 'install Time::Timezone'
# RUN perl -MCPAN -e 'install Text::Glob'
RUN perl -MCPAN -e 'install Number::Compare'
# RUN perl -MCPAN -e 'install Compress::Zlib'
RUN perl -MCPAN -e 'install IO::Wrap'
RUN perl -MCPAN -e 'install Convert::TNEF'
RUN perl -MCPAN -e 'install Digest::MD5'
RUN perl -MCPAN -e 'install Digest::SHA1'
RUN perl -MCPAN -e 'install Email::Send'
RUN perl -MCPAN -e 'install Email::MIME'
RUN perl -MCPAN -e 'install Email::Valid'
RUN perl -MCPAN -e 'install Email::Outlook::Message'
RUN perl -MCPAN -e 'install File::ReadBackwards'
RUN perl -MCPAN -e 'install File::Scan::ClamAV'
RUN perl -MCPAN -e 'install LWP::Simple'
RUN perl -MCPAN -e 'install MIME::Types'
RUN perl -MCPAN -e 'install Mail::DKIM::Verifier'
RUN perl -MCPAN -e 'install Mail::DKIM'
RUN perl -MCPAN -e 'install NetAddr::IP'
RUN perl -MCPAN -e 'install Net::IP'
RUN perl -MCPAN -e 'install Mail::SPF'
RUN perl -MCPAN -e 'install Mail::SPF::Query'
RUN perl -MCPAN -e 'install Mail::SRS'
RUN perl -MCPAN -e 'install Net::CIDR::Lite'
RUN perl -MCPAN -e 'install Net::DNS'
RUN perl -MCPAN -e 'install Net::IP::Match::Regexp'
RUN perl -MCPAN -e 'install Net::LDAP'
RUN perl -MCPAN -e 'install Net::SMTP'
RUN perl -MCPAN -e 'install Net::SenderBase'
RUN perl -MCPAN -e 'install Net::Syslog'
RUN perl -MCPAN -e 'install PerlIO::scalar'
# RUN perl -MCPAN -e 'install threads'
RUN perl -MCPAN -e 'install threads::shared'
RUN perl -MCPAN -e 'install Thread::Queue'
RUN perl -MCPAN -e 'install Thread::State'
RUN perl -MCPAN -e 'install Tie::DBI'
# RUN perl -MCPAN -e 'install Time::HiRes'
RUN perl -MCPAN -e 'install Schedule::Cron'
RUN perl -MCPAN -e 'install Sys::MemInfo'
RUN perl -MCPAN -e 'install Sys::CpuAffinity'
RUN perl -MCPAN -e 'install IO::Socket::SSL'
RUN perl -MCPAN -e 'install BerkeleyDB'
RUN perl -MCPAN -e 'install Crypt::CBC'
RUN perl -MCPAN -e 'install Crypt::OpenSSL::AES'
RUN perl -MCPAN -e 'install Crypt::GOST'
RUN perl -MCPAN -e 'install Authen::SASL'
# RUN perl -MCPAN -e 'install Data::Dumper'
RUN perl -MCPAN -e 'install Devel::Peek'
# RUN perl -MCPAN -e 'install Devel::Size'
RUN perl -MCPAN -e 'install Devel::InnerPackage'
RUN perl -MCPAN -e 'install Convert::Scalar'
RUN perl -MCPAN -e 'install Net::SMTP::SSL'
RUN perl -MCPAN -e 'install Socket6'
RUN perl -MCPAN -e 'install IO::Socket::INET6'
RUN perl -MCPAN -e 'install IO::Socket::IP'
RUN perl -MCPAN -e 'install Lingua::Stem::Snowball'
RUN perl -MCPAN -e 'install Lingua::Identify'
RUN perl -MCPAN -e 'install Lingua::StopWords'
RUN perl -MCPAN -e 'install Lingua::Stem'
RUN perl -MCPAN -e 'install Lingua::Stem::Patch' 
RUN perl -MCPAN -e 'install MIME::Charset'
RUN perl -MCPAN -e 'install Crypt::SMIME'
RUN perl -MCPAN -e 'install Unicode::LineBreak'
RUN perl -MCPAN -e 'install Text::Unidecode'
RUN perl -MCPAN -e 'install Regexp::Optimizer'
RUN perl -MCPAN -e 'install OLE::Storage_Lite'
RUN perl -MCPAN -e 'install IO::Compress::Gzip'
RUN perl -MCPAN -e 'install IO::Compress::Bzip2'
RUN perl -MCPAN -e 'install IPC::Run'
# RUN perl -MCPAN -e 'install Archive::Zip'
# RUN perl -MCPAN -e 'install Archive::Tar'
RUN perl -MCPAN -e 'install Archive::Rar'
RUN perl -MCPAN -e 'install Archive::Extract'
RUN perl -MCPAN -e 'install File::Type'
RUN perl -MCPAN -e 'install IO::Compress::Base'
RUN perl -MCPAN -e 'install IO::Compress::Deflate'
RUN perl -MCPAN -e 'install IO::Compress::Lzma'
RUN perl -MCPAN -e 'install IO::Compress::RawDeflate'
RUN perl -MCPAN -e 'install IO::Compress::Xz'
RUN perl -MCPAN -e 'install IO::Compress::Zip'
RUN perl -MCPAN -e 'install DBD::File'
RUN perl -MCPAN -e 'install DBD::LDAP'
RUN perl -MCPAN -e 'install DBD::ODBC'
RUN perl -MCPAN -e 'install DBD::PgPP'
RUN perl -MCPAN -e 'install DBD::Sprite'
RUN perl -MCPAN -e 'install DBD::mysql'
RUN perl -MCPAN -e 'install Razor2::Client::Agent'
RUN perl -MCPAN -e 'install HTML::Strip'
RUN perl -MCPAN -e 'install HTML::TreeBuilder'
RUN perl -MCPAN -e 'install XML::RSS' 
RUN perl -MCPAN -e 'install Alien::Libarchive'
RUN perl -MCPAN -e 'install Archive::Libarchive::XS'
RUN perl -MCPAN -e 'install Sys::Syslog'
RUN perl -MCPAN -e 'install Filesys::Df'

COPY assp.mod.zip ASSP_2.6.3_19169_install.zip /tmp/ 

RUN mkdir -p /var/db && \
	mkdir -p /var/db/assp/tmpDB/files && \
	cd /var/db && \
	unzip /tmp/ASSP_2.6.3_19169_install.zip && \
	mv assp/assp.cfg.rename_on_new_install assp/assp.cfg && \
	cd /var/db/assp/ && \
	unzip /tmp/assp.mod.zip
	
RUN cd /var/db/assp/assp.mod/install && \
	perl mod_inst.pl 

ADD assp.cfg /var/db/assp/

RUN chown -R nobody:nogroup /var/db/assp

VOLUME [ "/var/db/assp" ]

EXPOSE 25/tcp 2525/tcp 465/tcp 587/tcp 55555/tcp 

CMD [ "perl", "/var/db/assp/assp.pl", "/var/db/assp" ]

RUN  apt-get -y clean && \
	rm -rf $HOME/.cpan && \
	rm -rf /tmp/assp.mod.zip && \ 
	rm -rf /tmp/ASSP_*_install.zip

