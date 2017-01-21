Return-Path: <andriy.shevchenko@linux.intel.com>
Message-ID: <1485006980.2133.279.camel@linux.intel.com>
Subject: Re: [PATCH v7 2/5] clk: x86: Add Atom PMC platform clocks
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Stephen Boyd <sboyd@codeaurora.org>, Pierre-Louis Bossart
	 <pierre-louis.bossart@linux.intel.com>
Cc: linux-clk@vger.kernel.org, x86@kernel.org,
 platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, alsa-devel@alsa-project.org, Irina
 Tirdea <irina.tirdea@intel.com>,  Michael Turquette
 <mturquette@baylibre.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 Takashi Iwai <tiwai@suse.com>,  linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Mark Brown
 <broonie@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>, Len Brown
 <lenb@kernel.org>, Vinod Koul <vinod.koul@intel.com>
Date: Sat, 21 Jan 2017 15:56:20 +0200
In-Reply-To: <20170120235856.GF20800@codeaurora.org>
References: 
	<1484690270-28425-1-git-send-email-pierre-louis.bossart@linux.intel.com>
	 <1484690270-28425-3-git-send-email-pierre-louis.bossart@linux.intel.com>
	 <20170120235856.GF20800@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Fri, 2017-01-20 at 15:58 -0800, Stephen Boyd wrote:
> On 01/17, Pierre-Louis Bossart wrote:
> > 

> > +static void plt_clk_reg_update(struct clk_plt *clk, u32 mask, u32
> > val)
> > +{
> > +	u32 tmp;
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&clk->lock, flags);
> > +
> > +	tmp = clk_readl(clk->reg);
> 
> Do you need to use clk_readl? I'd prefer we deleted that
> function/macro because it's just confusing.

Good to know.

>  Please don't use it
> unless you need it for some reason.

It was my suggestion, I didn't know that the mentioned API is kinda
deprecated.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
