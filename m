Return-Path: <James.Hogan@imgtec.com>
Date: Wed, 20 Jan 2016 14:57:31 +0000
From: James Hogan <james.hogan@imgtec.com>
To: Heiko Stuebner <heiko@sntech.de>
CC: <mturquette@baylibre.com>, <sboyd@codeaurora.org>,
	<linux-clk@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, Zhang Qing <zhangqing@rock-chips.com>
Subject: Re: [PATCH] clk-divider: make sure read-only dividers do not write
 to their register
Message-ID: <20160120145731.GA6864@jhogan-linux.le.imgtec.org>
References: <8710207.gKyLbM2bKY@phil>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
In-Reply-To: <8710207.gKyLbM2bKY@phil>
List-ID: <linux-clk.vger.kernel.org>

--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 20, 2016 at 03:42:54PM +0100, Heiko Stuebner wrote:
> Commit e6d5e7d90be9 ("clk-divider: Fix READ_ONLY when divider > 1") remov=
ed
> the special ops struct for read-only clocks and instead opted to handle
> them regularly.
>=20
> On the rk3368 this results in breakage as aclkm now gets set a value.
> While it is the same divider, the A53 core still doesn't like it.
> The reason being that "ACLKENMasserts one clock cycle before the rising
> edge of ACLKM" and the clock should only be touched when STANDBYWFIL2
> is asserted.
>=20
> So make sure, read-only clocks don't touch the clock-register at all
> even if only writing the same value.
>=20
> Fixes: e6d5e7d90be9 ("clk-divider: Fix READ_ONLY when divider > 1")
> Reported-by: Zhang Qing <zhangqing@rock-chips.com>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

It wouldn't hurt to clarify in the comment that this isn't just an
optimisation, and that even writing the same value to the hardware may
not be safe.

In any case
Reviewed-by: James Hogan <james.hogan@imgtec.com>

Cheers
James

> ---
>  drivers/clk/clk-divider.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
> index ded3ff4..6dfe261 100644
> --- a/drivers/clk/clk-divider.c
> +++ b/drivers/clk/clk-divider.c
> @@ -391,6 +391,10 @@ static int clk_divider_set_rate(struct clk_hw *hw, u=
nsigned long rate,
>  	unsigned long flags =3D 0;
>  	u32 val;
> =20
> +	/* don't do writes in read-only case */
> +	if (divider->flags & CLK_DIVIDER_READ_ONLY)
> +		return 0;
> +
>  	value =3D divider_get_val(rate, parent_rate, divider->table,
>  				divider->width, divider->flags);
> =20
> --=20
> 2.6.4
>=20
>=20

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWn6BbAAoJEGwLaZPeOHZ6SwAP+wWc+6xqXEyBVRY2MSg85FpB
ZEpXvIxWXyfd1C08bEMuxdTml6nyyuE5m6+KjH0zUrcpekSRUtsyfdq5BHw67yif
KpAJGKrDzcXUkT+fCLnBgs5upsEq8gGkhTY1tacErL0yhIaAhFVqoPyUPa2Xi1tM
4NuKvQSbfRlmGDnaAjPse8GTumjcxSqXj0h6e+9Mptm3HY6xlJeMa8BznjWu+Plt
UdyX0GuPy31cCRz7ohusAuJI/Y4QpQM+AYcY5RcD0BoFJsw5dyeS0P3o9bbsyIby
o49NJ5XO5m0JExlPKEFRCIapzwmBUpjRmDCDSGeJ6g/ugi85Cx/c90A3HL7yWZfP
AZ1gpJHq61/G0jkYIcXpRHk5hszlfcY4qX3THEk4lmaZ4lFGaPkBge7WnJOUTEze
0UYuNhN8SVtVbfc/bddbCB/TXGppflEshnYVBBAKI250hFDLMJbUD54TnQsHpF/o
sPRiY5PZS+Vtg6gVcpy8TaefjxAaIRCzrfJtbIJtbarHjzw7kT/XiBx+bClNrH4J
KyT2jyod5U/uB5tM0jyeqDkhz4l+jiQOQRkhXDmN+Qc61ZWDCxrzSKhIpThKZA8f
Wx6DqUxxQeA7UStN63e+oUejNIMSB3xwdvfZD2Cx6znHHPGx2S/BSggJ2UqXgeJs
iPdjQy3hwzRuiJzh3ZfE
=2Hyq
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--
