Return-Path: <jagan@amarulasolutions.com>
MIME-Version: 1.0
References: <20180927114850.24565-1-jagan@amarulasolutions.com>
 <20180927114850.24565-5-jagan@amarulasolutions.com> <CAGb2v66No3-AODYCCGifBrm9uvPjaNdR2W5MDQdazRAPomT9CQ@mail.gmail.com>
In-Reply-To: <CAGb2v66No3-AODYCCGifBrm9uvPjaNdR2W5MDQdazRAPomT9CQ@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 27 Sep 2018 19:14:23 +0530
Message-ID: <CAMty3ZBUQKVLJsmkU=hjaO_O5bhetDfAh9-7iLkUqOznVc0KyA@mail.gmail.com>
Subject: Re: [PATCH 04/12] drm/sun4i: sun6i_mipi_dsi: Enable missing DSI bus clock
To: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Icenowy Zheng <icenowy@aosc.io>,
	Jernej Skrabec <jernej.skrabec@siol.net>, Vasily Khoruzhick <anarsoul@gmail.com>,
	Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
	David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
	linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Thu, Sep 27, 2018 at 6:13 PM Chen-Yu Tsai <wens@csie.org> wrote:
>
> Hi,
>
> On Thu, Sep 27, 2018 at 7:49 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >
> > DSI bus_clk is already available in sun6i_dsi but missed to
> > get the clk and process for enable/disable.
> >
> > This patch add support for it.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > index 8e9c76febca2..156b371243c6 100644
> > --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > @@ -1004,6 +1004,12 @@ static int sun6i_dsi_probe(struct platform_device *pdev)
> >                 return PTR_ERR(dsi->reset);
> >         }
> >
> > +       dsi->bus_clk = devm_clk_get(dev, "bus");
> > +       if (IS_ERR(dsi->bus_clk)) {
> > +               dev_err(dev, "Couldn't get the DSI bus clock\n");
> > +               return PTR_ERR(dsi->bus_clk);
> > +       }
> > +
>
> The DSI driver uses devm_regmap_init_mmio_clk, which enables the
> clock behind the scenes when regmap access needs it enabled.
>
> Did you have any issues without this patch?

I'm unable to read register values via devmem, I see all 0's for all
dsi reg space.
