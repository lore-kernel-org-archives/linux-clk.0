Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DB27EB64DC
	for <linux-clk@archiver.kernel.org>; Fri, 14 Jul 2023 07:09:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234921AbjGNHJZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Jul 2023 03:09:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234787AbjGNHJX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 14 Jul 2023 03:09:23 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB93011D
        for <linux-clk@vger.kernel.org>; Fri, 14 Jul 2023 00:09:21 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1qKCvU-0004lk-QT; Fri, 14 Jul 2023 09:09:16 +0200
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1qKCvU-0002DO-3M; Fri, 14 Jul 2023 09:09:16 +0200
Date:   Fri, 14 Jul 2023 09:09:16 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Adrian Alonso <adrian.alonso@nxp.com>
Cc:     Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
        "bli@bang-olufsen.dk" <bli@bang-olufsen.dk>,
        dl-linux-imx <linux-imx@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-clk <linux-clk@vger.kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Abel Vesa <abelvesa@kernel.org>
Subject: Re: [EXT] Re: bounds of pdiv in clk-pll14xx.c
Message-ID: <20230714070916.yybwlxpwiqdwjcw2@pengutronix.de>
References: <ca6b0f0b-3f0d-8e4d-c857-8c6515250782@prevas.dk>
 <20230713175435.z66efhro7mvnk5gg@pengutronix.de>
 <DB9PR04MB828202F64FB4F4724B23564FFC37A@DB9PR04MB8282.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB9PR04MB828202F64FB4F4724B23564FFC37A@DB9PR04MB8282.eurprd04.prod.outlook.com>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Adrian,

thanks for the fast reply :)

On 23-07-13, Adrian Alonso wrote:
> Hi,
> 
> +Bligaard
> 
> FRef for Audio/Video PLLs are usually 24Mhz/25Mhz;

All PLLs are sourced by the external 24MHz osc if I understood the
i.MX8M{N,M,P} reference manuals correctly.

> But most common use case for dynamic reconf is for Audio PLL
> Where prate = 2 4Mhz (FRef) could derive 44.1khz/44khz sample rates

Video-plls are very device/use-case specific too.

> b) 1 <= p <= 63; (1 <= p <= 4 if prate = 24MHz);
> 
> Found out this old commit log:
> 
> clk: imx: dynamic audio pll rate settings
> 
> Add support for dynamic audio pll rate settings
> Calculate optimal dividers close to required user freq request
> Fractional PLL constrains:
>  a). 6MHz <= Fref <= 25MHz;
>  b). 1 <= p <= 63; if Fref is external cristal Fref = 24Mhz
>      1 <= p <= 4;

Where is this restriction of 1 <= p <= 4 (fref = 24MHz) mentioned? I
wasn't able to find that limitation within the reference-manual nor the
datasheet.

>  c). 64 <= m <= 1023;
>  d). 0 <= s <= 6;
>  e). -32768 <= k <= 32767;
> 
> Usage example:
> ------------------------------------------------------------
> cat /sys/devices/platform/30030000.sai/pll1
> 722534400
> echo 589824000 > /sys/devices/platform/30030000.sai/pll1
> ------------------------------------------------------------
> 
> clk_int_pll1443x_recalc_rate: 589823982:393:1:4:14155
> mdiv = 393; pdiv = 1; sdiv = 4; kdiv = 14155;
> Audio PLL rate = 589823982 Hz
> 
> cat /sys/kernel/debug/clk/clk_summary
> ------------------------------------------------------------
>  audio_pll2_ref_sel  0            0    24000000 0 0
>   audio_pll2         0            0   589823982 0 0
>    audio_pll2_bypass 0            0   589823982 0 0
>     audio_pll2_out   0            0   589823982 0 0

With the reference manual mentioned: 1 <= p <= 63 restriction you may
find the exact clock rate of: 589824000. So question is why do we have
this limitation?

Regards,
  Marco
