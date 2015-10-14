Return-Path: <sboyd@codeaurora.org>
Date: Wed, 14 Oct 2015 11:21:38 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Gregory CLEMENT <gregory.clement@free-electrons.com>,
	Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH 14/26] clk: mvebu: Convert to clk_hw based provider APIs
Message-ID: <20151014182138.GD26883@codeaurora.org>
References: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
 <1438362246-6664-15-git-send-email-sboyd@codeaurora.org>
 <20151014170922.3027008a@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20151014170922.3027008a@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On 10/14, Thomas Petazzoni wrote:
> On Fri, 31 Jul 2015 10:03:54 -0700, Stephen Boyd wrote:
> > @@ -209,9 +208,8 @@ static void __init of_cpu_clk_setup(struct device_node *node)
> >  			goto bail_out;
> >  
> >  		sprintf(clk_name, "cpu%d", cpu);
> > -		parent_clk = of_clk_get(node, 0);
> >  
> > -		cpuclk[cpu].parent_name = __clk_get_name(parent_clk);
> > +		cpuclk[cpu].parent_name = of_clk_get_parent_name(node, 0);
> >  		cpuclk[cpu].clk_name = clk_name;
> >  		cpuclk[cpu].cpu = cpu;
> >  		cpuclk[cpu].reg_base = clock_complex_base;
> 
> Sorry to chime in only right now, but this patch causes a regression on
> Armada XP: the cpu clocks are no longer seen as child of their parent
> and therefore their rate is always 0. This breaks cpufreq on this
> platform.
> 
[...]
> 
> Stephen, what do you suggest to fix this issue?

Simplest fix is to revert this hunk. Longer term, we should look
into making of_clk_get_parent_name() use whatever string has been
used when registering the clock, or completely change how we do
parent child linkages so that strings aren't necessary.

> 
> The easiest solution is to add a clock-output-names property to the
> coreclk node. This way, of_clk_get_parent_name() will properly resolve
> the clock name to its correct name (i.e, "cpuclk" in our case) and
> everything works fine (I've tested). The drawback of this solution is
> that it breaks backward compatibility with old DTs: a 4.2 DT for Armada
> XP would no longer work with a >= 4.3 kernel.
> 
> Do you have some other suggestions to make ?
> 

How about this patch?

---8<----
diff --git a/drivers/clk/mvebu/clk-cpu.c b/drivers/clk/mvebu/clk-cpu.c
index 5837eb8a212f..85da8b983256 100644
--- a/drivers/clk/mvebu/clk-cpu.c
+++ b/drivers/clk/mvebu/clk-cpu.c
@@ -197,6 +197,7 @@ static void __init of_cpu_clk_setup(struct device_node *node)
 	for_each_node_by_type(dn, "cpu") {
 		struct clk_init_data init;
 		struct clk *clk;
+		struct clk *parent_clk;
 		char *clk_name = kzalloc(5, GFP_KERNEL);
 		int cpu, err;
 
@@ -208,8 +209,9 @@ static void __init of_cpu_clk_setup(struct device_node *node)
 			goto bail_out;
 
 		sprintf(clk_name, "cpu%d", cpu);
+		parent_clk = of_clk_get(node, 0);
 
-		cpuclk[cpu].parent_name = of_clk_get_parent_name(node, 0);
+		cpuclk[cpu].parent_name = __clk_get_name(parent_clk);
 		cpuclk[cpu].clk_name = clk_name;
 		cpuclk[cpu].cpu = cpu;
 		cpuclk[cpu].reg_base = clock_complex_base;
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
