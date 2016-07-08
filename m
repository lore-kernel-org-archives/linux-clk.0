Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 "Russell King - ARM Linux" <linux@armlinux.org.uk>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <8760shgfzu.wl%kuninori.morimoto.gx@renesas.com>
Cc: "Rob Herring" <robh@kernel.org>, "Mark Brown" <broonie@kernel.org>,
 "Linux-Kernel" <linux-kernel@vger.kernel.org>,
 "Linux-DT" <devicetree@vger.kernel.org>,
 "Linux-ARM" <linux-arm-kernel@lists.infradead.org>,
 "Linux-ALSA" <alsa-devel@alsa-project.org>, linux-clk@vger.kernel.org
References: <87wpl2yyuw.wl%kuninori.morimoto.gx@renesas.com>
 <146785219147.73491.2827268663638530377@resonance>
 <87ziptixv7.wl%kuninori.morimoto.gx@renesas.com>
 <20160707122636.GP1041@n2100.armlinux.org.uk>
 <8760shgfzu.wl%kuninori.morimoto.gx@renesas.com>
Message-ID: <146794140875.73491.7115209079607438738@resonance>
Subject: Re: [PATCH v2] clkdev: add devm_of_clk_get()
Date: Thu, 07 Jul 2016 18:30:09 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Kuninori Morimoto (2016-07-07 17:03:00)
> =

> Hi Russell
> =

> > > > > +struct clk *devm_of_clk_get(struct device *dev,
> > > > > +                           struct device_node *np, int index)
> > > > =

> > > > Any reason not to use devm_clk_get? Why do we need this helper?
> > > =

> > > Because of_clk_get() can parse "clocks", "#clock-cells" on DT.
> > =

> > clk_get() should also work just fine.  clk_get() uses
> > __of_clk_get_by_name() internally, which uses "clock-names" to
> > locate the index if a connection id is given.  of_clk_get() allows
> > lookup of a clock by index only, omitting the name, which means
> > you need to coordinate the order of clocks in DT with the order
> > that the driver wants... which sounds error prone to me.
> =

> Thanks.
> =

> But, I have 1 issue on [devm_]clk_get().
> It can't select device_node on [devm_]clk_get(), it uses dev->of_node dir=
ectly.
> =

> struct clk *clk_get(struct device *dev, const char *con_id)
> {
>         ...
>         if (dev) {
>                 clk =3D __of_clk_get_by_name(dev->of_node, dev_id, con_id=
);
>                                            ~~~~~~~~~~~~
>                 ...
>         }
> }
> =

> I would like to select specific device_node.

Do you have access to the struct device that you want to target? Can you
pass that device into either clk_get or devm_clk_get?

Regards,
Mike

> =

>         sound_soc {
>                 ...
>                 cpu {
>                         ...
> =3D>                      clocks =3D <&xxx>;
>                 };
> =

>                 codec {
>                         ...
> =3D>                      clocks =3D <&xxx>;
>                 };
>         };
> =

> But, of_clk_get_by_name() / of_clk_get() doesn't have devm_xxx version
