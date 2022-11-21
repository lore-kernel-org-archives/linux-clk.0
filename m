Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7580C4332F
	for <linux-clk@archiver.kernel.org>; Mon, 21 Nov 2022 19:26:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbiKUT0c (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Nov 2022 14:26:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231478AbiKUT0b (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Nov 2022 14:26:31 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC56F9E088
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 11:26:30 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id b12so7547643wrn.2
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 11:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/ZL6rLSjizF6F00imfDrFMSQ/wOdXEjel6osgWFNPC0=;
        b=atyYg8gYVIhmIFzcSF88hX9vc6gWRn7Z576mhNVRnpIrwfucmpdrazHU0U/N/xOSSX
         B4afvQa36DDrPjinYnBlTUwpEoXoZhgJaqUM2ynKK1KGpbeRQL4atSL9F1oBI1rdCAmI
         2yLr/tloD+Pg2+r08gGhfD31OjPg4qACJQ2kVvSO3DZBTQIDwcqinQ7RGLgSpwuY9RH+
         GCAQQ2/5PBAJ2RhtXFtyyQRSB7MkhiKtTb+oLpwChX6lZU3fX9+wUwOXOX/VmU6oDEzR
         wYEBGhA3V+3/spRDATk+YwzPmkXqUi2rsKKcnz58j0sWPNyP8ULT0AhNv+yw51W2UXXF
         PJew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ZL6rLSjizF6F00imfDrFMSQ/wOdXEjel6osgWFNPC0=;
        b=W82cW7vse/BdEvNyDAk/PKzlS6KAwg2R8K2OzK5V3i1SJ2iF9QPlT+ESW78QuCXQWD
         71F/dlm9VFdhxcm+vAFRAIRbPspqxTyBgfWvSwvsr/2fmYdR+dXSJ5RqT1T80ggQPjPO
         TEvAD9nIm2ghyIyXq40dwldKaneEkh7qXNOHaV4uiZ9vY5cIn2tUnRVdvDq4I7/4K5AC
         mQciDVccAZYFsjby2bJ9mxUk8ZuLHhxFMvSvl/khBTqIafAaye6aOH11mJP7gpX/vbdW
         rE+vNnQIEs9fXjhapycinm+s0RIOzUpyYD/582I3MpZagQRc1yUi8Hly/2bMf8vlFBTN
         dKRA==
X-Gm-Message-State: ANoB5pmeJOSyDx9Q8bd61qPmBvCKFkcQpPgp994monyrOVoJeKdXEvuW
        +bVSkx4LSfRnbA4MMqSezgBSMw==
X-Google-Smtp-Source: AA0mqf78fNj3kHp6o5Hgjh/rdsY6F2cjjjqHn4aCQo9tYpssMt4RyiI+CAYKm2SYwU9+HoLc+FrBpA==
X-Received: by 2002:adf:dd81:0:b0:236:88a2:f072 with SMTP id x1-20020adfdd81000000b0023688a2f072mr12136401wrl.516.1669058789434;
        Mon, 21 Nov 2022 11:26:29 -0800 (PST)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id c1-20020adffb01000000b0023657e1b980sm11878553wrr.53.2022.11.21.11.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 11:26:28 -0800 (PST)
Date:   Mon, 21 Nov 2022 21:26:27 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bough Chen <haibo.chen@nxp.com>,
        Jesse Taube <mr.bossman075@gmail.com>
Subject: Re: [PATCH v2 1/4] clk: imx: imxrt1050: fix IMXRT1050_CLK_LCDIF_APB
 offsets
Message-ID: <Y3vQ47WJnC7yofwD@linaro.org>
References: <20221115193244.10484-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221115193244.10484-1-giulio.benetti@benettiengineering.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-11-15 20:32:41, Giulio Benetti wrote:
> Cc: Jesse Taube <mr.bossman075@gmail.com>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Missing commit message. Same for patch #2 and #4.

> ---
> V1->V2:
> * nothing done
> ---
>  drivers/clk/imx/clk-imxrt1050.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-imxrt1050.c b/drivers/clk/imx/clk-imxrt1050.c
> index 9539d35588ee..26108e9f7e67 100644
> --- a/drivers/clk/imx/clk-imxrt1050.c
> +++ b/drivers/clk/imx/clk-imxrt1050.c
> @@ -140,7 +140,7 @@ static int imxrt1050_clocks_probe(struct platform_device *pdev)
>  	hws[IMXRT1050_CLK_USDHC1] = imx_clk_hw_gate2("usdhc1", "usdhc1_podf", ccm_base + 0x80, 2);
>  	hws[IMXRT1050_CLK_USDHC2] = imx_clk_hw_gate2("usdhc2", "usdhc2_podf", ccm_base + 0x80, 4);
>  	hws[IMXRT1050_CLK_LPUART1] = imx_clk_hw_gate2("lpuart1", "lpuart_podf", ccm_base + 0x7c, 24);
> -	hws[IMXRT1050_CLK_LCDIF_APB] = imx_clk_hw_gate2("lcdif", "lcdif_podf", ccm_base + 0x74, 10);
> +	hws[IMXRT1050_CLK_LCDIF_APB] = imx_clk_hw_gate2("lcdif", "lcdif_podf", ccm_base + 0x70, 28);
>  	hws[IMXRT1050_CLK_DMA] = imx_clk_hw_gate("dma", "ipg", ccm_base + 0x7C, 6);
>  	hws[IMXRT1050_CLK_DMA_MUX] = imx_clk_hw_gate("dmamux0", "ipg", ccm_base + 0x7C, 7);
>  	imx_check_clk_hws(hws, IMXRT1050_CLK_END);
> -- 
> 2.34.1
> 
