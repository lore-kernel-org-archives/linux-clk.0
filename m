Return-Path: <stefan.wahren@i2se.com>
Subject: Re: [PATCH] clk: mxs: ensure that i.MX28's ref_io clks are not
 operated too fast
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Fabio Estevam <fabio.estevam@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Krummsdorf Michael <Michael.Krummsdorf@tq-group.com>
Cc: linux-clk@vger.kernel.org, kernel@pengutronix.de
References: <20170503185625.10297-1-u.kleine-koenig@pengutronix.de>
 <20180726143232.ds22exgxiv6zlsn5@pengutronix.de>
From: Stefan Wahren <stefan.wahren@i2se.com>
Message-ID: <10f5e651-caf4-3fe0-87c0-fe42ccdc6349@i2se.com>
Date: Thu, 26 Jul 2018 16:50:07 +0200
MIME-Version: 1.0
In-Reply-To: <20180726143232.ds22exgxiv6zlsn5@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hi Uwe,

no new insights from my side.

Am 26.07.2018 um 16:32 schrieb Uwe Kleine-König:
> On Wed, May 03, 2017 at 08:56:25PM +0200, Uwe Kleine-König wrote:
>> Since commits 7d81397cd93d ("clk: mxs: add clock support for imx28") and
>> 64e2bc413047 ("clk: mxs: imx28: decrease the frequency of ref_io1 for
>> SSP2 and SSP3") the frequencies for ref_io0 and ref_io1 are initialized
>> to 288 MHz because the initial frequency "seems too high to be ssp clock
>> source directly". However this isn't enough to ensure that the frequency
>> isn't increased later again. In fact this happens on my machine as the
>> mxs-spi driver calls clk_set_rate(ssp->clk, 160000000) with ssp being
>> ssp2 which is resolved to
>>
>> 	ref_io1.rate = 320 MHz
>> 	ssp2_sel.parent = ref_io1
>> 	ssp2_div.divider = 2
>>
>> . The observed effect is that reading MISO reliably fails: Instead of
>> the least significant bit the second least significant bit is reported
>> twice. This is probably related to the reports
>>
>> 	https://community.nxp.com/thread/290209
>> 	https://community.nxp.com/thread/310434
>> 	https://community.nxp.com/thread/385546
>>
>> So additionally to initializing ref_io0 and ref_io1 to 288 MHz ensure
>> that their frequency is never set to something bigger later on. This is
>> done by adding a parameter min_frac to clk-ref and use that instead of
>> the hard coded 18 to limit the valid values for FRAC. For all ref clocks
>> but ref_io0 and ref_io1 18 is used and so there is no functional change
>> for those.
>>
>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> Back in 2017 this patch made the issue disappear on a customer's machine
> (using TQ's TQMa28). Now the problem is back on a variant of the machine
> (using TQMa28L). Back then Stefan had the problem with my patch on a
> Duckbill, too.
>

I only want to note that we are using this ugly hack for Duckbill to 
avoid this issue:

https://github.com/I2SE/linux/commit/e457d5e0309c07e30e8dd8b17c32f7b3cbdd9547

Best regards
Stefan
