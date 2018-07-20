Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
References: <1531924476-23261-1-git-send-email-phil.edworthy@renesas.com>
 <CAMuHMdVEgj7kJFxNuR8w468FoGRaP_mEDv6JqB_7deuQjsed_Q@mail.gmail.com>
 <TY1PR01MB1769588F9C53755C0FD56D98F5510@TY1PR01MB1769.jpnprd01.prod.outlook.com>
 <CAMuHMdWqdg9KV4h_U-VZGVdOL6upUpDgqO7kwQh8tFQjDFh-Ug@mail.gmail.com> <TY1PR01MB17697FBCBDC6296E7B2589C9F5510@TY1PR01MB1769.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB17697FBCBDC6296E7B2589C9F5510@TY1PR01MB1769.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Jul 2018 14:41:20 +0200
Message-ID: <CAMuHMdVMGWWcFZvjgBWZAabxWXdtBeH4XLYaXZVkQ=rOaeCH0g@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a06g032: Avoid needless probe deferring
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Simon Horman <horms@verge.net.au>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Phil,

On Fri, Jul 20, 2018 at 2:26 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> On 20 July 2018 13:12, Geert Uytterhoeven wrote:
> > On Fri, Jul 20, 2018 at 2:06 PM Phil Edworthy  wrote:
> > > On 20 July 2018 12:21, Geert Uytterhoeven wrote:
> > > > On Wed, Jul 18, 2018 at 4:34 PM Phil Edworthy wrote:
> > > > > To avoid all SoC peripheral drivers deferring their probes, both
> > > > > clock and pinctrl drivers should already be probed. Since the
> > > > > pinctrl driver requires a clock to access the registers, the clock
> > > > > driver should be probed before the pinctrl driver.
> > > > >
> > > > > Therefore, move the clock driver from subsys_initcall to core_initcall.
> > > > >
> > > > > Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> > > >
> > > > Thanks for your patch!
> > > Thanks for your review!
> > >
> > > > The (not yet upstreamed) pinctrl driver uses postcore_initcall(), right?
> > > No, the pinctrl driver uses subsys_initcall, but postcore_initcall or
> > > arch_initcall may be better to make it clear about the dependencies.
> >
> > if the pinctrl driver uses subsys_initcall(), ...

> > > > > -subsys_initcall(r9a06g032_clocks_init);
> > > > > +core_initcall(r9a06g032_clocks_init);
> >
> > ... using postcore_initcall() or arch_initcall() here, should work with
> > platform_driver_probe()?
> Nope, you have to use platform_driver_register() for DT based drivers.
> subsys_initcall is the earliest you can use platform_driver_probe().

So drivers/misc/atmel_tclib.c and drivers/pinctrl/pinctrl-coh901.c, which
use arch_initcall(), cannot work?

If that is really true, you can still use subsys_initcall() in the clock driver,
and subsys_initcall_sync() in the pinctrl driver.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
