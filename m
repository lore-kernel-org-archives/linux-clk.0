Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Lee Jones <lee.jones@linaro.org>, 
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <20150810144811.GN3249@x1>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, sboyd@codeaurora.org,
 maxime.ripard@free-electrons.com, s.hauer@pengutronix.de,
 geert@linux-m68k.org
References: <1438974570-20812-1-git-send-email-mturquette@baylibre.com>
 <1438974570-20812-4-git-send-email-mturquette@baylibre.com>
 <20150810144811.GN3249@x1>
Message-ID: <20150810185516.2416.32293@quantum>
Subject: Re: [PATCH RFC RFT 3/3] clk: introduce CLK_ENABLE_HAND_OFF flag
Date: Mon, 10 Aug 2015 11:55:16 -0700
List-ID: <linux-clk.vger.kernel.org>

Hi Lee,

Quoting Lee Jones (2015-08-10 07:48:11)
> On Fri, 07 Aug 2015, Michael Turquette wrote:
> =

> > Some clocks are critical to system operation (e.g. cpu, memory, etc) and
> > should not be gated until a driver that knows best claims such a clock
> > and expressly gates that clock through the normal clk.h api.
> > =

> > The typical way to handle this is for the clk driver or some other early
> > code to call clk_prepare_enable on this important clock as soon as it is
> > registered and before the clk_disable_unused garbage collector kicks in.
> > =

> > This patch introduces a formal way to handle this scenario that is
> > provided by the clk framework. Clk driver authors can set the
> > CLK_ENABLE_HAND_OFF flag in their clk data, which will cause the clk to
> > be enabled in clk_register(). =

> =

> Doesn't this patch put as right back at square one?  We still require
> each of the clock providers to know which of its clocks are critical
> on any given platform.  Only this time we're setting a flag as opposed
> to actually enabling the clock.  The code for doing so will still be
> little per-vendor hand-rolled chunks scattered all over the subsystem.

This is conceptually analogous to what your "ARM: sti: stih410-clocks:
Identify critical clocks" patch does. In that patch you mark-up the
critical clocks within the *provider* node.

My patch puts that data in the clock *provider* driver, where it
belongs.

ST's driver is an unfortunate case. All of the clock data was shoved
into DT before we had a clue that doing so is a terrible idea.
Thankfully such platforms are a minority. For the sane clock driver,
with static clock data in the kernel source, it is trivial to set the
CLK_ENABLE_HAND_OFF flag for a given clock.

All that hand-wavey crap about "little per-vendor hand-rolled chunks
scattered all over the system" is FUD and a waste of everyone's time.

> =

> Mitigating this was the whole point of my critical clocks set.  It
> appears we're not solving the problem here at all.

This series is solving the following problems:

1) enabling specified clocks at boot
2) preventing those clocks from being gated by clk_disable_unused
3) gracefully handing off the reference counts to clock consumer drivers
4) not bastardizing the clk.h api or otherwise making an ugly mess of
things

If you mean to say, "this patch doesn't let me toss this data in
Devicetree, a data orifice that is used by only a fraction of Linux
kernel users" then you would be right. Here is a diff of how to do this
with a sane clock driver:

