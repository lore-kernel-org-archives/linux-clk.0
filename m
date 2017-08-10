Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Jerome Brunet <jbrunet@baylibre.com>, "Stephen Boyd" <sboyd@codeaurora.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1502281102.2759.37.camel@baylibre.com>
Cc: linux-clk@vger.kernel.org, "Kevin Hilman" <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org, "Russell King" <linux@armlinux.org.uk>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Boris Brezillon" <boris.brezillon@free-electrons.com>
References: <20170612194438.12298-1-jbrunet@baylibre.com>
 <20170612194438.12298-6-jbrunet@baylibre.com>
 <20170726001217.GC2146@codeaurora.org>
 <1501089516.2401.29.camel@baylibre.com>
 <20170804001836.GU2146@codeaurora.org>
 <150223186723.22158.11617219588466426777@resonance>
 <1502281102.2759.37.camel@baylibre.com>
Message-ID: <150238404899.5192.14704927279228855279@resonance>
Subject: Re: [PATCH v3 05/10] clk: add support for clock protection
Date: Thu, 10 Aug 2017 09:54:08 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Jerome Brunet (2017-08-09 05:18:22)
> On Tue, 2017-08-08 at 15:37 -0700, Michael Turquette wrote:
> > Hi Stephen,
> > =

> > Quoting Stephen Boyd (2017-08-03 17:18:36)
> > > On 07/26, Jerome Brunet wrote:
> > > > > > +void clk_rate_protect(struct clk *clk);
> > > > > =

> > > > > Is there any plan to use this clk_rate_protect() API? It seems
> > > > > inherently racy for a clk consumer to call clk_set_rate() and
> > > > > then this clk_rate_protect() API after that to lock the rate in.
> > > > > How about we leave this out of the consumer API until a user
> > > > > needs it?
> > > > =

> > > > Having this API available is whole reason I've been working on this=
 for so
> > > > long.
> > > > By the now, you may have forgot but I explained the use-case in fir=
st RFC
> > > > [0]
> > > > Here is an example (wip) of usage [1]
> > > > =

> > > > [0]: http://lkml.kernel.org/r/20170302173835.18313-1-jbrunet@baylib=
re.com
> > > > [1]: https://github.com/jeromebrunet/linux/commits/amlogic/wip/audi=
o-clk-l
> > > > ock
> > =

> > Indeed, something like rate protection or "lock rate" has been discussed
> > since the birth of CCF. I remember a whiteboarding session between you,
> > Paul W. and myself about it probably in 2012. Peter might have been
> > there too.
> > =

> > > =

> > > If we're forgetting why something is introduced then it means the
> > > commit text is missing information. Please clearly describe the
> > > need for the API in the commit text for the patch that introduces
> > > it.
> > =

> > My $0.02 is that the "pick an unused PLL" thing is a benefit of this new
> > api that is internal to the clock controller driver, and is not the
> > driving force behind the series. If a simple, easy to understand
> > justification for this patch series is needed, might I suggest something
> > like the following for the next commit log/coverletter:
> > =

> > "Some clock consumers require that a clock rate must not deviate from
> > its selected frequency. There can be several reasons for this, not least
> > of which is that some hardware may not be able to handle or recover from
> > a glitch caused by changing the clock rate while the hardware is in
> > operation. The ability to lock a clock's rate, and release that lock, is
> > a fundamental clock rate control primitive. It's absence is a bug that
> > is fixed by this patch series."
> > =

> > That's the short and sweet version. If more verbosity is needed as to
> > why rate_range doesn't need this, there are some good reasons:
> > =

> > 1) simplicity: some consumers don't care about their rate, but do
> > care that they rate doesn't change. clk_rate_{un}protect is much simpler
> > than forcing those consumers to call clk_get_rate, then cache that value
> > for future use and then call clk_set_rate_range.
> > =

> > 2) expressiveness / debug: trying to find out why a clock rate is locked
> > searching through every use of clk_set_rate_range is sort of lame,
> > especially if variables are used to pass in min/max instead of
> > hard-coded values. It's way way easier to just grep for
> > clk_rate_protect.
> > =

> > > =

> > > > =

> > > > > =

> > > > > Finally, When does a consumer want the rate of a clk to change
> > > > > after they call clk_set_rate() on it? I would guess that very few
> > > > > consumers would be willing to accept that. Which begs the
> > > > > question, if anyone will keep calling clk_set_rate() after this
> > > > > API (and the clk_set_rate_protect() API) is added. It almost
> > > > > seems like we would want it to be opt-out, instead of opt-in, so
> > > > > that consumers would call clk_set_rate() and expect it to be a
> > > > > stable clk rate after that, and they would call
> > > > > clk_set_rate_trample_on_me() or something properly named when
> > > > > they don't care what the rate is after they call the API.
> > > > > =

> > > > =

> > > > Indeed, we generally don't want our rate to change, but:
> > > > - This is mostly for leaf clocks, the internal path would generally=
 not
> > > > care, as
> > > > long as the leaf are happy.
> > > > - Even a leaf may be open (be able to deal with) to small glitches,=
 pll
> > > > relock,
> > > > re parenting
> > > > =

> > > > Actually, if all the clock could not tolerate any glitches, there w=
ould
> > > > have
> > > > been a lot of complains about CCF by now, it does not prevent glitc=
hes at
> > > > all.
> > > =

> > > Well some devices handle glitches in the hardware, so the details
> > > of glitch free rate changes are hidden from clk consumers, and
> > > the software in general, on those devices.
> > =

> > On the hardware that I am familiar with, the problem of glitches lies
> > not in the clock hardware, but with the downstream peripheral logic / ip
> > block that consumes that clock signal. So it seems to me that having a
> > consumer api for locking the rate makes perfect sense.
> > =

