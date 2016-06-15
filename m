Return-Path: <paulmck@linux.vnet.ibm.com>
Date: Wed, 15 Jun 2016 14:11:59 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
To: tony@atomide.com, linux@roeck-us.net, mturquette@baylibre.com,
        sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org
Subject: Clock-driver patches to avoid lockdep complaints
Reply-To: paulmck@linux.vnet.ibm.com
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <20160615211159.GA31575@linux.vnet.ibm.com>
List-ID: <linux-clk.vger.kernel.org>

Hello!

Ingo was not comfortable taking these through -tip, which is understandable,
given that they don't depend on each other or on anything else not already
in mainline, and that they don't have anything to do with -tip.

So what would you guys like to do with these?

They may be pulled from f17a0dd1c2e0 (clk: Use _rcuidle suffix to allow
clk_core_enable() to used from idle) in my -rcu tree:

	git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git

							Thanx, Paul
