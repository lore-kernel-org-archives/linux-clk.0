Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28724C433EF
	for <linux-clk@archiver.kernel.org>; Fri, 11 Feb 2022 09:16:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348363AbiBKJQ2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 11 Feb 2022 04:16:28 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231723AbiBKJQ1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 11 Feb 2022 04:16:27 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE545102D
        for <linux-clk@vger.kernel.org>; Fri, 11 Feb 2022 01:16:26 -0800 (PST)
Received: from pyrite.rasen.tech (h175-177-042-148.catv02.itscom.jp [175.177.42.148])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8194493;
        Fri, 11 Feb 2022 10:16:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1644570983;
        bh=Lb4nq8uRBNT9UiQnqN01WTbgVcLCoZRVwf6MWlfeKy8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FkNeX7KdhRUoHqE4hNmqGWqJNHl3QSpahW6YpKk0tz0jmq64WmkN8ijcK54//v9Wv
         5aRCJMdp/x2fHdopSFs4VHvfmuUFO6PXAFpdyJAO6+nvZC7K+vAFvrlCS/z73SRcCX
         zYwicTzzLKk22DDfFNZ20YT4pZPJol5qlnVegtMQ=
Date:   Fri, 11 Feb 2022 18:16:13 +0900
From:   paul.elder@ideasonboard.com
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH] clk: imx8mp: Add missing
 IMX8MP_CLK_MEDIA_MIPI_PHY1_REF_ROOT clock
Message-ID: <20220211091613.GC174255@pyrite.rasen.tech>
References: <20220211091311.28146-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220211091311.28146-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Laurent,

On Fri, Feb 11, 2022 at 11:13:11AM +0200, Laurent Pinchart wrote:
> The IMX8MP_CLK_MEDIA_MIPI_PHY1_REF_ROOT clock derives from the
> media_mipi_phy1_ref clock and is gated by the shared media clock gate.
> Its identifier is defined in dt-bindings/clock/imx8mp-clock.h but its
> definition is missing from the driver. Add it.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
>  drivers/clk/imx/clk-imx8mp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
> index c990ad37882b..f23b92906d3b 100644
> --- a/drivers/clk/imx/clk-imx8mp.c
> +++ b/drivers/clk/imx/clk-imx8mp.c
> @@ -694,6 +694,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
>  	hws[IMX8MP_CLK_MEDIA_CAM2_PIX_ROOT] = imx_clk_hw_gate2_shared2("media_cam2_pix_root_clk", "media_cam2_pix", ccm_base + 0x45d0, 0, &share_count_media);
>  	hws[IMX8MP_CLK_MEDIA_DISP1_PIX_ROOT] = imx_clk_hw_gate2_shared2("media_disp1_pix_root_clk", "media_disp1_pix", ccm_base + 0x45d0, 0, &share_count_media);
>  	hws[IMX8MP_CLK_MEDIA_DISP2_PIX_ROOT] = imx_clk_hw_gate2_shared2("media_disp2_pix_root_clk", "media_disp2_pix", ccm_base + 0x45d0, 0, &share_count_media);
> +	hws[IMX8MP_CLK_MEDIA_MIPI_PHY1_REF_ROOT] = imx_clk_hw_gate2_shared2("media_mipi_phy1_ref_root", "media_mipi_phy1_ref", ccm_base + 0x45d0, 0, &share_count_media);
>  	hws[IMX8MP_CLK_MEDIA_ISP_ROOT] = imx_clk_hw_gate2_shared2("media_isp_root_clk", "media_isp", ccm_base + 0x45d0, 0, &share_count_media);
>  
>  	hws[IMX8MP_CLK_USDHC3_ROOT] = imx_clk_hw_gate4("usdhc3_root_clk", "usdhc3", ccm_base + 0x45e0, 0);
> -- 
> Regards,
> 
> Laurent Pinchart
> 
