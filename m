Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Eric Anholt <eric@anholt.net>,  linux-clk@vger.kernel.org
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1455591838-22725-1-git-send-email-eric@anholt.net>
Cc: linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, "Stephen Warren" <swarren@wwwdotorg.org>,
 "Lee Jones" <lee@kernel.org>, "Stephen Boyd" <sboyd@codeaurora.org>,
 "Eric Anholt" <eric@anholt.net>, stable@vger.kernel.org
References: <1455591838-22725-1-git-send-email-eric@anholt.net>
Message-ID: <20160216214457.2278.13701@quark.deferred.io>
Subject: Re: [PATCH 1/2] clk: bcm2835: Fix setting of PLL divider clock rates
Date: Tue, 16 Feb 2016 13:44:57 -0800
List-ID: <linux-clk.vger.kernel.org>

Quoting Eric Anholt (2016-02-15 19:03:57)
> Our dividers weren't being set successfully because CM_PASSWORD wasn't
> included in the register write.  It looks easier to just compute the
> divider to write ourselves than to update clk-divider for the ability
> to OR in some arbitrary bits on write.
> =

> Fixes about half of the video modes on my HDMI monitor (everything
> except 720x400).
> =

> Cc: stable@vger.kernel.org
> Signed-off-by: Eric Anholt <eric@anholt.net>

Applied to clk-next.

Regards,
Mike

> ---
>  drivers/clk/bcm/clk-bcm2835.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> =

> diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
> index 015e687..9f4df8f 100644
> --- a/drivers/clk/bcm/clk-bcm2835.c
> +++ b/drivers/clk/bcm/clk-bcm2835.c
> @@ -1107,13 +1107,15 @@ static int bcm2835_pll_divider_set_rate(struct cl=
k_hw *hw,
>         struct bcm2835_pll_divider *divider =3D bcm2835_pll_divider_from_=
hw(hw);
>         struct bcm2835_cprman *cprman =3D divider->cprman;
>         const struct bcm2835_pll_divider_data *data =3D divider->data;
> -       u32 cm;
> -       int ret;
> +       u32 cm, div, max_div =3D 1 << A2W_PLL_DIV_BITS;
>  =

> -       ret =3D clk_divider_ops.set_rate(hw, rate, parent_rate);
> -       if (ret)
> -               return ret;
> +       div =3D DIV_ROUND_UP_ULL(parent_rate, rate);
> +
> +       div =3D min(div, max_div);
> +       if (div =3D=3D max_div)
> +               div =3D 0;
>  =

> +       cprman_write(cprman, data->a2w_reg, div);
>         cm =3D cprman_read(cprman, data->cm_reg);
>         cprman_write(cprman, data->cm_reg, cm | data->load_mask);
>         cprman_write(cprman, data->cm_reg, cm & ~data->load_mask);
> -- =

> 2.7.0
>=20
