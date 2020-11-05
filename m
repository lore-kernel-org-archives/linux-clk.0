Return-Path: <SRS0=dIxE=EL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F113C4741F
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 15:40:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 24D322151B
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 15:40:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731196AbgKEPkW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 Nov 2020 10:40:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731180AbgKEPkW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 5 Nov 2020 10:40:22 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84978C0613D2
        for <linux-clk@vger.kernel.org>; Thu,  5 Nov 2020 07:40:22 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1kahN7-0000Il-2D; Thu, 05 Nov 2020 16:40:21 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1kahN6-0002V7-Bl; Thu, 05 Nov 2020 16:40:20 +0100
Date:   Thu, 5 Nov 2020 16:40:20 +0100
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     linux-clk@vger.kernel.org
Cc:     Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, kernel@pengutronix.de
Subject: Re: [PATCH] clk: si5351: Wait for bit clear after PLL reset
Message-ID: <20201105154020.GB29830@pengutronix.de>
References: <20201021143026.406-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201021143026.406-1-s.hauer@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 16:39:43 up 259 days, 23:10, 148 users,  load average: 0.06, 0.16,
 0.17
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi All,

Any feedback to this one? It fixes a real issue here.

Sascha


On Wed, Oct 21, 2020 at 04:30:26PM +0200, Sascha Hauer wrote:
> Documentation states that SI5351_PLL_RESET_B and SI5351_PLL_RESET_A bits
> are self clearing bits, so wait until they are cleared before
> continuing.
> This fixes a case when the clock doesn't come up properly after a PLL
> reset. It worked properly when the frequency was below 900MHz, but with
> 900MHz it only works when we are waiting for the bit to clear.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/clk/clk-si5351.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
> index 1e1702e609cb..57e4597cdf4c 100644
> --- a/drivers/clk/clk-si5351.c
> +++ b/drivers/clk/clk-si5351.c
> @@ -902,6 +902,10 @@ static int _si5351_clkout_set_disable_state(
>  static void _si5351_clkout_reset_pll(struct si5351_driver_data *drvdata, int num)
>  {
>  	u8 val = si5351_reg_read(drvdata, SI5351_CLK0_CTRL + num);
> +	u8 mask = val & SI5351_CLK_PLL_SELECT ? SI5351_PLL_RESET_B :
> +						       SI5351_PLL_RESET_A;
> +	unsigned int v;
> +	int err;
>  
>  	switch (val & SI5351_CLK_INPUT_MASK) {
>  	case SI5351_CLK_INPUT_XTAL:
> @@ -909,9 +913,12 @@ static void _si5351_clkout_reset_pll(struct si5351_driver_data *drvdata, int num
>  		return;  /* pll not used, no need to reset */
>  	}
>  
> -	si5351_reg_write(drvdata, SI5351_PLL_RESET,
> -			 val & SI5351_CLK_PLL_SELECT ? SI5351_PLL_RESET_B :
> -						       SI5351_PLL_RESET_A);
> +	si5351_reg_write(drvdata, SI5351_PLL_RESET, mask);
> +
> +	err = regmap_read_poll_timeout(drvdata->regmap, SI5351_PLL_RESET, v,
> +				 !(v & mask), 0, 20000);
> +	if (err < 0)
> +		dev_err(&drvdata->client->dev, "Reset bit didn't clear\n");
>  
>  	dev_dbg(&drvdata->client->dev, "%s - %s: pll = %d\n",
>  		__func__, clk_hw_get_name(&drvdata->clkout[num].hw),
> -- 
> 2.20.1
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
