Return-Path: <leonard.crestez@nxp.com>
Message-ID: <1491932908.31718.33.camel@nxp.com>
Subject: Re: [RFC PATCH 3/3] cpufreq: imx6q: refine clk operations
From: Leonard Crestez <leonard.crestez@nxp.com>
To: Dong Aisheng <aisheng.dong@nxp.com>, <linux-clk@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<kernel@pengutronix.de>, <broonie@kernel.org>, <yibin.gong@nxp.com>,
	<rjw@rjwysocki.net>, <viresh.kumar@linaro.org>, <mturquette@baylibre.com>,
	<sboyd@codeaurora.org>, <shawnguo@kernel.org>, <fabio.estevam@nxp.com>,
	<anson.huang@nxp.com>, <ping.bai@nxp.com>, <octavian.purdila@nxp.com>
Date: Tue, 11 Apr 2017 20:48:28 +0300
In-Reply-To: <1491969809-20154-4-git-send-email-aisheng.dong@nxp.com>
References: <1491969809-20154-1-git-send-email-aisheng.dong@nxp.com>
	 <1491969809-20154-4-git-send-email-aisheng.dong@nxp.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Return-Path: leonard.crestez@nxp.com
List-ID: <linux-clk.vger.kernel.org>

On Wed, 2017-04-12 at 12:03 +0800, Dong Aisheng wrote:
> +static int num_clks;
> +static struct clk_bulk_data clks[] = {
> +	{ .id = "arm" },
> +	{ .id = "pll1_sys" },
> +	{ .id = "step" },
> +	{ .id = "pll1_sw" },
> +	{ .id = "pll2_pfd2_396m" },
> +	{ .id = "pll2_bus" },
> +	{ .id = "secondary_sel" },
> +};

The .id is only required for initialization, it seems strange to keep
it around runtime data. It might be better for this API to work with an
array of clk* and separate array of names (or clk_bulk_init_data if we
need flags). Variable references would be shorter and it would allow
more data to be const.

> -put_clk:
> -	if (!IS_ERR(arm_clk))
> -		clk_put(arm_clk);
> -	if (!IS_ERR(pll1_sys_clk))
> -		clk_put(pll1_sys_clk);
> -	if (!IS_ERR(pll1_sw_clk))
> -		clk_put(pll1_sw_clk);
> -	if (!IS_ERR(step_clk))
> -		clk_put(step_clk);
> -	if (!IS_ERR(pll2_pfd2_396m_clk))
> -		clk_put(pll2_pfd2_396m_clk);
> -	if (!IS_ERR(pll2_bus_clk))
> -		clk_put(pll2_bus_clk);
> -	if (!IS_ERR(secondary_sel_clk))
> -		clk_put(secondary_sel_clk);
> +
> +	clk_bulk_put(num_clks, clks);
> +put_node:
>  	of_node_put(np);
> +
>  	return ret;
>  }


My subjective opinion is that a better way to clean this up would be to
have a single imx6q_cpufreq_clean function that takes all resources and
does stuff like:

if (!IS_ERR(clk)) clk_put(clk);
clk = NULL;

That function can be called from both _remove and failed _probe without
having to keep track of which resources have been allocated until then.
Just free and NULL all clocks/regulators and simplify control flow.

--
Regards,
Leonard
