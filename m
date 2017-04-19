Return-Path: <sboyd@codeaurora.org>
Date: Wed, 19 Apr 2017 09:39:33 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/3] clk: ls1021a: new platform clock driver
Message-ID: <20170419163933.GF7065@codeaurora.org>
References: <20170222150349.16790-1-alexander.stein@systec-electronic.com>
 <20170222150349.16790-2-alexander.stein@systec-electronic.com>
 <20170407193324.GB7065@codeaurora.org>
 <4595163.lvBEMnN8DZ@ws-stein>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <4595163.lvBEMnN8DZ@ws-stein>
List-ID: <linux-clk.vger.kernel.org>

On 04/12, Alexander Stein wrote:
> On Friday 07 April 2017 12:33:24, Stephen Boyd wrote:
> > On 02/22, Alexander Stein wrote:
> > > +		return;
> > > +	}
> > > +
> > > +	parent_clk = of_clk_get(np, 0);
> > > +	if (IS_ERR(parent_clk)) {
> > > +		pr_warn("Failed to get clock for node %s\n", np->name);
> > > +		return;
> > > +	}
> > > +
> > > +	/* Register the input clock under the desired name. */
> > > +	parent_name = __clk_get_name(parent_clk);
> > > +
> > > +	if (of_property_read_string(np, "clock-output-names", &name))
> > > +		name = np->name;
> > 
> > Please just hardcode it unless you really need different names
> > from DT. We're trying to move away from clock-output-names for
> > clk tree description as it's inflexible in the face of DT ABI.
> 
> But how do you then reference this clock from another DT node if clock-output-
> names is remove dfrom patch 2/3? See path 3/3. I have to admit I'm not an 
> expert on DT clocks.

clocks = <&phandle cells...>? I'm not sure I follow the problem
here?

clock-output-names is optional.

> 
> > > +
> > > +	/* Works only as those 4 bits (Bits 28-31 big endian) do not cross 
> byte
> > > boundary */
> > This line is too long, but also what's going on? Some sort of
> > 64-bit register here?
> 
> No, this is periphery attached as big-endian on a little-endian CPU, the 
> infamous LS1021A has lots (but not all) of them. Finally this needs a proper 
> clk improvement to support big-endian accesses on little-endian CPUs. Don't 
> look at it (in detail), yet.
> 
> > > +	clk = clk_register_divider_table(NULL, name, parent_name,
> > > +				   0, base,
> > > +				   4, 4, 0, qspi_cfg_div_table, NULL);
> > > +	if (IS_ERR(clk)) {
> > > +		pr_warn("Failed to register divider table clock (%ld)\n",
> > > PTR_ERR(clk));
> > > +		return;
> > > +	}
> > > +	of_clk_add_provider(np, of_clk_src_simple_get, clk);
> > 
> > Can you please use the clk_hw based provider and divider
> > registration APIs?
> 
> Is there a specific reason to use clk_hw based API? Both apparently do the 
> same.

We're trying to split the consumer and provider APIs along struct
clk_hw and struct clk respectively. If we can have drivers only
registers clk_hw pointers and never get back anything but an
error code, then we can force consumers to always go through the
clk_get() family of APIs. Then we can easily tell who is a
provider, who is a consumer, and who is a provider + a consumer.
Right now this isn't always clear cut because clk_hw has access
to struct clk, and also clk_regsiter() returns a clk pointer, but
it doesn't really get used by anything in a provider driver,
unless provider drivers are doing something with the consumer
API.

> 
> > > +}
> > > +CLK_OF_DECLARE(scfg_qspi_cfg_ls1021a, "fsl,scfg-qspi-cfg-ls1021a",
> > > scfg_qspi_cfg_ls1021a_init);
> > Can this be a platform driver? We usually reserve CLK_OF_DECLARE
> > for clks that we need to get the timer or interrupt controllers
> > working because they need to probe so early. Otherwise use a
> > proper driver and we can use platform device APIs instead of OF
> > specific ones to map register regions and get clks.
> 
> As this is a simple clock divider neither timers nor interrupts are involved. 
> There should be no problem to change this to a platform driver changing the 
> init function into a probe one.
> 

Sounds great! Please do.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
