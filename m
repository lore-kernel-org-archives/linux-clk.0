Return-Path: <alexander.stein@systec-electronic.com>
From: Alexander Stein <alexander.stein@systec-electronic.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/3] clk: ls1021a: new platform clock driver
Date: Wed, 12 Apr 2017 17:01:59 +0200
Message-ID: <4595163.lvBEMnN8DZ@ws-stein>
In-Reply-To: <20170407193324.GB7065@codeaurora.org>
References: <20170222150349.16790-1-alexander.stein@systec-electronic.com> <20170222150349.16790-2-alexander.stein@systec-electronic.com> <20170407193324.GB7065@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

On Friday 07 April 2017 12:33:24, Stephen Boyd wrote:
> On 02/22, Alexander Stein wrote:
> > +static const struct clk_div_table qspi_cfg_div_table[] = {
> > +	{ 0x0, 256 }, { 0x1, 64 }, { 0x2, 32 }, { 0x3, 24 },
> > +	{ 0x4,  20 }, { 0x5, 15 }, { 0x6, 12 }, { 0x7,  8 },
> > +	{ 0 },
> > +};
> > +
> > +static void __init scfg_qspi_cfg_ls1021a_init(struct device_node *np)
> > +{
> > +	const char *parent_name;
> > +	const char *name;
> > +	void __iomem *base;
> > +	struct clk *parent_clk;
> > +	struct clk *clk;
> > +	struct resource res;
> 
> Unused? but should be used!

Just copy & paste mistake. It can be removed.

> > +
> > +	base = of_iomap(np, 0);
> > +	if (!base) {
> > +		pr_warn("Failed to map address range for node %s\n", np->name);
> 
> We don't typically need any sort of error message.

Ok.

> > +		return;
> > +	}
> > +
> > +	parent_clk = of_clk_get(np, 0);
> > +	if (IS_ERR(parent_clk)) {
> > +		pr_warn("Failed to get clock for node %s\n", np->name);
> > +		return;
> > +	}
> > +
> > +	/* Register the input clock under the desired name. */
> > +	parent_name = __clk_get_name(parent_clk);
> > +
> > +	if (of_property_read_string(np, "clock-output-names", &name))
> > +		name = np->name;
> 
> Please just hardcode it unless you really need different names
> from DT. We're trying to move away from clock-output-names for
> clk tree description as it's inflexible in the face of DT ABI.

But how do you then reference this clock from another DT node if clock-output-
names is remove dfrom patch 2/3? See path 3/3. I have to admit I'm not an 
expert on DT clocks.

> > +
> > +	/* Works only as those 4 bits (Bits 28-31 big endian) do not cross 
byte
> > boundary */
> This line is too long, but also what's going on? Some sort of
> 64-bit register here?

No, this is periphery attached as big-endian on a little-endian CPU, the 
infamous LS1021A has lots (but not all) of them. Finally this needs a proper 
clk improvement to support big-endian accesses on little-endian CPUs. Don't 
look at it (in detail), yet.

> > +	clk = clk_register_divider_table(NULL, name, parent_name,
> > +				   0, base,
> > +				   4, 4, 0, qspi_cfg_div_table, NULL);
> > +	if (IS_ERR(clk)) {
> > +		pr_warn("Failed to register divider table clock (%ld)\n",
> > PTR_ERR(clk));
> > +		return;
> > +	}
> > +	of_clk_add_provider(np, of_clk_src_simple_get, clk);
> 
> Can you please use the clk_hw based provider and divider
> registration APIs?

Is there a specific reason to use clk_hw based API? Both apparently do the 
same.

> > +}
> > +CLK_OF_DECLARE(scfg_qspi_cfg_ls1021a, "fsl,scfg-qspi-cfg-ls1021a",
> > scfg_qspi_cfg_ls1021a_init);
> Can this be a platform driver? We usually reserve CLK_OF_DECLARE
> for clks that we need to get the timer or interrupt controllers
> working because they need to probe so early. Otherwise use a
> proper driver and we can use platform device APIs instead of OF
> specific ones to map register regions and get clks.

As this is a simple clock divider neither timers nor interrupts are involved. 
There should be no problem to change this to a platform driver changing the 
init function into a probe one.

Best regards,
Alexander
