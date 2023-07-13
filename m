Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 565B2C0015E
	for <linux-clk@archiver.kernel.org>; Thu, 13 Jul 2023 17:54:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbjGMRyl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Jul 2023 13:54:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbjGMRyk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Jul 2023 13:54:40 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5CE8271F
        for <linux-clk@vger.kernel.org>; Thu, 13 Jul 2023 10:54:39 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1qK0WT-0001Vv-2Q; Thu, 13 Jul 2023 19:54:37 +0200
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1qK0WR-0007ex-CU; Thu, 13 Jul 2023 19:54:35 +0200
Date:   Thu, 13 Jul 2023 19:54:35 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
        adrian.alonso@nxp.com
Cc:     Abel Vesa <abelvesa@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-clk <linux-clk@vger.kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>
Subject: Re: bounds of pdiv in clk-pll14xx.c
Message-ID: <20230713175435.z66efhro7mvnk5gg@pengutronix.de>
References: <ca6b0f0b-3f0d-8e4d-c857-8c6515250782@prevas.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca6b0f0b-3f0d-8e4d-c857-8c6515250782@prevas.dk>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

+To Adrian since Sascha mentioned him in his commit.

On 23-06-21, Rasmus Villemoes wrote:
> I'm a bit confused by the range of pdiv used in
> imx_pll14xx_calc_settings(), introduced in commit b09c68dc57c9 (clk:
> imx: pll14xx: Support dynamic rates).
> 
> We have this comment
> 
>         /*
>          * Fractional PLL constrains:
>          *
>          * a) 6MHz <= prate <= 25MHz
>          * b) 1 <= p <= 63 (1 <= p <= 4 prate = 24MHz)
>          * c) 64 <= m <= 1023
>          * d) 0 <= s <= 6
>          * e) -32768 <= k <= 32767
> 
> and those values match what I can find in the reference manuals for the
> imx8mm, imx8mn and imx8mp SOCs. But the code then only loops over 1 <= p
> <= 7. I also don't really understand what the parenthesis
> 
>    (1 <= p <= 4 prate = 24MHz)
> 
> is supposed to mean. Is p restricted to <= 4 when the parent rate is
> 24MHz? That doesn't seem to make any sense, and in any case the loop
> does go up to p==7.

I have the exact same question since the '1 <= 7' restriction stops me
from getting the most precise video-pll frequency. If I set the
restiction according the reference manual I get an exact match.

With the following diff I be able to get an exact match:

8<---------------------------------------------------------------
diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index 7150c59bbfc95..d1d0d25fea2ce 100644
--- a/drivers/clk/imx/clk-pll14xx.c
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -186,7 +186,7 @@ static void imx_pll14xx_calc_settings(struct clk_pll14xx *pll, unsigned long rat
 	}
 
 	/* Finally calculate best values */
-	for (pdiv = 1; pdiv <= 7; pdiv++) {
+	for (pdiv = 1; pdiv <= 63; pdiv++) {
 		for (sdiv = 0; sdiv <= 6; sdiv++) {
 			/* calc mdiv = round(rate * pdiv * 2^sdiv) / prate) */
 			mdiv = DIV_ROUND_CLOSEST(rate * (pdiv << sdiv), prate);
8<---------------------------------------------------------------

Regards,
  Marco
