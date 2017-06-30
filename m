Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 30 Jun 2017 11:52:59 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Priit Laes <plaes@plaes.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
	Jonathan Liu <net147@gmail.com>
Subject: Re: [PATCH v4 6/6] ARM: sun4i: Convert to CCU
Message-ID: <20170630095259.publzn56jy3ru5qb@flea>
References: <cover.24b2b13ec5a68552e186ba1637f1328363c3886e.1498422562.git-series.plaes@plaes.org>
 <f4b2bbc20ca8afa9cc918ba8f781bd69ec3c6d00.1498422562.git-series.plaes@plaes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4barowp35roet375"
In-Reply-To: <f4b2bbc20ca8afa9cc918ba8f781bd69ec3c6d00.1498422562.git-series.plaes@plaes.org>
List-ID: <linux-clk.vger.kernel.org>


--4barowp35roet375
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Jun 25, 2017 at 11:45:47PM +0300, Priit Laes wrote:
>  		osc24M: clk@01c20050 {
>  			#clock-cells =3D <0>;
>  			compatible =3D "allwinner,sun4i-a10-osc-clk";
> @@ -187,487 +176,12 @@
>  			clock-output-names =3D "osc24M";
>  		};

This should be a fixed clock now.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--4barowp35roet375
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZVh97AAoJEBx+YmzsjxAgvNUQAL2YavHx6f00MJFhgG1N8kr3
/NBAHvkYmbpgN2HRNkyNeaD5KeXTgbxlOy7Qr+YqGGXEsEGiCAxsfEaUOzZUF9Tb
7ftx+qcUOTMNZv1hMQgptgMdS9EvtrjEVIpEOugno7MOZaIJiZ2Hv1kG3W6kDGXV
3xawBesdj/QPMc740EhkPa/rBcGdd/8pAVXGGGdhCgHs4fIo5xN/SPPhfvoL95Bj
yh7glPYez97BREaXhNvYaEaIcikkT7XNi1kOtkkq9Aw/ybA0mcUaudvLX76zwMX6
V6qSlWzYoSuPOeyhsvCJ9R39/jcPeoDCGZY1YUmHF2BxBhNn4HpaXzBEr5YuDKx6
19wbqyT8RXykjpyeUa/dF2R9OtJuwqhTjeaXkyF6plFBbabO5gSG1vU6v8sZBokk
7RIOjzvFXI14tyZAZjTzh35lgQ0J9a7X5uKRa37vxbb8lYWTygSjS9q4+fSIC8VS
U4dGcluS/35qaeigPHjrG2WOSth5Pf/mI/+uh1ArAULxrgqIgwC3bfbV6qctF3Cu
L7qyfAuFjyTfr/ak/FTAseX8H43RS93ogjhGS8tunYaH+R2VDkMoNHCu7BB9noij
FTks2WcH+J/qb6lMAs8pcXzKoE7cD9oxIrb/41iyFwma6cM7UEXfHOSzgSs4wEG5
jMqP/C7cxcZkVPcQ5GYC
=ldHl
-----END PGP SIGNATURE-----

--4barowp35roet375--
