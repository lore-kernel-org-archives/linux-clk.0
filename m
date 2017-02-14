Return-Path: <linux+mturquette=baylibre.com@armlinux.org.uk>
Date: Tue, 14 Feb 2017 20:01:13 +0000
From: Russell King - ARM Linux <linux@armlinux.org.uk>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Michael Turquette <mturquette@baylibre.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] clk: add more managed APIs
Message-ID: <20170214200113.GA27312@n2100.armlinux.org.uk>
References: <20170128184047.GA24957@dtor-ws>
 <20170128190309.GN27312@n2100.armlinux.org.uk>
 <20170128192207.GA38136@dtor-ws>
 <64ed0890-14f6-42ff-66b1-60f7b3d7d02f@roeck-us.net>
 <20170128233911.GO27312@n2100.armlinux.org.uk>
 <20170129180743.GA10917@dtor-ws>
 <20170130185551.GM8801@codeaurora.org>
 <20170131005713.GA35974@dtor-ws>
 <20170207035151.GA18296@dtor-ws>
 <20170214194408.GW25384@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170214194408.GW25384@codeaurora.org>
Sender: Russell King - ARM Linux <linux@armlinux.org.uk>
List-ID: <linux-clk.vger.kernel.org>

On Tue, Feb 14, 2017 at 11:44:08AM -0800, Stephen Boyd wrote:
> I'd prefer we didn't do this. Instead, make clk_put() drop any
> prepare or enables that were done via that clk pointer. Mike
> started to do this before[1], but we have some code that assumes
> it can do:
> 
> 	clk = clk_get(...)
> 	clk_prepare_enable(clk)
> 	clk_put(clk)
> 
> and have the clk stay on. Those would need to be changed.

Yes, I've seen from time to time code that plays this game over the
years.  However, from my simple grepping, it seems that we only have
a small number of cases:

arch/mips/alchemy/devboards/db1200.c:           clk_prepare_enable(c);
arch/mips/alchemy/devboards/db1200.c-           clk_put(c);

arch/mips/alchemy/devboards/db1300.c:           clk_prepare_enable(c);
arch/mips/alchemy/devboards/db1300.c-           clk_put(c);

arch/mips/alchemy/devboards/db1550.c:           clk_prepare_enable(c);
arch/mips/alchemy/devboards/db1550.c-           clk_put(c);

drivers/base/power/clock_ops.c:         clk_prepare_enable(clk);
drivers/base/power/clock_ops.c-         clk_put(clk);

drivers/mtd/nand/orion_nand.c:          clk_prepare_enable(clk);
drivers/mtd/nand/orion_nand.c-          clk_put(clk);

I've always hated that - and it goes against the API:

 * Note: drivers must ensure that all clk_enable calls made on this
 * clock source are balanced by clk_disable calls prior to calling
 * this function.

(That comment should have been updated when clk_prepare() & clk_unprepare()
was added to include balancing those.)

So really, all the cases above are buggy.  However, the statement in the
API doesn't give permission for what you're suggesting!

The suggestion requires that we also cast in stone that every "struct clk"
which is handed out from clk_get() becomes unique _everywhere_, because
that's the only way to really track the prepare/enable state on a per-
clk_get() basis, so we can properly clean up at clk_put().

However, I think we still have some non-CCF clock API implementations
around, which hand out shared "struct clk"s.  Changing this requirement
will impact those, since they would need to be updated before the change
could be made.

So, although it would be a nice change to make (which would rule out the
abuse) I don't think it's one that could be practically made at this
stage without (a) fixing all instances like those quoted above and (b)
converting all non-CCF implementations to either CCF or making them
hand out unique struct clk's.

(I do have patches which converts sa11x0 to CCF... which would be one
less non-CCF implementation.)

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
