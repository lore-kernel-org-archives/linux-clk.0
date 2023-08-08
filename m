Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E490EC001DB
	for <linux-clk@archiver.kernel.org>; Tue,  8 Aug 2023 19:48:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232010AbjHHTsi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Aug 2023 15:48:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230451AbjHHTsY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Aug 2023 15:48:24 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EF4C4DE8F
        for <linux-clk@vger.kernel.org>; Tue,  8 Aug 2023 09:52:53 -0700 (PDT)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <a.fatoum@pengutronix.de>)
        id 1qTMNG-0003Ii-CI; Tue, 08 Aug 2023 15:03:46 +0200
Message-ID: <ce1303c3-79b2-7a50-6fab-6235d9930d53@pengutronix.de>
Date:   Tue, 8 Aug 2023 15:03:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/2] clk: imx: pll14xx: dynamically configure PLL for
 393216000/361267200Hz
Content-Language: en-US
To:     Adam Ford <aford173@gmail.com>,
        Marco Felsch <m.felsch@pengutronix.de>
Cc:     abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de,
        rasmus.villemoes@prevas.dk, adrian.alonso@nxp.com,
        linux-clk@vger.kernel.org, linux-imx@nxp.com, kernel@pengutronix.de
References: <20230807084744.1184791-1-m.felsch@pengutronix.de>
 <20230807084744.1184791-2-m.felsch@pengutronix.de>
 <CAHCN7xLdwNXXeEi82KN7QWgUqUCeFjxJgkdo0+GujJYo8qLXVQ@mail.gmail.com>
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <CAHCN7xLdwNXXeEi82KN7QWgUqUCeFjxJgkdo0+GujJYo8qLXVQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 08.08.23 14:19, Adam Ford wrote:
> On Mon, Aug 7, 2023 at 3:47 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
>>
>> From: Ahmad Fatoum <a.fatoum@pengutronix.de>
>>
>> Since commit b09c68dc57c9 ("clk: imx: pll14xx: Support dynamic rates"),
>> the driver has the ability to dynamically compute PLL parameters to
>> approximate the requested rates. This is not always used, because the
>> logic is as follows:
>>
>>   - Check if the target rate is hardcoded in the frequency table
>>   - Check if varying only kdiv is possible, so switch over is glitch free
>>   - Compute rate dynamically by iterating over pdiv range
>>
>> If we skip the frequency table for the 1443x PLL, we find that the
>> computed values differ to the hardcoded ones. This can be valid if the
>> hardcoded values guarantee for example an earlier lock-in or if the
>> divisors are chosen, so that other important rates are more likely to
>> be reached glitch-free.
>>
>> For rates (393216000 and 361267200, this doesn't seem to be the case:
>> They are only approximated by existing parameters (393215995 and
>> 361267196 Hz, respectively) and they aren't reachable glitch-free from
>> other hardcoded frequencies. Dropping them from the table allows us
>> to lock-in to these frequencies exactly.
>>
>> This is immediately noticeable because they are the assigned-clock-rates
>> for IMX8MN_AUDIO_PLL1 and IMX8MN_AUDIO_PLL2, respectively and a look
>> into clk_summary so far showed that they were a few Hz short of the target:
>>
>> imx8mn-board:~# grep audio_pll[12]_out /sys/kernel/debug/clk/clk_summary
>> audio_pll2_out           0        0        0   361267196 0     0  50000   N
>> audio_pll1_out           1        1        0   393215995 0     0  50000   Y
>>
>> and afterwards:
>>
>> imx8mn-board:~# grep audio_pll[12]_out /sys/kernel/debug/clk/clk_summary
>> audio_pll2_out           0        0        0   361267200 0     0  50000   N
>> audio_pll1_out           1        1        0   393216000 0     0  50000   Y
>>
>> This change is equivalent to adding following hardcoded values:
>>
>>   /*               rate     mdiv  pdiv  sdiv   kdiv */
>>   PLL_1443X_RATE(393216000, 655,    5,    3,  23593),
>>   PLL_1443X_RATE(361267200, 497,   33,    0, -16882),
>>
>> Fixes: 053a4ffe2988 ("clk: imx: imx8mm: fix audio pll setting")
>> Cc: stable@vger.kernel.org # v5.18+
>> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
>> ---
>> v2:
>> - new patch
>>
>>  drivers/clk/imx/clk-pll14xx.c | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
>> index dc6bc21dff41..0d58d85c375e 100644
>> --- a/drivers/clk/imx/clk-pll14xx.c
>> +++ b/drivers/clk/imx/clk-pll14xx.c
>> @@ -64,8 +64,6 @@ static const struct imx_pll14xx_rate_table imx_pll1443x_tbl[] = {
>>         PLL_1443X_RATE(650000000U, 325, 3, 2, 0),
>>         PLL_1443X_RATE(594000000U, 198, 2, 2, 0),
>>         PLL_1443X_RATE(519750000U, 173, 2, 2, 16384),
>> -       PLL_1443X_RATE(393216000U, 262, 2, 3, 9437),
>> -       PLL_1443X_RATE(361267200U, 361, 3, 3, 17511),
> 
> Part of me wonders why we need the look-up table at all if the driver
> has been fixed to achieve better rates. 

The look-up table achieves a different (worse) rate only for the two setpoints
that are dropped in this patch.

> I don't know if there is a
> significant time in calculating the numbers as compared to the time it
> takes to search the table.

The speed of calculation is negligible. Differently chosen parameters
may affect the speed of lock-in or allow faster switch to other interesting
frequencies. I also think we might be able to drop the table, but that should
be a different patch with a different justification as both ways
would achieve the same rate, but with different parameters.

If anybody from NXP could shed some light on how the existing parameters
were initially chosen that would be most useful.

Cheers,
Ahmad


> 
> adam
>>  };
>>
>>  struct imx_pll14xx_clk imx_1443x_pll = {
>> --
>> 2.39.2
>>
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

