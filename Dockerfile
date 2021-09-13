FROM perl:threaded

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
	
RUN perl /var/db/assp/assp.mod/install/mod_inst.pl /var/db/assp 

RUN cpan-outdated -p|cpanm -n

RUN cpanm Mail::SPF::Query --force

RUN cpanm IO::Socket::INET6 --force

# RUN cpanm Archive::Rar --force

RUN cpanm IO::Compress::Lzma --force

RUN cpanm IO::Compress::Xz --force

RUN cpanm IO::Compress::Zip --force 

RUN cpanm Archive::Libarchive::XS --force

ADD assp.cfg /var/db/assp/

RUN rm -rf /root/.cpan && \
	rm -rf /tmp/assp.mod.zip && \ 
	rm -rf /tmp/ASSP_*_install.zip

RUN chown -R nobody:nogroup /var/db/assp

VOLUME [ "/var/db/assp" ]

EXPOSE 25/tcp 2525/tcp 465/tcp 587/tcp 55555/tcp 

CMD [ "perl", "/var/db/assp/assp.pl", "/var/db/assp" ]