> > > =

> > > > =

> > > > If you go over the initial RFC, the point is also for the CCF to fa=
vor
> > > > other
> > > > (unused parent) when several (sometimes with the same capabilities)=
 are
> > > > available. I think this is also a fairly common use case. That's so=
mething
> > > > rate_range won't do either, as far as I understood.
> > > =

> > > Fair enough, but why do we want consumers to need to know that
> > > there are sometimes unused parents that aren't getting chosen for
> > > a particular frequency? I see this as exposing the internals of
> > > the clk tree to consumers when they shouldn't need to care. Of
> > > course, sometimes clk consumers really do care about internals,
> > =

> > Right, sometimes they do, and we need to strike a balance. I think that
> > this api has been needed for some time. It very likely could have been
> > included in the initial version of the CCF that was merged years back if
> > I hadn't been trying very hard to stick only to the existing clk.h.
> > =

> > clk_set_rate has always been a "last write wins" api, across a shared
> > resource, and we've always known that this is not a great situation.
> > This patch series does a good job of solving that issue, in conjunction
> > with the existing range stuff.
> > =

> > > for example if some PLL is used for a display controller and it's
> > > also routed out of the chip on the display phy pins to encode
> > > data or something. Then perhaps we really want to use one
> > > particular PLL instead of a generic one that may also be a parent
> > > of the display controller clk. Making sure clk_set_rate() doesn't
> > > trample on clks deep in the tree seems different than this
> > > though.
> > > =

> > > Going back to your RFC series cover letter though, I see three
> > > PLLs (mppl0,1,2) and two users of the PLLs (amclk and mclk_i958).
> > > Is anything else using these PLLs in the system? Why are we doing
> > > all this stuff instead of hard-coding the parents for these clks
> > > to be different PLLs? If we want it to be flexible we could
> > > assign parents to the cts_amclk_sel and cts_mclk_i958_sel to be
> > > different PLLs in DT via assigned clock parents. Or it could just
> > > be hard-coded in the clk driver during probe.
> > > =

> > > If there's really sharing going on, and you can't hardcode the
> > > parents, please indicate why that's the case in the commit text.
> > > I don't want to introduce another consumer API just because we
> > > didn't want to restrict the available parents for a couple clks.
> > =

> > I think the PLL sharing thing is a big distraction. Giving consumers the
> > ability to guarantee that their rates are locked in using a simple
> > critical section call just makes sense to me. If it helps with other
> > cases then yay.
> =

> It guarantee that what is being protected, won't be broken ... for sure i=
t helps
> with sharing issues.
> =

> > =

> > > =

> > > > =

> > > > Last but not least, it allows consumer to set the rate in a sort of
> > > > critical
> > > > section and have the guarantee that nobody will be able to change t=
he rate
> > > > between the clk_set_rate() call and prepare_enable(). That's someth=
ing we
> > > > don't
> > > > have at the moment.
> > > > =

> > > =

> > > Right, but clk_rate_protect() doesn't close the critical section
> > > between clk_set_rate() and clk_rate_protect() if another
> > > consumers changes the frequency, or if that consumer changes the
> > > frequency of some parent of the clk. This is why I'm asking what
> > =

> > Right, clk_set_rate_protect does this in the next patch in this series.
> =

> Hum, I disagree here.=C2=A0For sure, if you call clk_set_rate() before
> clk_rate_protect() you have not guarantee at all, but you are doing it wr=
ong.
> The way to use this it to call clk_rate_protect() then clk_set_rate().
> =

> As explained earlier, as long as the clock is protected only once, the
> protecting consumer is still able to change the rate, because it is the o=
nly one
> depending on clock.

I honestly do not see the difference between calling
clk_set_rate_protect() versus calling clk_rate_protect() followed by
clk_set_rate() within the rate-protected critical section.

Yes, you can always call clk_set_rate() later on, but I'm really
surprised that calling clk_set_rate_protect() is somehow *wrong*. I'm
quite sure that if this api gets merged that users will think of
clk_set_rate_protect() in the same way that they think of using
clk_prepare_enable() ... it's a useful helper that becomes the default
choice of driver authors.

> =

> This is a good fit for driver which heavily depends on rate being but nee=
d to
> change the rate during during their operations. It is not necessary to un=
protect
> the clock before calling clk_set_rate().

Sure, and drivers can aggressively call clk_{en,dis}able within the
clk_prepare critical section, but very few do that in practice. From
experience, driver authors will not micro-optimize this stuff.

Regarding my comment below to remove clk_rate_protect(), I rescind that
statement. We definitely need the api, but it's also clear to me that
most users will just opt-in to use clk_set_rate_protect() by default.

Regards,
Mike

> =

> clk_set_rate_protect() is only introduce to help driver which could get i=
n the
> situation where 2 consumers protect the clock w/o getting a chance to set=
 the
> rate, exhausting  the ressources. To re-set the rate, clk_rate_unprotect(=
) must
> be called before calling clk_set_rate_protect() again.
> =

> > =

> > > the use of this API is for. Shouldn't we want consumers to use
> > > clk_set_rate_protect() so they can be sure they got the rate they
> > > wanted, instead of hoping that something else hasn't come in
> > > between the set_rate and the protect calls and changed the
> > > frequency?
> > =

> > We can remove clk_rate_protect if you really want, but there is always
> > the case that a consumer driver does not set the rate, but needs to
> > guarantee that the rate will not change during operation.
> > =

> > Any driver that must both set the rate AND guarantee it will not change
> > must use clk_set_rate_protect.
> > =

> > Regards,
> > Mike
> > =

> > > =

> > > --=C2=A0
> > > Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> > > a Linux Foundation Collaborative Project
>=20
