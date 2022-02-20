Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B390DC433F5
	for <linux-clk@archiver.kernel.org>; Sun, 20 Feb 2022 07:05:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232144AbiBTHF1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 20 Feb 2022 02:05:27 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:36808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbiBTHF0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 20 Feb 2022 02:05:26 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49384381BC
        for <linux-clk@vger.kernel.org>; Sat, 19 Feb 2022 23:05:05 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0CC1E25B;
        Sun, 20 Feb 2022 08:05:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645340703;
        bh=oW4QGapsCyaCVw+tJrr6Rzq28lsxQSzur0gpeSt47w4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cky+zlW7ayZrgqa8DzKeQSoPWpqKAqfGMQgtooQBGoBgWmsDaBvM1+HM70LKBCp+Q
         5GQ6+Z5Z2IWtXy7JHm0StP2hzZOWwKefZT31kWQAT7WeuTowqFn0CxqzWNNMg1SZul
         lspi8OjOnzyR57knET8p4VKoCKcdLfE596OGx7R0=
Date:   Sun, 20 Feb 2022 09:04:54 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Abel Vesa <abel.vesa@nxp.com>
Cc:     linux-clk@vger.kernel.org,
        Paul Elder <paul.elder@ideasonboard.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH] clk: imx8mp: Add missing
 IMX8MP_CLK_MEDIA_MIPI_PHY1_REF_ROOT clock
Message-ID: <YhHoFqBOxPpeMA8b@pendragon.ideasonboard.com>
References: <20220211091311.28146-1-laurent.pinchart@ideasonboard.com>
 <YhHPbacbIqZ3rEkJ@pendragon.ideasonboard.com>
 <YhHmqv5KhqNL6BxB@abelvesa>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YhHmqv5KhqNL6BxB@abelvesa>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Abel,

On Sun, Feb 20, 2022 at 08:58:50AM +0200, Abel Vesa wrote:
> On 22-02-20 07:19:41, Laurent Pinchart wrote:
> > Hi Abel,
> > 
> > Do you think we can get this merged in v5.18 ?
> 
> Yes. I'm going to apply it tomorrow.
> 
> Sorry for the delay.

No worries at all. Thank you for taking care of it.

> > On Fri, Feb 11, 2022 at 11:13:11AM +0200, Laurent Pinchart wrote:
> > > The IMX8MP_CLK_MEDIA_MIPI_PHY1_REF_ROOT clock derives from the
> > > media_mipi_phy1_ref clock and is gated by the shared media clock gate.
> > > Its identifier is defined in dt-bindings/clock/imx8mp-clock.h but its
> > > definition is missing from the driver. Add it.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
> > > ---
> > >  drivers/clk/imx/clk-imx8mp.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
> > > index c990ad37882b..f23b92906d3b 100644
> > > --- a/drivers/clk/imx/clk-imx8mp.c
> > > +++ b/drivers/clk/imx/clk-imx8mp.c
> > > @@ -694,6 +694,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
> > >  	hws[IMX8MP_CLK_MEDIA_CAM2_PIX_ROOT] = imx_clk_hw_gate2_shared2("media_cam2_pix_root_clk", "media_cam2_pix", ccm_base + 0x45d0, 0, &share_count_media);
> > >  	hws[IMX8MP_CLK_MEDIA_DISP1_PIX_ROOT] = imx_clk_hw_gate2_shared2("media_disp1_pix_root_clk", "media_disp1_pix", ccm_base + 0x45d0, 0, &share_count_media);
> > >  	hws[IMX8MP_CLK_MEDIA_DISP2_PIX_ROOT] = imx_clk_hw_gate2_shared2("media_disp2_pix_root_clk", "media_disp2_pix", ccm_base + 0x45d0, 0, &share_count_media);
> > > +	hws[IMX8MP_CLK_MEDIA_MIPI_PHY1_REF_ROOT] = imx_clk_hw_gate2_shared2("media_mipi_phy1_ref_root", "media_mipi_phy1_ref", ccm_base + 0x45d0, 0, &share_count_media);
> > >  	hws[IMX8MP_CLK_MEDIA_ISP_ROOT] = imx_clk_hw_gate2_shared2("media_isp_root_clk", "media_isp", ccm_base + 0x45d0, 0, &share_count_media);
> > >  
> > >  	hws[IMX8MP_CLK_USDHC3_ROOT] = imx_clk_hw_gate4("usdhc3_root_clk", "usdhc3", ccm_base + 0x45e0, 0);

-- 
Regards,

Laurent Pinchart
