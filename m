Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Jerome Brunet <jbrunet@baylibre.com>, "Stephen Boyd" <sboyd@codeaurora.org>,
 "Kevin Hilman" <khilman@baylibre.com>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1494597899.2135.3.camel@baylibre.com>
Cc: linux-clk@vger.kernel.org,  linux-amlogic@lists.infradead.org
References: <20170321183330.26722-1-jbrunet@baylibre.com>
 <149228583018.88277.3542713369128557565@resonance>
 <1494597899.2135.3.camel@baylibre.com>
Message-ID: <149487899783.2534.12818280336304151266@resonance>
Subject: Re: [RFC 0/7] clk: implement clock locking mechanism
Date: Mon, 15 May 2017 13:09:57 -0700
List-ID: <linux-clk.vger.kernel.org>

Hi Jerome,

Quoting Jerome Brunet (2017-05-12 07:04:59)
> On Sat, 2017-04-15 at 21:50 +0200, Michael Turquette wrote:
> > Hi Jerome,
> > =

> > Thanks for sending this series. The concept is one we've been talking
> > about for years, and your approach makes sense. Some comments below.
> > =

> > Quoting Jerome Brunet (2017-03-21 19:33:23)
> > > This RFC patchset is related to the discussion around CLK_SET_RATE_GA=
TE and
> > > clk_lock which available here [0]
> > =

> > If we merge this solution then we may want to convert some of those
> > CLK_SET_RATE_GATE users and =

> =

> It would be nice, but this would be on a case by case basis and would req=
uire
> the help of the platform maintainers. I think there two kind of users of
> CLK_SET_RATE_GATE at this moment:
> =

> 1) The clock must be gated - disabled - to change the rate safely:
> clk_protect_rate won't help here, it does not enforce such thing. We shou=
ld
> provide another fix for this because CLK_SET_RATE_GATE does really enforc=
e this
> constraint along the clock tree either
> =

> 2) The one (like me) trying to abuse the enable_count to get some protect=
ion:
> This never worked, and these drivers had no protection until now. If they=
 really
> need protection they can start using clk_protect_rate.
> =

> What I mean with this two point is: even if the intent is the same, there=
 is
> real functional difference between CLK_SET_RATE_GATE and clk_protect_rate=
. We
> will have to be careful ...

Agreed. I was only referring to the #2 category above, which I suspect
is a significant portion of them.

> =

> > potentially some of the rate-range users
> > that set min/max to the same value over to this new api.
> > =

> =

> This case is easier, if they use min=3Dmax, yes for sure.
> =

> > > =

> > > The goal of this patchset is to provide a way for consumers to inform=
 the
> > > system that they depend on the rate of the clock source and can't tol=
erate
> > > other consumers changing the rate or causing glitches.
> > > =

> > > Patches 1 to 3 are just rework to ease the integration of the locking
> > > mechanism. They should not introduce any functional differences.
> > > =

> > > Patch 4 is the important bit. It introduce 2 new functions to the CCF=
 API:
> > > clk_protect and clk_unprotect (The "lock" word is already used lot in
> > > clk.c. Using clk_lock and clk_unlock would have been very messy. If y=
ou
> > > found "protect" to be a poor choice, I'm happy to sed the whole thing=
 in
> > > future version)
> > > =

> > > These calls can happen at anytime during the life of the clk. As for
> > > prepare and enable, the calls must be balanced.
> > > =

> > > Inside the clock framework, 2 new count values are introduced to keep=
 track
> > > of the protection:
> > > * core "protect_count": this reference count value works in the same =
way as
> > > =C2=A0 prepare and enable count, and track whether the clock is prote=
cted or
> > > =C2=A0 not. This is the value that will checked to allow operation wh=
ich may
> > > =C2=A0 cause glitches or change the rate of clock source.
> > > * clk consumer "protect_ucount": this allows to track if the consumer=
 is
> > > =C2=A0 protecting the clock.
> > > =

> > > Requiring the consumer to unprotect its clock before changing it woul=
d have
> > > been very annoying for the consumer. It would also be unsafe, as it w=
ould
> > > still be possible for another consumer to change the rate between the=
 call
> > > to set_rate and protect. This needs to happen in a critical section.=
=C2=A0=C2=A0A
> > > solution would be to add "set_rate_protect", but we would need to do =
the
> > > same for the set_parent and set_phase (and the possible future
> > > functions). It does not scale well.=C2=A0=C2=A0The solution proposed =
in this patch is
> > > to use the consumer protect count.
> > > =

> > > In function altering the clock, if the consumer is protecting the clo=
ck,
> > > the protection is temporarily release under the prepare_lock. This en=
sure
> > > that:
> > > * the clock is still protect from another consumer because of the
> > > =C2=A0 prepare_lock
> > > * the rate set on a protected clock cannot change between set_rate and
> > > =C2=A0 later enable
> > > * only a consumer protecting a clock can do this temporary protection
> > > =C2=A0 removal (less chance of people messing with the refcount)
> > > * if more than one consumer protect the clock, it remains protected.
> > > =C2=A0 Because the protection is removed for the calling consumer, it=
 gives