diff --git a/drivers/clk/qcom/gcc-apq8084.c b/drivers/clk/qcom/gcc-apq8084.c
index 3563019..d2f5e5a 100644
--- a/drivers/clk/qcom/gcc-apq8084.c
+++ b/drivers/clk/qcom/gcc-apq8084.c
@@ -1450,23 +1450,23 @@ static struct clk_branch gcc_blsp1_qup1_spi_apps_cl=
k =3D {
 static struct clk_branch gcc_blsp1_qup2_i2c_apps_clk =3D {
        .halt_reg =3D 0x06c8,
        .clkr =3D {
                .enable_reg =3D 0x06c8,
                .enable_mask =3D BIT(0),
                .hw.init =3D &(struct clk_init_data){
                        .name =3D "gcc_blsp1_qup2_i2c_apps_clk",
                        .parent_names =3D (const char *[]){
                                "blsp1_qup2_i2c_apps_clk_src",
                        },
                        .num_parents =3D 1,
-                       .flags =3D CLK_SET_RATE_PARENT,
+                       .flags =3D CLK_SET_RATE_PARENT | CLK_ENABLE_HAND_OF=
F,
                        .ops =3D &clk_branch2_ops,
                },
        },
 };

The real problem that has been informing all of your design decisions is
that you are hacking on a platform that uses Devicetree as a data-driven
interface to the kernel, which it most certainly is not.  We're are not
tossing SoC RTL in there after all, nor replicating the register map
from a reference manual. The data that your clock provider uses to build
up its contribution to the system-wide clock tree belongs in your Linux
device driver.

Devicetree is most useful in creating connections between providers and
consumers of these resources, not in defining the resource itself.

> =

> > Then when the first clk consumer driver
> > comes along and calls clk_get() & clk_prepare_enable(), the reference
> > counts taken during clk registration are transfered (or handed off) to
> > the clk consumer.
> > =

> > At this point handling the clk is the same as any other clock which as
> > not set the new CLK_ENABLE_HAND_OFF flag. In fact no changes to any
> > clock consumer driver are needed for this to work.
> > =

> > Signed-off-by: Michael Turquette <mturquette@baylibre.com>
> > ---
> >  drivers/clk/clk.c            | 61 ++++++++++++++++++++++++++++++++++++=
+++++---
> >  include/linux/clk-provider.h |  3 +++
> >  2 files changed, 60 insertions(+), 4 deletions(-)
> > =

> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > index 6ec0f77..a3fdeab 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -59,6 +59,8 @@ struct clk_core {
> >       unsigned long           flags;
> >       unsigned int            enable_count;
> >       unsigned int            prepare_count;
> > +     bool                    need_handoff_enable;
> > +     bool                    need_handoff_prepare;
> >       unsigned long           min_rate;
> >       unsigned long           max_rate;
> >       unsigned long           accuracy;
> > @@ -656,16 +658,31 @@ static int clk_core_prepare(struct clk_core *core)
> >   */
> >  int clk_prepare(struct clk *clk)
> >  {
> > -     int ret;
> > +     int ret =3D 0;
> >  =

> >       if (!clk)
> >               return 0;
> >  =

> >       clk_prepare_lock();
> >       clk->prepare_count++;
> > +
> > +     /*
> > +      * setting CLK_ENABLE_HAND_OFF flag triggers this conditional
> > +      *
> > +      * need_handoff_prepare implies this clk was already prepared by
> > +      * __clk_init. now we have a proper user, so unset the flag in our
> > +      * internal bookkeeping. See CLK_ENABLE_HAND_OFF flag in clk-prov=
ider.h
> > +      * for details.
> > +      */
> > +     if (clk->core->need_handoff_prepare) {
> > +             clk->core->need_handoff_prepare =3D false;
> > +             goto out;
> > +     }
> > +
> >       ret =3D clk_core_prepare(clk->core);
> > -     clk_prepare_unlock();
> >  =

> > +out:
> > +     clk_prepare_unlock();
> >       return ret;
> >  }
> >  EXPORT_SYMBOL_GPL(clk_prepare);
> > @@ -772,16 +789,31 @@ static int clk_core_enable(struct clk_core *core)
> >  int clk_enable(struct clk *clk)
> >  {
> >       unsigned long flags;
> > -     int ret;
> > +     int ret =3D 0;
> >  =

> >       if (!clk)
> >               return 0;
> >  =

> >       flags =3D clk_enable_lock();
> >       clk->enable_count++;
> =

> This insinuates that we now have two users.  Same goes for the prepare
> count.

Wrong. After this statement struct clk.enable_count will be 1. Remember
that we have a struct clk.enable_count as well as a struct
clk_core.enable_count.

The former is set here in clk_enable() which is ONLY called by clock
consumer drivers (though the clk.h api). The latter is used within the
framework during __clk_init() with a call to clk_core_enable() if the
CLK_ENABLE_HAND_OFF flag is detected.

> =

> What happens during disable() and unprepare()?

The reference counts go to zero. As I stated in my cover letter, I'll
need to see evidence of a real use case where the "leave the clock on on
when I call clk_disable, clk_unprepare and clk_put" behavior is
warranted.

In fact it would be trivial to add that behavior to this code, but I'm
not going to over-engineer this for a hypothetical use case.

Regards,
Mike

> =

> > +     /*
> > +      * setting CLK_ENABLE_HAND_OFF flag triggers this conditional
> > +      *
> > +      * need_handoff_enable implies this clk was already enabled by
> > +      * __clk_init. now we have a proper user, so unset the flag in our
> > +      * internal bookkeeping. See CLK_ENABLE_HAND_OFF flag in clk-prov=
ider.h
> > +      * for details.
> > +      */
> > +     if (clk->core->need_handoff_enable) {
> > +             clk->core->need_handoff_enable =3D false;
> > +             goto out;
> > +     }
> > +
> >       ret =3D clk_core_enable(clk->core);
> > -     clk_enable_unlock(flags);
> >  =

> > +out:
> > +     clk_enable_unlock(flags);
> >       return ret;
> >  }
> >  EXPORT_SYMBOL_GPL(clk_enable);
> > @@ -2447,6 +2479,27 @@ static int __clk_init(struct device *dev, struct=
 clk *clk_user)
> >       if (core->ops->init)
> >               core->ops->init(core->hw);
> >  =

> > +     /*
> > +      * enable clocks with the CLK_ENABLE_HAND_OFF flag set
> > +      *
> > +      * This flag causes the framework to enable the clock at registra=
tion
> > +      * time, which is sometimes necessary for clocks that would cause=
 a
> > +      * system crash when gated (e.g. cpu, memory, etc). The prepare_c=
ount
> > +      * is migrated over to the first clk consumer to call clk_prepare=
().
> > +      * Similarly the clk's enable_count is migrated to the first cons=
umer
> > +      * to call clk_enable().
> > +      */
> > +     if (core->flags & CLK_ENABLE_HAND_OFF) {
> > +             core->need_handoff_prepare =3D true;
> > +             core->need_handoff_enable =3D true;
> > +             ret =3D clk_core_prepare(core);
> > +             if (ret)
> > +                     goto out;
> > +             clk_core_enable(core);
> > +             if (ret)
> > +                     goto out;
> > +     }
> > +
> >       kref_init(&core->ref);
> >  out:
> >       clk_prepare_unlock();
> > diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> > index 06a56e5..0230900 100644
> > --- a/include/linux/clk-provider.h
> > +++ b/include/linux/clk-provider.h
> > @@ -31,6 +31,9 @@
> >  #define CLK_SET_RATE_NO_REPARENT BIT(7) /* don't re-parent on rate cha=
nge */
> >  #define CLK_GET_ACCURACY_NOCACHE BIT(8) /* do not use the cached clk a=
ccuracy */
> >  #define CLK_RECALC_NEW_RATES BIT(9) /* recalc rates after notification=
s */
> > +#define CLK_ENABLE_HAND_OFF  BIT(10) /* enable clock when registered.
> > +                                        hand-off enable_count & prepar=
e_count
> > +                                        to first consumer that enables=
 clk */
> >  =

> >  struct clk;
> >  struct clk_hw;
> =

> -- =

> Lee Jones
> Linaro STMicroelectronics Landing Team Lead
> Linaro.org =E2=94=82 Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog
