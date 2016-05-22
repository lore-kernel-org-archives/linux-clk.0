Return-Path: <maxime.ripard@free-electrons.com>
Date: Sun, 22 May 2016 21:22:19 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Vishnu Patekar <vishnupatekar0510@gmail.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 08/16] clk: sunxi-ng: Add M-factor clock support
Message-ID: <20160522192219.GZ27618@lukather>
References: <1462737711-10017-1-git-send-email-maxime.ripard@free-electrons.com>
 <1462737711-10017-9-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v67wqsLR9QoMihSS6dkqqtyed=HqyBMJEp4adNm_xF-26Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tUxbtEzdJc4sX0sj"
In-Reply-To: <CAGb2v67wqsLR9QoMihSS6dkqqtyed=HqyBMJEp4adNm_xF-26Q@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--tUxbtEzdJc4sX0sj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 22, 2016 at 01:09:09AM +0800, Chen-Yu Tsai wrote:
> Hi,
>=20
> On Mon, May 9, 2016 at 4:01 AM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > Introduce support for clocks that divide by a linear factor.
>=20
> I think we can have just one implementation for single divide factor
> (either P or M)
> clocks, using the CCF divider helpers. Even the divider table clock
> could be merged
> in.

This is a good point, I'll merge the drivers.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--tUxbtEzdJc4sX0sj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXQgbrAAoJEBx+YmzsjxAghFcP/30L30PiM0YNEPfq4xo5Zm5Y
ig3CDHG75eFFwTu6O8kp1iuxvgjvEuhOoteGkLo9enQodW5nfE+e5M0YOZ2B+h06
TdhUntoUaXq/yVvN/88z4x+E9lc/ejHnenLEsYckKZ6P74kOgeLcK93jQqZf7u0J
NrPwoCRANzkQPHyLDr7ASe6zRBxGpnjIeSOWj/o52VjXal0/AR2RvNBhZS8rYgyl
tHPpHx+Afsqlqeulc0pDeVP7bBKEpWvu4R/MqlM/u0K1HmxHgjSINu/p43XudV/D
egnWea9Fo+EedXAVF7wTRqgYp2ZAHod1+J1oWcl0q/dfqCDqlBbYmV8/eTDrw0Mf
rFuhnv/4u0i+CSF7/aENjWsSB8TTt/JoGeu4oMzVkqB/0t/YlxYWp5eWo5SsCYTU
f/qIva/kbNV+bbSMauj0D5m+aWU6/nwGSpYFb7R7Ixy2diCqsKCKYA+UNRgTAJ0n
S/2vXBuR4O4rsg6eJhaMwJJOABdmcY023bXqMs0wOjxmaSiW+SXPQiVaaSTIi+2v
S2/ZubxfOmnMb4pXyycXgCn+ZrhL/nd2HgRkJ86toifHH1q9rFZZkr+UB3IQr6r5
mB143RzvUA+IoBtDZi9bekCBLiLUf6xSWlv8kFct11jqgWojZl4yHtT3PjWVvb8m
v0JgTBfk9IfSaKZCe149
=Dvw2
-----END PGP SIGNATURE-----

--tUxbtEzdJc4sX0sj--
