Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 1 Feb 2016 20:32:32 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Emilio =?iso-8859-1?Q?L=F3pez?= <emilio.lopez@collabora.co.uk>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, wens@csie.org,
	heiko@sntech.de, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] clk: sunxi: delay protected clocks until arch
 initcall
Message-ID: <20160201193232.GG4652@lukather>
References: <1453385439-10154-1-git-send-email-emilio.lopez@collabora.co.uk>
 <1453385439-10154-2-git-send-email-emilio.lopez@collabora.co.uk>
 <20160127153722.GC4317@lukather>
 <56A91245.3090706@collabora.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O8XZ+2Hy8Kj8wLPZ"
In-Reply-To: <56A91245.3090706@collabora.co.uk>
List-ID: <linux-clk.vger.kernel.org>


--O8XZ+2Hy8Kj8wLPZ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jan 27, 2016 at 03:53:57PM -0300, Emilio L=F3pez wrote:
> Hi Maxime,
>=20
> El 27/01/16 a las 12:37, Maxime Ripard escribi=F3:
> >Hi Emilio,
> >
> >On Thu, Jan 21, 2016 at 11:10:38AM -0300, Emilio L=F3pez wrote:
> >>Clocks are registered early on, and unused clocks get disabled on
> >>late initcall, so we can delay protecting important clocks a bit.
> >>If we do this too early, it may happen that some clocks are orphans
> >>and therefore enabling them may not work as intended. If we do this
> >>too late, a driver may reparent some clock and cause another important
> >>clock to be disabled as a byproduct.
> >>
> >>arch_initcall should be a good spot to do this, as clock drivers using
> >>the OF mechanisms will be all registered by then, and drivers won't
> >>have started probing yet.
> >>
> >>Signed-off-by: Emilio L=F3pez <emilio.lopez@collabora.co.uk>
> >>---
> >>  drivers/clk/sunxi/clk-sunxi.c | 22 ++++++++++++++++++----
> >>  1 file changed, 18 insertions(+), 4 deletions(-)
> >>
> >>diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunx=
i.c
> >>index 5ba2188..285e8ee 100644
> >>--- a/drivers/clk/sunxi/clk-sunxi.c
> >>+++ b/drivers/clk/sunxi/clk-sunxi.c
> >>@@ -1153,10 +1153,12 @@ static void __init of_sunxi_table_clock_setup(c=
onst struct of_device_id *clk_mat
> >>  	}
> >>  }
> >>
> >>+/* By default, don't protect any clocks */
> >>+static const char **protected_clocks __initdata;
> >>+static int protected_clocks_nr __initdata;
> >>+
> >>  static void __init sunxi_init_clocks(const char *clocks[], int nclock=
s)
> >>  {
> >>-	unsigned int i;
> >>-
> >>  	/* Register divided output clocks */
> >>  	of_sunxi_table_clock_setup(clk_divs_match, sunxi_divs_clk_setup);
> >>
> >>@@ -1169,14 +1171,26 @@ static void __init sunxi_init_clocks(const char=
 *clocks[], int nclocks)
> >>  	/* Register mux clocks */
> >>  	of_sunxi_table_clock_setup(clk_mux_match, sunxi_mux_clk_setup);
> >>
> >>+	/* We shall protect these clocks when everything is ready */
> >>+	protected_clocks =3D clocks;
> >>+	protected_clocks_nr =3D nclocks;
> >>+}
> >>+
> >>+static int __init sunxi_init_clock_protection(void)
> >>+{
> >>+	unsigned int i;
> >>+
> >>  	/* Protect the clocks that needs to stay on */
> >>-	for (i =3D 0; i < nclocks; i++) {
> >>-		struct clk *clk =3D clk_get(NULL, clocks[i]);
> >>+	for (i =3D 0; i < protected_clocks_nr; i++) {
> >>+		struct clk *clk =3D clk_get(NULL, protected_clocks[i]);
> >>
> >>  		if (!IS_ERR(clk))
> >>  			clk_prepare_enable(clk);
> >>  	}
> >>+
> >>+	return 0;
> >>  }
> >>+arch_initcall(sunxi_init_clock_protection);
> >
> >You also need to filter that by the machine compatible in case you're
> >running it on a !sunxi SoC.
>=20
> protected_clocks_nr will be 0 on a !sunxi machine, so this is effectively=
 a
> noop there.

Ah, yes, good point.

> >Overall, I'm a bit skeptical about the approach. It doesn't really fix
> >everything, just hides it behind a curtain, and I'm pretty sure the
> >clocks not registered by this code would still be broken (the mod0
> >clocks for example).
>=20
> This is only meant to solve the problems observed when trying to grab
> critical clocks before letting all the basic/OF clock types register. The
> actual clock trees are complete once all the built-in clock compatibles a=
re
> probed, so this just pushes the protection after that point in time. The
> plan on the long term should be to use the CCF-built-in clock protection,
> once it's finished and merged, but it's not here yet.
>=20
> Regarding your example, I'm not aware of any critical mod0 clocks (not th=
at
> it should matter, as they won't be orphans either).

My bad, the A13 mbus clock is one. The A23 is one too.

Both of these are probed through CLK_OF_DECLARE, and use directly
clk_prepare_enable on the clock given back by clk_register, which
won't work in your case.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--O8XZ+2Hy8Kj8wLPZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWr7LQAAoJEBx+YmzsjxAggK0P/j2PalciUU8TMm1VgFse3vib
M670s9QRDYM486PgnW+1H2WjF9Do0qwUCWhzRuBj0n65nAehU0ElShv8/O4ayCMB
uzNYQD27AUxztrYlacsXkXltzYEQ9jcfKQW7xbInGzurOfSN/3kjV0ebzuzcMIHJ
0NgRl/WDwsHHKCsdJUAe13C5i9OAwNYoUQV7dtDtWdSSquhYr1nKn3y8x8wd7BMK
6FYRW/BDphnVFAYsQpEYwKWW+N+Jqk43EpgoyxZjWV9mYK+MexrJPvAP4ghmHEwy
Kgqje693RIzJPpDIv6n+/WQFPvgD3ArpiY2kSAeiOpBuYDM/es4NkABNw9xaSuTv
yr3zRpgvy7sCdt91r0zJvB3G81ucQFzssSbot9pHCkq5HeeTJWnPVCXDW8ka1sly
DRO6vtvs/35e8asYPAQHLd2x5sI5y7sf0LXvJsF63GrX2FgdbHLEmhlNwKnAA8Ox
Ly16XjJbMv8+cm29OcsqN0wRgi2gCKaCqmtjQQ8+AJsONMKFFW5kSoKZ0x7uT6cA
6I+iko5C1m7OIMu49z5fxVVYeQfLwHnXo4w+onp70XmxXDTJ1dRDMteVT461l0wp
QNotd0V9KXTfxzhtx805TfqBznSBsYDp3/ndrnScza+nwdautlN59dD4xYlc77/U
kOnsD9EyJ3Y8wzxA1C5C
=9DAt
-----END PGP SIGNATURE-----

--O8XZ+2Hy8Kj8wLPZ--
