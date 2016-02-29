Return-Path: <anholt@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: kernel@martin.sperl.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: Martin Sperl <kernel@martin.sperl.org>
Subject: Re: [PATCH 1/6] clk: bcm2835: pll_off should only set CM_PLL_ANARST
In-Reply-To: <1456745963-2403-2-git-send-email-kernel@martin.sperl.org>
References: <1456745963-2403-1-git-send-email-kernel@martin.sperl.org> <1456745963-2403-2-git-send-email-kernel@martin.sperl.org>
Date: Mon, 29 Feb 2016 12:03:12 -0800
Message-ID: <8737sb708v.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain

kernel@martin.sperl.org writes:

> From: Martin Sperl <kernel@martin.sperl.org>
>
> bcm2835_pll_off is currently assigning CM_PLL_ANARST
> to the control register.
>
> This patch only sets the CM_PLL_ANARST bit
> not resetting any of the other bits, which allows
> restoring the register to its original value
> via bcm2834_pll_on.
>
> It also now locks during the read/modify/write cycle of
> both registers.
>
> Fixes: 41691b8862e2 ("clk: bcm2835: Add support for programming the
> audio domain clocks")
>
> Signed-off-by: Martin Sperl <kernel@martin.sperl.org>
> ---
>  drivers/clk/bcm/clk-bcm2835.c |   10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
> index 5747a9d..2b7c6af 100644
> --- a/drivers/clk/bcm/clk-bcm2835.c
> +++ b/drivers/clk/bcm/clk-bcm2835.c
> @@ -913,8 +913,14 @@ static void bcm2835_pll_off(struct clk_hw *hw)
>  	struct bcm2835_cprman *cprman = pll->cprman;
>  	const struct bcm2835_pll_data *data = pll->data;
>
> -	cprman_write(cprman, data->cm_ctrl_reg, CM_PLL_ANARST);
> -	cprman_write(cprman, data->a2w_ctrl_reg, A2W_PLL_CTRL_PWRDN);
> +	spin_lock(&cprman->regs_lock);
> +	cprman_write(cprman, data->cm_ctrl_reg,
> +		     cprman_read(cprman, data->cm_ctrl_reg) |
> +		     CM_PLL_ANARST);
> +	cprman_write(cprman, data->a2w_ctrl_reg,
> +		     cprman_read(cprman, data->a2w_ctrl_reg) |
> +		     A2W_PLL_CTRL_PWRDN);
> +	spin_unlock(&cprman->regs_lock);
>  }

I think I see now: we're making sure that the hold_mask of a divider
doesn't get lost if we turn its source PLL off.

Reviewed-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJW1KQAAAoJELXWKTbR/J7orpwP/jMkgrjWJu9gajzS0teICdEq
opXdTcJhw3rXj0X/hiBD9jOxOqi7+mD17R37kIfCc24uNfFowoLMNyHDqqHwW/fF
tzLtKCE0FOVMMCskwlQJSUkjBorUFrkFRqNvXfuPEZOVR03fvObumiMhQWPiIbyR
GyTVfjy7cu5ZpuI7tOTuuNVf+LfMgAniVBLJtH1WE7Vm3Z4K5rE0ZL1UzGZotueg
10qwHKXVgS0VkWiFb2G31oOdNmJxh+4czicqt5Gekf2a0pUMeF+CRHHaVpeiZnYP
EP1SLWsFeH8490HTiZ/Oyk4IXUwIHn6/bOQEfWKQ3JiAh58iiwDC7U+LJNi3UjzC
qtbXMNj1JpR+Ugq/Yp0zugZD++zBjbn2TsitOaR8EOz7Vt8ww2YBx/da0PqGAx2u
EaoeN59Jc59oekmr4+/j46Ma5Wbly2lBAhd1GhYmBDmm5lkeMnY2Vct9R7FFA8Lp
pheHfUC4tXu2Zn+MHz3cXjuYnCkikGsQXmIUUQhUvKHtabVgStbFYzIif+9o1WOi
GPadHcTpswuDr3S7W3XKc9I0szuhEHKc4bDgsoHFdYuWpjw3TGLJ/yYIJVqI/Oax
yz9V0Rf98zGMrXbNHQDCMxIFbMzOtWR6K3gkB9hHEHRMkp4rGCq4+5gzD1flkpbH
XzvF6GtkhWcGETIkKqWy
=TXoJ
-----END PGP SIGNATURE-----
--=-=-=--
