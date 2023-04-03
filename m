Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ADECC76196
	for <linux-clk@archiver.kernel.org>; Mon,  3 Apr 2023 08:36:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231623AbjDCIgB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Apr 2023 04:36:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229843AbjDCIf7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Apr 2023 04:35:59 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4BC735AD
        for <linux-clk@vger.kernel.org>; Mon,  3 Apr 2023 01:35:57 -0700 (PDT)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <a.fatoum@pengutronix.de>)
        id 1pjFfH-00071V-AM; Mon, 03 Apr 2023 10:35:47 +0200
Message-ID: <c9ba8e79-7fdb-72de-e58c-8c18e87c88df@pengutronix.de>
Date:   Mon, 3 Apr 2023 10:35:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] clk: imx: drop duplicated macro
Content-Language: en-US
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, abelvesa@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Cc:     linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
References: <20230403082728.3199849-1-peng.fan@oss.nxp.com>
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20230403082728.3199849-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 03.04.23 10:27, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Drop duplicated macro definition
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

> ---
>  drivers/clk/imx/clk.h | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
> index 3d94722bbf99..055bc9197fb4 100644
> --- a/drivers/clk/imx/clk.h
> +++ b/drivers/clk/imx/clk.h
> @@ -153,9 +153,6 @@ extern struct imx_fracn_gppll_clk imx_fracn_gppll;
>  #define imx_clk_pllv2(name, parent, base) \
>  	to_clk(imx_clk_hw_pllv2(name, parent, base))
>  
> -#define imx_clk_mux_flags(name, reg, shift, width, parents, num_parents, flags) \
> -	to_clk(imx_clk_hw_mux_flags(name, reg, shift, width, parents, num_parents, flags))
> -
>  #define imx_clk_hw_gate(name, parent, reg, shift) \
>  	imx_clk_hw_gate_flags(name, parent, reg, shift, 0)
>  

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

