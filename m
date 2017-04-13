Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1491931159.31718.16.camel@nxp.com>
References: <1491969809-20154-1-git-send-email-aisheng.dong@nxp.com>
 <1491969809-20154-2-git-send-email-aisheng.dong@nxp.com> <1491931159.31718.16.camel@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Apr 2017 21:57:46 +0200
Message-ID: <CAMuHMdUpi9rSUNkoEvFWpN-TB0xaYKKrZLy2wO2eOAoig1c56w@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] clk: add clk_bulk_get accessories
To: Leonard Crestez <leonard.crestez@nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>,
	Mark Brown <broonie@kernel.org>, yibin.gong@nxp.com,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, anson.huang@nxp.com,
	ping.bai@nxp.com, octavian.purdila@nxp.com,
	linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Tue, Apr 11, 2017 at 7:19 PM, Leonard Crestez
<leonard.crestez@nxp.com> wrote:
> On Wed, 2017-04-12 at 12:03 +0800, Dong Aisheng wrote:
>> +/**
>> + * clk_bulk_enable - ungate a bulk of clocks
>> + * @num_clks: the number of clk_bulk_data
>> + * @clks: the clk_bulk_data table being ungated
>> + *
>> + * clk_bulk_enable must not sleep
>> + * Returns 0 on success, -EERROR otherwise.
>> + */
>> +int clk_bulk_enable(int num_clks, struct clk_bulk_data *clks)
>> +{
>> +       int ret;
>> +       int i;
>> +
>> +       for (i = 0; i < num_clks; i++) {
>> +               ret = clk_enable(clks[i].clk);
>> +               if (ret) {
>> +                       pr_err("Failed to enable clk '%s': %d\n",
>> +                               clks[i].id, ret);
>> +                       goto err;
>> +               }
>> +       }
>> +
>> +       return 0;
>> +
>> +err:
>> +       while (--i >= 0)
>> +               clk_put(clks[i].clk);
>
> Shouldn't this be clk_disable?
>
> And you can probably use clk_bulk_disable(i, clks) instead

To avoid nasty surprises, clk_bulk_disable() should loop over all clocks
in reverse order.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
