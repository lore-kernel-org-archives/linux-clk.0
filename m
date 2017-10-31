Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1509470994.13838.28.camel@baylibre.com>
Subject: Re: [PATCH v4 09/10] clk: add clk_rate_exclusive api
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	 <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King
 <linux@armlinux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Quentin
 Schulz <quentin.schulz@free-electrons.com>, Kevin Hilman
 <khilman@baylibre.com>
Date: Tue, 31 Oct 2017 18:29:54 +0100
In-Reply-To: <150899557300.90597.9865127803541159465@resonance>
References: <20170924200030.6227-1-jbrunet@baylibre.com>
	 <20170924200030.6227-10-jbrunet@baylibre.com>
	 <150899557300.90597.9865127803541159465@resonance>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Thu, 2017-10-26 at 07:26 +0200, Michael Turquette wrote:
> Hi Jerome,
> 
> Quoting Jerome Brunet (2017-09-24 22:00:29)
> > @@ -1778,6 +1867,50 @@ int clk_set_rate(struct clk *clk, unsigned long rate)
> >  EXPORT_SYMBOL_GPL(clk_set_rate);
> >  
> >  /**
> > + * clk_set_rate_exclusive - specify a new rate get exclusive control
> > + * @clk: the clk whose rate is being changed
> > + * @rate: the new rate for clk
> > + *
> > + * This is a combination of clk_set_rate() and clk_rate_exclusive_get()
> > + * within a critical section
> > + *
> > + * This can be used initially to ensure that at least 1 consumer is
> > + * statisfied when several consumers are competing for exclusivity over the
> > + * same clock provider.
> 
> Please add the following here:
> 
>   Calls to clk_rate_exclusive_get() should be balanced with calls to
>   clk_rate_exclusive_put().

Oh indeed !
I can do a resend with it or, if you prefer, you may directly amend the patch.
As you prefer

Thanks

> 
> Otherwise looks good to me.
> 
> Best regards,
> Mike
