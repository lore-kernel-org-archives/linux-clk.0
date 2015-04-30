Return-Path: <sebastian.hesselbarth@gmail.com>
Return-Path: <sebastian.hesselbarth@gmail.com>
Message-ID: <55429497.6030409@gmail.com>
Date: Thu, 30 Apr 2015 22:46:15 +0200
From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
CC: Michael Welling <mwelling@ieee.org>,
 Jean-Francois Moine <moinejf@free.fr>,
 Mike Turquette <mturquette@linaro.org>,
 Stephen Boyd <sboyd@codeaurora.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Russell King <rmk+linux@arm.linux.org.uk>,
 linux-clk@vger.kernel.org,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 3/4] clk: si5351: Do not pass struct clk in platform_data
References: <1430415954-29517-1-git-send-email-sebastian.hesselbarth@gmail.com> <1430415954-29517-4-git-send-email-sebastian.hesselbarth@gmail.com> <CAOMZO5BYnE2epGrWbnNnaqEt1r6+xoPYWKtjc8w-Ze22aitgXA@mail.gmail.com> <20150430183043.GA21890@deathray> <554277F3.7060500@gmail.com> <CAOMZO5BJWfpir3ngjVjf+A5um6uh=D7WKQFUg3x5fnk8Az6WiQ@mail.gmail.com>
In-Reply-To: <CAOMZO5BJWfpir3ngjVjf+A5um6uh=D7WKQFUg3x5fnk8Az6WiQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 30.04.2015 21:16, Fabio Estevam wrote:
> On Thu, Apr 30, 2015 at 3:44 PM, Sebastian Hesselbarth
> <sebastian.hesselbarth@gmail.com> wrote:
>> Michael is right, the check is for bailing out if none of the parent
>> clocks is available.
>
> +       if (IS_ERR(drvdata->pxtal) && IS_ERR(drvdata->pclkin)) {
> +               dev_err(&client->dev, "missing at least one parent clock\n");
> +               return -EINVAL;
> +       }
>
> Then shouldn't the error message be: "missing both parent clocks\n" ?

Yeah, probably. I'll reword the error message and also check the
variant as only 5351C can have a "clkin" parent clock.

Sebastian
