Return-Path: <eric@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Boris Brezillon <boris.brezillon@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-rpi-kernel@lists.infradead.org, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, stable@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: bcm2835: De-assert/assert PLL reset signal when appropriate
In-Reply-To: <20180208134338.24590-3-boris.brezillon@bootlin.com>
References: <20180208134338.24590-1-boris.brezillon@bootlin.com> <20180208134338.24590-3-boris.brezillon@bootlin.com>
Date: Thu, 08 Feb 2018 15:15:42 +0000
Message-ID: <87po5f5x7l.fsf@anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Boris Brezillon <boris.brezillon@bootlin.com> writes:

> In order to enable a PLL, not only the PLL has to be powered up and
> locked, but you also have to de-assert the reset signal. The last part
> was missing. Add it so PLLs that were not enabled by the FW/bootloader
> can be enabled from Linux.
>
> Fixes: 41691b8862e2 ("clk: bcm2835: Add support for programming the audio=
 domain clocks")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  drivers/clk/bcm/clk-bcm2835.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
> index a07f6451694a..6c5d4a8e426c 100644
> --- a/drivers/clk/bcm/clk-bcm2835.c
> +++ b/drivers/clk/bcm/clk-bcm2835.c
> @@ -602,6 +602,9 @@ static void bcm2835_pll_off(struct clk_hw *hw)
>  	const struct bcm2835_pll_data *data =3D pll->data;
>=20=20
>  	spin_lock(&cprman->regs_lock);
> +	cprman_write(cprman, data->a2w_ctrl_reg,
> +		     cprman_read(cprman, data->a2w_ctrl_reg) &
> +		     ~A2W_PLL_CTRL_PRST_DISABLE);
>  	cprman_write(cprman, data->cm_ctrl_reg,
>  		     cprman_read(cprman, data->cm_ctrl_reg) |
>  		     CM_PLL_ANARST);

For turning off, the FW just does the equivalent of:

	cprman_write(cprman, data->cm_ctrl_reg, CM_PLL_ANARST);
	cprman_write(cprman, data->a2w_ctrl_reg, A2W_PLL_CTRL_PWRDN);

How about we do that, instead?

> @@ -640,6 +643,10 @@ static int bcm2835_pll_on(struct clk_hw *hw)
>  		cpu_relax();
>  	}
>=20=20
> +	cprman_write(cprman, data->a2w_ctrl_reg,
> +		     cprman_read(cprman, data->a2w_ctrl_reg) |
> +		     A2W_PLL_CTRL_PRST_DISABLE);
> +
>  	return 0;
>  }

I agree with this hunk -- they drop PRST at the very end, after lock.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlp8aZ4ACgkQtdYpNtH8
nuiQ4A//cJlURcGmhGZTIdVh+95GAgjnwM6lAF21DVKkRsZhK6pic3OG83XNMJDt
OY3UvdCIwEBMwXhpjUQcJY745VqdVf0rpbwBswa5fHDxS4OpNnt/USRH0LPLVEsB
95rnxxISMYlj/bfmN6J/QwGmXpb8r6RUxBcGuszXCr4KUP5lIu5hESVAgxmoBHAH
wIuAIo48OjxFoiFeO2iVfn6YLfD0+WhB/ugLValpVvx6DWj4922lJYHbzUa8haIZ
aqTDCPpvO0lXYRUxw53X0hfZzNfwcVZxayZMGWurzD5px+l3gn3WrTQzQsAxE6MZ
lW1+zHzlsQudeH/DLeKXxb37uq8toX4y2xnwqmXmIkzIcO+1ax8TXv/fsMBnrqbX
jN/9JI/kNF3yvclfyp/8RdGCu2HMnZ51Myj8ymGr8Budb/K92b9xH+7ruHU2ebfB
ufQDwVTQ3ZN76W/B6Nm+0pNGsAm3vGHYD8wnNF48c4x8o4GhrjDiHY48iWKq/Ky/
wpPh4XQMxgegnyVisolo7PHTwsJQCkXSabb+mgx1fDwRXozb5oE593grFabLhD+I
SUPDNg7UO63gDiWuV5TCZiGO7pqURMiS6nTzHjWV8kDHoX41JKdza7sIrcRKMNMp
1r6sK/akHPKZ/l4cUQvyFZ6RMtAzW7QxuoUGX1EgPxZV1snZnpo=
=E0l7
-----END PGP SIGNATURE-----
--=-=-=--
