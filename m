Return-Path: <dongas86@gmail.com>
Return-Path: <dongas86@gmail.com>
Date: Thu, 13 Apr 2017 22:02:25 +0800
From: Dong Aisheng <dongas86@gmail.com>
To: Leonard Crestez <leonard.crestez@nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
	broonie@kernel.org, yibin.gong@nxp.com, rjw@rjwysocki.net,
	viresh.kumar@linaro.org, mturquette@baylibre.com,
	sboyd@codeaurora.org, shawnguo@kernel.org, fabio.estevam@nxp.com,
	anson.huang@nxp.com, ping.bai@nxp.com, octavian.purdila@nxp.com,
	linux-clk@vger.kernel.org
Subject: Re: [RFC PATCH 1/3] clk: add clk_bulk_get accessories
Message-ID: <20170413140225.GB24254@b29396-OptiPlex-7040>
References: <1491969809-20154-1-git-send-email-aisheng.dong@nxp.com>
 <1491969809-20154-2-git-send-email-aisheng.dong@nxp.com>
 <1491931159.31718.16.camel@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <1491931159.31718.16.camel@nxp.com>
List-ID: <linux-clk.vger.kernel.org>

On Tue, Apr 11, 2017 at 08:19:19PM +0300, Leonard Crestez wrote:
> On Wed, 2017-04-12 at 12:03 +0800, Dong Aisheng wrote:
> > +/**
> > + * clk_bulk_enable - ungate a bulk of clocks
> > + * @num_clks: the number of clk_bulk_data
> > + * @clks: the clk_bulk_data table being ungated
> > + *
> > + * clk_bulk_enable must not sleep
> > + * Returns 0 on success, -EERROR otherwise.
> > + */
> > +int clk_bulk_enable(int num_clks, struct clk_bulk_data *clks)
> > +{
> > +       int ret;
> > +       int i;
> > +
> > +       for (i = 0; i < num_clks; i++) {
> > +               ret = clk_enable(clks[i].clk);
> > +               if (ret) {
> > +                       pr_err("Failed to enable clk '%s': %d\n",
> > +                               clks[i].id, ret);
> > +                       goto err;
> > +               }
> > +       }
> > +
> > +       return 0;
> > +
> > +err:
> > +       while (--i >= 0)
> > +               clk_put(clks[i].clk);
> 
> Shouldn't this be clk_disable?
> 

Good catch!
Will change in the formal version if Maintainer accepts this idea.

> And you can probably use clk_bulk_disable(i, clks) instead

Probably i'd prefer keep clk_disable to match with clk_enable
to make things more clear.

Thanks

Regards
Dong Aisheng
