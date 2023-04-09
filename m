Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E3F5C77B70
	for <linux-clk@archiver.kernel.org>; Sun,  9 Apr 2023 14:10:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbjDIOKP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 9 Apr 2023 10:10:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbjDIOKO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 9 Apr 2023 10:10:14 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32CDF40DC
        for <linux-clk@vger.kernel.org>; Sun,  9 Apr 2023 07:10:08 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id sb12so6918925ejc.11
        for <linux-clk@vger.kernel.org>; Sun, 09 Apr 2023 07:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681049407; x=1683641407;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWbSgDAMrUeTkTzdxf9kU0BiKTq0gFmqjxzx/mV1DIw=;
        b=alYRDzBJPwrBHZrEu0HcZ91ApEGoV3F2G5nwHhhCxnJ8HyVJU6BJxHxz5WIA99GAnA
         bYuCnz2vuRVrrYFtH79igaOE4hGZVcCi+fH2p/k5zW6PeHtDH31/miKV6+G7tVufp0je
         ZrkYVQy2BfTF8TbxzgJX60HNB86Y/nITNv6KlwJKeongYNIfJMgzQkxFwv/pvXrWclXo
         uxd69e05kYFztF/OAJ87i+AvNclSOvPgik/cDG5EKsu2PvGO5NhYDPqiZVoDxkpx6mHX
         sCYrfq5HUjvKmiTFVU+g7XSndF8Y/eUfqgCb9LmLBQKwXXlQs5CuPn+joMK7bn91HCxm
         NO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681049407; x=1683641407;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZWbSgDAMrUeTkTzdxf9kU0BiKTq0gFmqjxzx/mV1DIw=;
        b=Vl978URyW6xnj8EwPhIho6wXIFcDTAm7U9tLcupVNXTL8314RaJLPJW7vMkGiVnL2e
         szVnwt5nSmk9Bj1JrSy6EKgZhjX76a3KwX0CSrH4Pu+AT1PyjGkQMAItXcvUsRnnv8Ss
         CEQm2lxJYvOR7tdRg025rj92+GSXf81McWBSBGvOAZi5s/8BC/aXjFKnR6ueFIGSGNaQ
         GnzP1dNGPgxmOxPj63v4lBsDVK6Jea+f2adizs9w52TbvLt4k1zoOAK5BEplgsKkHuzY
         GtdXAbU16U7UumI1q7To32wOH68r2uFf1nl2shMNseAXAy50XzYNKZhQcodQnFxFp55R
         RBGA==
X-Gm-Message-State: AAQBX9cG7oeFRgPrYWLv+vhQIe6EatWTSYU0yOCkR0hfBdHPDytOHhtQ
        VguvHHN79BPk976sl4fcg6eZzA==
X-Google-Smtp-Source: AKy350Y1zIEy1rT6IrUrOwyD2k63RPhd4SZJVjljukrdlVWpu3vQcRHQ7OeLaRDxLuRMPsJlvy2YzQ==
X-Received: by 2002:a17:906:1c08:b0:932:a14e:4c57 with SMTP id k8-20020a1709061c0800b00932a14e4c57mr4477602ejg.76.1681049407595;
        Sun, 09 Apr 2023 07:10:07 -0700 (PDT)
Received: from linaro.org ([188.25.26.161])
        by smtp.gmail.com with ESMTPSA id ho11-20020a1709070e8b00b0093ebc654f78sm4163881ejc.25.2023.04.09.07.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Apr 2023 07:10:07 -0700 (PDT)
Date:   Sun, 9 Apr 2023 17:10:05 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 4/5] clk: imx: imx8ulp: Add tpm5 clock as critical gate
 clock
Message-ID: <ZDLHPeIGx/XWaF2Q@linaro.org>
References: <20230331063814.2462059-1-peng.fan@oss.nxp.com>
 <20230331063814.2462059-5-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230331063814.2462059-5-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-03-31 14:38:13, Peng Fan (OSS) wrote:
