Return-Path: <dianders@google.com>
MIME-Version: 1.0
Sender: dianders@google.com
In-Reply-To: <alpine.DEB.2.20.1610110908240.7794@nanos>
References: <1476133442-17757-1-git-send-email-dianders@chromium.org> <alpine.DEB.2.20.1610110908240.7794@nanos>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 11 Oct 2016 09:33:15 -0700
Message-ID: <CAD=FV=VTc-RFNiUqkKDr=NFWhphV7r2J+EudSbqt4X3TX62mQw@mail.gmail.com>
Subject: Re: [PATCH v2] timers: Fix usleep_range() in the context of wake_up_process()
To: Thomas Gleixner <tglx@linutronix.de>
Cc: John Stultz <john.stultz@linaro.org>, Andreas Mohr <andi@lisas.de>,
	Brian Norris <briannorris@chromium.org>, Tao Huang <huangtao@rock-chips.com>,
	Tony Xie <tony.xie@rock-chips.com>,
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "broonie@kernel.org" <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Thomas,

+clock and regulator folks since part of my arguments below involve
the regulator / clock core.  If you're not interested in this topic,
feel free to ignore.  Original patch can be found on LKML or at
<https://patchwork.kernel.org/patch/9369963/>

On Tue, Oct 11, 2016 at 12:14 AM, Thomas Gleixner <tglx@linutronix.de> wrote:
> On Mon, 10 Oct 2016, Douglas Anderson wrote:
>> Users of usleep_range() expect that it will _never_ return in less time
>> than the minimum passed parameter.  However, nothing in any of the code
>> ensures this.  Specifically:
>
> There is no such guarantee for that interface and never has been, so how
> did you make sure that none of the existing users is relying on this?
>
> You can't just can't just declare that all all of the users expect that and
> be done with it.

You're right that I can't guarantee that no callers are relying on the
existing behavior of a wake_up_process() causing usleep_range() to
return early.  I would say, however, that all callers I've seen are
absolutely relying on the min delay being enforced and I've never
personally seen a caller relying on being woken up from
usleep_range().  All the users relying on the min delay being enforced
have never had a problem because it's not common for a task that's in
usleep_range() to be woken up, but if you happen to call some generic
code in a context where a wake up is possible you'll get a very
unexpected bug (like I just did).

I can try to look through some callers to usleep_range(), but there
are 1620 of them as per my "git grep", so I can't look at them all.
:(

...in any case, below are my arguments about why we should change
this.  If we can't agree to change this, then IMHO the way forward is
to deprecate usleep_range() and start the transition of all callers to
one of two functions: usleep_atlest() and usleep_wakeable().  As
argued below I think that usleep_range() name implies that it will at
least sleep the minimum so I would really like to avoid keeping the
name usleep_range() and also keeping the existing behavior.

--

1. I believe msleep() and usleep_range() should be parallel functions.
msleep() has this guarantee of not ending early.  I believe users will
expect that usleep() will also.

2. The "timers-howto.txt" does not have any information about the fact
that usleep_range() might end early.  This document implies that
(assuming you're not in atomic) udelay() / usleep_range() should be
chosen between simply based on how long the expected delay is.  There
is no note that you shouldn't use usleep_range() if you can't handle
ending early.

3. It seems to me that if someone wants to wait to be woken up but
they want a timeout, they wouldn't reach for usleep_range().  They
would instead think to use schedule_hrtimeout_range() directly.  Said
another way: we already have a function for scheduling a delay that
can be interrupted with a wakeup, so why do we need usleep_range() to
also behave this way?

4. We need to change a lot of places if we want to handle the fact
that usleep_range() might wake up early.  Every instance of
usleep_range() that I've ever seen is not expecting to end early and
is expecting at least the minimum delay for correctness.  These
functions have all worked correctly because they didn't happen to be
called in a context where someone might wake up the calling task.
...but if suddenly one of these functions is called on a task that
might be woken up then all their correctness will go out the door.

In other words, I see a lot of usleep_range() calls that look like this:

  /* After 5 ms we know reset is done */
  assert_reset()
  usleep_range(5000, 7000)

If that returns early then we'll get badness.

--

Here's a (perhaps more realistic) example of the problem.  Imagine
that we are trying to do some type of DVF (Dynamic Voltage Frequency)
switch.  That involves changing both a regulator and a clock.  It's
possible that we might want to try to do these two things in parallel
on two tasks, so we could imagine doing:

Task #1 (voltage)
A) Call into regulator core to change voltage.
A1) Regulator core will call into arbitrary regulator driver.
A2) Regulator core won't return until regulator is at the right level.
A3) Delay waiting for regulator might be done with usleep_range().
B) Signal Task #2 that we're done.
C) Wait on Task #2 to finish.

Task #2 (clock)
A) Call into clock core to change clock.
A1) Clock core will call into arbitrary clock driver.
A2) Clock core won't return until clock is stable.
A3) Delay waiting for clock might be done with usleep_range().
B) Signal Task #1 that we're done.
C) Wait on Task #1 to finish.

Depending on the delays and the mechanism used to signal and wait, it
is possible that the "Signal" step above will end up waking up the
other task.  If it does this while the other task is in the
usleep_range() code then we'll have serious problems: we'll either run
with an clock or a regulator that isn't all the way ready.

Now perhaps you will say that we should re-design the signaling
mechanism above so that it doesn't cause a wake up of the other task.
We certainly could try to do that if need be (we'd have to validate
that there is really NEVER an unexpected wakeup), but I'd expect a lot
of push back since I don't think folks would think that waking up a
task would cause such incorrect behavior.

Now perhaps you will say that we should re-design all clock and
regulator drivers to not call usleep_range() (or to add a loop).  This
implies that we should add a new function so they don't all need to
get this loop right.


NOTE: In the particular failure case I'm running into, I'm on a system
using the (out of tree) "interactive" governor.  I haven't followed
through the exact code path, but I see that it is using
wake_up_process() in at least several places to wake up the
"speedchange_task".  This is the same task that might be calling into
cpufreq to change the frequency and might be calling into the
regulator core to do the delay.  We were specifically seeing cases
where the usleep_range() in PWM regulator was returning early.

--

OK, I know that the above is pretty long.  Hopefully it made sense.
Feel free to grab me on IRC if it helps.  I can be found on freenode
as dianders and can join any channel where it's helpful to hash this
out.

-Doug
