Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 10 Jul 2017 13:55:19 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Olliver Schinagl <oliver@schinagl.nl>
Cc: plaes@plaes.org, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
	Jonathan Liu <net147@gmail.com>
Subject: Re: [linux-sunxi] [PATCH v5 5/6] ARM: sun7i: Convert to CCU
Message-ID: <20170710115519.sddpeyvbxq5llunf@flea>
References: <cover.23e9103a2becf2261d7e145bb1516221a5cfb8a4.1499197129.git-series.plaes@plaes.org>
 <2ff8930c51b90a0bb875ecc6c4737f44b3314e7f.1499197129.git-series.plaes@plaes.org>
 <4091e67f-6207-26ef-85f1-e9ff509dd3b7@schinagl.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xldyawbxg7nb3imv"
In-Reply-To: <4091e67f-6207-26ef-85f1-e9ff509dd3b7@schinagl.nl>
List-ID: <linux-clk.vger.kernel.org>


--xldyawbxg7nb3imv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 10, 2017 at 01:23:51PM +0200, Olliver Schinagl wrote:
> Hi Pleas,
>=20
> On 04-07-17 22:05, Priit Laes wrote:
> > Convert sun7i-a20.dtsi to new CCU driver.
> >=20
> > Tested on Cubietruck.
> >=20
> > Signed-off-by: Priit Laes <plaes@plaes.org>
> > ---
> >  arch/arm/boot/dts/sun7i-a20.dtsi | 719 +++-----------------------------
> >  1 file changed, 84 insertions(+), 635 deletions(-)
> >=20
> > diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i=
-a20.dtsi
> > index 96bee77..a5ca5a8 100644
> > --- a/arch/arm/boot/dts/sun7i-a20.dtsi
> > +++ b/arch/arm/boot/dts/sun7i-a20.dtsi
> > @@ -46,8 +46,6 @@
> >=20
> >  #include <dt-bindings/interrupt-controller/arm-gic.h>
> >  #include <dt-bindings/thermal/thermal.h>
> > -
> > -#include <dt-bindings/clock/sun4i-a10-pll2.h>
> >  #include <dt-bindings/dma/sun4i-a10.h>
> I had to add these includes here to make this all work:

That's unlikely, none of the defines are used in this patch.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--xldyawbxg7nb3imv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZY2snAAoJEBx+YmzsjxAg3qsP/Apq7k3Av0XOGGIjXX8TKG2h
Yz1OVSG2PZhZwHoWrQE6uUCFguYkrvJQZWhB0HCljQD50hMVsiEKf55avOkF3d1U
pAv1OI7uS8aO66nev7pgoDksHe3KNNl9hMkCxJN76PVOE9o5UXGKwarQoewC6SA7
2AcbuP7BwCBco4O49w0y4jthpAHtXl7stbKA2xn9Be9Sq1ZaowSUuCDjAS5oHVr0
3kWweglwusnPtZjVtflJEWD7jx1OI/LAY5A/1Z5E4jS4/1izZ3uWLM+4W00nwGW/
/As5LZz/7vm/T0WFPG4OAFUDmQQ3Bv81BOxvDvnqqp1lcXy4SjQGrxXx1tuh9WTQ
4n1CXi4nzm8Asg+9TD3xVW6fVcDodd9yzTn8bSjgUlhS8iMFhAt4jHNocNIhewax
7Ee03UVoapJtiOlny2diqUIi6I8GtDbhPrVRpcOA7ZQIHkcEqr23iSzW2zmHrTbQ
r6ktY2+Kj7Qyvy0CP3G7/r8RbThEjaNyZi+V/+0pGzZ93PuOsNJ2+BuXEJoNwQfn
21UbHuP+KlsfrZx51tFwOCQOd87a1WaXmqfN+9Xe7i2Z/M/Qc4Wf0PhxNg4aNBAQ
ygti/KBSW/AFoKpu4FC7xkBqfJhe0D516BUWKt9Cehyyyx09maWHgOtRrX6RZ5As
luAkaZh38W3FlMgbR+wg
=ZCov
-----END PGP SIGNATURE-----

--xldyawbxg7nb3imv--
