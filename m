Return-Path: <stefan.wahren@i2se.com>
Subject: Re: [PATCH] clk: mxs: ensure that i.MX28's ref_io clks are not
 operated too fast
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
References: <20170503185625.10297-1-u.kleine-koenig@pengutronix.de>
 <CAOMZO5BZ8pqBW2VfuaUGyzgn8kv3AdvhwQ5nFEWuUSpmvrW9rA@mail.gmail.com>
 <20170530065457.e2m4nyo2dztumyi6@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Fabio Estevam <fabio.estevam@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org,
 Sascha Hauer <kernel@pengutronix.de>
From: Stefan Wahren <stefan.wahren@i2se.com>
Message-ID: <2f36b783-72a5-6271-42c0-7d5fdad212a1@i2se.com>
Date: Tue, 30 May 2017 10:04:33 +0200
MIME-Version: 1.0
In-Reply-To: <20170530065457.e2m4nyo2dztumyi6@pengutronix.de>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

Am 30.05.2017 um 08:54 schrieb Uwe Kleine-König:
> On Mon, May 29, 2017 at 06:21:49PM -0300, Fabio Estevam wrote:
>> Hi Uwe,
>>
>> On Wed, May 3, 2017 at 3:56 PM, Uwe Kleine-König
>> <u.kleine-koenig@pengutronix.de> wrote:
>>> Since commits 7d81397cd93d ("clk: mxs: add clock support for imx28") and
>>> 64e2bc413047 ("clk: mxs: imx28: decrease the frequency of ref_io1 for
>>> SSP2 and SSP3") the frequencies for ref_io0 and ref_io1 are initialized
>>> to 288 MHz because the initial frequency "seems too high to be ssp clock
>>> source directly". However this isn't enough to ensure that the frequency
>>> isn't increased later again. In fact this happens on my machine as the
>>> mxs-spi driver calls clk_set_rate(ssp->clk, 160000000) with ssp being
>>> ssp2 which is resolved to
>>>
>>>         ref_io1.rate = 320 MHz
>>>         ssp2_sel.parent = ref_io1
>>>         ssp2_div.divider = 2
>>>
>>> . The observed effect is that reading MISO reliably fails: Instead of
>>> the least significant bit the second least significant bit is reported
>>> twice. This is probably related to the reports
>>>
>>>         https://community.nxp.com/thread/290209
>>>         https://community.nxp.com/thread/310434
>> As Stefan mentioned that your patch does not solve his issue, please
>> remove this link when you submit a v2.
> I still think it is related to these reports, don't you?

I think this is related somehow, but this version doesn't mention that
it doesn't fix the linked issue. So removing the link would be the best
in order to avoid confusion.

Btw did you tried to disable DMA transfer during your tests?

Regards
Stefan

>
> Best regards
> Uwe
>
