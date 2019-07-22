Return-Path: <SRS0=ECv2=VT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07599C76191
	for <linux-clk@archiver.kernel.org>; Mon, 22 Jul 2019 03:34:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CA3A021953
	for <linux-clk@archiver.kernel.org>; Mon, 22 Jul 2019 03:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1563766487;
	bh=KOxZPjyK9INnzYcIKi8Kw5IoLDhXg2vltv5ZVrxbMxM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=kyRLHMuRTIqQ9jBCCWU0cwkYDFBgCBdy6OOtCIg9UkT/GczqoeCD+0gYx88uH67rM
	 UVpdkcnKrAO5fXAlR1f2cU8xFjzNya1Qo5JwKEX2923n85RPhvggaXFvK1qNIfomCH
	 p7d11ufPLXzQm7eyi+seBE/enUNtVH6pm5QcflK4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728014AbfGVDer (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 21 Jul 2019 23:34:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:36196 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726360AbfGVDer (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 21 Jul 2019 23:34:47 -0400
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 74CAB20821;
        Mon, 22 Jul 2019 03:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563766486;
        bh=KOxZPjyK9INnzYcIKi8Kw5IoLDhXg2vltv5ZVrxbMxM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XLWFiu9I+GRhAgwOajCy/jahWvlNp0VbvlmGCPVCn7KrwLgzbhPMYPctTP6ptiOU6
         YvXZNLGgovVynGo5k2VM3qUA9/ZH6gJARzOjJ4L/9pr4J3jvUr/TrInrXBzj5bfq1I
         8T4oWnuQoEtwoDtXutRtBgvxB+Cu1FP3HUrTWNMc=
Date:   Mon, 22 Jul 2019 11:34:20 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     jun.li@nxp.com
Cc:     sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, mturquette@baylibre.com, Peter.Chen@nxp.com,
        ping.bai@nxp.com, leonard.crestez@nxp.com, daniel.baluta@nxp.com,
        Anson.Huang@nxp.com, aisheng.dong@nxp.com, peng.fan@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 3/5] clk: imx8mm: correct the usb1_ctrl parent to be
 usb_bus
Message-ID: <20190722033418.GX3738@dragon>
References: <20190703072327.38165-1-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190703072327.38165-1-jun.li@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Jul 03, 2019 at 03:23:25PM +0800, jun.li@nxp.com wrote:
> From: Li Jun <jun.li@nxp.com>
> 
> Per latest imx8mm datasheet of CCM, the parent of usb1_ctrl_root_clk
> should be usb_bus.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>

I only received 3 patches as a series.  In that case, the patches should
have subject prefix like '[PATCH 1/3]' ...

The patches look good to me.  Applied all 3, thanks.

Shawn

> ---
>  drivers/clk/imx/clk-imx8mm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
> index 6b8e75d..735cf9d 100644
> --- a/drivers/clk/imx/clk-imx8mm.c
> +++ b/drivers/clk/imx/clk-imx8mm.c
> @@ -631,7 +631,7 @@ static int __init imx8mm_clocks_init(struct device_node *ccm_node)
>  	clks[IMX8MM_CLK_UART2_ROOT] = imx_clk_gate4("uart2_root_clk", "uart2", base + 0x44a0, 0);
>  	clks[IMX8MM_CLK_UART3_ROOT] = imx_clk_gate4("uart3_root_clk", "uart3", base + 0x44b0, 0);
>  	clks[IMX8MM_CLK_UART4_ROOT] = imx_clk_gate4("uart4_root_clk", "uart4", base + 0x44c0, 0);
> -	clks[IMX8MM_CLK_USB1_CTRL_ROOT] = imx_clk_gate4("usb1_ctrl_root_clk", "usb_core_ref", base + 0x44d0, 0);
> +	clks[IMX8MM_CLK_USB1_CTRL_ROOT] = imx_clk_gate4("usb1_ctrl_root_clk", "usb_bus", base + 0x44d0, 0);
>  	clks[IMX8MM_CLK_GPU3D_ROOT] = imx_clk_gate4("gpu3d_root_clk", "gpu3d_div", base + 0x44f0, 0);
>  	clks[IMX8MM_CLK_USDHC1_ROOT] = imx_clk_gate4("usdhc1_root_clk", "usdhc1", base + 0x4510, 0);
>  	clks[IMX8MM_CLK_USDHC2_ROOT] = imx_clk_gate4("usdhc2_root_clk", "usdhc2", base + 0x4520, 0);
> -- 
> 2.7.4
> 
