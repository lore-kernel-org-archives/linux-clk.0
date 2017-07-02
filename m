Return-Path: <ukl@pengutronix.de>
Date: Sun, 2 Jul 2017 11:23:36 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Dirk Behme <dirk.behme@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	Linux PM list <linux-pm@vger.kernel.org>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-clk <linux-clk@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	kernel@pengutronix.de
Subject: Re: Clocks used by another OS/CPU (was: Re: [RFC PATCH] clk:
 renesas: cpg-mssr: Add interface for critical core clocks)
Message-ID: <20170702092336.uxwl23kyd4koxclj@pengutronix.de>
References: <CAMuHMdW9+CNTTOVO4SRRUxuz3ajLbY2j1uG8b_RpHX52NPwXrQ@mail.gmail.com>
 <CAL_JsqKGrZeR7z80beY_XEjqd5fEQQwPxusJ1FADoALgNE3fEg@mail.gmail.com>
 <20170630202453.eh6vaehkap3as4np@pengutronix.de>
 <8d86a9aa-1928-6b52-1487-d5fb9dae17f4@gmail.com>
 <20170701181408.yuocymwtj5dgt74d@pengutronix.de>
 <6098d579-f206-5a23-bbfc-ac13e0448479@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <6098d579-f206-5a23-bbfc-ac13e0448479@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

Hello Dirk,

On Sun, Jul 02, 2017 at 07:48:41AM +0200, Dirk Behme wrote:
> > On my machine (Udoo Neo, A9 + M4) the A9 is the primary CPU that is
> > started by the bootrom. If I want the M4 being the primary device I'd
> > need support in the bootloader to wait long enough (i.e. until the M4 is
> > up) before letting the A9 jump into Linux. Managable I'd say. This way
> > would even make sense if the M4 runs a rt critical OS that shouldn't be
> > forced to wait on the non-rt A9 to enable a clk.
> 
> 
> Overall, assuming that the issue we are discussing here can be solved quite
> easily in hardware (a set of clock registers for each CPU/OS domain,
> connected cleverly to effectively control each clock, with access protection
> for each set of registers) I tend to think that for a SoC supposed to run
> different OS on different cores this is a missing hardware feature (bug?).

So you want to enable bits for your CAN clock, one in each cpu's domain.

I'd say that is a nice idea that a hardware engineer might be proud to
pick up but that results in more headache than fun for the software
colleague.

There are several problems that come immediately to mind:

 - You can switch of a clk because you don't need it on, or because you
   need it off. I guess you want to have the clock on if at least one
   cpu wants it on. So you take away the freedom from the other cpu to
   force the clock off. (Yeah, the currently available clk framework
   doesn't allow that either.)
 - What if cpu 0 sets the parent of the can clk to pll2 but cpu 1 wants
   it set to pll1? How does cpu 1 notice the change?
 - On off might be relatively easy, what about clk dividers? cpu 0 sets
   2 which cpu 1 sets 6.

That convinces me that the disadvantages of having two views on the clk
core have more weight and you really want a single view and share that
by software.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
