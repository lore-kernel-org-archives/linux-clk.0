Return-Path: <lee.jones@linaro.org>
Return-Path: <lee.jones@linaro.org>
Date: Tue, 11 Aug 2015 19:33:17 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	sboyd@codeaurora.org, maxime.ripard@free-electrons.com,
	s.hauer@pengutronix.de, geert@linux-m68k.org
Subject: Re: [PATCH RFC RFT 3/3] clk: introduce CLK_ENABLE_HAND_OFF flag
Message-ID: <20150811183317.GT18282@x1>
References: <1438974570-20812-1-git-send-email-mturquette@baylibre.com>
 <1438974570-20812-4-git-send-email-mturquette@baylibre.com>
 <20150810144811.GN3249@x1>
 <20150810185516.2416.32293@quantum>
 <20150811084329.GA13374@x1>
 <20150811170904.2416.43354@quantum>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <20150811170904.2416.43354@quantum>
List-ID: <linux-clk.vger.kernel.org>

On Tue, 11 Aug 2015, Michael Turquette wrote:

> Quoting Lee Jones (2015-08-11 01:43:29)
> > On Mon, 10 Aug 2015, Michael Turquette wrote:
> > > Quoting Lee Jones (2015-08-10 07:48:11)
> > > > On Fri, 07 Aug 2015, Michael Turquette wrote:
> > > This series is solving the following problems:
> > > 
> > > 1) enabling specified clocks at boot
> > > 2) preventing those clocks from being gated by clk_disable_unused
> > 
> > The original patch-set did this just fine.
> 
> There is a very real difference between the implementations.
> 
> The original patch made it easy to call clk_prepare_enable on a clock
> from some place other than a Linux device driver (e.g. DT).
> 
> The hand-off semantic establishes an expectation that a driver will come
> along and claim ownership of the clk using standard Linux apis; we're
> just preserving the enabled state of the clock until that time.
> 
> I had a chat with Stephen Boyd about this yesterday and we discussed
> taking it even further: do not explicitly enable the clock, but instead
> simply refrain from disabling a clock that is both ON and has this flag
> set.

Doing so will prevent clk_disable_unused() from gating it, but if we
don't take a reference sibling clocks will be able to disable the
parent which will be fatal.

> It sounds like that would that work for ST, yes? Are you interested in
> using a flag (or a DT property) to enable an otherwise-gated clock, or
> simply insuring that bootloader-enabled and reset-enabled clocks are not
> spuriously turned off?

Clocks are ungated by the bootloader.

> > > If you mean to say, "this patch doesn't let me toss this data in
> > > Devicetree, a data orifice that is used by only a fraction of Linux
> > > kernel users" then you would be right.
> > 
> > A fraction of Linux kernel users, yes, but the majority (all?) of
> > the Clock Framework users do use DT.
> 
> At last count we had 5 architectures using ccf, I haven't counted in a
> while. x86 definitely does not use Devicetree. I have no clue if MIPS
> does. PowerPC and ARM-ish both do.

I believe that most of your users are ARM-ish.

> > > diff --git a/drivers/clk/qcom/gcc-apq8084.c b/drivers/clk/qcom/gcc-apq8084.c
> > > index 3563019..d2f5e5a 100644
> > > --- a/drivers/clk/qcom/gcc-apq8084.c
> > > +++ b/drivers/clk/qcom/gcc-apq8084.c
> > > @@ -1450,23 +1450,23 @@ static struct clk_branch gcc_blsp1_qup1_spi_apps_clk = {
> > >  static struct clk_branch gcc_blsp1_qup2_i2c_apps_clk = {
> > >         .halt_reg = 0x06c8,
> > >         .clkr = {
> > >                 .enable_reg = 0x06c8,
> > >                 .enable_mask = BIT(0),
> > >                 .hw.init = &(struct clk_init_data){
> > >                         .name = "gcc_blsp1_qup2_i2c_apps_clk",
> > >                         .parent_names = (const char *[]){
> > >                                 "blsp1_qup2_i2c_apps_clk_src",
> > >                         },
> > >                         .num_parents = 1,
> > > -                       .flags = CLK_SET_RATE_PARENT,
> > > +                       .flags = CLK_SET_RATE_PARENT | CLK_ENABLE_HAND_OFF,
> > >                         .ops = &clk_branch2_ops,
> > >                 },
> > >         },
> > >  };
> > 
> > Fair enough.  Obviously for anyone using Device Tree, this solution
> > makes it pretty difficult to partake.
> 
> QCOM is using Devicetree. I've covered how to make a clock-controller
> style binding before using QCOM's driver & binding as examples. Take a
> look here if you have some spare time:
> 
> http://lkml.kernel.org/r/<20150416192014.19585.9663@quantum>

Spare time, what's that?

> > > > What happens during disable() and unprepare()?
> > > 
> > > The reference counts go to zero. As I stated in my cover letter, I'll
> > > need to see evidence of a real use case where the "leave the clock on on
> > > when I call clk_disable, clk_unprepare and clk_put" behavior is
> > > warranted.
> > 
> > I can't say for sure (get-out clause), but I doubt we'd need that, as
> > this would only be required if a knowledgeable consumer existed
> > i.e. one which actually wanted to the disable critical clock.  On ST's
> > platforms I don't think there is a use-case for these clocks to ever
> > be gated, as the platform would be unrecoverable and require a reboot.
> 
> That's great. I suspected that behavior was not necessary at all.
> 
> Let's zero in on the technical concerns here:
> 
> 1) ST's flexgen binding should not get screwed over. So we'll need a DT
> wrapper around the flag

Great.

> 2) I would love feedback on whether you expect the flag/property to
> enable a disabled clock or if you merely want to keep an already-enabled
> clock from being disabled

For us, we only need the clock not to be turned off, either by
clk_disable_unused() or by drivers using critical clock siblings, but
as I'm striving for a generic approach, it would be hypocritical of me
to encourage not to cover all bases with this solution.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
