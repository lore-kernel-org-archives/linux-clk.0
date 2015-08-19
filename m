Return-Path: <abrestic@google.com>
MIME-Version: 1.0
Sender: abrestic@google.com
In-Reply-To: <1439890337-13803-4-git-send-email-govindraj.raja@imgtec.com>
References: <1439890337-13803-1-git-send-email-govindraj.raja@imgtec.com>
	<1439890337-13803-4-git-send-email-govindraj.raja@imgtec.com>
Date: Wed, 19 Aug 2015 14:09:28 -0700
Message-ID: <CAL1qeaEYF2dx8E6MA6c7YCHi-e5OqiMMWDC3cCTC8ZvfMCiXww@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] clk: pistachio: Fix PLL rate calculation in
 integer mode
From: Andrew Bresticker <abrestic@chromium.org>
To: Govindraj Raja <govindraj.raja@imgtec.com>
Cc: Linux-MIPS <linux-mips@linux-mips.org>, linux-clk@vger.kernel.org,
	Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>,
	Zdenko Pulitika <zdenko.pulitika@imgtec.com>, Kevin Cernekee <cernekee@chromium.org>,
	Ralf Baechle <ralf@linux-mips.org>, James Hartley <James.Hartley@imgtec.com>,
	Damien Horsley <Damien.Horsley@imgtec.com>, James Hogan <James.Hogan@imgtec.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Tue, Aug 18, 2015 at 2:32 AM, Govindraj Raja
<govindraj.raja@imgtec.com> wrote:
> From: Zdenko Pulitika <zdenko.pulitika@imgtec.com>
>
> .recalc_rate callback for the fractional PLL doesn't take operating
> mode into account when calculating PLL rate. This results in
> the incorrect PLL rates when PLL is operating in integer mode.
>
> Operating mode of fractional PLL is based on the value of the
> fractional divider. Currently it assumes that the PLL will always
> be configured in fractional mode which may not be
> the case. This may result in the wrong output frequency.
>
> Also vco was calculated based on the current operating mode which
> makes no sense because .set_rate is setting operating mode. Instead,
> vco should be calculated using PLL settings that are about to be set.
>
> Signed-off-by: Zdenko Pulitika <zdenko.pulitika@imgtec.com>
> Signed-off-by: Govindraj Raja <govindraj.raja@imgtec.com>

One minor comment below, otherwise:

Reviewed-by: Andrew Bresticker <abrestic@chromium.org>

> --- a/drivers/clk/pistachio/clk-pll.c
> +++ b/drivers/clk/pistachio/clk-pll.c

> @@ -65,6 +65,10 @@
>  #define MIN_OUTPUT_FRAC                        12000000UL
>  #define MAX_OUTPUT_FRAC                        1600000000UL
>
> +/* Fractional PLL operating modes */
> +#define PLL_MODE_INT                   1
> +#define PLL_MODE_FRAC                  0

Make this an enum (e.g. enum pll_mode) and ...

> +static inline u32 pll_frac_get_mode(struct clk_hw *hw)
> +{
> +       struct pistachio_clk_pll *pll = to_pistachio_pll(hw);
> +       u32 val;
> +
> +       val = pll_readl(pll, PLL_CTRL3) & PLL_FRAC_CTRL3_DSMPD;
> +       return val ? PLL_MODE_INT : PLL_MODE_FRAC;
> +}
> +
> +static inline void pll_frac_set_mode(struct clk_hw *hw, u32 mode)
> +{
> +       struct pistachio_clk_pll *pll = to_pistachio_pll(hw);
> +       u32 val;
> +
> +       val = pll_readl(pll, PLL_CTRL3);
> +       if (mode == PLL_MODE_INT)
> +               val |= PLL_FRAC_CTRL3_DSMPD | PLL_FRAC_CTRL3_DACPD;
> +       else
> +               val &= ~(PLL_FRAC_CTRL3_DSMPD | PLL_FRAC_CTRL3_DACPD);
> +
> +       pll_writel(pll, val, PLL_CTRL3);
> +}

... use the enum type instead of u32 for the mode.
