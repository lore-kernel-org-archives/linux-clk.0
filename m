Return-Path: <tony@atomide.com>
Date: Tue, 14 Jul 2015 02:54:32 -0700
From: Tony Lindgren <tony@atomide.com>
To: Tero Kristo <t-kristo@ti.com>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Paul Walmsley <paul@pwsan.com>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	linux-clk@vger.kernel.org
Subject: Re: [GIT PULL] clk: ti: clock driver code migration to drivers
Message-ID: <20150714095431.GJ17550@atomide.com>
References: <55A4CE41.9070909@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <55A4CE41.9070909@ti.com>
List-ID: <linux-clk.vger.kernel.org>

* Tero Kristo <t-kristo@ti.com> [150714 01:56]:
> 
> This pull request contains the TI clock driver set to move the clock
> implementations under clock driver. Some small portions of the clock driver
> code still remain under mach-omap2 after this, it should be decided whether
> this code is now obsolete and should be deleted or should someone try to fix
> it.

Hmm care to clarify what is obsolete or broken after this series?

And I take it's not obsolete or broken because of this series? :)

Also, I just gave this branch a quick boot test and it seems to
behave for me.

Regards,

Tony
