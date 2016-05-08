Return-Path: <maxime.ripard@free-electrons.com>
Date: Sun, 8 May 2016 22:03:08 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
	Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
	Hans de Goede <hdegoede@redhat.com>, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
	dri-devel@lists.freedesktop.org,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Alexander Kaplan <alex@nextthing.co>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v4 01/11] clk: sunxi: Add display and TCON0 clocks driver
Message-ID: <20160508200308.GF6167@lukather>
References: <1461590572-4027-1-git-send-email-maxime.ripard@free-electrons.com>
 <1461590572-4027-2-git-send-email-maxime.ripard@free-electrons.com>
 <20160506223002.GE3492@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VuQYccsttdhdIfIP"
In-Reply-To: <20160506223002.GE3492@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>


--VuQYccsttdhdIfIP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Fri, May 06, 2016 at 03:30:02PM -0700, Stephen Boyd wrote:
> On 04/25, Maxime Ripard wrote:
> > The A10 SoCs and its relatives has a special clock controller to drive =
the
> > display engines (both frontend and backend), that have a lot in common =
with
> > the clock to drive the first TCON channel.
> >=20
> > Add a driver to support both.
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > Acked-by: Rob Herring <robh@kernel.org>
> > ---
>=20
> Acked-by: Stephen Boyd <sboyd@codeaurora.org>
>=20
> Unless I can merge this into clk-next? Wasn't clear to me.

Yes, please do, I already sent you the bunch of patches I gathered for
4.7, and I don't have any others but this one.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--VuQYccsttdhdIfIP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXL5t8AAoJEBx+YmzsjxAgxjMQAJRscW5VbMdQAUp92zlXM5k0
RIjmeVxfuQImSn71I+/qfXinTf8XRCCnlomiLBKQn69MdG3ge61kcTgRmzmAISxM
O/2nSbepShCjjw9br89wJKdONFFOP9nEBil+tX4rbRJZ/SI1nx9c1lDUwCO/O7RT
Zd+rFqdgDDAAUUhkvKbxbbsynAtFDB6nPvb8NMDn3DqPuDpf4dgE6ILqNpSJVZsW
uGd/8uowBD5gYfCdyPdFHtneAPQv/krBmHU9dRgm/ehWQ5WV7dY0lxFhRG6d/aYc
XtYWB4Sc3r4W5zJ3sCdrv26wB8BXSsh9cLqGLoP7AqO8cRUX77l8QsOQpEMAcToY
5+UxlD79aSKT/m+vsspLKCrgA7Dq644HgMFyEmFvBps36L/ICJ00C9XMspRUZYh3
dzk2Y8Pn7Yi4RjpoIbzwgouPgyelMiI3E1RTm59geinKfVeUQz92eLMpvd335GYQ
kJuvQdBIm0/zAfdtnQTpLraRlbpXiegco1+hCeGl7Ac+zM30j2s3LvCNDYt6QxS7
ujHOdu8fFdajbdaIJA/OxZqcHvvKHbp3NlBRGeP40aHMMXxjduxOg1IZeP01qXT4
5c7rdI+sQAeftNiUzVJMwLfokA95jVpk3FWkJ+GSZ3gBztEjbrfV3SkS9kF1t4Wb
kqaIf8FH71wpXz0Jlfr7
=rNod
-----END PGP SIGNATURE-----

--VuQYccsttdhdIfIP--
