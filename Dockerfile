## STAGE 1 - BUILD
FROM perl:5.34.0-threaded AS BUILD

MAINTAINER eduardo@fametec.com.br

RUN cd /tmp && \
	curl -OL https://sourceforge.net/projects/assp/files/ASSP%20V2%20multithreading/2.6.5%2021218/ASSP_2.6.5_21218_install.zip && \
	curl -OL https://sourceforge.net/projects/assp/files/ASSP%20V2%20multithreading/ASSP%20V2%20module%20installation/assp.mod.zip

RUN mkdir -p /var/db && \
	mkdir -p /var/db/assp/tmpDB/files && \
	cd /var/db && \
	unzip /tmp/ASSP_2.6.5_21218_install.zip && \
	mv assp/assp.cfg.rename_on_new_install assp/assp.cfg && \
	cd /var/db/assp/ && \
	unzip /tmp/assp.mod.zip

WORKDIR /var/db/assp
	
RUN perl /var/db/assp/assp.mod/install/mod_inst.pl /var/db/assp && \
	cpan-outdated -p | cpanm -n && \
	cpanm Mail::SPF::Query --force --notest --quiet && \
	cpanm IO::Socket::INET6 --force --quiet && \
	cpanm IO::Compress::Lzma --force --quiet && \
	cpanm IO::Compress::Xz --force --quiet && \
	cpanm IO::Compress::Zip --force --quiet && \
	cpanm Archive::Libarchive --force --quiet && \
	cpanm Alien::Libarchive --force --quiet

RUN rm -rf /root/.cpan && \
	rm -rf /tmp/assp.mod.zip && \ 
	rm -rf /tmp/ASSP_*_install.zip

## STAGE 2 - COPY FROM BUILD TO SLIM THREADED PERL AND 

FROM perl:5.34.0-slim-threaded

RUN apt update -q && \
	apt -q -y install mariadb-client ca-certificates && \
	apt -q -y clean all

VOLUME [ "/var/db/assp" ]

COPY --from=BUILD /usr/local/lib/perl5 /usr/local/lib/perl5

COPY --from=BUILD /var/db/assp /var/db/assp

ADD assp.cfg /var/db/assp/

RUN chown -R nobody:nogroup /var/db/assp

EXPOSE 25/tcp 2525/tcp 465/tcp 587/tcp 55555/tcp 

CMD [ "perl", "/var/db/assp/assp.pl", "/var/db/assp" ]