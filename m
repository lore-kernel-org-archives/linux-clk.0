Return-Path: <laurent.pinchart@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH V4] clk: vc5: Add support for IDT VersaClock 5P49V5923 and 5P49V5933
Date: Wed, 11 Jan 2017 18:42:21 +0200
Message-ID: <1574466.IP68Wc09dt@avalon>
In-Reply-To: <f1a287f5-6050-2e19-99c9-e17972e4db88@gmail.com>
References: <20170110185020.20645-1-marek.vasut@gmail.com> <8755535.oe5AAjKalT@avalon> <f1a287f5-6050-2e19-99c9-e17972e4db88@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Marek,

On Wednesday 11 Jan 2017 16:53:53 Marek Vasut wrote:
> On 01/11/2017 04:41 PM, Laurent Pinchart wrote:
> > On Wednesday 11 Jan 2017 15:37:11 Marek Vasut wrote:
> >> On 01/10/2017 07:50 PM, Marek Vasut wrote:
> >>> Add driver for IDT VersaClock 5 5P49V5923 and 5P49V5933 chips. These
> >>> chips have two clock inputs, XTAL or CLK, which are muxed into single
> >>> PLL/VCO input. In case of 5P49V5923, the XTAL in built into the chip
> >>> while the 5P49V5923 requires external XTAL.
> >>> 
> >>> The PLL feeds two fractional dividers. Each fractional divider feeds
> >>> output mux, which allows selecting between clock from the fractional
> >>> divider itself or from output mux on output N-1. In case of output
> >>> mux 0, the output N-1 is instead connected to the output from the mux
> >>> feeding the PLL.
> >>> 
> >>> The driver thus far supports only the 5P49V5923 and 5P49V5933, while
> >>> it should be easily extensible to the whole 5P49V59xx family of chips
> >>> as they are all pretty similar.
> >>> 
> >>> Signed-off-by: Marek Vasut <marek.vasut@gmail.com>
> >>> Cc: Michael Turquette <mturquette@baylibre.com>
> >>> Cc: Stephen Boyd <sboyd@codeaurora.org>

[snip]

> >>> diff --git a/drivers/clk/clk-versaclock5.c
> >>> b/drivers/clk/clk-versaclock5.c
> >>> new file mode 100644
> >>> index 000000000000..14f518e84d6d
> >>> --- /dev/null
> >>> +++ b/drivers/clk/clk-versaclock5.c

[snip]

> >>> +static long vc5_mux_round_rate(struct clk_hw *hw, unsigned long rate,
> >>> +			       unsigned long *parent_rate)
> >>> +{
> >>> +	unsigned long idiv;
> >>> +
> >>> +	/* PLL cannot operate with input clock above 50 MHz. */
> >>> +	if (rate > 50000000)
> >>> +		return -EINVAL;
> > 
> > As this is a PLL constraint, shouldn't it be enforced by
> > vc5_pll_round_rate() instead ?
> 
> vc5_pll_round_rate can only enforce PLL output frequency, not input
> frequency AFAICT .

vc5_pll_round_rate() can modify the parent rate, that seems a good way to 
enforce the requirement to me :-) On the other hand I've just realized that 
there's an output directly wired to the mux, in which case the mux output rate 
can be configured without taking the PLL into account. This probably calls for 
enforcing the 50MHz requirement here.

How do you envision this all to work ? If the user modifies the OUT0_I2C_SELB 
frequency, the mux divisor will be modified. Does the PLL then automatically 
recalculate its divisor to keep the same output frequency ? Doesn't the PLL 
input frequency get modified at least temporarily ?

> >>> +	/* CLKIN within range of PLL input, feed directly to PLL. */
> >>> +	if (*parent_rate <= 50000000)
> >>> +		return *parent_rate;
> >>> +
> >>> +	idiv = DIV_ROUND_UP(*parent_rate, rate);
> >>> +	if (idiv > 127)
> >>> +		return -EINVAL;
> >>> +
> >>> +	return *parent_rate / idiv;
> >>> +}
> 
> [...]
> 
> >>> +static struct clk_hw *
> >>> +vc5_of_clk_get(struct of_phandle_args *clkspec, void *data)
> >>> +{
> >>> +	struct vc5_driver_data *vc5 = data;
> >>> +	unsigned int idx = clkspec->args[0];
> >>> +
> >>> +	if (idx > 2) {
> >>> +		pr_err("%s: invalid index %u\n", __func__, idx);
> > 
> > Does this deserve an error message ?
> 
> I think it does, the driver will yell if you use incorrect index in the
> bindings.

Shouldn't it be the caller that complains ? I'd rather have an error message 
in the CCF core than duplicating it in all clock drivers.

> >>> +		return ERR_PTR(-EINVAL);
> >>> +	}
> >>> +
> >>> +	return &vc5->clk_out[idx].hw;
> >>> +}

-- 
Regards,

Laurent Pinchart
