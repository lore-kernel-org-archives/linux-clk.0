Return-Path: <festevam@gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOMZO5AtZDLiVu_qwmACXXx-o9qKAoj9yZh8ZG54are6U44XPQ@mail.gmail.com>
References: <20170503185625.10297-1-u.kleine-koenig@pengutronix.de>
 <20180726143232.ds22exgxiv6zlsn5@pengutronix.de> <CAOMZO5AtZDLiVu_qwmACXXx-o9qKAoj9yZh8ZG54are6U44XPQ@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 26 Jul 2018 12:18:19 -0300
Message-ID: <CAOMZO5ASyzL2qHEDHTJcwkBPHL5DGO1pKrWyWqgtRAKOgG4Usg@mail.gmail.com>
Subject: Re: [PATCH] clk: mxs: ensure that i.MX28's ref_io clks are not
 operated too fast
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Krummsdorf Michael <Michael.Krummsdorf@tq-group.com>, Stefan Wahren <stefan.wahren@i2se.com>,
	linux-clk <linux-clk@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Uwe,

On Thu, Jul 26, 2018 at 12:04 PM, Fabio Estevam <festevam@gmail.com> wrote:
> Hi Uwe,
>
> On Thu, Jul 26, 2018 at 11:32 AM, Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@pengutronix.de> wrote:
>
>> Fabio: Doesn't that look bad enough to let the hardware guys at NXP
>> look into that?
>
> Yes, I think we should ask for their help on this problem.

We are changing the ref_io while it is already feeding SSP, which is
not a good practice.

It would be better if we could change the ref_io frequency first, and
then feed the SSP clock afterwards:

--- a/drivers/clk/mxs/clk-imx28.c
+++ b/drivers/clk/mxs/clk-imx28.c
@@ -110,12 +110,6 @@ static void __init clk_misc_init(void)
        writel_relaxed(val, ENET);

        /*
-        * Source ssp clock from ref_io than ref_xtal,
-        * as ref_xtal only provides 24 MHz as maximum.
-        */
-       writel_relaxed(0xf << BP_CLKSEQ_BYPASS_SSP0, CLKSEQ + CLR);
-
-       /*
         * 480 MHz seems too high to be ssp clock source directly,
         * so set frac0 to get a 288 MHz ref_io0 and ref_io1.
         */
@@ -123,6 +117,12 @@ static void __init clk_misc_init(void)
        val &=3D ~((0x3f << BP_FRAC0_IO0FRAC) | (0x3f << BP_FRAC0_IO1FRAC))=
;
        val |=3D (30 << BP_FRAC0_IO0FRAC) | (30 << BP_FRAC0_IO1FRAC);
        writel_relaxed(val, FRAC0);
+
+       /*
+        * Source ssp clock from ref_io than ref_xtal,
+        * as ref_xtal only provides 24 MHz as maximum.
+        */
+       writel_relaxed(0xf << BP_CLKSEQ_BYPASS_SSP0, CLKSEQ + CLR);
 }
