Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 9 Mar 2017 11:54:50 +0100
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
Subject: Re: [PATCH 12/15] drm/sun4i: tcon: multiply the vtotal when not in
 interlace
Message-ID: <20170309105450.44l26dbry56an65d@lukather>
References: <cover.bc06ffa88f847ddd9ddd7c259415d5f61b55307b.1488876832.git-series.maxime.ripard@free-electrons.com>
 <0b3b516527c42e745ed8a35736948a383411bd50.1488876832.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v67t7O4AuSXUupB3EU7OZdxgQbeyB6qL_g3x_BXOFLg9Bg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="x77cuo2tpcmr2jkt"
In-Reply-To: <CAGb2v67t7O4AuSXUupB3EU7OZdxgQbeyB6qL_g3x_BXOFLg9Bg@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--x77cuo2tpcmr2jkt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 07, 2017 at 06:05:17PM +0800, Chen-Yu Tsai wrote:
> Hi,
>=20
> On Tue, Mar 7, 2017 at 4:56 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > It appears that the total vertical resolution needs to be doubled when
> > we're not in interlaced. Make sure that is the case.
>=20
> This is true for both channels, though we handle them differently.
>=20
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  drivers/gpu/drm/sun4i/sun4i_tcon.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i=
/sun4i_tcon.c
> > index e44217fb4f6f..515fa56c1e6a 100644
> > --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > @@ -248,10 +248,13 @@ void sun4i_tcon1_mode_set(struct sun4i_tcon *tcon=
, struct drm_encoder *encoder,
> >                      SUN4I_TCON1_BASIC3_H_BACKPORCH(bp));
> >
> >         bp =3D mode->crtc_vtotal - mode->crtc_vsync_start;
> > +       val =3D mode->crtc_vtotal;
> > +       if (!(mode->flags & DRM_MODE_FLAG_INTERLACE))
> > +               val =3D val * 2;
> >         DRM_DEBUG_DRIVER("Setting vertical total %d, backporch %d\n",
> >                          mode->vtotal, bp);
> >         regmap_write(tcon->regs, SUN4I_TCON1_BASIC4_REG,
> > -                    SUN4I_TCON1_BASIC4_V_TOTAL(mode->vtotal) |
> > +                    SUN4I_TCON1_BASIC4_V_TOTAL(val) |
>=20
> For channel 0, the SUN4I_TCON0_BASIC2_V_TOTAL macro multiplies the passed=
 in
> value by 2. I think we should do the same for channel 1, and instead halv=
e the
> value passed in if we are outputting interlaced data. I think this makes =
more
> sense because:
>=20
> 1) The register description for both channels are the same. Handling them
>    consistently will result in less confusion, such as this one.
>=20
> 2) The definition of interlaced modes is a frame is separated into odd and
>    even fields, with each field contains half the number of lines of the
>    full frame. One field is displayed during each VSYNC cycle. The TCON d=
oes
>    not know whether it's interlaced video or not. It only knows the displ=
ay
>    timings. In this case, the number of horizontal lines per cycle is key.

Hmm, yes, you're right. I'll fix it in the next release.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--x77cuo2tpcmr2jkt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYwTR6AAoJEBx+YmzsjxAgg9YP/jGDmCPeaS3RWCm66bqe1+tF
PlxM1UpLZAWhzok82yCoh/rhFcwa2vp2VD24KDjcR47ffw9T9xs8qsm5IHaxAE3g
uclMXucD5f3+WHQ/hDP4KFrAN5bKWfhSm5Mjpsa/1dWm1b1Dw+WQmxIFmLsuztyl
g+A34PRxqq2d79qIt3OnGOO6pXDjFQ8JZxBsey/+FIHf+GZEfM4BkOUQ+A2R2Y/3
dBKu5u273dw9BZlk876Dq3hfMbSASeM0vAceeTtQOQcOgdmDfQUfet0XhNcrX8OD
lAJIww12j19me5FcURlN7HaGyHOTML7sawDp480cqVfNVIUZQB/aXPpB6ewENMqs
2YWuAqEu0dIrPnb1lr8eQFa6myK4VQQK49kNmlMoczMujW6onNHCT4EX1xSnnQlY
rvfNZSRkRPGqdjgSroqykXp3BL8rvfmdHl6tW8nRrjgm8fBQd6pw93U3xhcTSu0e
XH6cSdn9z7TTrI2nmI3DQSJcrIw2VYCxy+LrW0QskISvb/oE+l+zlkvhhdSGWvW2
653nO8HEfw6y2K/whxxMagaaDk93pVwcYLaF0fNU241/aZ9wmGLPAK4cS7Pod7lU
ty6cBVXuX7FcYqD+E8LTNGB6M8gM8i+52zdjYybLRCi5wVUA8yWSdiQOZwANRg9T
R+KfS1qEWM5ys9LY05WR
=AUz+
-----END PGP SIGNATURE-----

--x77cuo2tpcmr2jkt--
