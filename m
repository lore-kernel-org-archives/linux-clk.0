Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 8 Mar 2017 09:55:41 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>,
	Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-sunxi <linux-sunxi@googlegroups.com>
Subject: Re: [PATCH 11/15] drm/sun4i: tcon: Fix tcon channel 1 backporch
 calculation
Message-ID: <20170308085541.p75lt7hmjzbzzpem@lukather>
References: <cover.bc06ffa88f847ddd9ddd7c259415d5f61b55307b.1488876832.git-series.maxime.ripard@free-electrons.com>
 <475aeed1da40d46d8e50420c281a74c32b78c730.1488876832.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v64gJ13DB3UxfG7DnJCzE+CZ02repkX8=iOQASsHw2cG5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3ekb4dmocyjhfaca"
In-Reply-To: <CAGb2v64gJ13DB3UxfG7DnJCzE+CZ02repkX8=iOQASsHw2cG5A@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--3ekb4dmocyjhfaca
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 08, 2017 at 12:25:59PM +0800, Chen-Yu Tsai wrote:
> On Tue, Mar 7, 2017 at 4:56 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > It seems like what's called a backporch in the datasheet is actually the
> > backporch plus the sync period. Fix that in our driver.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  drivers/gpu/drm/sun4i/sun4i_tcon.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i=
/sun4i_tcon.c
> > index 93249c5ab1e4..e44217fb4f6f 100644
> > --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > @@ -240,15 +240,14 @@ void sun4i_tcon1_mode_set(struct sun4i_tcon *tcon=
, struct drm_encoder *encoder,
> >                      SUN4I_TCON1_BASIC2_Y(mode->crtc_vdisplay));
> >
> >         /* Set horizontal display timings */
> > -       bp =3D mode->crtc_htotal - mode->crtc_hsync_end;
> > +       bp =3D mode->crtc_htotal - mode->crtc_hsync_start;
> >         DRM_DEBUG_DRIVER("Setting horizontal total %d, backporch %d\n",
> >                          mode->htotal, bp);
> >         regmap_write(tcon->regs, SUN4I_TCON1_BASIC3_REG,
> >                      SUN4I_TCON1_BASIC3_H_TOTAL(mode->crtc_htotal) |
> >                      SUN4I_TCON1_BASIC3_H_BACKPORCH(bp));
> >
> > -       /* Set vertical display timings */
>=20
> Why remove the comment?

I have no idea :)

This will be fixed. Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--3ekb4dmocyjhfaca
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYv8cJAAoJEBx+YmzsjxAgS7sP/jpkb39RNCNPzQ6N1glivs9h
jbt0WXqjvMuf2CbUo/H94Rs7K5Me+dNPgmlfdOU8ei15kia4QhVzufyiLgY/EjFw
QUpzhoTMILp45syzoH6FbuFg8LYm8OCo9nnSk+3TLMShPkH8kph9RUFk8F+nWn+J
GXotZzobRdHkJ+aWwgYqbl4P+on7dy2WOfSGac6NPv4Wg63NTc4kwgAH6VP1e6us
PYPgdC6Ykbfu4w/er7V0wkbiPH/0oaSnhlhMEWT1FC7GX3+qVDL/gKnMXu/ejtAi
VhFWIZ8g/NIXeUcA6y9MSABNHSZK9PBwBfivhtfVPn5lY1On6hfjHvHB89rStp+P
t12XljGxmpQxzLOFVDnk0vKYFY48myt0efmvPuhFCMlpiHdlKSGWERrdaxXkKk/p
UcmQKnU7JRVYFwvBouyNzmT+CbSIzgjHILEG5ZDrIKM0qiFOMb3CIEnW4d/EmkQS
Kr8dLXcdjltQZvJ5T6InEcxPeZL5V/dQwjYcca5VVX97n/67Bw64gl9nR5sX2G6U
lJiuPDUrPCHGzfQeWkDd5pJkaxLC8NYTp8keY5ktBm4Wt6S6DmglkY7Suonbdec3
zhxMVxOOysNS61z7igGDBfW9pd2gngV0UE1hYzyxW6wMBwr3L7YUzf2tYluKHohr
fsHUc5Ff4arGg78slgyj
=Jcec
-----END PGP SIGNATURE-----

--3ekb4dmocyjhfaca--
