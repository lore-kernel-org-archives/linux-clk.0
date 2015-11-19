Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 19 Nov 2015 16:43:47 +0100
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
Subject: Re: [PATCH 05/19] clk: sunxi: add DRAM gates
Message-ID: <20151119154347.GR32142@lukather>
References: <1446214865-3972-1-git-send-email-maxime.ripard@free-electrons.com>
 <1446214865-3972-6-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v66B7X5xQGMq_MzAHGz4OLsnDQStVHcQaMGO+HYY43kjBQ@mail.gmail.com>
 <CAGb2v65qjKCNER=5Gq5UXnvY_nia+EQYRAk3U9hokmXuxHoi_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="brdEIFGMNIjz5YJG"
In-Reply-To: <CAGb2v65qjKCNER=5Gq5UXnvY_nia+EQYRAk3U9hokmXuxHoi_Q@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--brdEIFGMNIjz5YJG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2015 at 04:08:53PM +0800, Chen-Yu Tsai wrote:
> On Mon, Nov 9, 2015 at 12:18 PM, Chen-Yu Tsai <wens@csie.org> wrote:
> > On Fri, Oct 30, 2015 at 10:20 PM, Maxime Ripard
> > <maxime.ripard@free-electrons.com> wrote:
> >> The Allwinner SoCs have a gate controller to gate the access to the DR=
AM
> >> clock to the some devices that need to access the DRAM directly (mostly
> >> display / image related IPs).
> >>
> >> Use a simple gates driver to support it.
> >>
> >> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> >
> > Acked-by: Chen-Yu Tsai <wens@csie.org>
> >
> >> ---
> >>  drivers/clk/sunxi/clk-simple-gates.c | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/drivers/clk/sunxi/clk-simple-gates.c b/drivers/clk/sunxi/=
clk-simple-gates.c
> >> index 0214c6548afd..5666c767fa14 100644
> >> --- a/drivers/clk/sunxi/clk-simple-gates.c
> >> +++ b/drivers/clk/sunxi/clk-simple-gates.c
> >> @@ -112,6 +112,8 @@ CLK_OF_DECLARE(sun5i_a13_apb0, "allwinner,sun5i-a1=
3-apb0-gates-clk",
> >>                sunxi_simple_gates_init);
> >>  CLK_OF_DECLARE(sun5i_a13_apb1, "allwinner,sun5i-a13-apb1-gates-clk",
> >>                sunxi_simple_gates_init);
> >> +CLK_OF_DECLARE(sun5i_a13_dram, "allwinner,sun5i-a13-dram-gates-clk",
> >> +              sunxi_simple_gates_init);
>=20
> Nit: Since the compatible added is sun5i, could you mention it in the
> commit message,
> to avoid confusion when we do this for the other families?

It will be fixed in the v2.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--brdEIFGMNIjz5YJG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWTe4zAAoJEBx+YmzsjxAgDo8P/iFXFpCX/bidKQEske1yAuox
f2W8fa0yyFoYGTtmdiOjIrV+Fhxp1fWuPWYuDXFb8tpWVkz1hjm85LsOnxwfqpWo
/L5plB3DS0LfqLATg6ieNTmJXGmnO7Q22TSQBzFcjPicogZzNbEU7ICfTVYp+qvd
hMTSN8rASMSdcMhLaFJfaM8gRZ8k+JFPhulVgQQOG6N3SqTn3M6BtFG473rKJ1Hc
t/8T0X2Byq/gi/1VOuw+CzmHL0xB0J3SSXXrDxCeqielZhuQGlBCOjg5UgUOpn16
0dlgVXqHWi8YXH6SV9APbrK67+RJPNGnUovO0vqgWNbojtk8S+wdGncT70A3eOXw
ZnNmNZik/TilWENIKjfRQYKjexQOivLKELCaZA3hecSq3LKBDbD0+WMchgE/IjkW
oXKlJIZ16MNBK2NBhp6MG7PwBU6WDkroighK5jcAmXG56gsVyN7vrDqrzUsSyRRS
rJLbj7zo64sAQ+UNbwIpcfqQ/D34CVXNdPc6mCxaMXPdlfSBDdQzxsOx/eITRzEa
1WNdrcoEep28KIgFI0Oma39fu7f58ouTjztRop2/4GDofz7Qic/TxzJJWg5BnjcH
h79p8YaTUuxyTXHhiT4wsswahQL5gJmJC0mkluQKvEX/7TFO+rHwht2MghCY9Ern
VnkGKnCbP/UfCLeXYsTi
=sVMs
-----END PGP SIGNATURE-----

--brdEIFGMNIjz5YJG--
