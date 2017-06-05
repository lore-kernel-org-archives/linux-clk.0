Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 5 Jun 2017 16:00:12 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	devicetree <devicetree@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-sunxi <linux-sunxi@googlegroups.com>
Subject: Re: [PATCH 10/19] drm/sun4i: hdmi: Rename internal DDC clock to
 avoid name collision
Message-ID: <20170605140012.rlx7rm7xhriwqaza@flea.lan>
References: <20170602101024.18940-1-wens@csie.org>
 <20170602101024.18940-11-wens@csie.org>
 <20170602193012.xwuziggyx6evmusz@flea.lan>
 <CAGb2v64Vgdjm1MAwn+L0PVc0CA0QOCn=0RONKoGDWLpzVBzvmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rglkvp77czxqdczo"
In-Reply-To: <CAGb2v64Vgdjm1MAwn+L0PVc0CA0QOCn=0RONKoGDWLpzVBzvmQ@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--rglkvp77czxqdczo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 03, 2017 at 10:33:25PM +0800, Chen-Yu Tsai wrote:
> On Sat, Jun 3, 2017 at 3:30 AM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > On Fri, Jun 02, 2017 at 06:10:15PM +0800, Chen-Yu Tsai wrote:
> >> The DDC parent clock on the A31 SoC is also conveniently named
> >> "hdmi-ddc", which results in a name collision when the hdmi driver
> >> registers its internal DDC divider clock.
> >>
> >> Rename the internal clock to "hdmi-ddc-divider".
> >>
> >> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> >> ---
> >>  drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c b/drivers/gpu/=
drm/sun4i/sun4i_hdmi_ddc_clk.c
> >> index e1071838f487..9a6b6243e977 100644
> >> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
> >> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
> >> @@ -125,7 +125,7 @@ static int _sun4i_ddc_create(struct sun4i_hdmi *hd=
mi, struct clk *parent,
> >>       if (!ddc)
> >>               return -ENOMEM;
> >>
> >> -     init.name =3D "hdmi-ddc";
> >> +     init.name =3D "hdmi-ddc-divider";
> >
> > Can't we rename the CCU clock instead? Having the clock called
> > hdmi-ddc being the actual clock output on the DDC bus feels more
> > natural.
>=20
> Do you have any suggestions? The manual labels the conflicting one
> in the CCU as "HDMI_DDC"...

DDC as the main CCU clock, and hdmi-ddc as the one actually generated
by the HDMI controller?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--rglkvp77czxqdczo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZNWPsAAoJEBx+YmzsjxAgrsMP/jaUDyu//o5b4n7fWZ0A8tCL
Kmkgp14n1DhMpepd7sx/9+hFRMyS2BPiiLUPgc5BCRYQLRo3ty84sSufaax/rAoe
oT6EwqyTOl6jKNG+Vtu7d/dxwgwxgbv991nYvuqmRkkY739ECvvmEG25SdFkwuXt
JA9YON/7bPxbVpYxxV37lhxg/Gx9S3O6qgvOobI+OVBxRz+h4nXdVZk9HZ5Ofz5X
6ZRcEbrD96NLR40boeikDRmuf+IJZ0CKzp5a7GLf9Pt7M0Rg5ZOoFl8SqofInBAa
vLDnx6JNDy942NK85IbK6O7iuP60c057tyTjEXv79Np31/+2+adMNP5PNPLr2fx7
CQACyLWqD6nQDb51utwEU3nTHaMsN+u0YcyoBc2dNO1A+jb9ph0Nsbcoudll5KaI
hJmLkdbaQVffqHLxz+KOQnmolacfzXYpWVP3fJm+r2erFb4LoWoQOTWKv0RNxOHx
eGvYZgsiweytM+DiiTy/zDzXZhG/5teLmQojCNYmrf9IHz0nsU7d9npW2ezNY48e
FLvV8CAP9qnFCYXyyY8xdUS6Az+t5BkZGdT3ocgkF3VERFcCy5hx37tVVN2lqQt7
BK4z8u41hbTB1EPXsrIHjK6s/x9b5PXlxi/i7lzDSDof1Tg/eqoXEJvUrgXwx+Vd
eDJ12KrtmxKH2fbhQ3ub
=qseh
-----END PGP SIGNATURE-----

--rglkvp77czxqdczo--
