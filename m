Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: paulmck@linux.vnet.ibm.com, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
 tony@atomide.com, linux@roeck-us.net, sboyd@codeaurora.org
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <20160615211159.GA31575@linux.vnet.ibm.com>
Cc: linux-clk@vger.kernel.org
References: <20160615211159.GA31575@linux.vnet.ibm.com>
Message-ID: <20160617170140.27203.76544@quark.deferred.io>
Subject: Re: Clock-driver patches to avoid lockdep complaints
Date: Fri, 17 Jun 2016 10:01:40 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Paul E. McKenney (2016-06-15 14:11:59)
> Hello!
> =

> Ingo was not comfortable taking these through -tip, which is understandab=
le,
> given that they don't depend on each other or on anything else not already
> in mainline, and that they don't have anything to do with -tip.
> =

> So what would you guys like to do with these?
> =

> They may be pulled from f17a0dd1c2e0 (clk: Use _rcuidle suffix to allow
> clk_core_enable() to used from idle) in my -rcu tree:
> =

>         git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.g=
it

Applied both patches to clk-next.

Regards,
Mike

> =

>                                                         Thanx, Paul
>=20
