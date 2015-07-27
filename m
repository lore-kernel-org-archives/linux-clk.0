Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Mon, 27 Jul 2015 09:33:45 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 33/45] clk: sunxi: Include clk.h
Message-ID: <20150727073345.GQ2564@lukather>
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
 <1436571223-10959-34-git-send-email-sboyd@codeaurora.org>
 <20150720080116.GS28632@lukather>
 <55AD3781.2030604@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IjNIXuzrMEaOuFwn"
In-Reply-To: <55AD3781.2030604@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--IjNIXuzrMEaOuFwn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2015 at 11:01:37AM -0700, Stephen Boyd wrote:
> On 07/20/2015 01:01 AM, Maxime Ripard wrote:
> >Hi Stephen,
> >
> >On Fri, Jul 10, 2015 at 04:33:31PM -0700, Stephen Boyd wrote:
> >>This clock provider uses the consumer API, so include clk.h
> >>explicitly.
> >>
> >>Cc: Chen-Yu Tsai <wens@csie.org>
> >>Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> >>Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> >>---
> >>  drivers/clk/sunxi/clk-mod0.c       | 3 ++-
> >>  drivers/clk/sunxi/clk-sun8i-mbus.c | 2 +-
> >>  drivers/clk/sunxi/clk-sun9i-core.c | 2 +-
> >>  drivers/clk/sunxi/clk-sun9i-mmc.c  | 3 ++-
> >>  drivers/clk/sunxi/clk-sunxi.c      | 2 ++
> >>  drivers/clk/sunxi/clk-usb.c        | 3 ++-
> >>  6 files changed, 10 insertions(+), 5 deletions(-)
> >>
> >>diff --git a/drivers/clk/sunxi/clk-mod0.c b/drivers/clk/sunxi/clk-mod0.c
> >>index 9d028aec58e5..39ba5c3d5d3a 100644
> >>--- a/drivers/clk/sunxi/clk-mod0.c
> >>+++ b/drivers/clk/sunxi/clk-mod0.c
> >>@@ -14,8 +14,9 @@
> >>   * GNU General Public License for more details.
> >>   */
> >>+#include <linux/clk.h>
> >>  #include <linux/clk-provider.h>
> >>-#include <linux/clkdev.h>
> >>+#include <linux/slab.h>
> >I guess you're adding a bit more that clk.h ;)
> >
> >Could you sort the headers alphabetically please?
> >
>=20
> Sure.
>=20
> ---8<----
>=20
> From: Stephen Boyd <sboyd@codeaurora.org>
> Subject: [PATCH] clk: sunxi: Include clk.h and remove unused clkdev.h inc=
ludes
>=20
> This clock provider uses the consumer API, so include clk.h
> explicitly. Also remove clkdev.h in files that aren't using it
> and include slab.h when clkdev.h was being used to implicitly
> include it.
>=20
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Perfect, thanks!

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--IjNIXuzrMEaOuFwn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVtd7ZAAoJEBx+YmzsjxAg3BUP/1zE+RmEdZDwKylw3+9xDXv0
d0GmQR7AIQKB6gFmmgOdlPz7bwnrmTGCzUL3zaE/UaH3A0cS5zvJFQubDYWCjA7l
tmeHiMiW0M7C/ZWxI4yT8MMwxjm9JdXrh36x0laCCMSLV2Vd9s9OJzMPvxjCgRRP
8/bZzMlMMn18BntAY58TXRJZh4NHcKzsLk6+9l7K1OcOVMRamO8TX0gxEm8RiX05
5uo5cMAX42ZFVNFV3g9Wi5FvR1wQW3oB8gdQYDPL4DB9rpXK5Mt2+2IBWOzxEtnz
yXUjU30DLcEyLoIB5nPc/SeUYcRrryebtONmD7NtAQWkMPhPxrxkAsxpIYT6eBlK
byw+scas5Ah+y95+QRKIg8yQichzpbhNW9Mjd1VTCBZw8F6Jr0gnCF3uWhoZJcJ3
zm8B/RpaC1DnDZa2dgg/1LeVgv0JJUsdSN+1TbcGqYLp2wfJsJEaXAWKEJp5qtn4
HDtb+p3B+VZObWHeyZh5h8vM+3sUkY8sYPwAd9gj8R6fuG8Nl4o497P0Dc42Ecjt
xk6aY21C+HVo3FdjEKXwCjFqpoy7IVP2lR2udpaXvowwQ/AqgapOTjK88x36by1J
Nh6mTsmjzUhl1AtfM4Z61FUmDU0AGn+xfyg4T5n5hv92+B3lL0glm5WZt04awegk
bemETVoUEBamI2mUrdhz
=39qB
-----END PGP SIGNATURE-----

--IjNIXuzrMEaOuFwn--
