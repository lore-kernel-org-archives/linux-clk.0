Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 005C9C001DE
	for <linux-clk@archiver.kernel.org>; Mon, 31 Jul 2023 14:23:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231411AbjGaOX1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 31 Jul 2023 10:23:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232597AbjGaOXQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 31 Jul 2023 10:23:16 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41ABC1713
        for <linux-clk@vger.kernel.org>; Mon, 31 Jul 2023 07:23:11 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1qQTnZ-0004Io-Vw; Mon, 31 Jul 2023 16:23:01 +0200
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1qQTnZ-00051D-Gj; Mon, 31 Jul 2023 16:23:01 +0200
Date:   Mon, 31 Jul 2023 16:23:01 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, festevam@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, Anson.Huang@nxp.com
Cc:     kernel@pengutronix.de, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-imx@nxp.com
Subject: Re: [PATCH v2 1/2] clk: imx8mp: fix sai4 clock
Message-ID: <20230731142301.zqx6xivq3qjdwp25@pengutronix.de>
References: <20230731142150.3186650-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230731142150.3186650-1-m.felsch@pengutronix.de>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

+Cc linux-imx@nxp.com

On 23-07-31, Marco Felsch wrote:
> The reference manual don't mention a SAI4 hardware block. This would be
> clock slice 78 which is skipped (TRM, page 237). Remove any reference to
> this clock to align the driver with the reality.
> 
> Fixes: 9c140d992676 ("clk: imx: Add support for i.MX8MP clock driver")
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> Changelog:
> 
> v2:
> - rebase to v6.5-rc1
> 
>  drivers/clk/imx/clk-imx8mp.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
> index 1469249386dd8..670aa2bab3017 100644
> --- a/drivers/clk/imx/clk-imx8mp.c
> +++ b/drivers/clk/imx/clk-imx8mp.c
> @@ -178,10 +178,6 @@ static const char * const imx8mp_sai3_sels[] = {"osc_24m", "audio_pll1_out", "au
>  						"video_pll1_out", "sys_pll1_133m", "osc_hdmi",
>  						"clk_ext3", "clk_ext4", };
>  
> -static const char * const imx8mp_sai4_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out",
> -						"video_pll1_out", "sys_pll1_133m", "osc_hdmi",
> -						"clk_ext1", "clk_ext2", };
> -
>  static const char * const imx8mp_sai5_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out",
>  						"video_pll1_out", "sys_pll1_133m", "osc_hdmi",
>  						"clk_ext2", "clk_ext3", };
> @@ -567,7 +563,6 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
>  	hws[IMX8MP_CLK_SAI1] = imx8m_clk_hw_composite("sai1", imx8mp_sai1_sels, ccm_base + 0xa580);
>  	hws[IMX8MP_CLK_SAI2] = imx8m_clk_hw_composite("sai2", imx8mp_sai2_sels, ccm_base + 0xa600);
>  	hws[IMX8MP_CLK_SAI3] = imx8m_clk_hw_composite("sai3", imx8mp_sai3_sels, ccm_base + 0xa680);
> -	hws[IMX8MP_CLK_SAI4] = imx8m_clk_hw_composite("sai4", imx8mp_sai4_sels, ccm_base + 0xa700);
>  	hws[IMX8MP_CLK_SAI5] = imx8m_clk_hw_composite("sai5", imx8mp_sai5_sels, ccm_base + 0xa780);
>  	hws[IMX8MP_CLK_SAI6] = imx8m_clk_hw_composite("sai6", imx8mp_sai6_sels, ccm_base + 0xa800);
>  	hws[IMX8MP_CLK_ENET_QOS] = imx8m_clk_hw_composite("enet_qos", imx8mp_enet_qos_sels, ccm_base + 0xa880);
> -- 
> 2.39.2
> 
> 
> 
