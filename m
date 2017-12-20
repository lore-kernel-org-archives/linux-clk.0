Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: David Lechner <david@lechnology.com>,  linux-clk@vger.kernel.org
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <3ad110cf-95ba-0d0b-53ee-f1fa2d37d7fa@lechnology.com>
Cc: "Stephen Boyd" <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org,
 "Jerome Brunet" <jbrunet@baylibre.com>
References: <1513122223-14932-1-git-send-email-david@lechnology.com>
 <32ca585d-c51d-1c85-42ba-85f0b1df0a60@lechnology.com>
 <f6df34ba-b553-5b10-8a36-f5a043722aa6@lechnology.com>
 <151372258747.45969.10121622799666696251@resonance>
 <3ad110cf-95ba-0d0b-53ee-f1fa2d37d7fa@lechnology.com>
Message-ID: <151379785862.37313.908268542576551305@resonance>
Subject: Re: [PATCH] clk: fix spin_lock/unlock imbalance on bad clk_enable()
 reentrancy
Date: Wed, 20 Dec 2017 11:24:18 -0800
List-ID: <linux-clk.vger.kernel.org>

Quoting David Lechner (2017-12-20 10:53:27)
> On 12/19/2017 04:29 PM, Michael Turquette wrote:
> > Hi David,
> > =

> > Quoting David Lechner (2017-12-15 08:29:56)
> >> On 12/12/2017 10:14 PM, David Lechner wrote:
> >>> On 12/12/2017 05:43 PM, David Lechner wrote:
> >>>> If clk_enable() is called in reentrant way and spin_trylock_irqsave(=
) is
> >>>> not working as expected, it is possible to get a negative enable_ref=
cnt
> >>>> which results in a missed call to spin_unlock_irqrestore().
> >>>>
> >>>> It works like this:
> >>>>
> >>>> 1. clk_enable() is called.
> >>>> 2. clk_enable_unlock() calls spin_trylock_irqsave() and sets
> >>>>  =C2=A0=C2=A0=C2=A0 enable_refcnt =3D 1.
> >>>> 3. Another clk_enable() is called before the first has returned
> >>>>  =C2=A0=C2=A0=C2=A0 (reentrant), but somehow spin_trylock_irqsave() =
is returning true.
> >>>>  =C2=A0=C2=A0=C2=A0 (I'm not sure how/why this is happening yet, but=
 it is happening
> >>>> to me
> >>>>  =C2=A0=C2=A0=C2=A0 with arch/arm/mach-davinci clocks that I am work=
ing on).
> >>>
> >>> I think I have figured out that since CONFIG_SMP=3Dn and
> >>> CONFIG_DEBUG_SPINLOCK=3Dn on my kernel that
> >>>
> >>> #define arch_spin_trylock(lock)({ barrier(); (void)(lock); 1; })
> >>>
> >>> in include/linux/spinlock_up.h is causing the problem.
> >>>
> >>> So, basically, reentrancy of clk_enable() is broken for non-SMP syste=
ms,
> >>> but I'm not sure I know how to fix it.
> >>>
> >>>
> >>
> >> Here is what I came up with for a fix. If it looks reasonable, I will
> >> resend as a proper patch.
> >>
> >> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> >> index bb1b1f9..53fad5f 100644
> >> --- a/drivers/clk/clk.c
> >> +++ b/drivers/clk/clk.c
> >> @@ -136,12 +136,23 @@ static void clk_prepare_unlock(void)
> >>           mutex_unlock(&prepare_lock);
> >>    }
> >>
> >> +#ifdef CONFIG_SMP
> >> +#define NO_SMP 0
> >> +#else
> >> +#define NO_SMP 1
> >> +#endif
> >> +
> >>    static unsigned long clk_enable_lock(void)
> >>           __acquires(enable_lock)
> >>    {
> >> -       unsigned long flags;
> >> +       unsigned long flags =3D 0;
> >>
> >> -       if (!spin_trylock_irqsave(&enable_lock, flags)) {
> >> +       /*
> >> +        * spin_trylock_irqsave() always returns true on non-SMP system
> >> (unless
> > =

> > Ugh, wrapped lines in patch make me sad.
> =

> Sorry, I was being lazy. :-/
> =

> > =

> >> +        * spin lock debugging is enabled) so don't call
> >> spin_trylock_irqsave()
> >> +        * unless we are on an SMP system.
> >> +        */
> >> +       if (NO_SMP || !spin_trylock_irqsave(&enable_lock, flags)) {
> > =

> > I'm not sure that this looks reasonable. The inverse logic (NO_SMP =3D 0
> > being equivalent to SMP =3D 1) just makes things harder to read for no
> > reason.
> > =

> > More to the point, did you fix your enable/disable call imbalance? If
> > so, did you test that fix without this patch? I'd like to know if fixing
> > the enable/disable imbalance is Good Enough. I'd prefer to take only
> > that change and not this patch.
> =

> Without this patch, the imbalance in calls to spin lock/unlock are =

> fixed, but I still get several WARN_ONCE_ON() because the reference =

> count becomes negative, so I would not call it Good Enough.

Several WARN_ON_ONCE? Have you narrowed down exactly which conditions in
the lock/unlock path are firing?

Also, I wasn't referring to the lock/unlock imbalance in my email above.
I was referring to the enable count mismatch. Have you fixed that bug? I
assume it's an incorrect clk consumer driver causing it.

Regards,
Mike

> =

> > =

> > Best regards,
> > Mike
> > =

> >>                   if (enable_owner =3D=3D current) {
> >>                           enable_refcnt++;
> >>                           __acquire(enable_lock);
> >>
>=20
