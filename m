Return-Path: <sboyd@codeaurora.org>
Date: Wed, 31 May 2017 23:39:37 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Phil Elwell <phil@raspberrypi.org>
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Michael Turquette <mturquette@baylibre.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
	linux-clk@vger.kernel.org
Subject: Re: CLK_OF_DECLARE advice required
Message-ID: <20170601063937.GN20170@codeaurora.org>
References: <ae427c15-330f-6f8d-e2ac-62a8deacbdc5@raspberrypi.org>
 <8b65e551-e6dd-cf5c-1b22-e1f1a5996d73@wwwdotorg.org>
 <0794f430-9761-c855-9a89-13d9871c5831@i2se.com>
 <6765be64-9cf6-4663-4182-5b63f27bfb93@raspberrypi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <6765be64-9cf6-4663-4182-5b63f27bfb93@raspberrypi.org>
List-ID: <linux-clk.vger.kernel.org>

On 05/31, Phil Elwell wrote:
> On 31/05/2017 16:58, Stefan Wahren wrote:
> > Am 31.05.2017 um 17:27 schrieb Stephen Warren:
> >> On 05/30/2017 06:23 AM, Phil Elwell wrote:
> >>> Hi,
> >>>
> >>> I've run into a problem using the fixed-factor clock on Raspberry Pi
> >>> and I'd
> >>> like some advice before I submit a patch.
> >>>
> >>> Some context: the aim is to use a standard UART and some external
> >>> circuitry
> >>> as a MIDI interface. This would be straightforward except that Linux
> >>> doesn't
> >>> recognise the required 31.25KHz as a valid UART baud rate. Rhe
> >>> workaround is
> >>> to declare the UART clock such that the reported rate differs from
> >>> the actual
> >>> rate. If one sets the reported rate to be (actual*38400)/31250 then
> >>> requesting a 38400 baud rate will result in an actual 31250 baud signal.
> >>
> >> This sounds like the wrong approach. Forcing the port to use a
> >> different clock rate than the user requests would prevent anyone from
> >> using that port for its standard purpose; it'd turn what should be a
> >> runtime decision into a compile-time decision.
> >>
> >> Are you sure there's no way to simply select the correct baud rate on
> >> the port? I see plenty of references to configuring custom baud rates
> >> under Linux when I search Google, e.g.:
> >>
> >>> https://stackoverflow.com/questions/12646324/how-to-set-a-custom-baud-rate-on-linux
> >>>
> >> "How to set a custom baud rate on Linux?"
> >>
> >>> https://sourceware.org/ml/libc-help/2009-06/msg00016.html
> >> "Re: Terminal interface and non-standard baudrates"
> >>
> > 
> > I remember this gist from Peter Hurley:
> > 
> > https://gist.github.com/peterhurley/fbace59b55d87306a5b8
> 
> Thank you, Stephen and Stephan. Stephen - the clock scaling is applied by a DT overlay so
> it effectively a runtime setting, but I take your point about the elegance of the solution.
> Stefan - anybaud looks promising, although I would have preferred for users to continue to
> use the existing user-space tools - kernel changes can be deployed more easily.
> 
> For my edification, can you pretend for a moment that the application was a valid one and
> answer any of my original questions?:
> 
> 1. Should all system clock drivers use OF_CLK_DECLARE? Doing so would probably
> avoid this problem, but further initialisation order dependencies may
> require more drivers to be initialised early.

No. CLK_OF_DECLARE() is only there to register clks early for
things that need them early, i.e. interrupts and timers.
Otherwise they should be plain drivers (platform or some other
bus). If the same node has both then we have
CLK_OF_DECLARE for that.

> 
> 2. Why does the clock initialisation hook registered by OF_CLK_DECLARE not
> return any indication of success? If it did, and if the OF_POPULATED flag
> was only set after successful initialisation then the normal retrying of
> a deferred probe would also avoid this problem.

Historical raisins. Honestly if it fails the whole system should
probably panic because we aren't going to get interrupts or
schedule properly. Of course, we have whole drivers that register
with CLK_OF_DECLARE() though when they should really be a driver
that can do probe defer, etc., so making a change isn't really
feasible right now.

> 
> 3. Would adding the OF_CLK_DECLARE hook prevent the use of the devm_ managed
> functions like devm_kzalloc? If not, why doesn't fixed-factor-clock use it?
> 

If you use CLK_OF_DECLARE() then you don't get a struct device to
pass to devm functions and thus you can't use them. I don't
follow the question.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
