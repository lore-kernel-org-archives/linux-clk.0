Return-Path: <sboyd@codeaurora.org>
Date: Fri, 2 Jun 2017 15:34:32 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Phil Elwell <phil@raspberrypi.org>
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Michael Turquette <mturquette@baylibre.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
	linux-clk@vger.kernel.org
Subject: Re: CLK_OF_DECLARE advice required
Message-ID: <20170602223432.GU20170@codeaurora.org>
References: <ae427c15-330f-6f8d-e2ac-62a8deacbdc5@raspberrypi.org>
 <8b65e551-e6dd-cf5c-1b22-e1f1a5996d73@wwwdotorg.org>
 <0794f430-9761-c855-9a89-13d9871c5831@i2se.com>
 <6765be64-9cf6-4663-4182-5b63f27bfb93@raspberrypi.org>
 <20170601063937.GN20170@codeaurora.org>
 <215eea3c-febe-5aa4-9dbb-e1f170bc0b0d@raspberrypi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <215eea3c-febe-5aa4-9dbb-e1f170bc0b0d@raspberrypi.org>
List-ID: <linux-clk.vger.kernel.org>

On 06/01, Phil Elwell wrote:
> On 01/06/2017 07:39, Stephen Boyd wrote:
> > On 05/31, Phil Elwell wrote:
> >> For my edification, can you pretend for a moment that the application was a valid one and
> >> answer any of my original questions?:
> >>
> >> 1. Should all system clock drivers use OF_CLK_DECLARE? Doing so would probably
> >> avoid this problem, but further initialisation order dependencies may
> >> require more drivers to be initialised early.
> > 
> > No. CLK_OF_DECLARE() is only there to register clks early for
> > things that need them early, i.e. interrupts and timers.
> > Otherwise they should be plain drivers (platform or some other
> > bus). If the same node has both then we have
> > CLK_OF_DECLARE for that.
> 
> The problem with fixed-factor-clock is something like a Priority Inversion. CLK_OF_DECLARE
> doesn't say that a driver can be probed early, it says that _must_ be probed early. There is
> no fallback to platform device probing - setting the OF_POPULATED flag prevents that. In my
> example the parent clock and the consumer are regular platform devices, but having this tiny
> little gasket in between probed from of_clk_init breaks what ought to be a run-of-the-mill
> device instantiation. It would be better if the intermediate driver could adapt to the
> environment in which it finds itself, inheriting the "earlyness" of its consumer, but that
> would require proper dependency information which Device Tree doesn't capture in a way which
> is easy to make use of (phandles being integers that can be embedded in vectors in
> subsystem-specific ways).

You sort of lost me here. The clk framework has support for
"orphans" which means that clks can be registered in any order,
i.e. the fixed factor clk could register first and be orphaned
until the parent platform device driver probes and registers that
clk at which point we'll fix up the tree. So nothing goes wrong
and really the orphan design helps us here and in other
situations.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
