Return-Path: <paulmck@linux.vnet.ibm.com>
Date: Fri, 17 Jun 2016 10:49:32 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
To: Michael Turquette <mturquette@baylibre.com>
Cc: tony@atomide.com, linux@roeck-us.net, sboyd@codeaurora.org,
        linux-clk@vger.kernel.org
Subject: Re: Clock-driver patches to avoid lockdep complaints
Reply-To: paulmck@linux.vnet.ibm.com
References: <20160615211159.GA31575@linux.vnet.ibm.com>
 <20160617170140.27203.76544@quark.deferred.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160617170140.27203.76544@quark.deferred.io>
Message-Id: <20160617174932.GZ3923@linux.vnet.ibm.com>
List-ID: <linux-clk.vger.kernel.org>

On Fri, Jun 17, 2016 at 10:01:40AM -0700, Michael Turquette wrote:
> Quoting Paul E. McKenney (2016-06-15 14:11:59)
> > Hello!
> > 
> > Ingo was not comfortable taking these through -tip, which is understandable,
> > given that they don't depend on each other or on anything else not already
> > in mainline, and that they don't have anything to do with -tip.
> > 
> > So what would you guys like to do with these?
> > 
> > They may be pulled from f17a0dd1c2e0 (clk: Use _rcuidle suffix to allow
> > clk_core_enable() to used from idle) in my -rcu tree:
> > 
> >         git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git
> 
> Applied both patches to clk-next.

Thank you, Mike!

							Thanx, Paul

> Regards,
> Mike
> 
> > 
> >                                                         Thanx, Paul
> > 
> 
