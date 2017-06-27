Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 27 Jun 2017 11:46:07 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Priit Laes <plaes@plaes.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
	Jonathan Liu <net147@gmail.com>
Subject: Re: [PATCH v4 1/6] clk: sunxi-ng: div: Add support for fixed
 post-divider
Message-ID: <20170627094607.2hkgzkycclboemvu@flea.lan>
References: <cover.24b2b13ec5a68552e186ba1637f1328363c3886e.1498422562.git-series.plaes@plaes.org>
 <bc043a64775ec8c9cfcfe6d638e348d38e34eba3.1498422562.git-series.plaes@plaes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5tptchyg3tgiuxg4"
In-Reply-To: <bc043a64775ec8c9cfcfe6d638e348d38e34eba3.1498422562.git-series.plaes@plaes.org>
List-ID: <linux-clk.vger.kernel.org>


--5tptchyg3tgiuxg4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

On Sun, Jun 25, 2017 at 11:45:42PM +0300, Priit Laes wrote:
> SATA clock on sun4i/sun7i is of type (parent) / M / 6 where
> 6 is fixed post-divider.
>=20
> Signed-off-by: Priit Laes <plaes@plaes.org>
> ---
>  drivers/clk/sunxi-ng/ccu_div.c | 12 ++++++++++--
>  drivers/clk/sunxi-ng/ccu_div.h |  3 ++-
>  2 files changed, 12 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_di=
v.c
> index c0e5c10..de30e15 100644
> --- a/drivers/clk/sunxi-ng/ccu_div.c
> +++ b/drivers/clk/sunxi-ng/ccu_div.c
> @@ -62,8 +62,13 @@ static unsigned long ccu_div_recalc_rate(struct clk_hw=
 *hw,
>  	parent_rate =3D ccu_mux_helper_apply_prediv(&cd->common, &cd->mux, -1,
>  						  parent_rate);
> =20
> -	return divider_recalc_rate(hw, parent_rate, val, cd->div.table,
> -				   cd->div.flags);
> +	val =3D divider_recalc_rate(hw, parent_rate, val, cd->div.table,
> +				  cd->div.flags);
> +
> +	if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
> +		val /=3D cd->fixed_post_div;
> +
> +	return val;
>  }
> =20
>  static int ccu_div_determine_rate(struct clk_hw *hw,
> @@ -89,6 +94,9 @@ static int ccu_div_set_rate(struct clk_hw *hw, unsigned=
 long rate,
>  	val =3D divider_get_val(rate, parent_rate, cd->div.table, cd->div.width,
>  			      cd->div.flags);
> =20
> +	if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
> +		val *=3D cd->fixed_post_div;
> +
>  	spin_lock_irqsave(cd->common.lock, flags);
> =20
>  	reg =3D readl(cd->common.base + cd->common.reg);

You also need to adjust the round rate call back to take into account
the post divider before calling divider_round_rate_parent, and after
since that function can modify the parent_rate.

> diff --git a/drivers/clk/sunxi-ng/ccu_div.h b/drivers/clk/sunxi-ng/ccu_di=
v.h
> index 08d0744..f3a5028 100644
> --- a/drivers/clk/sunxi-ng/ccu_div.h
> +++ b/drivers/clk/sunxi-ng/ccu_div.h
> @@ -86,9 +86,10 @@ struct ccu_div_internal {
>  struct ccu_div {
>  	u32			enable;
> =20
> -	struct ccu_div_internal		div;
> +	struct ccu_div_internal	div;

Spurious change?

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--5tptchyg3tgiuxg4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZUilfAAoJEBx+YmzsjxAgJP4P/3IwD6pTvz8i/jOiK0UT0mpN
dS69dc52yN579jXF6XPamvTGo5YmlLOggEANE3+XJWe+WLyqE/jO/TZL0Oz9jopN
VMGhiFfOFO/rvcCa0KmT+0BPbkbUVoatMPiSjpneMTfl05C2IEbgE2fTxWM8Yx1f
ZELhrebG/7zb+5q3mPTtYbXgvs6tQ1VJ2cKZxd6CKKdRseeDRcZzkkcujjOxEMrI
yJy8b4ZrgGNsI4oLXeampQuCHp3SSIMANTMhsQSK+soBYFxUVlkm/UrrEnWVD8N8
AyVJxMlda7wo9L+cyes7I4HZsAMsQDtG6QQQ84jio9EDYCslDaO4FH7ZGKr/sVIp
W6Ie8PFobb8zh6YC+nIwNNchc5BOgLV9VAReNlGudstn17FNT/K32NY6WkPyGIL+
G97FpEDMSmGgn/n6vxek51YNwAZRlFKGHRWrC0yo7PPWa6X1Dk16fmDThzPloCrw
Z9gUNC7X5bkGqghpyF12us9KHM9t2dsU+CtkrjPHtt4bf7UXb/ktRvJ2ml+UXFYu
bsL91//B8cb9fzd1df3jxLo1L2nW5rZaUwPnwZ8ASg9DDzaZORyHWhBsxJe/KObY
hU9R76wxzVgMAfOLCtlAdRfFIRid/8csTzOxrFGuprVFTblaSfwAsv0dF8ktMYVV
wh/oLeZr7HhI+UgPuZPt
=ZGBX
-----END PGP SIGNATURE-----

--5tptchyg3tgiuxg4--
