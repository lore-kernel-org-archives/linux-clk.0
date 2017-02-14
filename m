Return-Path: <linux@roeck-us.net>
Date: Tue, 14 Feb 2017 12:31:33 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>,
	Russell King - ARM Linux <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-clk@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] clk: add more managed APIs
Message-ID: <20170214203133.GA3726@roeck-us.net>
References: <20170128190309.GN27312@n2100.armlinux.org.uk>
 <20170128192207.GA38136@dtor-ws>
 <64ed0890-14f6-42ff-66b1-60f7b3d7d02f@roeck-us.net>
 <20170128233911.GO27312@n2100.armlinux.org.uk>
 <20170129180743.GA10917@dtor-ws>
 <20170130185551.GM8801@codeaurora.org>
 <20170131005713.GA35974@dtor-ws>
 <20170207035151.GA18296@dtor-ws>
 <20170214194408.GW25384@codeaurora.org>
 <CAKdAkRSWCWrweNyDAJ4Xkc4igmRSexjKvEG57eg+3QnPc7mbRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAKdAkRSWCWrweNyDAJ4Xkc4igmRSexjKvEG57eg+3QnPc7mbRQ@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On Tue, Feb 14, 2017 at 11:55:20AM -0800, Dmitry Torokhov wrote:
> On Tue, Feb 14, 2017 at 11:44 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> > On 02/06, Dmitry Torokhov wrote:
> >> On Mon, Jan 30, 2017 at 04:57:13PM -0800, Dmitry Torokhov wrote:
> >> > When converting a driver to managed resources it is desirable to be able to
> >> > manage all resources in the same fashion. This change allows managing clock
> >> > prepared and enabled state in the same way we manage many other resources.
> >> >
> >> > This adds the following managed APIs:
> >> >
> >> > - devm_clk_prepare()/devm_clk_unprepare();
> >> > - devm_clk_prepare_enable()/devm_clk_disable_unprepare().
> >> >
> >> > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> >> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> >>
> >> It would be awesome if we could get it into 4.11...
> >
> > I'd prefer we didn't do this. Instead, make clk_put() drop any
> > prepare or enables that were done via that clk pointer. Mike
> > started to do this before[1], but we have some code that assumes
> > it can do:
> >
> >         clk = clk_get(...)
> >         clk_prepare_enable(clk)
> >         clk_put(clk)
> >
> > and have the clk stay on. Those would need to be changed.
> 
> That means we'd need to audit entire code base ;(
> 
> >
> > We would also need Russell's approval to update the clk_put()
> > documentation to describe this change in behavior.
> >
> > [1] http://lkml.kernel.org/r/1438974570-20812-1-git-send-email-mturquette@baylibre.com
> >
> 
> Note that devm* APIs do not preclude from changing clk_put() behavior
> down the road and it is extremely easy to go and
> s/devm_clk_prepare_enable/clk_prepare_enable/ once cleanup is
> automatic.
> 
> Having devm now will help make driver code better (because right now
> we either need to add wrappers so devm_add_action_or_reset() can be
> used, or continue mixing devm* and goto cleanups, which are often
> wrong).
> 

Absolutely agree. The combination of clk_prepare_enable() in probe and
clk_disable_unprepare() in remove is used all over the place. Sure,
we _can_ use devm_add_action_or_reset() for all those cases, and I do
have a coccinelle script doing just that. While I'll have to accept
going forward with that approach if needed, I have to admit that
I completely fail to miss the point why that would be a good idea.

Thanks,
Guenter
