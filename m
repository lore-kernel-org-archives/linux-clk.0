Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Jerome Brunet <jbrunet@baylibre.com>, "Stephen Boyd" <sboyd@codeaurora.org>,
 "Kevin Hilman" <khilman@baylibre.com>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1494594482.2135.1.camel@baylibre.com>
Cc: linux-clk@vger.kernel.org,  linux-amlogic@lists.infradead.org
References: <20170321183330.26722-1-jbrunet@baylibre.com>
 <20170321183330.26722-5-jbrunet@baylibre.com>
 <149452951146.81039.10685895856154834071@resonance>
 <1494594482.2135.1.camel@baylibre.com>
Message-ID: <149487861856.2534.2634206373859977048@resonance>
Subject: Re: [RFC 4/7] clk: add support for clock protection
Date: Mon, 15 May 2017 13:03:38 -0700
List-ID: <linux-clk.vger.kernel.org>

Hi Jerome,

Quoting Jerome Brunet (2017-05-12 06:08:02)
> On Thu, 2017-05-11 at 12:05 -0700, Michael Turquette wrote:
> > Quoting Jerome Brunet (2017-03-21 11:33:27)
<snip>
> > > @@ -838,7 +933,9 @@ static int clk_core_determine_round(struct clk_co=
re
> > > *core,
> > > =C2=A0{
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0long rate;
> > > =C2=A0
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (core->ops->determine_r=
ate) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (clk_core_is_protected(=
core)) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0req->rate =3D core->rate;
> > =

> > Hmm, in CCF we basically re-use round_rate/determine_rate from within
> > calls to clk_set_rate. The point is that clk_set_rate should set the
> > same rate that is returned from either of the other two functions.
> > =

> > The change above breaks that subtle assumption, as a clk consumer can
> > now call:
> > =

> >       clk_protect(clk);
> > =

> >       rate =3D clk_get_rate(clk);               // rate is 1234;
> > =

> >       rate =3D clk_round_rate(clk, 5678);       // rate is STILL 1234
> > =

> >       ret =3D clk_set_rate(clk, 5678);
> > =

> >       rate =3D clk_get_rate(clk);               // rate is 5678
> > =

> > Is my understanding correct? If so then we might consider adding some
> > more complex knowledge to clk_round_rate. Something like:
> > =

> >       if clk_is_protected(clk) AND it is only protect by THIS clk:
> >               round the rate
> >       else:
> >               return core->rate
> =

> I may be wrong but I think it is already the way you want it. Please see =
below
> [0]
<snip>
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (clk->protect_ucount)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0clk_core_unprotect(clk->core);
> > =

> > What happens here if two different users have both protected this same
> > clk? Looks like we ignore the second user?
> > =

> > In other words, what happens if clk->protect_ucount =3D=3D 2?
> =

> We don't really care what is the value of the consumer count, what is imp=
ortant
> is whether it is null or not. This is linked to the point [0] above. Mayb=
e it is
> not clear but here is how it (should) goes :
> =

> Every time clock_rate_protect is called the consumer *and* core count is
> incremented. (consumer_count =3D< core_count)
> =

> When an altering action is tried (set_rate, set_parent, ...), if the cons=
umer
> count is not null, we call clk_core_unprotect which mean that the core_co=
unt is
> temporarily decremented by 1. It is safe to do so because we are holding =
the
> prepare_lock.
> =

> When we get to =

> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (clk_core_is_protected(core=
)) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0req->rate =3D core->rate;
> =

> Either the clock was only protected by the calling consumer, *and only on=
ce*,
> then the protection has been temporarily removed, test is false and the u=
sual
> code will be executed, calling round/determine rate.
> =

> If the test is true, it means the clock is still protected. This happens =
if =

> * the clock is protected and we come from an unprotected consumer
> * the clock is protected by more than one consumer
> * the clock is protected more than one time by the same consumer - when t=
here is
> multiple code path protecting the rate in a device driver, as previously
> discussed. That's why clk_core_unprotect decrements by 1 and not by the
> consumer_count.
> =

> In such case, the clock is still protected, I think it make sense to retu=
rn what
> is already set and not round/determine again. The clock was already
> rounded/determined when it wasn't protected.
> =

> It this what you meant by :
> > if clk_is_protected(clk) AND it is only protect by THIS clk:
> ?

Yes, you've answered my question and I'm happy with that. When reviewing
the code before I missed the subtle point that we test for
clk->protect_ucount but then only modify core->protect_count. I think a
one-line comment above those conditional statements would be nice.

I do have a doubt about how clk_round_rate works now. Is it correct that
we do not ever decrement the protect count when a protecting consumer
calls clk_round_rate?

It seems to me that a clk consumer should be able to call clk_protect()
and then clk_round_rate() and get a real rounded rate instead req->rate
=3D core->rate, assuming that the core protect count is decremented to
zero.

In other words, can you make clk_round_rate work like clk_set_rate and
clk_set_parent?

Regards,
Mike

> =

> Cheers
> Jerome
> =

> > =

> > =

> > Best regards,
> > Mike
> > =

> > > +
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D clk_core_set_=
rate_nolock(clk->core, rate);
> > > =C2=A0
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (clk->protect_ucount)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0clk_core_protect(clk->core);
> > > +
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0clk_prepare_unlock();
> > > =C2=A0
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return ret;
> > > @@ -1669,12 +1772,18 @@ int clk_set_rate_range(struct clk *clk, unsig=
ned
> > > long min, unsigned long max)
> > > =C2=A0
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0clk_prepare_lock();
> > > =C2=A0
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (clk->protect_ucount)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0clk_core_unprotect(clk->core);
> > > +
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (min !=3D clk->min=
_rate || max !=3D clk->max_rate) {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0clk->min_rate =3D min;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0clk->max_rate =3D max;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D clk_core_set_rate_nolock(clk->core, clk-=
>core-
> > > >req_rate);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > > =C2=A0
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (clk->protect_ucount)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0clk_core_protect(clk->core);
> > > +
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0clk_prepare_unlock();
> > > =C2=A0
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return ret;
> > > @@ -1815,6 +1924,9 @@ static int clk_core_set_parent(struct clk_core =
*core,
> > > struct clk_core *parent)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if ((core->flags & CL=
K_SET_PARENT_GATE) && core->prepare_count)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0return -EBUSY;
> > > =C2=A0
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (clk_core_is_protected(=
core))
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return -EBUSY;
> > > +
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* try finding the ne=
w parent index */
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (parent) {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0p_index =3D clk_fetch_parent_index(core, parent);
> > > @@ -1878,11 +1990,24 @@ static int clk_core_set_parent_lock(struct cl=
k_core
> > > *core,
> > > =C2=A0 */
> > > =C2=A0int clk_set_parent(struct clk *clk, struct clk *parent)
> > > =C2=A0{
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
> > > +
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!clk)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> > > =C2=A0
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return clk_core_set_parent=
_lock(clk->core,
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0parent ? parent->core : NULL);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0clk_prepare_lock();
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (clk->protect_ucount)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0clk_core_unprotect(clk->core);
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D clk_core_set_paren=
t(clk->core, parent ? parent->core : NULL);
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (clk->protect_ucount)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0clk_core_protect(clk->core);
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0clk_prepare_unlock();
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return ret;
> > > =C2=A0}
> > > =C2=A0EXPORT_SYMBOL_GPL(clk_set_parent);
> > > =C2=A0
> > > @@ -1893,7 +2018,10 @@ static int clk_core_set_phase(struct clk_core =
*core,
> > > int degrees)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!core)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> > > =C2=A0
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0trace_clk_set_phase(clk->c=
ore, degrees);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (clk_core_is_protected(=
core))
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return -EBUSY;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0trace_clk_set_phase(core, =
degrees);
> > > =C2=A0
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (core->ops->set_ph=
ase)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D core->ops->set_phase(core->hw, degrees);
> > > @@ -1936,7 +2064,15 @@ int clk_set_phase(struct clk *clk, int degrees)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0degrees +=3D 360;
> > > =C2=A0
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0clk_prepare_lock();
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (clk->protect_ucount)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0clk_core_unprotect(clk->core);
> > > +
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D clk_core_set_=
phase(clk->core, degrees);
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (clk->protect_ucount)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0clk_core_protect(clk->core);
> > > +
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0clk_prepare_unlock();
> > > =C2=A0
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return ret;
> > > @@ -2023,11 +2159,12 @@ static void clk_summary_show_one(struct seq_f=
ile *s,
> > > struct clk_core *c,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!c)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
> > > =C2=A0
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0seq_printf(s, "%*s%-*s %11=
d %12d %11lu %10lu %-3d\n",
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0seq_printf(s, "%*s%-*s %11=
d %12d %12d %11lu %10lu %-3d\n",
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0level * 3 + 1, "",
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A030 - level * 3, c->name,
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0c->enable_count, c->prepare_count=
, clk_core_get_rate(c),
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0clk_core_get_accuracy(c), clk_cor=
e_get_phase(c));
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0c->enable_count, c->prepare_count=
, c->protect_count,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0clk_core_get_rate(c), clk_core_ge=
t_accuracy(c),
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0clk_core_get_phase(c));
> > > =C2=A0}
> > > =C2=A0
> > > =C2=A0static void clk_summary_show_subtree(struct seq_file *s, struct=
 clk_core
> > > *c,
> > > @@ -2049,8 +2186,8 @@ static int clk_summary_show(struct seq_file *s,=
 void
> > > *data)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct clk_core *c;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct hlist_head **l=
ists =3D (struct hlist_head **)s->private;
> > > =C2=A0
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0seq_puts(s,
> > > "=C2=A0=C2=A0=C2=A0clock=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0enable_cnt=C2=A0=C2=A0prepare_cnt=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rate=C2=A0=C2=A0=C2=A0accu
> > > racy=C2=A0=C2=A0=C2=A0phase\n");
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0seq_puts(s, "-------------=
------------------------------------------
> > > ---------------------------------\n");
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0seq_puts(s,
> > > "=C2=A0=C2=A0=C2=A0clock=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0enable_cnt=C2=A0=C2=A0prepare_cnt=C2=A0=C2=A0=
protect_cnt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > =C2=A0=C2=A0rate=C2=A0=C2=A0=C2=A0accuracy=C2=A0=C2=A0=C2=A0phase\n");
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0seq_puts(s, "-------------=
------------------------------------------
> > > ---------------------------------------------\n");
> > > =C2=A0
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0clk_prepare_lock();
> > > =C2=A0
> > > @@ -2085,6 +2222,7 @@ static void clk_dump_one(struct seq_file *s, st=
ruct
> > > clk_core *c, int level)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0seq_printf(s, "\"%s\"=
: { ", c->name);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0seq_printf(s, "\"enab=
le_count\": %d,", c->enable_count);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0seq_printf(s, "\"prep=
are_count\": %d,", c->prepare_count);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0seq_printf(s, "\"protect_c=
ount\": %d,", c->protect_count);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0seq_printf(s, "\"rate=
\": %lu,", clk_core_get_rate(c));
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0seq_printf(s, "\"accu=
racy\": %lu,", clk_core_get_accuracy(c));
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0seq_printf(s, "\"phas=
e\": %d", clk_core_get_phase(c));
> > > @@ -2191,6 +2329,11 @@ static int clk_debug_create_one(struct clk_core
> > > *core, struct dentry *pdentry)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!d)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0goto err_out;
> > > =C2=A0
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0d =3D debugfs_create_u32("=
clk_protect_count", S_IRUGO, core->dentry,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(u3=
2 *)&core->protect_count);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!d)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0goto err_out;
> > > +
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0d =3D debugfs_create_=
u32("clk_notifier_count", S_IRUGO, core->dentry,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
(u32 *)&core->notifier_count);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!d)
> > > @@ -2747,6 +2890,11 @@ void clk_unregister(struct clk *clk)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (clk->core->prepar=
e_count)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0pr_warn("%s: unregistering prepared clock: %s\n",
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0__func__, clk->core->name);
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (clk->core->protect_cou=
nt)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0pr_warn("%s: unregistering protected clock: %s\n",
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0__func__, clk->core->name);
> > > +
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0kref_put(&clk->core->=
ref, __clk_release);
> > > =C2=A0unlock:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0clk_prepare_unlock();
> > > @@ -2905,6 +3053,15 @@ void __clk_put(struct clk *clk)
> > > =C2=A0
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0clk_prepare_lock();
> > > =C2=A0
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Protect count not balan=
ced: warn and sanitize */
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (clk->protect_ucount) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0pr_warn("%s: releasing protected clock: %s\n",
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0__func__, clk->core->name);
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0for (; clk->protect_ucount; clk->protect_ucount--)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0clk=
_core_unprotect(clk->core);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > > +
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0hlist_del(&clk->clks_=
node);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (clk->min_rate > c=
lk->core->req_rate ||
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0clk->max_rate < clk->core->req_rate)
> > > diff --git a/include/linux/clk-provider.h b/include/linux/clk-provide=
r.h
> > > index a428aec36ace..705a158d9b8f 100644
> > > --- a/include/linux/clk-provider.h
> > > +++ b/include/linux/clk-provider.h
> > > @@ -739,6 +739,7 @@ unsigned long clk_hw_get_rate(const struct clk_hw=
 *hw);
> > > =C2=A0unsigned long __clk_get_flags(struct clk *clk);
> > > =C2=A0unsigned long clk_hw_get_flags(const struct clk_hw *hw);
> > > =C2=A0bool clk_hw_is_prepared(const struct clk_hw *hw);
> > > +bool clk_hw_is_protected(const struct clk_hw *hw);
> > > =C2=A0bool clk_hw_is_enabled(const struct clk_hw *hw);
> > > =C2=A0bool __clk_is_enabled(struct clk *clk);
> > > =C2=A0struct clk *__clk_lookup(const char *name);
> > > diff --git a/include/linux/clk.h b/include/linux/clk.h
> > > index e9d36b3e49de..90b72ead4411 100644
> > > --- a/include/linux/clk.h
> > > +++ b/include/linux/clk.h
> > > @@ -265,6 +265,30 @@ struct clk *devm_clk_get(struct device *dev, con=
st char
> > > *id);
> > > =C2=A0 */
> > > =C2=A0struct clk *devm_get_clk_from_child(struct device *dev,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0str=
uct device_node *np, const char
> > > *con_id);
> > > +/**
> > > + * clk_protect - inform the system when the clock source should be
> > > protected.
> > > + * @clk: clock source
> > > + *
> > > + * This function informs the system that the consumer protecting the=
 clock
> > > + * depends on the rate of the clock source and can't tolerate any gl=
itches
> > > + * introduced by further clock rate change or re-parenting of the cl=
ock
> > > source.
> > > + *
> > > + * Must not be called from within atomic context.
> > > + */
> > > +void clk_protect(struct clk *clk);
> > > +
> > > +/**
> > > + * clk_unprotect - release the protection of the clock source.
> > > + * @clk: clock source
> > > + *
> > > + * This function informs the system that the consumer previously pro=
tecting
> > > the
> > > + * clock source can now deal with other consumer altering the clock =
source.
> > > + *
> > > + * The caller must balance the number of protect and unprotect calls.
> > > + *
> > > + * Must not be called from within atomic context.
> > > + */
> > > +void clk_unprotect(struct clk *clk);
> > > =C2=A0
> > > =C2=A0/**
> > > =C2=A0 * clk_enable - inform the system when the clock source should =
be running.
> > > @@ -460,6 +484,11 @@ static inline void clk_put(struct clk *clk) {}
> > > =C2=A0
> > > =C2=A0static inline void devm_clk_put(struct device *dev, struct clk =
*clk) {}
> > > =C2=A0
> > > +
> > > +static inline void clk_protect(struct clk *clk) {}
> > > +
> > > +static inline void clk_unprotect(struct clk *clk) {}
> > > +
> > > =C2=A0static inline int clk_enable(struct clk *clk)
> > > =C2=A0{
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> > > --=C2=A0
> > > 2.9.3
> > >=20
