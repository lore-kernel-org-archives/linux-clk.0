Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
 "Stephen Boyd" <sboyd@codeaurora.org>, "Chen-Yu Tsai" <wens@csie.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <20160629190535.11855-14-maxime.ripard@free-electrons.com>
Cc: linux-clk@vger.kernel.org, "Hans de Goede" <hdegoede@redhat.com>,
 "Boris Brezillon" <boris.brezillon@free-electrons.com>,
 "Rob Herring" <robh+dt@kernel.org>,
 "Vishnu Patekar" <vishnupatekar0510@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, "Jean-Francois Moine" <moinejf@free.fr>,
 "Maxime Ripard" <maxime.ripard@free-electrons.com>
References: <20160629190535.11855-1-maxime.ripard@free-electrons.com>
 <20160629190535.11855-14-maxime.ripard@free-electrons.com>
Message-ID: <146785878822.73491.15164592643568518865@resonance>
Subject: Re: [PATCH v3 13/14] clk: sunxi-ng: Add H3 clocks
Date: Wed, 06 Jul 2016 19:33:08 -0700
List-ID: <linux-clk.vger.kernel.org>

Hi Maxime,

Quoting Maxime Ripard (2016-06-29 12:05:34)
> +static void __init sun8i_h3_ccu_setup(struct device_node *node)
> +{
> +       void __iomem *reg;
> +       u32 val;
> +
> +       reg =3D of_io_request_and_map(node, 0, of_node_full_name(node));
> +       if (IS_ERR(reg)) {
> +               pr_err("%s: Could not map the clock registers\n",
> +                      of_node_full_name(node));
> +               return;
> +       }
> +
> +       /* Force the PLL-Audio-1x divider to 4 */
> +       val =3D readl(reg + SUN8I_H3_PLL_AUDIO_REG);
> +       val &=3D ~GENMASK(4, 0);
> +       writel(val | 3, reg + SUN8I_H3_PLL_AUDIO_REG);
> +
> +       sunxi_ccu_probe(node, reg, &sun8i_h3_ccu_desc);
> +}
> +CLK_OF_DECLARE(sun8i_h3_ccu, "allwinner,sun8i-h3-ccu",
> +              sun8i_h3_ccu_setup);

There are several examples of drivers that split the clocks between
"early" CLK_OF_DECLARE clocks and "late" module clocks. If you really
need early clocks (which is less likely on a 64-bit platform with
architected timers), it would be nice to pair that with a proper
platform_driver (using builtin_platform_driver most likely).

Otherwise that is my only nitpick with this series. Looks good!

Best regards,
Mike
