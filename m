Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 6 Nov 2015 16:01:39 -0800
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	David Airlie <airlied@linux.ie>,
	Thierry Reding <thierry.reding@gmail.com>,
	devicetree <devicetree@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	linux-sunxi <linux-sunxi@googlegroups.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Alexander Kaplan <alex@nextthing.co>,
	Wynter Woods <wynter@nextthing.co>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 04/19] clk: sunxi: Add TCON channel1 clock
Message-ID: <20151107000139.GP6114@lukather>
References: <1446214865-3972-1-git-send-email-maxime.ripard@free-electrons.com>
 <1446214865-3972-5-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v650S8+8SNNBqx7u8k8wxHm2fSKdht=W3yA9Mh=rpU+hOA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Fl9V9vFrQUs+59QW"
In-Reply-To: <CAGb2v650S8+8SNNBqx7u8k8wxHm2fSKdht=W3yA9Mh=rpU+hOA@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--Fl9V9vFrQUs+59QW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Oct 31, 2015 at 05:53:26PM +0800, Chen-Yu Tsai wrote:
> On Fri, Oct 30, 2015 at 10:20 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > The TCON is a controller generating the timings to output videos signal=
s,
> > acting like both a CRTC and an encoder.
> >
> > It has two channels depending on the output, each channel being driven =
by
> > its own clock (and own clock controller).
> >
> > Add a driver for the channel 1 clock.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  drivers/clk/sunxi/Makefile             |   1 +
> >  drivers/clk/sunxi/clk-sun4i-tcon-ch1.c | 167 +++++++++++++++++++++++++=
++++++++
> >  2 files changed, 168 insertions(+)
> >  create mode 100644 drivers/clk/sunxi/clk-sun4i-tcon-ch1.c
>=20
> According to the documents I have, this variant of the TCON clock
> is specific to sun5i. On sun4i/sun7i, TCON CH1 clock has the same
> layout as TCON CH0 and the other display clocks.

At least for the A20, it's not true.

Make sure you do not confuse LCD1 CH0 (p79, which is a channel 0
clock), with LCD0 CH1 (p81, which is a channel 1 clock).

> > +       sclk1_parents[0] =3D sclk2_name;
> > +       sclk1_parents[1] =3D sclk2d2_name;
>=20
> Is there any need to expose these 2 clocks via DT using of_clk_add_provid=
er?

No, as far as I'm aware, there's no user external to this clock
driver.

> Note that these complex clock trees within a clock node breaks the
> assigned-clock-parents mechanism, as you can no longer specify the output
> clock's direct parents.

There's no point of changing the parent either. Hardware blocks are
always connected to the leaf clock (sclk1). We could also model it as
an extra 1-bit divider, which would simplify a bit the logic though.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--Fl9V9vFrQUs+59QW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWPT9jAAoJEBx+YmzsjxAgrb8QAIIINpEIELZapXD57xRAXYSt
ihwW9RwrgjPZFH1H/9+QfTZ+KKHCIQbg/d45KKL35LC6LrBnlLG9o3VPm0j95QVz
N4ug0sWdAlm31OUusfKH8dv36eTj43z6CUe6cccaTSYTaDt9LIJQe0IRsOwLCJ6G
XR4y0xMIauO3FtBmPWCGcgz86aRTPiM5Ou1cYX4dp7OXAmEffrBQ7+cH2l8RPICB
NFIUJU+zOd15zSdhvnlE4YnjiJkoHbXNjQCBLaA2gVQvbctxyM8zTYaet7TifeID
N5VHhr+lBuY8NcTz9SqFPbtZ+5PLcycBu8R4hSD4unrA//Yo6qtETNCU9PtvxSvR
qYGhq3OMUgZV1TntFiWlsoB95OMrhAfabNzgAO8thaezRiHXWd5+dyEWW4zu+z8f
Ph/9Q8rvN1GWE2UMiUIumCLoHkVssoHYX2QeCJ+lfCrTRvOeU9X/z5SJgrFEOlOU
10lEWoLDKw8mdbGZBeSxgVUMaKbixi4ZTfeFstZk+6NGb7UVrrf7nkUBloImKMBL
DaPi+ujTxtakHA8j2VEPN6tR8S8WSMmj6AzuoM5HwaWOyQefOBUDcOY1oD2G6NsI
azi6QXUGc00UhUl+aLC8XgnsMcjGsTyKdikOwU7IeRsKt7cu307ciidbjcnAlnYP
MHVWFGPIvMo6o1ojIfTN
=qYUn
-----END PGP SIGNATURE-----

--Fl9V9vFrQUs+59QW--
