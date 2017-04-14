Return-Path: <dongas86@gmail.com>
Return-Path: <dongas86@gmail.com>
Date: Sat, 15 Apr 2017 00:14:55 +0800
From: Dong Aisheng <dongas86@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	linux-clk <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Sascha Hauer <kernel@pengutronix.de>,
	Mark Brown <broonie@kernel.org>, yibin.gong@nxp.com,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <fabio.estevam@nxp.com>, anson.huang@nxp.com,
	ping.bai@nxp.com, leonard.crestez@nxp.com, octavian.purdila@nxp.com
Subject: Re: [RFC PATCH 1/3] clk: add clk_bulk_get accessories
Message-ID: <20170414161455.GE1792@b29396-OptiPlex-7040>
References: <1491969809-20154-1-git-send-email-aisheng.dong@nxp.com>
 <1491969809-20154-2-git-send-email-aisheng.dong@nxp.com>
 <CAMuHMdXuuHmjWCrLa7r8xK=Dgad9Cz9C6xibJPRVud6aq4oHxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAMuHMdXuuHmjWCrLa7r8xK=Dgad9Cz9C6xibJPRVud6aq4oHxQ@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

Hi Geert,

On Thu, Apr 13, 2017 at 09:56:31PM +0200, Geert Uytterhoeven wrote:
> On Wed, Apr 12, 2017 at 6:03 AM, Dong Aisheng <aisheng.dong@nxp.com> wrote:
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -520,6 +520,23 @@ void clk_unprepare(struct clk *clk)
> >  }
> >  EXPORT_SYMBOL_GPL(clk_unprepare);
> >
> > +/**
> > + * clk_bulk_unprepare - undo preparation of a bulk of clock sources
> > + * @num_clks: the number of clk_bulk_data
> > + * @clks: the clk_bulk_data table being ungated
> > + *
> > + * clk_bulk_unprepare may sleep, which differentiates it from clk_bulk_disable.
> > + * Returns 0 on success, -EERROR otherwise.
> > + */
> > +void clk_bulk_unprepare(int num_clks, struct clk_bulk_data *clks)
> 
> unsigned int num_clks (everywhere)
> 
> > +{
> > +       int i;
> 
> unsigned int i (everywhere)

Any special purpose?

Looks like 'int i' for a loop is widely used in kernel.

Would you please help clarify more?

> > +
> > +       for (i = 0; i < num_clks; i++)
> > +               clk_unprepare(clks[i].clk);
> > +}
> > +EXPORT_SYMBOL_GPL(clk_bulk_unprepare);
> 
> This does mean you have to change your "while (--i >= 0)" loops.

Is that really necessary as i thought the clk_bulk_get/put does not
guarantee any clk operation orders within the bulk?
Should we need add that support?

And currently this does the same thing as bulk regulator.

Regards
Dong Aisheng
