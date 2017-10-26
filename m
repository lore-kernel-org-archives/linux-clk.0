Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Jerome Brunet <jbrunet@baylibre.com>, "Stephen Boyd" <sboyd@codeaurora.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <20170924200030.6227-10-jbrunet@baylibre.com>
Cc: "Jerome Brunet" <jbrunet@baylibre.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Russell King" <linux@armlinux.org.uk>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Quentin Schulz" <quentin.schulz@free-electrons.com>,
 "Kevin Hilman" <khilman@baylibre.com>
References: <20170924200030.6227-1-jbrunet@baylibre.com>
 <20170924200030.6227-10-jbrunet@baylibre.com>
Message-ID: <150899557300.90597.9865127803541159465@resonance>
Subject: Re: [PATCH v4 09/10] clk: add clk_rate_exclusive api
Date: Thu, 26 Oct 2017 07:26:13 +0200
List-ID: <linux-clk.vger.kernel.org>

Hi Jerome,

Quoting Jerome Brunet (2017-09-24 22:00:29)
> @@ -1778,6 +1867,50 @@ int clk_set_rate(struct clk *clk, unsigned long ra=
te)
>  EXPORT_SYMBOL_GPL(clk_set_rate);
>  =

>  /**
> + * clk_set_rate_exclusive - specify a new rate get exclusive control
> + * @clk: the clk whose rate is being changed
> + * @rate: the new rate for clk
> + *
> + * This is a combination of clk_set_rate() and clk_rate_exclusive_get()
> + * within a critical section
> + *
> + * This can be used initially to ensure that at least 1 consumer is
> + * statisfied when several consumers are competing for exclusivity over =
the
> + * same clock provider.

Please add the following here:

  Calls to clk_rate_exclusive_get() should be balanced with calls to
  clk_rate_exclusive_put().

Otherwise looks good to me.

Best regards,
Mike
