Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06AC5C77B71
	for <linux-clk@archiver.kernel.org>; Sun,  9 Apr 2023 13:36:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbjDINgH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 9 Apr 2023 09:36:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbjDINgH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 9 Apr 2023 09:36:07 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E80364232
        for <linux-clk@vger.kernel.org>; Sun,  9 Apr 2023 06:36:02 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-947abd74b10so317762866b.2
        for <linux-clk@vger.kernel.org>; Sun, 09 Apr 2023 06:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681047361; x=1683639361;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F+U2cN54BmEXl9vhWYLHf8TnBpFB/z8HkcfW7Ar/Fco=;
        b=ZEakrV8siRKnkFM3dTfe71MlumwIwrKIXjrJ8otT8PJ8zWca7t4pQc9b2ONalYUN6H
         pjKN9WnBj0Tx4J5Jl7g/zDBwi8vH1zCOWF9uhR3k1gJJikCermUrjwCS/4XYbPK7WVFb
         4XJecOSvscU0OcUePf2eOqJdgFoLG0i8KkBQCD4eBLZc6ig1vF2oTciqOK7oc5vXVPKA
         osAvFlRVepySArTdJAVBdiTTD4go67xBRZJiizSOOddxAzxM92hXtxLTpV0RR2RiVg3W
         4LKpKgpLQfJ0OwKbmLHt66lOR2bw+2Fkfee3UvjhYQm9G5UQlIrOvGMxSz+beE0fAXw0
         w10A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681047361; x=1683639361;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+U2cN54BmEXl9vhWYLHf8TnBpFB/z8HkcfW7Ar/Fco=;
        b=fKyXMEaUVS8cM3S0LOw6JtlL7aSqaeK65Q3rggNjbwEj/HGFbeRN1vmIpg4YPkF9xg
         Kl5jewBlcd8gb9rFWjGI8cDXs1l/NJawPQ/13+PwRvhF1vhpo4x2cX88JGqAy8YVmz7Z
         uUzCa6KFCi8g9lixwiYC3wLBRdmRuUrdoJTOQdQ4hRaOefj3RYAyyaiyG5I9PvvmpFK3
         0962tOgs3LF37SqX/tMB9PoafpKSZRqBiVWuO1uqoQMqkVsZe63/ZseeqxhmGAMZJ2nR
         VguhXDCkhtv+aIFlGioVUHLu04TBx5JR77nGKASycyH48m6moC2FEzpwW2qlQXOerfQU
         X5Sg==
X-Gm-Message-State: AAQBX9dXjFDKPrVrNuoESiY931VCE/9avaS/EKUq9DfbPctG1hMuYWiO
        6DN5xX5hM5B77FzPGPLalCr4vg==
X-Google-Smtp-Source: AKy350Z2sfSQOMxOi8MX95CMiObAQXrydcRVRaTUrR8Jw1xutFp8Oc1gnjUqmfCpF7OiEg2xHTrhJQ==
X-Received: by 2002:aa7:c3c2:0:b0:504:9393:18b1 with SMTP id l2-20020aa7c3c2000000b00504939318b1mr2334418edr.9.1681047361378;
        Sun, 09 Apr 2023 06:36:01 -0700 (PDT)
Received: from linaro.org ([188.25.26.161])
        by smtp.gmail.com with ESMTPSA id a71-20020a509ecd000000b00501dd53dbfbsm3946255edf.75.2023.04.09.06.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Apr 2023 06:36:00 -0700 (PDT)
Date:   Sun, 9 Apr 2023 16:35:59 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Liu Ying <victor.liu@nxp.com>, Sandor Yu <Sandor.yu@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V3 3/4] clk: imx: imx8mp: Add LDB root clock
Message-ID: <ZDK/P9TQyRaPg687@linaro.org>
References: <20230403094633.3366446-1-peng.fan@oss.nxp.com>
 <20230403094633.3366446-3-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230403094633.3366446-3-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-04-03 17:46:32, Peng Fan (OSS) wrote:
> From: Liu Ying <victor.liu@nxp.com>
> 
> This patch adds "media_ldb_root_clk" clock for
> the LDB in the MEDIAMIX subsystem.
> 
> Reviewed-by: Sandor Yu <Sandor.yu@nxp.com>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
> 
> V3:
>  None
> V2:
>  Seperate binding
> 
>  drivers/clk/imx/clk-imx8mp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
> index 4a0f1b739fd4..8dcaeb213277 100644
> --- a/drivers/clk/imx/clk-imx8mp.c
> +++ b/drivers/clk/imx/clk-imx8mp.c
> @@ -696,6 +696,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
>  	hws[IMX8MP_CLK_MEDIA_DISP1_PIX_ROOT] = imx_clk_hw_gate2_shared2("media_disp1_pix_root_clk", "media_disp1_pix", ccm_base + 0x45d0, 0, &share_count_media);
>  	hws[IMX8MP_CLK_MEDIA_DISP2_PIX_ROOT] = imx_clk_hw_gate2_shared2("media_disp2_pix_root_clk", "media_disp2_pix", ccm_base + 0x45d0, 0, &share_count_media);
>  	hws[IMX8MP_CLK_MEDIA_MIPI_PHY1_REF_ROOT] = imx_clk_hw_gate2_shared2("media_mipi_phy1_ref_root", "media_mipi_phy1_ref", ccm_base + 0x45d0, 0, &share_count_media);
> +	hws[IMX8MP_CLK_MEDIA_LDB_ROOT] = imx_clk_hw_gate2_shared2("media_ldb_root_clk", "media_ldb", ccm_base + 0x45d0, 0, &share_count_media);
>  	hws[IMX8MP_CLK_MEDIA_ISP_ROOT] = imx_clk_hw_gate2_shared2("media_isp_root_clk", "media_isp", ccm_base + 0x45d0, 0, &share_count_media);
>  
>  	hws[IMX8MP_CLK_USDHC3_ROOT] = imx_clk_hw_gate4("usdhc3_root_clk", "usdhc3", ccm_base + 0x45e0, 0);
> -- 
> 2.37.1
> 
