Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 6 Mar 2017 10:06:39 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: sunxi-ng: tighten SoC deps on explicit AllWinner
 SoCs
Message-ID: <20170306090639.aubg4ixtt7f4kb5s@lukather>
References: <20170302174357.6246-1-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pyqowu2ek3glmkau"
In-Reply-To: <20170302174357.6246-1-pbrobinson@gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--pyqowu2ek3glmkau
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Mar 02, 2017 at 05:43:57PM +0000, Peter Robinson wrote:
> Tighten the depends on the various AllWinn SoCs so we don't
> inadvertantly get clock drivers when we're not wanting them
> like 32 bit SoC clocks for 64 bit configs. Ensure there's
> still test coverage though.
>=20
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>

It turns out that this was making Kconfig crash, because the keyword
is depends on and not depends.

I fixed it, but please make sure the syntax is correct next time.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--pyqowu2ek3glmkau
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYvSaaAAoJEBx+YmzsjxAgetgP/jhjxtcrNwJUL6GJZA3+ncFw
xJh7wwZx5Vhuh33TgcSAd8863rbQX5LMOdKEyoiNwopYy6ups+4K2LW1oOM59M3R
BCEaFj1f8nfTL8YogYvO827qug6zyBISDxyv+0zMfxv+OLfEWcjsUJgHt1uZxvOP
9pQq/mPaRyRCF9wxZrQK3rb2M40wnnp+0FW53jnQCQ0SJHrURnXwcCzuBLaGAasv
4Y7RldAcPtoqwhK6IaJlTsr6NyGmlD+efLVejFLUPSyC1vMx/Gj9WyZ1Ie+BNiLL
VfrpwuYcvQ0DWweUi/mBqWQQ9gmdqS5uu573VOOOBZyDdvotBLLYDYx4wKvVik1s
rOon2H7gDaEjK409HWcDdpONU8pS+SZ/dDyb4bQJ0s3iKAxRRCKH3D6Diol7e2ys
Gl0656OAuRsu5sSmlF16S8sZ63slaGLJF2op5Q7pEL3jxm+gOy8GW2QroRpO+MCf
QznSDErrJyRr8rofhpFKq9MBfW76tkSuLlvzB1tzEzuVstwd/4Ao3VuzwVY2XD1j
OB8CkzEFjgc5iZ5SROZna8uJL33RkLl/ZEjjIxOwolY1ebmD3TTzr5TmWBntVLzW
J/8fpCART88ME1ZzDcVx/CSakJT+BmCSp/uy9kiAmltJrfKeh2hL2woEuOftEXnT
ITRvMAast4tPpAHm1+lm
=R8jf
-----END PGP SIGNATURE-----

--pyqowu2ek3glmkau--
