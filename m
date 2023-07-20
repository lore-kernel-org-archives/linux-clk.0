Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5A97EB64DA
	for <linux-clk@archiver.kernel.org>; Thu, 20 Jul 2023 13:08:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231625AbjGTNIG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 Jul 2023 09:08:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231709AbjGTNIE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Jul 2023 09:08:04 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FE15EC
        for <linux-clk@vger.kernel.org>; Thu, 20 Jul 2023 06:08:03 -0700 (PDT)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <a.fatoum@pengutronix.de>)
        id 1qMTNv-0005Iy-1c; Thu, 20 Jul 2023 15:07:59 +0200
Message-ID: <3854bfc2-88bf-672c-d2cd-22b4ca3e2721@pengutronix.de>
Date:   Thu, 20 Jul 2023 15:07:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [EXT] Re: bounds of pdiv in clk-pll14xx.c
Content-Language: en-US
To:     Adrian Alonso <adrian.alonso@nxp.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
        "bli@bang-olufsen.dk" <bli@bang-olufsen.dk>,
        Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc:     dl-linux-imx <linux-imx@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-clk <linux-clk@vger.kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Abel Vesa <abelvesa@kernel.org>
References: <ca6b0f0b-3f0d-8e4d-c857-8c6515250782@prevas.dk>
 <20230713175435.z66efhro7mvnk5gg@pengutronix.de>
 <DB9PR04MB828202F64FB4F4724B23564FFC37A@DB9PR04MB8282.eurprd04.prod.outlook.com>
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <DB9PR04MB828202F64FB4F4724B23564FFC37A@DB9PR04MB8282.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello Adrian,

[Cc'ing Peng Fan and Jacky Bay who also worked on the downstream driver]

On 13.07.23 23:59, Adrian Alonso wrote:
> Hi,
> 
> +Bligaard
> 
> FRef for Audio/Video PLLs are usually 24Mhz/25Mhz;
> 
> But most common use case for dynamic reconf is for Audio PLL
> Where prate = 2 4Mhz (FRef) could derive 44.1khz/44khz sample rates
> 
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

imx8mm.dtsi/imx8mn.dtsi initialize audio_pll1 and audio_pll2
with 393216000 and 361267200 Hz respectively, but the hardcoded
parameters in the table result in 393215995 and 361267196 Hz
respectively. With Marco's patch restoring 63 as upper bound for
pdiv, we can achieve the exact frequency if we just drop these
two hardcoded frequencies from the table.

I wonder why the parameters were chosen the way they are, despite
them not achieving the required frequencies exactly. Do you have
some insight into why this could be and if we shouldn't just drop:

  PLL_1443X_RATE(393216000U, 262, 2, 3, 9437),
  PLL_1443X_RATE(361267200U, 361, 3, 3, 17511),

in favor of the dynamic determination. FTR, the parameters it
chooses (with Marco's patch applied) are:

/*               rate     mdiv  pdiv  sdiv   kdiv */
PLL_1443X_RATE(393216000, 655,    5,    3,  23593),
PLL_1443X_RATE(361267200, 497,   33,    0, -16882),
 

Cheers,
Ahmad

>      1 <= p <= 4;
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
> 
> Regards
> Adrian

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

