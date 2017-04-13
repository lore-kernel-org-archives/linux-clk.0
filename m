Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1491969809-20154-2-git-send-email-aisheng.dong@nxp.com>
References: <1491969809-20154-1-git-send-email-aisheng.dong@nxp.com> <1491969809-20154-2-git-send-email-aisheng.dong@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Apr 2017 21:56:31 +0200
Message-ID: <CAMuHMdXuuHmjWCrLa7r8xK=Dgad9Cz9C6xibJPRVud6aq4oHxQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] clk: add clk_bulk_get accessories
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: linux-clk <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>,
	Mark Brown <broonie@kernel.org>, yibin.gong@nxp.com,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, anson.huang@nxp.com,
	ping.bai@nxp.com, leonard.crestez@nxp.com, octavian.purdila@nxp.com
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Wed, Apr 12, 2017 at 6:03 AM, Dong Aisheng <aisheng.dong@nxp.com> wrote:
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -520,6 +520,23 @@ void clk_unprepare(struct clk *clk)
>  }
>  EXPORT_SYMBOL_GPL(clk_unprepare);
>
> +/**
> + * clk_bulk_unprepare - undo preparation of a bulk of clock sources
> + * @num_clks: the number of clk_bulk_data
> + * @clks: the clk_bulk_data table being ungated
> + *
> + * clk_bulk_unprepare may sleep, which differentiates it from clk_bulk_disable.
> + * Returns 0 on success, -EERROR otherwise.
> + */
> +void clk_bulk_unprepare(int num_clks, struct clk_bulk_data *clks)

unsigned int num_clks (everywhere)

> +{
> +       int i;

unsigned int i (everywhere)

> +
> +       for (i = 0; i < num_clks; i++)
> +               clk_unprepare(clks[i].clk);
> +}
> +EXPORT_SYMBOL_GPL(clk_bulk_unprepare);

This does mean you have to change your "while (--i >= 0)" loops.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
