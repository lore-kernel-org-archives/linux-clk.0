Return-Path: <linux-amlogic-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Wed, 1 Mar 2017 11:11:19 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 2/3] clk: meson-gxbb: Add MALI clocks
Message-ID: <20170301191119.GR25384@codeaurora.org>
References: <1488365164-22861-1-git-send-email-narmstrong@baylibre.com>
 <1488365164-22861-3-git-send-email-narmstrong@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <1488365164-22861-3-git-send-email-narmstrong@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org, carlo@caione.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

On 03/01, Neil Armstrong wrote:
> diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
> index a52063f..31f6090 100644
> --- a/drivers/clk/meson/gxbb.c
> +++ b/drivers/clk/meson/gxbb.c
> @@ -634,6 +634,131 @@
>  	},
>  };
>  
> +/*
> + * The MALI IP is clocked by two identical clocks (mali_0 and mali_1)
> + * muxed by a glitch-free switch.
> + */
> +
> +static u32 mux_table_mali_0_1[] = {0, 1, 2, 3, 4, 5, 6, 7};
> +const char *gxbb_mali_0_1_parent_names[] = {

static?

> +	"xtal", "gp0_pll", "mpll2", "mpll1", "fclk_div7",
> +	"fclk_div4", "fclk_div3", "fclk_div5"
> +};
> +
[..]
> +	.reg = (void *)HHI_MALI_CLK_CNTL,
> +	.bit_idx = 24,
> +	.lock = &clk_lock,
> +	.hw.init = &(struct clk_init_data){
> +		.name = "mali_1",
> +		.ops = &clk_gate_ops,
> +		.parent_names = (const char *[]){ "mali_1_div" },
> +		.num_parents = 1,
> +		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),
> +	},
> +};
> +
> +static u32 mux_table_mali[] = {0, 1};
> +const char *gxbb_mali_parent_names[] = {

static?

> +	"mali_0", "mali_1"
> +};
[...]
>  static struct clk_mux *gxbb_clk_muxes[] = {
>  	&gxbb_mpeg_clk_sel,
>  	&gxbb_sar_adc_clk_sel,
> +	&gxbb_mali_0_sel,
> +	&gxbb_mali_1_sel,
> +	&gxbb_mali,
>  };
>  
>  static struct clk_divider *gxbb_clk_dividers[] = {

Can these arrays be const? If so, please do that in a separate
patch.

>  	&gxbb_mpeg_clk_div,
>  	&gxbb_sar_adc_clk_div,
> +	&gxbb_mali_0_div,
> +	&gxbb_mali_1_div,
>  };
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
