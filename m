Return-Path: <linux-pm-owner@vger.kernel.org>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Pavel Machek <pavel@ucw.cz>, mturquette@baylibre.com,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH] clk: readd refcounting for struct clk instances [when used in pm_clk_add_clk(), genpd]
Date: Sun, 20 Sep 2015 14:38:38 +0200
Message-ID: <1513357.mLLrRzFF5g@diego>
In-Reply-To: <9158634.8HmHM8CzF6@diego>
References: <1878691.zhVxsBBBGg@diego> <20150916003931.GK23081@codeaurora.org> <9158634.8HmHM8CzF6@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-pm-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

Am Mittwoch, 16. September 2015, 11:18:05 schrieb Heiko Stübner:
> Am Dienstag, 15. September 2015, 17:39:31 schrieb Stephen Boyd:
> > On 09/15, Heiko Stübner wrote:
> > > With the split into struct clk and struct clk_core, clocks lost the
> > > ability for nested __clk_get clkdev calls. While it stays possible to
> > > call __clk_get, the first call to (__)clk_put will clear the struct clk,
> > > making subsequent clk_put calls run into a NULL pointer dereference.
> > > 
> > > One prime example of this sits in the generic power domain code, where
> > > it
> > > is possible to add the clocks both by name and by passing in a struct
> > > clk
> > > via pm_clk_add_clk(). __pm_clk_add() in turn then calls __clk_get to
> > > increase the refcount, so that the original code can put the clock
> > > again.
> > > 
> > > A possible call-path looks like
> > > clk = of_clk_get();
> > > pm_clk_add_clk(dev, clk);
> > > clk_put(clk);
> > > 
> > > with pm_clk_add_clk() => __pm_clk_add() then calling __clk_get on the
> > > clk
> > > and later clk_put when the pm clock list gets destroyed, thus creating
> > > a NULL pointer deref, as the struct clk doesn't exist anymore.
> > > 
> > > So add a separate refcounting for struct clk instances and only clean up
> > > once the refcount reaches zero.
> > > 
> > > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > > ---
> > > I stumbled upon this while applying the new Rockchip power-domain
> > > driver,
> > > but I guess the underlying issue is universal and probably present since
> > > the original clk/clk_core split, so this probably counts as fix.
> > 
> > Ok. The fix makes sense, but I wonder why we do this. Perhaps we
> > should stop exporting __clk_get() and __clk_put() to everything
> > that uses clkdev in the kernel. They're called per-user clks for
> > a reason. There's one user. Now we have two users of the same
> > struct clk instance, so we have to refcount it too? I hope the
> > shared clk instance isn't being used to set rates in two pieces
> > of code.
> > 
> > And this only affects pm_clk_add_clk() callers right? So the only
> > caller in the kernel (drivers/clk/shmobile/clk-mstp.c) doesn't
> > seem to have this problem right now because it never calls
> > clk_put() on the pointer it passes to pm_clk_add_clk().
> 
> As written above, I stumbled upon this with the new Rockchip power-domain
> driver [0] which calls pm_clk_add_clk in its rockchip_pd_attach_dev()
> function
> 
> 
> [0] http://www.spinics.net/lists/kernel/msg2070432.html
> 
> > So what if we did the patch below? This would rely on callers not
> > calling clk_put() before calling pm_clk_remove() or
> > pm_clk_destroy(), and the life cycle would be clear, but the
> > sharing is still there. Or we could say that after a clk is given
> > to pm_clk_add_clk() that the caller shouldn't touch it anymore,
> > like shmobile is doing right now. Then there's nothing to do
> > besides remove the extra __clk_get() call in the pm layer.
> 
> I guess that is the call of the genpd people (Rafael and Pavel according to
> get_maintainers.pl). I'm very much fine with adapting the Rockchip power-
> domain driver as needed to new handling paradigms.
> 
> Personally I'd prefer your solution of making the initial handler do all the
> getting and putting, as doing clk_get in the power-domain driver and
> relying on clk_put being done in the genpd core feels awkward. Although
> that solution would mean, the calling driver would also need to keep track
> of clocks, while the current rockchip power-domain driver can just call
> clk_put after handing the clock of to genpd.

after looking more into the suggested change, I'd like to retract that 
statement :-) .

For reference the code in question is at [0] and currently 
rockchip_pd_attach_dev() can just do (when expecting refcounting works)

	while ((clk = of_clk_get(dev->of_node, i++)) && !IS_ERR(clk)) {
		error = pm_clk_add_clk(dev, clk);
		clk_put(clk);
	}

effectively handing the clock off to the power-domain code.

These clocks are necessary to be on for the synchronous reset of the device 
when powerdomain state changes and thus get read from the device nodes as 
discussed during the 18 revision the powerdomain code took.

Now if the caller really needs to keep track of that, this would require 
duplicating large parts of the pm-clock handling, like the keeping track of 
what devices actually got attached to what power-domain, and of course all the 
clock references of each device, as they would need to be "put" in 
rockchip_pd_detach_dev() then.


Heiko


[0] https://git.kernel.org/cgit/linux/kernel/git/mmind/linux-rockchip.git/commit/?h=v4.4-armsoc/drivers&id=e329c10ed7f244da48fa17ab85fb266bf5bbebcc
