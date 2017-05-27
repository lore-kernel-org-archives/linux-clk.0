Return-Path: <bjorn.andersson@linaro.org>
Return-Path: <bjorn.andersson@linaro.org>
Date: Sat, 27 May 2017 13:19:13 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 5/5 v2] clk: qcom: Add support for MSM8660 LCC
Message-ID: <20170527201913.GN12920@tuxbook>
References: <20170419091326.11226-1-linus.walleij@linaro.org>
 <20170419091326.11226-5-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170419091326.11226-5-linus.walleij@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On Wed 19 Apr 02:13 PDT 2017, Linus Walleij wrote:
> diff --git a/drivers/clk/qcom/lcc-msm8660.c b/drivers/clk/qcom/lcc-msm8660.c
[..]
> +/* The vendor code uses PLL4 as parent everywhere */
> +static const struct parent_map lcc_parent_map[] = {
> +	{ P_PXO, 0 },
> +	{ P_CXO, 1 },
> +	/* Select RPM PLL4, but also used for selecting LPA PLL0 */
> +	{ P_PLL4_LPA_PLL0, 2 },
> +	/* Will just ground the line */
> +	{ P_GND, 6 },
> +};
> +
> +static const char * const lcc_parent_tbl[] = {
> +	"pxo",
> +	"cxo",
> +	/*
> +	 * PLL4 is an RPM clock on MSM8660/APQ8060, set to "pll4" for this
> +	 * If we enable and mux in the LPA_PLL0 on this platform, we can
> +	 * set this to "lpa_pll0" instead
> +	 */
> +	"pll4_clk",
> +	"gnd", /* This is a very inactive parent */
> +};
> +
> +/*
> + * This table is evidently for using PLL4 as parent, if we start using
> + * LPA_PLL0 we need to provide a second table.
> + */

Aren't you muxing in LPA_PLL0 as source instead of PLL4 at the bottom of
probe()? And as you hard code that selector, shouldn't the parent table
reference lpa_pll0?

> +static struct freq_tbl clk_tbl_aif_osr_pll4[] = {
> +	{   768000, P_PLL4_LPA_PLL0, 4,  1, 176 },
> +	{  1024000, P_PLL4_LPA_PLL0, 4,  1, 132 },
> +	{  1536000, P_PLL4_LPA_PLL0, 4,  1,  88 },
> +	{  2048000, P_PLL4_LPA_PLL0, 4,  1,  66 },
> +	{  3072000, P_PLL4_LPA_PLL0, 4,  1,  44 },
> +	{  4096000, P_PLL4_LPA_PLL0, 4,  1,  33 },
> +	{  6144000, P_PLL4_LPA_PLL0, 4,  1,  22 },
> +	{  8192000, P_PLL4_LPA_PLL0, 2,  1,  33 },
> +	{ 12288000, P_PLL4_LPA_PLL0, 4,  1,  11 },
> +	{ 24576000, P_PLL4_LPA_PLL0, 2,  1,  11 },
> +	{ 27000000, P_PXO,           1,  0,   0 },
> +	{ }
> +};
> +
[..]
> +static int lcc_msm8660_probe(struct platform_device *pdev)
> +{
[..]
> +	/*
> +	 * Enable LPA_PLL0 source on the LPASS Primary PLL Mux. Incidentally
> +	 * this is set to 0x00000001 at boot.
> +	 * 0x01 = LPA_PLL0
> +	 */
> +	regmap_write(regmap, 0xc4, 0x1);

Regards,
Bjorn
