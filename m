Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 6 Nov 2015 16:11:09 -0800
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	David Airlie <airlied@linux.ie>,
	Thierry Reding <thierry.reding@gmail.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>,
	Alexander Kaplan <alex@nextthing.co>,
	Wynter Woods <wynter@nextthing.co>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 04/19] clk: sunxi: Add TCON channel1 clock
Message-ID: <20151107001109.GQ6114@lukather>
References: <1446214865-3972-1-git-send-email-maxime.ripard@free-electrons.com>
 <1446214865-3972-5-git-send-email-maxime.ripard@free-electrons.com>
 <20151030213734.GI19782@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xFawzEZLoq+g1Byu"
In-Reply-To: <20151030213734.GI19782@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>


--xFawzEZLoq+g1Byu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Oct 30, 2015 at 02:37:34PM -0700, Stephen Boyd wrote:
> On 10/30, Maxime Ripard wrote:
> > The TCON is a controller generating the timings to output videos signal=
s,
> > acting like both a CRTC and an encoder.
> >=20
> > It has two channels depending on the output, each channel being driven =
by
> > its own clock (and own clock controller).
> >=20
> > Add a driver for the channel 1 clock.
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>=20
> Similar comments apply to patches 3 and 4. Was the same code
> copy/pasted two more times and then changed to have different
> values?

I don't really recall, but I probably used the same skeleton yeah.

> Looks like we should consolidate all that stuff into something more
> generic so that we don't have the same problems 3 times.

Does it?

They're both pretty different actually. One is a gate + mux + reset
(patch 3), the other one is actually a combination of two clocks, one
that is the parent of the other, the former being a gate + mux, the
latter a gate + div.

At least at the hardware level, they're very different, and adding
more code to deal with both case would complicate quite a lot the
probe code, for no real reasons.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--xFawzEZLoq+g1Byu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWPUGdAAoJEBx+YmzsjxAgAw0P/3pyCnGjU4AOJsYSJhlvfOJZ
RPcBNJou//psQiSrmBM0MXGtn1/Dd8utbP0uhoP06llPPdULenQvvtdWAm7fD+L6
QzML6uqthQXeU2UBs+wbFJmFAg10TyUju7vb750jq1JDebRACFihOpsd3IYlqByJ
v6JlfBTFgbvpkwceVHC7qGrgEZh9gymD2pLa8sc9hpz/WxJYY2zNhVNrv+/T+9Ml
UuyIRd1X1EzaBwgS/WlzV0YmeUURFIEmkCkPRzu8onlnkgz2O/MucTD5lhWg/aya
HiBpMCtahF8YYR7Fy335Z2FHxAagl4buYXYvVZDC6jPaXCCjuV3+KLLa17Ngfxyl
bt7pujz722FS7Oxt8shTAX0Z4c+Wls+mmpBFsEDvMoyeW99RsnjPIq1ogMMYT8+t
oIzHYfuHWxmPZMTV2xcrBB7CXOQ1KQ+VoJijZ9qrAVS8z21A6cts3PjuKv3kzTod
3pgR2eWOVSn/82WUFqfrOUUVJ+ysHpKGbbKYnHO2VyZxWqGiCuQlJw3+nfnL2tFF
bOr5G0baGLgbCttaoy395B25ZsNRQCGDZXEmzXFbwRe9CxiQQeHsRX4HNoku7PG8
Skl9znOGvb8ec2P8ktB/E696KDp/0kTE1LvpV60ktlqc86SVn+H0XZAC/mMwPSed
dx3QtFH+G49kD39eoR5b
=jGTD
-----END PGP SIGNATURE-----

--xFawzEZLoq+g1Byu--