> From: Jacky Bai <ping.bai@nxp.com>
> 
> The TPM5 is used for broadcast timer purpose and registered
> with TIMER_OF_DECLARE. As the clock driver is not ready at
> that stage, so the TPM5 clock is configured in bootloader(TF-A).
> if we just remove the TPM5 clock from linux will introduce a
> risk that the TPM5's parent clock will be gated, then lead to
> TPM's channel control config can NOT be written into register
> successfully.
> 
> Due to the above reason, we still need to add the TPM5 clock
> into linux clock but register it as a simple critical gate
> clock to make sure its parent is always on.
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/clk/imx/clk-imx8ulp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8ulp.c b/drivers/clk/imx/clk-imx8ulp.c
> index 0dd48e8159ee..6a8a9e50d826 100644
> --- a/drivers/clk/imx/clk-imx8ulp.c
> +++ b/drivers/clk/imx/clk-imx8ulp.c
> @@ -333,7 +333,6 @@ static int imx8ulp_clk_pcc3_init(struct platform_device *pdev)
>  	clks[IMX8ULP_CLK_WDOG4] = imx8ulp_clk_hw_composite("wdog4", pcc3_periph_bus_sels, ARRAY_SIZE(pcc3_periph_bus_sels), true, true, true, base + 0xac, 1);
>  	clks[IMX8ULP_CLK_LPIT1] = imx8ulp_clk_hw_composite("lpit1", pcc3_periph_bus_sels, ARRAY_SIZE(pcc3_periph_bus_sels), true, true, true, base + 0xc8, 1);
>  	clks[IMX8ULP_CLK_TPM4] = imx8ulp_clk_hw_composite("tpm4", pcc3_periph_bus_sels, ARRAY_SIZE(pcc3_periph_bus_sels), true, true, true, base + 0xcc, 1);
> -	clks[IMX8ULP_CLK_TPM5] = imx8ulp_clk_hw_composite("tpm5", pcc3_periph_bus_sels, ARRAY_SIZE(pcc3_periph_bus_sels), true, true, true, base + 0xd0, 1);
>  	clks[IMX8ULP_CLK_FLEXIO1] = imx8ulp_clk_hw_composite("flexio1", pcc3_periph_bus_sels, ARRAY_SIZE(pcc3_periph_bus_sels), true, true, true, base + 0xd4, 1);
>  	clks[IMX8ULP_CLK_I3C2] = imx8ulp_clk_hw_composite("i3c2", pcc3_periph_bus_sels, ARRAY_SIZE(pcc3_periph_bus_sels), true, true, true, base + 0xd8, 1);
>  	clks[IMX8ULP_CLK_LPI2C4] = imx8ulp_clk_hw_composite("lpi2c4", pcc3_periph_bus_sels, ARRAY_SIZE(pcc3_periph_bus_sels), true, true, true, base + 0xdc, 1);
> @@ -378,6 +377,7 @@ static int imx8ulp_clk_pcc3_init(struct platform_device *pdev)
>  	clks[IMX8ULP_CLK_DMA1_CH31] = imx_clk_hw_gate("pcc_dma1_ch31", "xbar_ad_divplat", base + 0x84, 30);
>  	clks[IMX8ULP_CLK_MU0_B] = imx_clk_hw_gate_flags("mu0_b", "xbar_ad_divplat", base + 0x88, 30, CLK_IS_CRITICAL);
>  	clks[IMX8ULP_CLK_MU3_A] = imx_clk_hw_gate("mu3_a", "xbar_ad_divplat", base + 0x8c, 30);
> +	clks[IMX8ULP_CLK_TPM5] = imx_clk_hw_gate_flags("tpm5", "sosc_div2",  base + 0xd0, 30, CLK_IS_CRITICAL);
>  
>  	imx_check_clk_hws(clks, clk_data->num);
>  
> -- 
> 2.37.1
> 
