Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 5 Jul 2016 08:12:11 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: rui.zhang@intel.com, edubezval@gmail.com, robh+dt@kernel.org,
	wens@csie.org, emilio@elopez.com.ar, mark.rutland@arm.com,
	linux@armlinux.org.uk, mturquette@baylibre.com,
	sboyd@codeaurora.org, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [RFC PATCH 1/5] clk: sunxi: Add a driver for the PLL2 on
 A31/23/33
Message-ID: <20160705061211.GA7643@lukather>
References: <20160628101325.2522-1-icenowy@aosc.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
In-Reply-To: <20160628101325.2522-1-icenowy@aosc.xyz>
List-ID: <linux-clk.vger.kernel.org>


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jun 28, 2016 at 06:13:21PM +0800, Icenowy Zheng wrote:
> This is based on the PLL2 driver for A10/20.

Thanks for this patch.

However, as you might have seen, we're switching to a new clock code
base, so it would be great if you could use that instead.

http://lists.infradead.org/pipermail/linux-arm-kernel/2016-June/440077.html

While we declared all the clocks for the H3, nothing really mandates
that for the existing platforms we don't introduce a few clocks as
they are needed. That will probably even smoothen the transition.

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXe0+7AAoJEBx+YmzsjxAg0SQP/12GR1O+kAiQdkVMdqw0u8we
udCmpgX504kQ02GuGXsPQz9BJ4xd2Rjhi0ljVcBLgle3xt/m2kA2qeMYPUwagQLT
6NZR1t/yHGrQIspokXVQNlH4hLz9Bi3/5ja8uxUmZOEF+oSrRBmJWQ2sQgtvkIT6
wvJecu3cPobojjZg1eYWlO6SY6HBMe1I4k+7PlkO4QE56LB9VAbJ+C8zMZJo6CZn
c5V8NRnD68zNjgVcq3Cu6HEHvRMM9dWUc4CJIm4HsqNHOK4xMUq4MObti/waSAZn
qn5W+ObE7Ov/fSBbmQg93l37z5ldLqGZqYO0vbVuRIWwHcgGx3SNiJCloZenznH1
Xgkj/Ik38CJh6sy7G1ujurFW+oazmOHDs4x6D4YRAPkpJEUp6A7ceKocxDOBz32l
oOc4tixqpl/QbcyyVNQAVw6G33Kd2AIILHug8iiNdpxgd5xg1j4gTNaM2en9A/KK
0Om7WwWbpLWcU9E4fxccqnVlRrNxKKc3POjYIKGbThlh9HvE/oPntGpfU+Utcc4d
TfIoS4fMK4/QlXBpKfMn5N2xbsx6j8HzBAngVh8pac7GhRCG6OBo+DgoLlhoc9Mi
TTWoHoFQQxWmWHvu+/Dy+nC3+NQh8bKcPUKTiw2KPht2lsVitHHIoc+7ZDHQPNrE
cLZYpvwQ6l+vioP26u/y
=rIEg
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--
