Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Lee Jones <lee.jones@linaro.org>, 
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <20150811183317.GT18282@x1>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, sboyd@codeaurora.org,
 maxime.ripard@free-electrons.com, s.hauer@pengutronix.de,
 geert@linux-m68k.org
References: <1438974570-20812-1-git-send-email-mturquette@baylibre.com>
 <1438974570-20812-4-git-send-email-mturquette@baylibre.com>
 <20150810144811.GN3249@x1> <20150810185516.2416.32293@quantum>
 <20150811084329.GA13374@x1> <20150811170904.2416.43354@quantum>
 <20150811183317.GT18282@x1>
Message-ID: <20150811185827.31346.68194@quantum>
Subject: Re: [PATCH RFC RFT 3/3] clk: introduce CLK_ENABLE_HAND_OFF flag
Date: Tue, 11 Aug 2015 11:58:27 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Lee Jones (2015-08-11 11:33:17)
> On Tue, 11 Aug 2015, Michael Turquette wrote:
> > I had a chat with Stephen Boyd about this yesterday and we discussed
> > taking it even further: do not explicitly enable the clock, but instead
> > simply refrain from disabling a clock that is both ON and has this flag
> > set.
> =

> Doing so will prevent clk_disable_unused() from gating it, but if we
> don't take a reference sibling clocks will be able to disable the
> parent which will be fatal.

We propagate the reference counting up the tree. My implementation is a
call to clk_core_enable which walks the parent lists and increments
reference counts, so what you describe will not happen.

I am only proposing to augment the logic slightly by checking the value
of the .is_enabled callback and making sure that this clock isn't
already gated in hardware. If it is then we won't touch it in the
framework; it's up to drivers to claim it and enable as usual.

> =

> > It sounds like that would that work for ST, yes? Are you interested in
> > using a flag (or a DT property) to enable an otherwise-gated clock, or
> > simply insuring that bootloader-enabled and reset-enabled clocks are not
> > spuriously turned off?
> =

> Clocks are ungated by the bootloader.

Thanks for the info.

> > That's great. I suspected that behavior was not necessary at all.
> > =

> > Let's zero in on the technical concerns here:
> > =

> > 1) ST's flexgen binding should not get screwed over. So we'll need a DT
> > wrapper around the flag
> =

> Great.
> =

> > 2) I would love feedback on whether you expect the flag/property to
> > enable a disabled clock or if you merely want to keep an already-enabled
> > clock from being disabled
> =

> For us, we only need the clock not to be turned off, either by
> clk_disable_unused() or by drivers using critical clock siblings, but
> as I'm striving for a generic approach, it would be hypocritical of me
> to encourage not to cover all bases with this solution.

I'm going for Minimum Viable Product here. I deeply do not want to have
a mechanism for ungating clocks from DT. Keeping ungated clocks enabled
is a different beast entirely and probably satisfies most users that
have been following development of this feature.

For example the whole big messy fuss over the DT bindings for the
simple-fb driver could have been avoided if this feature had existed
then.

Additionally, I prefer not to merge features that do not have users. ST
needs to keep already-enabled clocks from being turned off, so that's
what we'll merge.

Regards,
Mike
