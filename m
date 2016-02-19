Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Joshua Henderson <joshua.henderson@microchip.com>,
 linux-kernel@vger.kernel.org
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1455899179-14097-3-git-send-email-joshua.henderson@microchip.com>
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org,
 "Purna Chandra Mandal" <purna.mandal@microchip.com>,
 "Joshua Henderson" <joshua.henderson@microchip.com>,
 "Stephen Boyd" <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
References: <1455899179-14097-1-git-send-email-joshua.henderson@microchip.com>
 <1455899179-14097-3-git-send-email-joshua.henderson@microchip.com>
Message-ID: <20160219201615.2278.2909@quark.deferred.io>
Subject: Re: [PATCH v7 2/3] clk: clk-pic32: Add PIC32 clock driver
Date: Fri, 19 Feb 2016 12:16:15 -0800
List-ID: <linux-clk.vger.kernel.org>

Quoting Joshua Henderson (2016-02-19 08:25:35)
> +const struct clk_ops pic32_roclk_ops =3D {
> +       .enable                 =3D roclk_enable,
> +       .disable                =3D roclk_disable,
> +       .is_enabled             =3D roclk_is_enabled,
> +       .get_parent             =3D roclk_get_parent,
> +       .set_parent             =3D roclk_set_parent,
> +       .determine_rate         =3D roclk_determine_rate,
> +       .recalc_rate            =3D roclk_recalc_rate,
> +       .round_rate             =3D roclk_round_rate,
> +       .set_rate_and_parent    =3D roclk_set_rate_and_parent,
> +       .set_rate               =3D roclk_set_rate,
> +       .init                   =3D roclk_init,
> +};

You can remove .round_rate and only use .determine_rate.

...
> +CLK_OF_DECLARE(pic32mzda_clk, "microchip,pic32mzda-clk", pic32mzda_clock=
_init);

Can you make this a platform_driver instead of using CLK_OF_DECLARE? I
asked this in v6 but there was no response.

Regards,
Mike

> -- =

> 1.7.9.5
>=20
