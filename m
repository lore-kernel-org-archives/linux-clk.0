Return-Path: <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Oct 2015 17:09:22 +0200
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Gregory CLEMENT
 <gregory.clement@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>,
 Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH 14/26] clk: mvebu: Convert to clk_hw based provider APIs
Message-ID: <20151014170922.3027008a@free-electrons.com>
In-Reply-To: <1438362246-6664-15-git-send-email-sboyd@codeaurora.org>
References: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
	<1438362246-6664-15-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

Stephen, Mike,

On Fri, 31 Jul 2015 10:03:54 -0700, Stephen Boyd wrote:
> We're removing struct clk from the clk provider API, so switch
> this code to using the clk_hw based provider APIs. This also
> removes a clk_get() in this driver that can just as easily use
> of_clk_get_parent_name() instead.
> 
> Cc: Gregory CLEMENT <gregory.clement@free-electrons.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
>  drivers/clk/mvebu/clk-cpu.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/mvebu/clk-cpu.c b/drivers/clk/mvebu/clk-cpu.c
> index 86888a658d4c..5837eb8a212f 100644
> --- a/drivers/clk/mvebu/clk-cpu.c
> +++ b/drivers/clk/mvebu/clk-cpu.c
> @@ -121,7 +121,7 @@ static int clk_cpu_on_set_rate(struct clk_hw *hwclk, unsigned long rate,
>  	if (!cpuclk->pmu_dfs)
>  		return -ENODEV;
>  
> -	cur_rate = __clk_get_rate(hwclk->clk);
> +	cur_rate = clk_hw_get_rate(hwclk);
>  
>  	reg = readl(cpuclk->reg_base + SYS_CTRL_CLK_DIVIDER_CTRL2_OFFSET);
>  	fabric_div = (reg >> SYS_CTRL_CLK_DIVIDER_CTRL2_NBCLK_RATIO_SHIFT) &
> @@ -197,7 +197,6 @@ static void __init of_cpu_clk_setup(struct device_node *node)
>  	for_each_node_by_type(dn, "cpu") {
>  		struct clk_init_data init;
>  		struct clk *clk;
> -		struct clk *parent_clk;
>  		char *clk_name = kzalloc(5, GFP_KERNEL);
>  		int cpu, err;
>  
> @@ -209,9 +208,8 @@ static void __init of_cpu_clk_setup(struct device_node *node)
>  			goto bail_out;
>  
>  		sprintf(clk_name, "cpu%d", cpu);
> -		parent_clk = of_clk_get(node, 0);
>  
> -		cpuclk[cpu].parent_name = __clk_get_name(parent_clk);
> +		cpuclk[cpu].parent_name = of_clk_get_parent_name(node, 0);
>  		cpuclk[cpu].clk_name = clk_name;
>  		cpuclk[cpu].cpu = cpu;
>  		cpuclk[cpu].reg_base = clock_complex_base;

Sorry to chime in only right now, but this patch causes a regression on
Armada XP: the cpu clocks are no longer seen as child of their parent
and therefore their rate is always 0. This breaks cpufreq on this
platform.

For the record, our DT looks like this:

			coreclk: mvebu-sar@18230 {
				compatible = "marvell,armada-xp-core-clock";
				reg = <0x18230 0x08>;
				#clock-cells = <1>;
			};

			cpuclk: clock-complex@18700 {
				#clock-cells = <1>;
				compatible = "marvell,armada-xp-cpu-clock";
				reg = <0x18700 0x24>, <0x1c054 0x10>;
				clocks = <&coreclk 1>;
			};

The driver for the cpuclk registers n clocks, one for each CPU, where
each clock has as its parent the second "core clock", i.e <&coreclk 1>.

In the code before your patch, we were doing an of_clk_get(), which was
doing a complete "resolution" of the parent clock, and so
cpuclk[cpu].parent_name is "cpuclk". This allows the clk framework to
properly find "cpuclk" as the parent for the cpu[0-3] clocks, and we
get the appropriate behavior:

  cpuclk                                   4            4  1333000000          0 0  
     cpu3                                  1            1  1333000000          0 0  
     cpu2                                  1            1  1333000000          0 0  
     cpu1                                  1            1  1333000000          0 0  
     cpu0                                  3            3  1333000000          0 0  
     dramclk                               0            0   666500000          0 0  
     hclk                                  0            0   333250000          0 0  
     nbclk                                 0            0   666500000          0 0  

With your patch, since we don't use clock-output-names in the Device
Tree, the of_clk_get_parent_name() helper function returns simply the
name of the Device Tree node of the parent, in our case just
"mvebu-sar". Which obviously doesn't match any clock name, with the
consequence that cpu[0-3] are no longer parented to cpuclk, and
therefore their rate is 0 because they don't have a parent:

 cpuclk                                   0            0  1333000000          0 0  
    dramclk                               0            0   666500000          0 0  
    hclk                                  0            0   333250000          0 0  
    nbclk                                 0            0   666500000          0 0  
 cpu3                                     1            1           0          0 0  
 cpu2                                     1            1           0          0 0  
 cpu1                                     1            1           0          0 0  
 cpu0                                     3            3           0          0 0  

Stephen, what do you suggest to fix this issue?

The easiest solution is to add a clock-output-names property to the
coreclk node. This way, of_clk_get_parent_name() will properly resolve
the clock name to its correct name (i.e, "cpuclk" in our case) and
everything works fine (I've tested). The drawback of this solution is
that it breaks backward compatibility with old DTs: a 4.2 DT for Armada
XP would no longer work with a >= 4.3 kernel.

Do you have some other suggestions to make ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
