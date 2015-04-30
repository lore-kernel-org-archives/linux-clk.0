Return-Path: <festevam@gmail.com>
MIME-Version: 1.0
In-Reply-To: <554277F3.7060500@gmail.com>
References: <1430415954-29517-1-git-send-email-sebastian.hesselbarth@gmail.com>
	<1430415954-29517-4-git-send-email-sebastian.hesselbarth@gmail.com>
	<CAOMZO5BYnE2epGrWbnNnaqEt1r6+xoPYWKtjc8w-Ze22aitgXA@mail.gmail.com>
	<20150430183043.GA21890@deathray>
	<554277F3.7060500@gmail.com>
Date: Thu, 30 Apr 2015 16:16:40 -0300
Message-ID: <CAOMZO5BJWfpir3ngjVjf+A5um6uh=D7WKQFUg3x5fnk8Az6WiQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] clk: si5351: Do not pass struct clk in platform_data
From: Fabio Estevam <festevam@gmail.com>
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Michael Welling <mwelling@ieee.org>, Jean-Francois Moine <moinejf@free.fr>,
	Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, Russell King <rmk+linux@arm.linux.org.uk>,
	linux-clk@vger.kernel.org,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Sebastian,

On Thu, Apr 30, 2015 at 3:44 PM, Sebastian Hesselbarth
<sebastian.hesselbarth@gmail.com> wrote:

> Fabio,
>
> Michael is right, the check is for bailing out if none of the parent
> clocks is available.

+       if (IS_ERR(drvdata->pxtal) && IS_ERR(drvdata->pclkin)) {
+               dev_err(&client->dev, "missing at least one parent clock\n");
+               return -EINVAL;
+       }

Then shouldn't the error message be: "missing both parent clocks\n" ?

Regards,

Fabio Estevam
