Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1494252233-21074-2-git-send-email-aisheng.dong@nxp.com>
References: <1494252233-21074-1-git-send-email-aisheng.dong@nxp.com> <1494252233-21074-2-git-send-email-aisheng.dong@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 May 2017 17:08:46 +0200
Message-ID: <CAMuHMdVDOor0E2cjEKO+=Pm+1MGO4BibGTdULPvPKd390fTxuw@mail.gmail.com>
Subject: Re: [PATCH V2 1/3] clk: add clk_bulk_get accessories
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: linux-clk <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>,
	Mark Brown <broonie@kernel.org>, yibin.gong@nxp.com,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, anson.huang@nxp.com,
	ping.bai@nxp.com, Leonard Crestez <leonard.crestez@nxp.com>, octavian.purdila@nxp.com,
	Russell King <linux@armlinux.org.uk>, Florian Fainelli <f.fainelli@gmail.com>,
	Russell King <linux@arm.linux.org.uk>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Dong,

On Mon, May 8, 2017 at 4:03 PM, Dong Aisheng <aisheng.dong@nxp.com> wrote:
> --- /dev/null
> +++ b/drivers/clk/clk-bulk.c
> @@ -0,0 +1,165 @@

> +int __must_check clk_bulk_get(struct device *dev, int num_clks,
> +                             struct clk_bulk_data *clks)
> +{
> +       int ret;
> +       int i;
> +
> +       for (i = 0; i < num_clks; i++)
> +               clks[i].clk = NULL;
> +
> +       for (i = 0; i < num_clks; i++) {
> +               clks[i].clk = clk_get(dev, clks[i].id);
> +               if (IS_ERR(clks[i].clk)) {
> +                       ret = PTR_ERR(clks[i].clk);
> +                       dev_err(dev, "Failed to get clk '%s': %d\n",
> +                               clks[i].id, ret);
> +                       clks[i].clk = NULL;
> +                       goto err;
> +               }
> +       }
> +
> +       return 0;
> +
> +err:
> +       while (--i >= 0)
> +               clk_put(clks[i].clk);

These are released in inverse order, which is good.

> +
> +       return ret;
> +}
> +EXPORT_SYMBOL(clk_bulk_get);
> +
> +void clk_bulk_put(int num_clks, struct clk_bulk_data *clks)
> +{
> +       int i;
> +
> +       for (i = 0; i < num_clks; i++) {
> +               clk_put(clks[i].clk);
> +               clks[i].clk = NULL;

These aren't.

Typically resources are released in the inverse order. Not doing so may
cause subtle issues.

I can't come up with an example. but I'm quite sure the real world will find
one soon ;-)

The same is true for enable vs. disable, and prepare vs. unprepare.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
