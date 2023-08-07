Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF186EB64DD
	for <linux-clk@archiver.kernel.org>; Mon,  7 Aug 2023 08:59:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231217AbjHGI7f (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 7 Aug 2023 04:59:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjHGI72 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 7 Aug 2023 04:59:28 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18E31E68
        for <linux-clk@vger.kernel.org>; Mon,  7 Aug 2023 01:59:27 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1qSw59-0004TV-9O; Mon, 07 Aug 2023 10:59:19 +0200
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1qSw58-0004H9-BR; Mon, 07 Aug 2023 10:59:18 +0200
Date:   Mon, 7 Aug 2023 10:59:18 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de,
        rasmus.villemoes@prevas.dk, adrian.alonso@nxp.com,
        aford173@gmail.com, a.fatoum@pengutronix.de
Cc:     linux-clk@vger.kernel.org, kernel@pengutronix.de, linux-imx@nxp.com
Subject: Re: [PATCH v2 2/2] clk: imx: pll14xx: dynamically configure PLL for
 393216000/361267200Hz
Message-ID: <20230807085918.geeq44opz52lz7pp@pengutronix.de>
References: <20230807084744.1184791-1-m.felsch@pengutronix.de>
 <20230807084744.1184791-2-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230807084744.1184791-2-m.felsch@pengutronix.de>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On 23-08-07, Marco Felsch wrote:
> From: Ahmad Fatoum <a.fatoum@pengutronix.de>
> 
> Since commit b09c68dc57c9 ("clk: imx: pll14xx: Support dynamic rates"),
> the driver has the ability to dynamically compute PLL parameters to
> approximate the requested rates. This is not always used, because the
> logic is as follows:
> 
>   - Check if the target rate is hardcoded in the frequency table
>   - Check if varying only kdiv is possible, so switch over is glitch free
>   - Compute rate dynamically by iterating over pdiv range
> 
> If we skip the frequency table for the 1443x PLL, we find that the
> computed values differ to the hardcoded ones. This can be valid if the
> hardcoded values guarantee for example an earlier lock-in or if the
> divisors are chosen, so that other important rates are more likely to
> be reached glitch-free.
> 
> For rates (393216000 and 361267200, this doesn't seem to be the case:
> They are only approximated by existing parameters (393215995 and
> 361267196 Hz, respectively) and they aren't reachable glitch-free from
> other hardcoded frequencies. Dropping them from the table allows us
> to lock-in to these frequencies exactly.
> 
> This is immediately noticeable because they are the assigned-clock-rates
> for IMX8MN_AUDIO_PLL1 and IMX8MN_AUDIO_PLL2, respectively and a look
> into clk_summary so far showed that they were a few Hz short of the target:
> 
> imx8mn-board:~# grep audio_pll[12]_out /sys/kernel/debug/clk/clk_summary
> audio_pll2_out           0        0        0   361267196 0     0  50000   N
> audio_pll1_out           1        1        0   393215995 0     0  50000   Y
> 
> and afterwards:
> 
> imx8mn-board:~# grep audio_pll[12]_out /sys/kernel/debug/clk/clk_summary
> audio_pll2_out           0        0        0   361267200 0     0  50000   N
> audio_pll1_out           1        1        0   393216000 0     0  50000   Y
> 
> This change is equivalent to adding following hardcoded values:
> 
>   /*               rate     mdiv  pdiv  sdiv   kdiv */
>   PLL_1443X_RATE(393216000, 655,    5,    3,  23593),
>   PLL_1443X_RATE(361267200, 497,   33,    0, -16882),
> 
> Fixes: 053a4ffe2988 ("clk: imx: imx8mm: fix audio pll setting")
> Cc: stable@vger.kernel.org # v5.18+
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

I forgot to add my s-o-b, if b4 can collect this I will do it this way:

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Regards,
  Marco

> ---
> v2:
> - new patch
> 
>  drivers/clk/imx/clk-pll14xx.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
> index dc6bc21dff41..0d58d85c375e 100644
> --- a/drivers/clk/imx/clk-pll14xx.c
> +++ b/drivers/clk/imx/clk-pll14xx.c
> @@ -64,8 +64,6 @@ static const struct imx_pll14xx_rate_table imx_pll1443x_tbl[] = {
>  	PLL_1443X_RATE(650000000U, 325, 3, 2, 0),
>  	PLL_1443X_RATE(594000000U, 198, 2, 2, 0),
>  	PLL_1443X_RATE(519750000U, 173, 2, 2, 16384),
> -	PLL_1443X_RATE(393216000U, 262, 2, 3, 9437),
> -	PLL_1443X_RATE(361267200U, 361, 3, 3, 17511),
>  };
>  
>  struct imx_pll14xx_clk imx_1443x_pll = {
> -- 
> 2.39.2
> 
> 
> 
