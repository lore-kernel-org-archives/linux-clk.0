Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Joachim Eastwood <manabian@gmail.com>,  sboyd@codeaurora.org
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1436651307-24098-2-git-send-email-manabian@gmail.com>
Cc: devicetree@vger.kernel.org, "Joachim Eastwood" <manabian@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <1436651307-24098-1-git-send-email-manabian@gmail.com>
 <1436651307-24098-2-git-send-email-manabian@gmail.com>
Message-ID: <20150811204127.31346.16729@quantum>
Subject: Re: [PATCH 1/2] clk: add lpc18xx creg clk driver
Date: Tue, 11 Aug 2015 13:41:27 -0700
List-ID: <linux-clk.vger.kernel.org>

Hi Joachim,

Quoting Joachim Eastwood (2015-07-11 14:48:26)
> +static void __init lpc18xx_creg_clk_init(struct device_node *np)
> +{
> +       const char *clk_32khz_parent;
> +       struct regmap *syscon;
> +
> +       syscon =3D syscon_node_to_regmap(np->parent);
> +       if (IS_ERR(syscon)) {
> +               pr_err("%s: syscon lookup failed\n", __func__);
> +               return;
> +       }
> +
> +       clk_32khz_parent =3D of_clk_get_parent_name(np, 0);
> +
> +       clk_creg[CREG_CLK_32KHZ] =3D
> +               clk_register_creg_clk(&clk_creg_clocks[CREG_CLK_32KHZ],
> +                                     &clk_32khz_parent, syscon);
> +
> +       clk_creg[CREG_CLK_1KHZ] =3D
> +               clk_register_creg_clk(&clk_creg_clocks[CREG_CLK_1KHZ],
> +                                     &clk_creg_clocks[CREG_CLK_32KHZ].na=
me,
> +                                     syscon);
> +
> +       of_clk_add_provider(np, of_clk_src_onecell_get, &clk_base_data);
> +}
> +CLK_OF_DECLARE(lpc18xx_creg_clk, "nxp,lpc1850-creg-clk", lpc18xx_creg_cl=
k_init);

I'll ask the same question that Stephen asked in your CCU/CGU driver
series: is it necessary to use CLK_OF_DECLARE here or can you use the
platform device model?

Thanks,
Mike
