Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25635C001DE
	for <linux-clk@archiver.kernel.org>; Wed,  2 Aug 2023 06:46:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230338AbjHBGqp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Aug 2023 02:46:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231824AbjHBGqo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Aug 2023 02:46:44 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06631DC
        for <linux-clk@vger.kernel.org>; Tue,  1 Aug 2023 23:46:43 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1qR5d1-0007gp-Tz; Wed, 02 Aug 2023 08:46:39 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1qR5d1-0006jB-Aa; Wed, 02 Aug 2023 08:46:39 +0200
Date:   Wed, 2 Aug 2023 08:46:39 +0200
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc:     Abel Vesa <abelvesa@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-clk <linux-clk@vger.kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>
Subject: Re: bounds of pdiv in clk-pll14xx.c
Message-ID: <20230802064639.GK15436@pengutronix.de>
References: <ca6b0f0b-3f0d-8e4d-c857-8c6515250782@prevas.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca6b0f0b-3f0d-8e4d-c857-8c6515250782@prevas.dk>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Jun 21, 2023 at 01:24:12PM +0200, Rasmus Villemoes wrote:
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

The original patch from Adrian that my patch is based on indeed had 1 <=
p <= 4. I did some digging but I haven't found the reason why this was
changed to 1 <= p <= 7 in the patch I upstreamed. I can imagine that at
some point we realized that we also got suboptimal rates and therefore
changed it, but I don't know.

> 
> It also seems that the built-in entries for 393216000 and 361267200 are
> suboptimal. Using m=655, p=5, s=3, k=23593 would give 393216000 exactly,
> and that set would be found by the loop if it wasn't being preceded by
> the table lookup.

I gave the table precedence in case it contains qualified known good
values. If these values turn out to be not so good after all then I
suggest that we remove them.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
