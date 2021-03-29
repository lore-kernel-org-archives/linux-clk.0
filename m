Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 019BDC433C1
	for <linux-clk@archiver.kernel.org>; Mon, 29 Mar 2021 15:18:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C000561968
	for <linux-clk@archiver.kernel.org>; Mon, 29 Mar 2021 15:18:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbhC2PSI convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 29 Mar 2021 11:18:08 -0400
Received: from mslow1.mail.gandi.net ([217.70.178.240]:33475 "EHLO
        mslow1.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230347AbhC2PSD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 29 Mar 2021 11:18:03 -0400
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id 2DB4ED1502;
        Mon, 29 Mar 2021 14:48:28 +0000 (UTC)
X-Originating-IP: 91.175.115.186
Received: from localhost (91-175-115-186.subs.proxad.net [91.175.115.186])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 47462FF809;
        Mon, 29 Mar 2021 14:48:05 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Pali =?utf-8?Q?Roh=C3=A1r?= <pali@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc:     Marek =?utf-8?Q?Beh=C3=BAn?= <kabel@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Tomasz Maciej Nowak <tmn505@gmail.com>,
        Luka Perkov <luka.perkov@sartura.hr>,
        Andre Heider <a.heider@gmail.com>,
        Vladimir Vid <vladimir.vid@sartura.hr>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        =?utf-8?Q?G=C3=A9rald?= Kerma <gerald@gk2.net>,
        Konstantin Porotchkin <kostap@marvell.com>
Subject: Re: [PATCH mvebu v3 05/10] clk: mvebu: armada-37xx-periph: Fix
 switching CPU freq from 250 Mhz to 1 GHz
In-Reply-To: <20210222194158.12342-6-pali@kernel.org>
References: <20210114124032.12765-1-pali@kernel.org>
 <20210222194158.12342-1-pali@kernel.org>
 <20210222194158.12342-6-pali@kernel.org>
Date:   Mon, 29 Mar 2021 16:48:04 +0200
Message-ID: <87y2e6dniz.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Pali Rohár <pali@kernel.org> writes:

> It was observed that the workaround introduced by commit 61c40f35f5cd
> ("clk: mvebu: armada-37xx-periph: Fix switching CPU rate from 300Mhz to
> 1.2GHz") when base CPU frequency is 1.2 GHz is also required when base
> CPU frequency is 1 GHz. Otherwise switching CPU frequency directly from
> L2 (250 MHz) to L0 (1 GHz) causes a crash.
>
> When base CPU frequency is just 800 MHz no crashed were observed during
> switch from L2 to L0.
>
> Signed-off-by: Pali Rohár <pali@kernel.org>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Tested-by: Tomasz Maciej Nowak <tmn505@gmail.com>
> Tested-by: Anders Trier Olesen <anders.trier.olesen@gmail.com>
> Tested-by: Philip Soares <philips@netisense.com>
> Fixes: 2089dc33ea0e ("clk: mvebu: armada-37xx-periph: add DVFS support for cpu clocks")
> Cc: stable@vger.kernel.org # 61c40f35f5cd ("clk: mvebu: armada-37xx-periph: Fix switching CPU rate from 300Mhz to 1.2GHz")


Acked-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Thanks,

Gregory

> ---
>  drivers/clk/mvebu/armada-37xx-periph.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clk/mvebu/armada-37xx-periph.c b/drivers/clk/mvebu/armada-37xx-periph.c
> index 6507bd2c5f31..b15e177bea7e 100644
> --- a/drivers/clk/mvebu/armada-37xx-periph.c
> +++ b/drivers/clk/mvebu/armada-37xx-periph.c
> @@ -487,8 +487,10 @@ static long clk_pm_cpu_round_rate(struct clk_hw *hw, unsigned long rate,
>  }
>  
>  /*
> - * Switching the CPU from the L2 or L3 frequencies (300 and 200 Mhz
> - * respectively) to L0 frequency (1.2 Ghz) requires a significant
> + * Workaround when base CPU frequnecy is 1000 or 1200 MHz
> + *
> + * Switching the CPU from the L2 or L3 frequencies (250/300 or 200 MHz
> + * respectively) to L0 frequency (1/1.2 GHz) requires a significant
>   * amount of time to let VDD stabilize to the appropriate
>   * voltage. This amount of time is large enough that it cannot be
>   * covered by the hardware countdown register. Due to this, the CPU
> @@ -498,15 +500,15 @@ static long clk_pm_cpu_round_rate(struct clk_hw *hw, unsigned long rate,
>   * To work around this problem, we prevent switching directly from the
>   * L2/L3 frequencies to the L0 frequency, and instead switch to the L1
>   * frequency in-between. The sequence therefore becomes:
> - * 1. First switch from L2/L3(200/300MHz) to L1(600MHZ)
> + * 1. First switch from L2/L3 (200/250/300 MHz) to L1 (500/600 MHz)
>   * 2. Sleep 20ms for stabling VDD voltage
> - * 3. Then switch from L1(600MHZ) to L0(1200Mhz).
> + * 3. Then switch from L1 (500/600 MHz) to L0 (1000/1200 MHz).
>   */
>  static void clk_pm_cpu_set_rate_wa(unsigned long rate, struct regmap *base)
>  {
>  	unsigned int cur_level;
>  
> -	if (rate != 1200 * 1000 * 1000)
> +	if (rate < 1000 * 1000 * 1000)
>  		return;
>  
>  	regmap_read(base, ARMADA_37XX_NB_CPU_LOAD, &cur_level);
> -- 
> 2.20.1
>

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
