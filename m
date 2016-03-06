Return-Path: <martin@sperl.org>
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Subject: Re: [PATCH v7] clk: bcm2835: Add support for programming the audio domain clocks
From: Martin Sperl <martin@sperl.org>
In-Reply-To: <1444354644-31997-1-git-send-email-eric@anholt.net>
Date: Sun, 6 Mar 2016 12:31:05 +0100
Cc: linux-clk <linux-clk@vger.kernel.org>,
 Mike Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <AE3FF4E9-9435-463F-8A05-2ED0CE67BC26@sperl.org>
References: <1444354644-31997-1-git-send-email-eric@anholt.net>
To: Eric Anholt <eric@anholt.net>
List-ID: <linux-clk.vger.kernel.org>

I know it has already been merged, but while doing some=20
clock investigations of the RPI3 I came accross this code:

> On 09.10.2015, at 03:37, Eric Anholt <eric@anholt.net> wrote:
> diff --git a/drivers/clk/bcm/clk-bcm2835.c =
b/drivers/clk/bcm/clk-bcm2835.c
> index dd295e4..8502a4b 100644
> --- a/drivers/clk/bcm/clk-bcm2835.c
> +++ b/drivers/clk/bcm/clk-bcm2835.c
> +static unsigned long bcm2835_pll_get_rate(struct clk_hw *hw,
> +					  unsigned long parent_rate)
> +{
> +	struct bcm2835_pll *pll =3D container_of(hw, struct bcm2835_pll, =
hw);
> +	struct bcm2835_cprman *cprman =3D pll->cprman;
> +	const struct bcm2835_pll_data *data =3D pll->data;
> +	u32 a2wctrl =3D cprman_read(cprman, data->a2w_ctrl_reg);
> +	u32 ndiv, pdiv, fdiv;
> +	bool using_prediv;
> +
> +	if (parent_rate =3D=3D 0)
> +		return 0;
> +
> +	fdiv =3D cprman_read(cprman, data->frac_reg) & =
A2W_PLL_FRAC_MASK;
> +	ndiv =3D (a2wctrl & A2W_PLL_CTRL_NDIV_MASK) >> =
A2W_PLL_CTRL_NDIV_SHIFT;
> +	pdiv =3D (a2wctrl & A2W_PLL_CTRL_PDIV_MASK) >> =
A2W_PLL_CTRL_PDIV_SHIFT;
> +	using_prediv =3D cprman_read(cprman, data->ana_reg_base + 4) &
> +		data->ana->fb_prediv_mask;
> +
> +	if (using_prediv)
> +		ndiv *=3D 2;
Is this really correct?

As far as I interpret the name =E2=80=9Cfb_predic_mask" it should be =
either:
  pdiv * =3D 2; /* there is already a divider of 2 applied */
or
  ndiv *=3D 2; /* we need to multiply bot integer and fractional by 2 */
  fdiv *=3D 2;

As it is a pre-divider, I would assume it is the first,
but I could be wrong - not knowing a lot about PLLs.

Just want to raise this as a question.

Martin
