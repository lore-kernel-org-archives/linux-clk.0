Return-Path: <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Oct 2015 10:22:43 +0200
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Gregory CLEMENT
 <gregory.clement@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>,
 Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH 14/26] clk: mvebu: Convert to clk_hw based provider APIs
Message-ID: <20151015102243.79d9e5ce@free-electrons.com>
In-Reply-To: <20151014182138.GD26883@codeaurora.org>
References: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
	<1438362246-6664-15-git-send-email-sboyd@codeaurora.org>
	<20151014170922.3027008a@free-electrons.com>
	<20151014182138.GD26883@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

Stephen,

On Wed, 14 Oct 2015 11:21:38 -0700, Stephen Boyd wrote:

> How about this patch?
> 
> ---8<----
> diff --git a/drivers/clk/mvebu/clk-cpu.c b/drivers/clk/mvebu/clk-cpu.c
> index 5837eb8a212f..85da8b983256 100644
> --- a/drivers/clk/mvebu/clk-cpu.c
> +++ b/drivers/clk/mvebu/clk-cpu.c
> @@ -197,6 +197,7 @@ static void __init of_cpu_clk_setup(struct device_node *node)
>  	for_each_node_by_type(dn, "cpu") {
>  		struct clk_init_data init;
>  		struct clk *clk;
> +		struct clk *parent_clk;
>  		char *clk_name = kzalloc(5, GFP_KERNEL);
>  		int cpu, err;
>  
> @@ -208,8 +209,9 @@ static void __init of_cpu_clk_setup(struct device_node *node)
>  			goto bail_out;
>  
>  		sprintf(clk_name, "cpu%d", cpu);
> +		parent_clk = of_clk_get(node, 0);
>  
> -		cpuclk[cpu].parent_name = of_clk_get_parent_name(node, 0);
> +		cpuclk[cpu].parent_name = __clk_get_name(parent_clk);
>  		cpuclk[cpu].clk_name = clk_name;
>  		cpuclk[cpu].cpu = cpu;
>  		cpuclk[cpu].reg_base = clock_complex_base;

Applied on top of 4.3-rc5, this patch fixes the problem for me, without
any change to the Device Tree files.

It's probably the easiest option for 4.3. Do you want me to submit a
patch, or will you apply it directly to your clk tree?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
