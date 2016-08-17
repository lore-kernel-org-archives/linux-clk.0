Return-Path: <moinejf@free.fr>
Date: Wed, 17 Aug 2016 11:35:20 +0200
From: Jean-Francois Moine <moinejf@free.fr>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette
 <mturquette@baylibre.com>, linux-clk@vger.kernel.org, Heiko
 =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] clk: core: Force setting the phase delay when no change
Message-Id: <20160817113520.c11e03eb1ddb60a7acc2703b@free.fr>
In-Reply-To: <63bc0953-9c64-e7f5-3938-6ecf894c893e@rock-chips.com>
References: <20160813164656.DD30A61A06@smtp.codeaurora.org>
	<20160815182959.GV361@codeaurora.org>
	<7e871c7e-d7fb-92f4-aacc-092c67a1ec1f@rock-chips.com>
	<20160817083438.8c7f336e76bc12205e71e13d@free.fr>
	<63bc0953-9c64-e7f5-3938-6ecf894c893e@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
List-ID: <linux-clk.vger.kernel.org>

On Wed, 17 Aug 2016 16:15:57 +0800
Shawn Lin <shawn.lin@rock-chips.com> wrote:

> + Heiko
>=20
> On 2016/8/17 14:34, Jean-Francois Moine wrote:
> > On Wed, 17 Aug 2016 09:00:05 +0800
> > Shawn Lin <shawn.lin@rock-chips.com> wrote:
> >
> >> On 2016/8/16 2:29, Stephen Boyd wrote:
> >>> On 08/13, Jean-Francois Moine wrote:
> >>>> The hardware phase delay may depend on some other settings as clock
> >>>> reparenting, so, it has to be set each time.
> >>>> Also, when the delay was the same as previously, an error was return=
ed.
> >>>>
> >>>> Signed-off-by: Jean-Francois Moine <moinejf@free.fr>
> >>>> ---
> >>>
> >>> This effectively reverts commit 023bd7166be0 (clk: skip
> >>> unnecessary set_phase if nothing to do, 2016-02-26), so I'd like
> >>> to see if Shawn has any comments or if that patch was just a
> >>> broken optimization.
> >>>
> >>> We may want to go another route and get the phase from the
> >>> hardware and compare that to what's requested. That way we don't
> >>> set the phase again unnecessarily.
> >>
> >> Sorry for late response.
> >>
> >> If the client calls clk_set_phase to set the same phase ,
> >> why it needs to reparent as *this* parent already support this phase a=
nd
> >> we don't need to do it again?
> >>
> >> For some reasons we have to reparent the clock, it should be sub clock
> >> drivers' responsibility to guarantee that we can maintain/restore the
> >> topology structure no matter for rate or for phase. But it shouldn't
> >> make the callers/users be aware of what was happening.
> >>
> >> How do you nofify them that "Oh, reparent now, please call
> >> clk_set_phase again" ? :)
> >>
> >> Plz correct me if my understanding is wrong.
> >
> > Shawn,
> >
> > Maybe this problem is Allwinner specific.
> >
> > In their SoCs, the phase delays 0..360=B0 must be translated to a
> > hardware shift 0..7 which depends on the ratio of of the rates of the
> > clock and its father. When reparenting the clock, the ratio may change
> > and, with a same phase delay, the hardware shift may have to be
>=20
> So when reparenting the clock, could you update the clk->core->phase
> as well to match the real phase using?

No so easy: from the old ratio, we should translate back the hardware
shifts (sample and output) to degrees, and, after reparenting,
explicitly call the set_phase function of both the sample and output
clocks and update the hardware.

While we are sure that the client will call set_phase after reparenting.

> > changed. As the phase delay is always set after setting the clock,
> > setting the clock hardware in all cases solves the possible mismatch.
> >
> > Now, the problem I had is a bit different: in some devices (MMCs) of
> > some Allwinner SoCs, and under some conditions, the hardware phase
> > delay may be set directly in the client instead of in the clock.
>=20
> You mean Allwinner mmc driver hardcode the setting of clk phasse instead
> of calling clk API? Looks strange to me...

But not so stupid. In the Allwinner's SoCs, the MMC hardware asks for
2 clocks, 'sample' and 'output', which have a same rate but different
phase delays. The phase shift is implemented in the clock hardware.
So, by software, after setting the (main) clock rate, the MMC driver must
call the clock driver to update the delays of the clock children.

In newer SoCs, Allwinner developped a 'new timing' mode.
The hardware phase shift still exists in the clock, but they added the
same shifting mechanism in the MMC hardware. In this 'new timing' mode,
there is only one clock, and the MMC driver sets itself the phase delays
without having to call twice more the clock driver.

(but this would be too simple, in fact, the old timing must still be
used for rates < 50MHz, and some devices - eMMC - don't work without the
new timing)

> > Only the clock knows when this capability is used, so the clock must
> > alert the client that this one has to set the phase delay or not.
> > I solved this required synchronization by returning a specific error
> > code when the clock does not set the phase delay on its side.
> > This mechanism works fine when the set_phase() callback function of the
> > clock is always called, even with a same delay.
> >
> > In the Allwinner's SoCs, setting the hardware phase delay asks for only
> > a few machine instructions, so, the overhead is very small.
> > If this is not the case for other machines, it could be simple enough
> > to move the test of same delay to the clock drivers of these machines...
>=20
> I understand it now but it's a trick but not a legit way to solve your
> problem from my view.

Have you arguments about keeping the test of same delay and not calling
the clock driver?

--=20
Ken ar c'henta=F1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
