Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1490206409.29739.2.camel@baylibre.com>
Subject: Re: [RFC 0/7] clk: implement clock locking mechanism
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	 <sboyd@codeaurora.org>, Kevin Hilman <khilman@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org
Date: Wed, 22 Mar 2017 19:13:29 +0100
In-Reply-To: <149014126203.54062.76278318846510349@resonance>
References: <20170321183330.26722-1-jbrunet@baylibre.com>
	 <149014126203.54062.76278318846510349@resonance>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Tue, 2017-03-21 at 17:07 -0700, Michael Turquette wrote:
> Hi Jérôme,
> 
> Quoting Jerome Brunet (2017-03-21 11:33:23)
> > This RFC patchset is related to the discussion around CLK_SET_RATE_GATE and
> > clk_lock which available here [0]
> > 
> > The goal of this patchset is to provide a way for consumers to inform the
> > system that they depend on the rate of the clock source and can't tolerate
> > other consumers changing the rate or causing glitches.
> > 
> > Patches 1 to 3 are just rework to ease the integration of the locking
> > mechanism. They should not introduce any functional differences.
> > 
> > Patch 4 is the important bit. It introduce 2 new functions to the CCF API:
> > clk_protect and clk_unprotect (The "lock" word is already used lot in
> > clk.c. Using clk_lock and clk_unlock would have been very messy. If you
> > found "protect" to be a poor choice, I'm happy to sed the whole thing in
> > future version)
> 
> I prefer clk_lock_rate and clk_unlock_rate.
> 
> > 
> > These calls can happen at anytime during the life of the clk. As for
> > prepare and enable, the calls must be balanced.
> > 
> > Inside the clock framework, 2 new count values are introduced to keep track
> > of the protection:
> > * core "protect_count": this reference count value works in the same way as
> >   prepare and enable count, and track whether the clock is protected or
> >   not. This is the value that will checked to allow operation which may
> >   cause glitches or change the rate of clock source.
> > * clk consumer "protect_ucount": this allows to track if the consumer is
> >   protecting the clock.
> 
> Similarly, s/protect/lock_rate/g
> 
> > 
> > Requiring the consumer to unprotect its clock before changing it would have
> > been very annoying for the consumer. It would also be unsafe, as it would
> > still be possible for another consumer to change the rate between the call
> > to set_rate and protect. This needs to happen in a critical section.  A
> > solution would be to add "set_rate_protect", but we would need to do the
> > same for the set_parent and set_phase (and the possible future
> > functions). It does not scale well.  The solution proposed in this patch is
> > to use the consumer protect count.
> > 
> > In function altering the clock, if the consumer is protecting the clock,
> > the protection is temporarily release under the prepare_lock. This ensure
> > that:
> > * the clock is still protect from another consumer because of the
> >   prepare_lock
> > * the rate set on a protected clock cannot change between set_rate and
> >   later enable
> > * only a consumer protecting a clock can do this temporary protection
> >   removal (less chance of people messing with the refcount)
> 
> It should be impossible for consumer_A to remove the lock refcount set
> by consumer_B using something like these patches I wrote for
> prepare_count and enable_count:
> 
> https://lkml.kernel.org/r/1438974570-20812-1-git-send-email-mturquette@baylibr
> e.com
> 
Looks like what I have done here, except that this (core_count behind the
consumer count) is an added bonus.  The initial reason for it was to allow
consumer protecting the clock to do the temporary release of the protection
under the prepare_lock, so the consumer does not lock itself out.

> > * if more than one consumer protect the clock, it remains protected.
> >   Because the protection is removed for the calling consumer, it gives
> >   it a chance to jump to another provider, if available.
> 
> Hmm, that's a bit confusing. I guess you mean, "if the rate a parent
> clock is locked, and the child clock has multiple parents to choose
> from, then the child may select a different parent with an unlocked
> rate"?

Could not have said it better, apparently :)

> 
> > 
> > This protection mechanism assume that "protecting" consumer knows what it
> > is doing when it comes to setting the rate, and does not expect to be
> > protected against itself.
> 
> Is this always true? Are there drivers where one code path requires a
> stable rate (due to glitches) while another code path might try to
> change the rate?

For this particular case, each path can call "protect", protecting against each
other.

> 
> I can't think of any, but it's a big assumption to make. Anyone else
> have thoughts on it?

This mechanism I'm proposing is not a locking mechanism, but a way for a
consumer to inform the system "I heavily depends on this clock rate, it is
critical to my task, I can't tolerate anyone *else* from messing with it during
this specific period"

It effectively give the consumer the guarantee that the rate set under the
protection is the one it will get as long as it hold the protection

> 
> > 
> > This was tested with the audio use case mentioned in [0]
> > 
> > One caveat is the following case:
> > N+1 consumers protect their clocks. These clocks come from N possible
> > providers. We should able to satisfy at least N consumers before exhausting
> > the resources.  In the particular case where all the consumers call
> > "protect" before having a chance to call "set_rate", the last 2 consumers
> > will remains stuck on the last provider w/o being able to set the rate on
> > it. This means that in situation where there is 2 consumers on 1
> > providers, they will compete for the clock, and may end up in situation
> > where both protect the clock and none can set the rate they need.  This can
> > be solved if, when the rate fails to be set, the consumer release the
> > protection. Then the second consumer will be able to satisfy its request.
> > 
> > Patch 5 is a small change on set_rate_range to restore the old range on
> > failure. It don't use set_rate_range in any driver so I could not test this
> > change.
> > 
> > Patch 6 is just a cosmetic change to clk_summary debugfs entry to make it
> > less wide after adding protect count in it.
> > 
> > Patch 7 fix a warning reported by checkpatch.pl. Apparently, ENOSYS is used
> > incorrectly.
> > 
> > Bonus:
> > 
> > With this patchset, we should probably change the use the flags
> > "CLK_SET_RATE_GATE" and "CLK_SET_PARENT_GATE" We discussed removing
> > them. Another solution would be to have them automatically gate the clock
> > before performing the related operation.  What is your view on this ?
> 
> We'll need to ask the users of these flags. It would be nice to convert
> those folks over to use clk_lock_rate() instead of those flags.
> 

These flag have a very different purpose in the end.
These flags *should* mean that "to perform this operation, the clock should be
gated" In a way, it is the provider protecting itself against all the consumers
(1).
The api proposed here allow consumers to protect against other consumers (2).

I think these are different things. Some tried to do (2) using these flags (like
 me) and probably failed (like me).

I think these flags are still useful (if fixed - enforcing the clock to be gated
to perform the operation) to implement (1) use-cases.

> Regards,
> Mike
> 
> > 
> > [0]: http://lkml.kernel.org/r/148942423440.82235.17188153691656009029@resona
> > nce
> > 
> > Jerome Brunet (7):
> >   clk: take the prepare lock out of clk_core_set_parent
> >   clk: add set_phase core function
> >   clk: rework calls to round and determine rate callbacks
> >   clk: add support for clock protection
> >   clk: rollback set_rate_range changes on failure
> >   clk: cosmetic changes to clk_summary debugfs entry
> >   clk: fix incorrect usage of ENOSYS
> > 
> >  drivers/clk/clk.c            | 313 ++++++++++++++++++++++++++++++++++----
> > -----
> >  include/linux/clk-provider.h |   1 +
> >  include/linux/clk.h          |  29 ++++
> >  3 files changed, 279 insertions(+), 64 deletions(-)
> > 
> > -- 
> > 2.9.3
> > 
