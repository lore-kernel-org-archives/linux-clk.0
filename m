Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B9AC38145
	for <linux-clk@archiver.kernel.org>; Thu,  8 Sep 2022 16:38:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbiIHQiW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Sep 2022 12:38:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbiIHQiV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Sep 2022 12:38:21 -0400
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3317114A47;
        Thu,  8 Sep 2022 09:38:19 -0700 (PDT)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1279948d93dso26013112fac.10;
        Thu, 08 Sep 2022 09:38:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=lvfP/nhWsY8oBpBNFWb/Dc+zjx1n8PQQil/mT/n7D/U=;
        b=Ugs0yxE4phL1W6ZpEIO2CGj4z/NOl+eSc8M4QWTgDnRuBiOCRLZi1dFUEpeViR5rSB
         kJk9P7bp458LGicukOFIoiXU8OdvSaDkxkVApVSEjTXrNiOHf/gkC/0z9VorJ/UtulK6
         c/jBUw8CCVBi+UKxpRf8mijM6+F2nA6HV0ZgxrhHUTxvUrUhGrtw/qBp5TXDvxpR2HoF
         JCDCT5tODQrqJtFA7/A3o1Rwrqbv4kWppRo8pElh0rwGPJ/1Se+8ncR0rf2MBvKfQNAf
         AMqbSqaR4ASzGSWWmso1hk7Ql3xd9WNRPKrYi+nSrv36EfOA5XJWJgBuzfEpwLwcFPqk
         296g==
X-Gm-Message-State: ACgBeo3HIwwfDe059vMrqJvSnq6OHNzf01o6As77QRou2R/Tu9yc48XD
        kzkDCtZ+6MIdyK+n/+oE5A==
X-Google-Smtp-Source: AA6agR5p1R0sxmWEs10gj8myVJPaGmhmAee+K/QcxXYrhsaI9dj8t3i+ioEBP5ARnjKC7yd8qecEsw==
X-Received: by 2002:a05:6870:fb87:b0:126:2e4f:cf4d with SMTP id kv7-20020a056870fb8700b001262e4fcf4dmr2567506oab.240.1662655099196;
        Thu, 08 Sep 2022 09:38:19 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id o186-20020aca5ac3000000b0034564365bf2sm7752757oib.17.2022.09.08.09.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 09:38:18 -0700 (PDT)
Received: (nullmailer pid 2863036 invoked by uid 1000);
        Thu, 08 Sep 2022 16:38:17 -0000
Date:   Thu, 8 Sep 2022 11:38:17 -0500
From:   Rob Herring <robh@kernel.org>
To:     Li Jun <jun.li@nxp.com>
Cc:     abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        krzysztof.kozlowski+dt@linaro.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] clk: imx: imx8mp: add shared clk gate for usb
 suspend clk
Message-ID: <20220908163817.GA2828563-robh@kernel.org>
References: <1662547028-22279-1-git-send-email-jun.li@nxp.com>
 <1662547028-22279-2-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1662547028-22279-2-git-send-email-jun.li@nxp.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Sep 07, 2022 at 06:37:08PM +0800, Li Jun wrote:
> 32K usb suspend clock gate is shared with usb_root_clk.

So? What is the impact of not having this change? Why is it stable 
material? The commit message needs to answer those questions.

> 
> Fixes: 9c140d9926761 ("clk: imx: Add support for i.MX8MP clock driver")
> Cc: stable@vger.kernel.org # v5.19+
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>  drivers/clk/imx/clk-imx8mp.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
> index e89db568f5a8..5b66514bdd0c 100644
> --- a/drivers/clk/imx/clk-imx8mp.c
> +++ b/drivers/clk/imx/clk-imx8mp.c
> @@ -17,6 +17,7 @@
>  
>  static u32 share_count_nand;
>  static u32 share_count_media;
> +static u32 share_count_usb;
>  
>  static const char * const pll_ref_sels[] = { "osc_24m", "dummy", "dummy", "dummy", };
>  static const char * const audio_pll1_bypass_sels[] = {"audio_pll1", "audio_pll1_ref_sel", };
> @@ -673,7 +674,8 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
>  	hws[IMX8MP_CLK_UART2_ROOT] = imx_clk_hw_gate4("uart2_root_clk", "uart2", ccm_base + 0x44a0, 0);
>  	hws[IMX8MP_CLK_UART3_ROOT] = imx_clk_hw_gate4("uart3_root_clk", "uart3", ccm_base + 0x44b0, 0);
>  	hws[IMX8MP_CLK_UART4_ROOT] = imx_clk_hw_gate4("uart4_root_clk", "uart4", ccm_base + 0x44c0, 0);
> -	hws[IMX8MP_CLK_USB_ROOT] = imx_clk_hw_gate4("usb_root_clk", "hsio_axi", ccm_base + 0x44d0, 0);
> +	hws[IMX8MP_CLK_USB_ROOT] = imx_clk_hw_gate2_shared2("usb_root_clk", "hsio_axi", ccm_base + 0x44d0, 0, &share_count_usb);
> +	hws[IMX8MP_CLK_USB_SUSP] = imx_clk_hw_gate2_shared2("usb_suspend_clk", "osc_32k", ccm_base + 0x44d0, 0, &share_count_usb);
>  	hws[IMX8MP_CLK_USB_PHY_ROOT] = imx_clk_hw_gate4("usb_phy_root_clk", "usb_phy_ref", ccm_base + 0x44f0, 0);
>  	hws[IMX8MP_CLK_USDHC1_ROOT] = imx_clk_hw_gate4("usdhc1_root_clk", "usdhc1", ccm_base + 0x4510, 0);
>  	hws[IMX8MP_CLK_USDHC2_ROOT] = imx_clk_hw_gate4("usdhc2_root_clk", "usdhc2", ccm_base + 0x4520, 0);
> -- 
> 2.34.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