> > > =C2=A0 it a chance to jump to another provider, if available.
> > > =

> > > This protection mechanism assume that "protecting" consumer knows wha=
t it
> > > is doing when it comes to setting the rate, and does not expect to be
> > > protected against itself.
> > > =

> > > This was tested with the audio use case mentioned in [0]
> > > =

> > > One caveat is the following case:
> > > N+1 consumers protect their clocks. These clocks come from N possible
> > > providers. We should able to satisfy at least N consumers before exha=
usting
> > > the resources.=C2=A0=C2=A0In the particular case where all the consum=
ers call
> > > "protect" before having a chance to call "set_rate", the last 2 consu=
mers
> > > will remains stuck on the last provider w/o being able to set the rat=
e on
> > > it. This means that in situation where there is 2 consumers on 1
> > > providers, they will compete for the clock, and may end up in situati=
on
> > > where both protect the clock and none can set the rate they need.=C2=
=A0=C2=A0This can
> > > be solved if, when the rate fails to be set, the consumer release the
> > > protection. Then the second consumer will be able to satisfy its requ=
est.
> > =

> > This situation can be handled a bit more gracefully if clk_set_rate_lock
> > both returns an error code if setting the rate failes AND it releases
> > the rate lock in that case. At least that helps for the case of
> > initializing rates during .probe(). Automatically dropping the lock
> > might complicate things in other cases though...
> =

> set_rate_lock would solve the problem for=C2=A0
> > > "the last 2 consumers
> > > will remains stuck on the last provider w/o being able to set the rat=
e"
> =

> With set_rate_lock, only the last one won't be satisfied, which is fine I
> suppose.
> =

> > =C2=A0if setting the rate failes
> =

> Setting aside this RFC, when can we consider a that setting the rate fail=
ed ?
> CCF always give the best it can, according to a set of constraints (possi=
ble
> parents, range of the parents, ...) but does not return an error.

It should return errors if the .set_rate operation fails. That is a
long-standing bug.

I agree that rate selection via .determine_rate is not really a
pass/fail sort of thing.

> =

> Clock protect is just one more constraint added to the equation, right ?
> =

> set_rate having failed depends on the accuracy you need.
> For exemple You ask for 100Mhz out of :
> * a PLL: you get 98 MHz
> * a very slow clock: you get 10Hz
> =

> Which one has failed ?

Again, picking the rate is not the problem. I'm more concerned with PLLs
that will not lock and a timeout is hit in the .set_rate callback from
the PLL clock provider.

Regards,
Mike

> =

> Thanks for taking time to review this RFC Mike !
> Cheers
> Jerome
> =

> > =

> > Best regards,
> > Mike
> > =

> > > =

> > > Patch 5 is a small change on set_rate_range to restore the old range =
on
> > > failure. It don't use set_rate_range in any driver so I could not tes=
t this
> > > change.
> > > =

> > > Patch 6 is just a cosmetic change to clk_summary debugfs entry to mak=
e it
> > > less wide after adding protect count in it.
> > > =

> > > Patch 7 fix a warning reported by checkpatch.pl. Apparently, ENOSYS i=
s used
> > > incorrectly.
> > > =

> > > Bonus:
> > > =

> > > With this patchset, we should probably change the use the flags
> > > "CLK_SET_RATE_GATE" and "CLK_SET_PARENT_GATE" We discussed removing
> > > them. Another solution would be to have them automatically gate the c=
lock
> > > before performing the related operation.=C2=A0=C2=A0What is your view=
 on this ?
> > > =

> > > [0]: http://lkml.kernel.org/r/148942423440.82235.17188153691656009029=
@resona
> > > nce
> > > =

> > > Jerome Brunet (7):
> > > =C2=A0 clk: take the prepare lock out of clk_core_set_parent
> > > =C2=A0 clk: add set_phase core function
> > > =C2=A0 clk: rework calls to round and determine rate callbacks
> > > =C2=A0 clk: add support for clock protection
> > > =C2=A0 clk: rollback set_rate_range changes on failure
> > > =C2=A0 clk: cosmetic changes to clk_summary debugfs entry
> > > =C2=A0 clk: fix incorrect usage of ENOSYS
> > > =

> > > =C2=A0drivers/clk/clk.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0| 313 ++++++++++++++++++++++++++++++++++----
> > > -----
> > > =C2=A0include/linux/clk-provider.h |=C2=A0=C2=A0=C2=A01 +
> > > =C2=A0include/linux/clk.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A029 ++++
> > > =C2=A03 files changed, 279 insertions(+), 64 deletions(-)
> > > =

> > > --=C2=A0
> > > 2.9.3
> > >=20
