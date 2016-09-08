Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 8 Sep 2016 10:29:39 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Mylene Josserand <mylene.josserand@free-electrons.com>,
	linux-clk <linux-clk@vger.kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH v2 6/7] clk: sunxi-ng: Add A23 CCU
Message-ID: <20160908082939.GJ8913@lukather>
References: <20160906121837.7517-1-maxime.ripard@free-electrons.com>
 <20160906121837.7517-7-maxime.ripard@free-electrons.com>
 <CAGb2v64jDTWB4faaBdCBCcFrt1WNf=PYwc16kpgsUhaMRudHnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IJFRpmOek+ZRSQoz"
In-Reply-To: <CAGb2v64jDTWB4faaBdCBCcFrt1WNf=PYwc16kpgsUhaMRudHnQ@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--IJFRpmOek+ZRSQoz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 07, 2016 at 03:24:11PM +0800, Chen-Yu Tsai wrote:
> > +               [CLK_BUS_MSGBOX]        =3D &bus_msgbox_clk.common.hw,
>=20
> A23 manual and Allwinner sources say there is a bus gate for SPINLOCK.
> Tested it myself, and it indeed exists.

Yes, sorry. It was supposed to be spinlock instead of msgbox.

> > +       [RST_BUS_SPINLOCK]      =3D  { 0x2c4, BIT(22) },
>=20
> Allwinner sources say there is a reset control for MSGBOX.
> Tested it myself, and it indeed exists.

However, the msgbox is mentionned nowhere in the datasheet.

I'd prefer to be able to test that it actually works before adding it
to the clock driver.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--IJFRpmOek+ZRSQoz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX0SFzAAoJEBx+YmzsjxAglxgQAJpW5yqCk7jzPIlDLtkHOATG
0gz6F25GjQYSwW5b96KNbaa/crd8V0OphN/FijwO3frPqV+kzTxk0GHPt83SEqMG
rlVr0Dq7eBtyMhc3xySX3Irk//2kyGerbpLB6+j+byWbDryuvzWqx7j3TUBBYyq6
dd3yhp2zT6dDGpo6xzwSAe7KVPx28rh7LGYSwleKs19T451mxXk1huwlb3nSnYrT
vBoKXsGVALG9MHMsxFT9Liawbt9nGDhm/63MAmeCHyv02GuStZwKqNt1lFjBFekd
GbD1xpzv9kvy2f9+Vrditpe9RXIasa26w13ZKgiL8gnMUIMwufasnjr/r190Nw35
2cX5icBaUrjT9wBnSn6YA3s49tCB18j7I4O4jfAQ79i5HCYBrpZpDEwlmtv24JWP
84nvhzxSdu9M0GHYFAhFiFUr0n3sRe4GOCpsPDZI1Hz9dbwO6aSa5V+P0092K0SX
mZdxBnQK89E5S5LYU20pupyui/8gkTNXCAJvEgX/vKrrRLyL5jGc2VElIaCpmF1L
dRv96KKknZRK0Px6YmjMMfYYTbJ0MMDOwknfFt83UPlFUxjFA32T4gd9qKdrtqF3
xF7wkpMRxzzvsLrJ6pJOakMT9wbRI+v/hPo5CccDG86B54X8RQPpeWB9F2FCaSf5
6RkKtiX/9ZmEseykJoDN
=6JMo
-----END PGP SIGNATURE-----

--IJFRpmOek+ZRSQoz--
