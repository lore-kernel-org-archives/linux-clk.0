Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-ed1-f68.google.com ([209.85.208.68]:40656 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727262AbeI0Ufk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Sep 2018 16:35:40 -0400
MIME-Version: 1.0
References: <20180927114850.24565-1-jagan@amarulasolutions.com>
 <20180927114850.24565-5-jagan@amarulasolutions.com> <CAGb2v66No3-AODYCCGifBrm9uvPjaNdR2W5MDQdazRAPomT9CQ@mail.gmail.com>
 <CAMty3ZBUQKVLJsmkU=hjaO_O5bhetDfAh9-7iLkUqOznVc0KyA@mail.gmail.com>
In-Reply-To: <CAMty3ZBUQKVLJsmkU=hjaO_O5bhetDfAh9-7iLkUqOznVc0KyA@mail.gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 27 Sep 2018 22:16:56 +0800
Message-ID: <CAGb2v67pKgORe7uo6r6F+xaVi=Q-p6_DKotZJD7P=46Z=4RhEA@mail.gmail.com>
Subject: Re: [linux-sunxi] Re: [PATCH 04/12] drm/sun4i: sun6i_mipi_dsi: Enable
 missing DSI bus clock
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
        Icenowy Zheng <icenowy@aosc.io>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Vasily Khoruzhick <anarsoul@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, Sep 27, 2018 at 9:44 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> On Thu, Sep 27, 2018 at 6:13 PM Chen-Yu Tsai <wens@csie.org> wrote:
> >
> > Hi,
> >
> > On Thu, Sep 27, 2018 at 7:49 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> > >
> > > DSI bus_clk is already available in sun6i_dsi but missed to
> > > get the clk and process for enable/disable.
> > >
> > > This patch add support for it.
> > >
> > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > ---
> > >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > > index 8e9c76febca2..156b371243c6 100644
> > > --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > > +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > > @@ -1004,6 +1004,12 @@ static int sun6i_dsi_probe(struct platform_device *pdev)
> > >                 return PTR_ERR(dsi->reset);
> > >         }
> > >
> > > +       dsi->bus_clk = devm_clk_get(dev, "bus");
> > > +       if (IS_ERR(dsi->bus_clk)) {
> > > +               dev_err(dev, "Couldn't get the DSI bus clock\n");
> > > +               return PTR_ERR(dsi->bus_clk);
> > > +       }
> > > +
> >
> > The DSI driver uses devm_regmap_init_mmio_clk, which enables the
> > clock behind the scenes when regmap access needs it enabled.
> >
> > Did you have any issues without this patch?
>
> I'm unable to read register values via devmem, I see all 0's for all
> dsi reg space.

Well that is to be expected given how mmio with clk regmap works.
Did you encounter any other problems besides this?

FYI you can dump regmap contents using /sys/kernel/debug/regmap/*/registers

ChenYu
