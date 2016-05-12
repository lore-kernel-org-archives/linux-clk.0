Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 12 May 2016 10:30:47 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Priit Laes <plaes@plaes.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@baylibre.com>,
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
Subject: Re: [linux-sunxi] Re: [PATCH v4 01/11] clk: sunxi: Add display and
 TCON0 clocks driver
Message-ID: <20160512083047.GY3733@lukather>
References: <1461590572-4027-1-git-send-email-maxime.ripard@free-electrons.com>
 <1461590572-4027-2-git-send-email-maxime.ripard@free-electrons.com>
 <20160506223002.GE3492@codeaurora.org>
 <20160508200308.GF6167@lukather>
 <20160509223238.GW3492@codeaurora.org>
 <20160509223924.GX3492@codeaurora.org>
 <1462907459.9981.0.camel@plaes.org>
 <20160511221541.GG3492@codeaurora.org>
 <1463024360.16747.4.camel@plaes.org>
 <20160512065943.GX3733@lukather>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8VKnE9k7k7imdYv5"
In-Reply-To: <20160512065943.GX3733@lukather>
List-ID: <linux-clk.vger.kernel.org>


--8VKnE9k7k7imdYv5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 12, 2016 at 08:59:43AM +0200, Maxime Ripard wrote:
> On Thu, May 12, 2016 at 06:39:20AM +0300, Priit Laes wrote:
> > On Wed, 2016-05-11 at 15:15 -0700, Stephen Boyd wrote:
> > > On 05/10, Priit Laes wrote:
> > > >=20
> > > > On Mon, 2016-05-09 at 15:39 -0700, Stephen Boyd wrote:
> > > > >=20
> > > > > On 05/09, Stephen Boyd wrote:
> > > > > >=20
> > > > > >=20
> > > > > >=20
> > > > > > Ok I applied this one to clk-next.
> > > > > >=20
> > > > > And I squashed this in to silence the following checker warning.
> > > > >=20
> > > > > drivers/clk/sunxi/clk-sun4i-display.c:110:33: warning: Variable
> > > > > length array is used.
> > > > >=20
> > > > > ---8<---
> > > > > diff --git a/drivers/clk/sunxi/clk-sun4i-display.c
> > > > > b/drivers/clk/sunxi/clk-sun4i-display.c
> > > > > index f02e250e64ed..f8ff6c4a5633 100644
> > > > > --- a/drivers/clk/sunxi/clk-sun4i-display.c
> > > > > +++ b/drivers/clk/sunxi/clk-sun4i-display.c
> > > > > @@ -107,7 +107,7 @@ static int
> > > > > sun4i_a10_display_reset_xlate(struct
> > > > > reset_controller_dev *rcdev,
> > > > > =A0static void __init sun4i_a10_display_init(struct device_node
> > > > > *node,
> > > > > =A0					=A0=A0const struct
> > > > > sun4i_a10_display_clk_data *data)
> > > > > =A0{
> > > > > -	const char *parents[data->parents];
> > > > > +	const char *parents[4];
> > > > This change breaks at least de_[bf]e clocks which have 3 clock
> > > > parents.
> >=20
> > > I just used the largest data->parents number, which was 4. How
> > > does that break anything?
> >=20
> > If you look at the=A0sun4i_a10_display_init, it contains this block:
> >=20
> > =A0 =A0 ret =3D of_clk_parent_fill(node, parents, ARRAY_SIZE(parents));
> > =A0=A0=A0=A0if (ret !=3D ARRAY_SIZE(parents)) {
> > =A0=A0=A0=A0=A0=A0=A0=A0pr_err("%s: Could not retrieve the parents\n", =
clk_name);
> > =A0=A0=A0=A0=A0=A0=A0=A0goto unmap;
> > =A0=A0=A0=A0}
> >=20
> > of_clk_parent_fill returns 3 for de_be/de_fe nodes, and
> > ARRAY_SIZE(parents) is 4.
>=20
> Replacing both ARRAY_SIZE(parents) by data->parents would work though.

I just tested on top of current next, and indeed the following patch
is needed.

Stephen, could you squash it in the former patch?

diff --git a/drivers/clk/sunxi/clk-sun4i-display.c b/drivers/clk/sunxi/clk-=
sun4i-display.c
index 70803aa7028c..9780fac6d029 100644
--- a/drivers/clk/sunxi/clk-sun4i-display.c
+++ b/drivers/clk/sunxi/clk-sun4i-display.c
@@ -128,8 +128,8 @@ static void __init sun4i_a10_display_init(struct device=
_node *node,
 		return;
 	}
=20
-	ret =3D of_clk_parent_fill(node, parents, ARRAY_SIZE(parents));
-	if (ret !=3D ARRAY_SIZE(parents)) {
+	ret =3D of_clk_parent_fill(node, parents, data->parents);
+	if (ret !=3D data->parents) {
 		pr_err("%s: Could not retrieve the parents\n", clk_name);
 		goto unmap;
 	}

Thanks!
Maxime					 =20

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--8VKnE9k7k7imdYv5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXND83AAoJEBx+YmzsjxAgf1IQAJ1UEiWAWz/bJ6uEhMjY9ZWz
8fBlBkRyjllOW+WMgMUSv9r8VJhUjQ/0g9g2lyS0k0U0l24s9hTvcGdfrDXqDVMJ
E6aSdiQEGnSZkSseioTLd1MMtgACb29ilb71LQDjna7bYydsUZRVa7TOgN/Rs28p
t+w/GJTFxJFpxWLoD0z/jKy3eb0a/ec1X6nar/cWYqC62o27gGCzolgSis0ZcT1v
9/9SRlKaenE4a+xTt4fVnCnfIe+86itvTTyv0BN+TOqVtRTQKoPQQ6IgVzp0tAH8
XLsnHtOss/jKM6YU2hBOD/yaOILlukTgJGb7IfEr7b1AbpAgNUp2cUQO6/b64CJE
zbWHMNd9gMWquED1WUwM3NF1wyLQbD+Pc33dRr+MA9yGR5U+RU6c7KgbT3iEuyFq
wdCOhT3T4Fhl/LoS5ryc30/X2qpMIdiCiMig6D/UihTiftCWiM2bydFBZfpXx5kE
9FfF4MMcgPi1IfdDBESw/lLJiwVSjRktNobUCQcUkCh8KPQgctHQDWR9roJ9urNC
jJ/ULcTnqWl9qY/hDylzxY73C+KVV0iHWh6WerYtMgcRKcNixFa4idFvta419QIZ
1jfMqPvB6piVIAjQW/krbu5HGNVmL38M9fmXNbD4qFajRzrNP1kc4P1x+F90xDsH
ot7VHWLsQ26r5+aZV1Pl
=N8ET
-----END PGP SIGNATURE-----

--8VKnE9k7k7imdYv5--
