Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D8BEB64DD
	for <linux-clk@archiver.kernel.org>; Mon,  7 Aug 2023 08:49:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbjHGItL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 7 Aug 2023 04:49:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbjHGItL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 7 Aug 2023 04:49:11 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD50092
        for <linux-clk@vger.kernel.org>; Mon,  7 Aug 2023 01:49:09 -0700 (PDT)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <a.fatoum@pengutronix.de>)
        id 1qSvvC-0003GY-PD; Mon, 07 Aug 2023 10:49:02 +0200
Message-ID: <c00bbaa4-f56e-d454-e30e-91c37f2bc2d4@pengutronix.de>
Date:   Mon, 7 Aug 2023 10:49:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/2] clk: imx: pll14xx: align pdiv with reference
 manual
Content-Language: en-US
To:     Marco Felsch <m.felsch@pengutronix.de>, abelvesa@kernel.org,
        peng.fan@nxp.com, mturquette@baylibre.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, rasmus.villemoes@prevas.dk,
        adrian.alonso@nxp.com, aford173@gmail.com
Cc:     linux-clk@vger.kernel.org, linux-imx@nxp.com, kernel@pengutronix.de
References: <20230807084744.1184791-1-m.felsch@pengutronix.de>
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20230807084744.1184791-1-m.felsch@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 07.08.23 10:47, Marco Felsch wrote:
> The PLL14xx hardware can be found on i.MX8M{M,N,P} SoCs and always come
> with a 6-bit pre-divider. Neither the reference manuals nor the
> datasheets of these SoCs do mention any restrictions. Furthermore the
> current code doesn't respect the restrictions from the comment too.
> 
> Therefore drop the restriction and align the max pre-divider (pdiv)
> value to 63 to get more accurate frequencies.
> 
> Fixes: b09c68dc57c9 ("clk: imx: pll14xx: Support dynamic rates")
> Cc: stable@vger.kernel.org
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> Reviewed-by: Adam Ford <aford173@gmail.com>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Tested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

> ---
> v2:
> - Link: https://lore.kernel.org/all/20230714134938.2124861-1-m.felsch@pengutronix.de/
> - add fixes tag
> 
>  drivers/clk/imx/clk-pll14xx.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
> index 7150c59bbfc9..dc6bc21dff41 100644
> --- a/drivers/clk/imx/clk-pll14xx.c
> +++ b/drivers/clk/imx/clk-pll14xx.c
> @@ -139,11 +139,10 @@ static void imx_pll14xx_calc_settings(struct clk_pll14xx *pll, unsigned long rat
>  	/*
>  	 * Fractional PLL constrains:
>  	 *
> -	 * a) 6MHz <= prate <= 25MHz
> -	 * b) 1 <= p <= 63 (1 <= p <= 4 prate = 24MHz)
> -	 * c) 64 <= m <= 1023
> -	 * d) 0 <= s <= 6
> -	 * e) -32768 <= k <= 32767
> +	 * a) 1 <= p <= 63
> +	 * b) 64 <= m <= 1023
> +	 * c) 0 <= s <= 6
> +	 * d) -32768 <= k <= 32767
>  	 *
>  	 * fvco = (m * 65536 + k) * prate / (p * 65536)
>  	 */
> @@ -186,7 +185,7 @@ static void imx_pll14xx_calc_settings(struct clk_pll14xx *pll, unsigned long rat
>  	}
>  
>  	/* Finally calculate best values */
> -	for (pdiv = 1; pdiv <= 7; pdiv++) {
> +	for (pdiv = 1; pdiv <= 63; pdiv++) {
>  		for (sdiv = 0; sdiv <= 6; sdiv++) {
>  			/* calc mdiv = round(rate * pdiv * 2^sdiv) / prate) */
>  			mdiv = DIV_ROUND_CLOSEST(rate * (pdiv << sdiv), prate);

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

