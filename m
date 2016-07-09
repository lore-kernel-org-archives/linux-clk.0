Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Maxime Ripard <maxime.ripard@free-electrons.com>, 
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <20160708213506.GD4522@lukather>
Cc: "Stephen Boyd" <sboyd@codeaurora.org>, "Chen-Yu Tsai" <wens@csie.org>,
 linux-clk@vger.kernel.org, "Hans de Goede" <hdegoede@redhat.com>,
 "Boris Brezillon" <boris.brezillon@free-electrons.com>,
 "Rob Herring" <robh+dt@kernel.org>,
 "Vishnu Patekar" <vishnupatekar0510@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, "Jean-Francois Moine" <moinejf@free.fr>
References: <20160629190535.11855-1-maxime.ripard@free-electrons.com>
 <20160629190535.11855-14-maxime.ripard@free-electrons.com>
 <146785878822.73491.15164592643568518865@resonance>
 <20160708213506.GD4522@lukather>
Message-ID: <146802703641.73491.4992163597821488987@resonance>
Subject: Re: [PATCH v3 13/14] clk: sunxi-ng: Add H3 clocks
Date: Fri, 08 Jul 2016 18:17:16 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Maxime Ripard (2016-07-08 14:35:06)
> Hi Mike,
> =

> On Wed, Jul 06, 2016 at 07:33:08PM -0700, Michael Turquette wrote:
> > Hi Maxime,
> > =

> > Quoting Maxime Ripard (2016-06-29 12:05:34)
> > > +static void __init sun8i_h3_ccu_setup(struct device_node *node)
> > > +{
> > > +       void __iomem *reg;
> > > +       u32 val;
> > > +
> > > +       reg =3D of_io_request_and_map(node, 0, of_node_full_name(node=
));
> > > +       if (IS_ERR(reg)) {
> > > +               pr_err("%s: Could not map the clock registers\n",
> > > +                      of_node_full_name(node));
> > > +               return;
> > > +       }
> > > +
> > > +       /* Force the PLL-Audio-1x divider to 4 */
> > > +       val =3D readl(reg + SUN8I_H3_PLL_AUDIO_REG);
> > > +       val &=3D ~GENMASK(4, 0);
> > > +       writel(val | 3, reg + SUN8I_H3_PLL_AUDIO_REG);
> > > +
> > > +       sunxi_ccu_probe(node, reg, &sun8i_h3_ccu_desc);
> > > +}
> > > +CLK_OF_DECLARE(sun8i_h3_ccu, "allwinner,sun8i-h3-ccu",
> > > +              sun8i_h3_ccu_setup);
> > =

> > There are several examples of drivers that split the clocks between
> > "early" CLK_OF_DECLARE clocks and "late" module clocks. If you really
> > need early clocks (which is less likely on a 64-bit platform with
> > architected timers), it would be nice to pair that with a proper
> > platform_driver (using builtin_platform_driver most likely).
> =

> I think we discussed that already, but yeah, we do have timers that
> are not the architected ones (and this is a ARMv7 platform). I have
> the feeling that splitting the two doesn't really bring any benefit,
> but complexify a lot the driver.

Cool. I've pushed patches 1-13 to the clk tree under a shared, immutable
branch: clk-sunxi-ng

I've merged this branch into clk-next to get some soak testing.

I did not merge patch #14. Feel free to add my reviewed-by to that
patch.

Were you going to spin another version? If so I can replace v3 with v4
when it is ready. Thanks again for your hard work on this! Very happy to
see the binding be reworked :-)

Regards,
Mike

> =

> Maxime
> =

> -- =

> Maxime Ripard, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
