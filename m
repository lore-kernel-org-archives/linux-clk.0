Return-Path: <manabian@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1432838508-5184-2-git-send-email-matthias.bgg@gmail.com>
References: <1432838508-5184-1-git-send-email-matthias.bgg@gmail.com>
	<1432838508-5184-2-git-send-email-matthias.bgg@gmail.com>
Date: Fri, 29 May 2015 08:57:55 +0200
Message-ID: <CAGhQ9VysJ4O2uOc4LxdN_bFY42fP=ugLp=Sh2rtFEaaavf3yOQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: mux: Add regmap support for simple mux
From: Joachim  Eastwood <manabian@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>,
	henryc.chen@mediatek.com, s.hauer@pengutronix.de, jamesjj.liao@mediatek.com,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Matthias,

On 28 May 2015 at 20:41, Matthias Brugger <matthias.bgg@gmail.com> wrote:
> Some devices like SoCs from Mediatek need to use the clock muxes
> through a regmap interface.
> This patch adds regmap support for simple the simple multiplexer
> clock code.

Nice to see regmap support. This something I would also like to see
added to the clk framework.
And if the approach is agreed upon I would like to see support on
gates and dividers also.

> +static void clk_mux_writel(struct clk_mux *mux, u32 val)
> +{
> +       if (mux->flags && CLK_MUX_USE_REGMAP)

Assume you mean &.

> +               regmap_write(mux->regmap, mux->offset, val);
> +       else
> +               clk_writel(val, mux->reg);
> +}
> +
> +static u32 clk_mux_readl(struct clk_mux *mux)
> +{
> +       u32 val;
> +
> +       if (mux->flags && CLK_MUX_USE_REGMAP)

And here.

> +               regmap_read(mux->regmap, mux->offset, &val);
> +       else
> +               val = clk_readl(mux->reg);
> +
> +       return val;
> +}
> +
[...]
> @@ -409,7 +410,9 @@ void clk_unregister_divider(struct clk *clk);
>  struct clk_mux {
>         struct clk_hw   hw;

>         void __iomem    *reg;
> +       struct regmap   *regmap;

Since it not possible to have both iomem and regmap at the same time.
Could this be put in a union or does that make registration more
difficult?

>         u32             *table;
> +       u32             offset;
>         u32             mask;
>         u8              shift;
>         u8              flags;


regards,
Joachim Eastwood
