Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7167BC4332F
	for <linux-clk@archiver.kernel.org>; Fri,  4 Nov 2022 21:54:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbiKDVyC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Nov 2022 17:54:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbiKDVyA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Nov 2022 17:54:00 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF4866354
        for <linux-clk@vger.kernel.org>; Fri,  4 Nov 2022 14:53:59 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id ud5so16677369ejc.4
        for <linux-clk@vger.kernel.org>; Fri, 04 Nov 2022 14:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G2+2NHPv18uUoxTGZu5bT2YmBoYAj7oShXHc8+IlIFY=;
        b=Dl9lkTGyr8UcmUmcfcfSeZiJkln9sFrSN4HgLQsIQAUG5Ev5DPwRhNtg2z5upNXQHJ
         zAoZHQjTfFFGFTCnV570C4830V3+3W+WDHHTuFCBdlLzSzbcPa1OmjX35IebCSllcm3X
         4wZKimhMLYduqqWcEHj9BzCzQH2y+3apspOsZHacgoInfITV968u6O2RNaSk3t2qRZav
         AtIaqoIVrwYt2oa+s12077uxUEoDcZN5gUM2nJnMyndf+KrKuAV3Ydnpg/TzqIiTj2eU
         /PDs7XDNOE+cQ2FjunPQ9EOivOf1tukn5MkOwaHOUfLoRbP23D87RSRDKD44PAjLond+
         6CKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G2+2NHPv18uUoxTGZu5bT2YmBoYAj7oShXHc8+IlIFY=;
        b=kdp43O3Qf06pFw0qUIKPdTmoeCf6xZ0DFI1AJh7klltrFYLxhEsXqUn/k3Nd4lJ1bD
         PK8wI/XEvcH0vzV8853Y04oUsi8YQgV4/DeN8yvL6r/PoJcEFQWBpPwwYr++AXy+vf7E
         2Q2xqz6c0kR9Y4Ob2x/nuUXnfeeKQE9ODe94gFDCPzKqD4Ew+nYZ9xY7hAkqYD4cpFxI
         BMQlx+NK65dB4KQcYj843XY17QUGoJefxqb1ElJ2hhIOtjAcGP7C+++D3lKQBjwnpWcQ
         LSHb0BNm/wnFRSjFtGl4TGEtPjYX2UR6r0XD8syqrahWYzRuGM4fNhofzIjLotoXsJC6
         aD2Q==
X-Gm-Message-State: ACrzQf1yEOEM7h0yYFq0vJY+ckxdrIl0PSAqh+CkQUDCsBKZxGjGUlPb
        Kq7ECnD++C3A1eyCi0odcXaw+w==
X-Google-Smtp-Source: AMsMyM6qWSDs2vFvZXKCZQ8ROP0xAbtkT9Kn660kjwDIHL2mKmQfAEAmiC1ppfNJ32ejmMZ+fLqOXw==
X-Received: by 2002:a17:907:2715:b0:7ad:ef1e:3bc7 with SMTP id w21-20020a170907271500b007adef1e3bc7mr21252831ejk.580.1667598838198;
        Fri, 04 Nov 2022 14:53:58 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id ky14-20020a170907778e00b0073c8d4c9f38sm50492ejc.177.2022.11.04.14.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 14:53:57 -0700 (PDT)
Date:   Fri, 4 Nov 2022 23:53:56 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Shengjiu Wang <shengjiu.wang@nxp.com>
Cc:     shengjiu.wang@gmail.com, abelvesa@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, marex@denx.de
Subject: Re: [PATCH v4 2/2] clk: imx8mp: Add audio shared gate
Message-ID: <Y2WJ9Hm6jtdsy+Fp@linaro.org>
References: <1666935144-7364-1-git-send-email-shengjiu.wang@nxp.com>
 <1666935144-7364-3-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1666935144-7364-3-git-send-email-shengjiu.wang@nxp.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-10-28 13:32:24, Shengjiu Wang wrote:
> From: Abel Vesa <abel.vesa@nxp.com>
> 
> According to the RM, the CCGR101 is shared for the following root clocks:
> - AUDIO_AHB_CLK_ROOT
> - AUDIO_AXI_CLK_ROOT
> - SAI1_CLK_ROOT
> - SAI2_CLK_ROOT
> - SAI3_CLK_ROOT
> - SAI5_CLK_ROOT
> - SAI6_CLK_ROOT
> - SAI7_CLK_ROOT
> - PDM_CLK_ROOT
> 
> And still keep MX8MP_CLK_AUDIO_ROOT clock, even it is duplicate with
> AUDIO_AHB_CLK_ROOT, that is to avoid break any users.
> 
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/clk/imx/clk-imx8mp.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
> index 652ae58c2735..d9ad09877990 100644
> --- a/drivers/clk/imx/clk-imx8mp.c
> +++ b/drivers/clk/imx/clk-imx8mp.c
> @@ -17,6 +17,7 @@
>  
>  static u32 share_count_nand;
>  static u32 share_count_media;
> +static u32 share_count_audio;
>  
>  static const char * const pll_ref_sels[] = { "osc_24m", "dummy", "dummy", "dummy", };
>  static const char * const audio_pll1_bypass_sels[] = {"audio_pll1", "audio_pll1_ref_sel", };
> @@ -699,7 +700,21 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
>  	hws[IMX8MP_CLK_HDMI_ROOT] = imx_clk_hw_gate4("hdmi_root_clk", "hdmi_axi", ccm_base + 0x45f0, 0);
>  	hws[IMX8MP_CLK_TSENSOR_ROOT] = imx_clk_hw_gate4("tsensor_root_clk", "ipg_root", ccm_base + 0x4620, 0);
>  	hws[IMX8MP_CLK_VPU_ROOT] = imx_clk_hw_gate4("vpu_root_clk", "vpu_bus", ccm_base + 0x4630, 0);
> -	hws[IMX8MP_CLK_AUDIO_ROOT] = imx_clk_hw_gate4("audio_root_clk", "audio_ahb", ccm_base + 0x4650, 0);
> +
> +	/*
> +	 * IMX8MP_CLK_AUDIO_ROOT is same as IMX8MP_CLK_AUDIO_AHB_ROOT.
> +	 * In order to avoid break any users, still keep it.
> +	 */
> +	hws[IMX8MP_CLK_AUDIO_ROOT] = imx_clk_hw_gate2_shared2("audio_root_clk", "audio_ahb", ccm_base + 0x4650, 0, &share_count_audio);
> +	hws[IMX8MP_CLK_AUDIO_AHB_ROOT] = imx_clk_hw_gate2_shared2("audio_ahb_root", "audio_ahb", ccm_base + 0x4650, 0, &share_count_audio);

Please correct me if I'm wrong, but maybe it would make more sense to
register just one clock here and then do:

#define IMX8MP_CLK_AUDIO_AHB_ROOT IMX8MP_CLK_AUDIO_ROOT

in the bindings header file?

AFAIK, all consumers use these clocks by their binding ID.

> +	hws[IMX8MP_CLK_AUDIO_AXI_ROOT] = imx_clk_hw_gate2_shared2("audio_axi_root", "audio_axi", ccm_base + 0x4650, 0, &share_count_audio);
> +	hws[IMX8MP_CLK_SAI1_ROOT] = imx_clk_hw_gate2_shared2("sai1_root", "sai1", ccm_base + 0x4650, 0, &share_count_audio);
> +	hws[IMX8MP_CLK_SAI2_ROOT] = imx_clk_hw_gate2_shared2("sai2_root", "sai2", ccm_base + 0x4650, 0, &share_count_audio);
> +	hws[IMX8MP_CLK_SAI3_ROOT] = imx_clk_hw_gate2_shared2("sai3_root", "sai3", ccm_base + 0x4650, 0, &share_count_audio);
> +	hws[IMX8MP_CLK_SAI5_ROOT] = imx_clk_hw_gate2_shared2("sai5_root", "sai5", ccm_base + 0x4650, 0, &share_count_audio);
> +	hws[IMX8MP_CLK_SAI6_ROOT] = imx_clk_hw_gate2_shared2("sai6_root", "sai6", ccm_base + 0x4650, 0, &share_count_audio);
> +	hws[IMX8MP_CLK_SAI7_ROOT] = imx_clk_hw_gate2_shared2("sai7_root", "sai7", ccm_base + 0x4650, 0, &share_count_audio);
> +	hws[IMX8MP_CLK_PDM_ROOT] = imx_clk_hw_gate2_shared2("pdm_root", "pdm", ccm_base + 0x4650, 0, &share_count_audio);
>  
>  	hws[IMX8MP_CLK_ARM] = imx_clk_hw_cpu("arm", "arm_a53_core",
>  					     hws[IMX8MP_CLK_A53_CORE]->clk,
> -- 
> 2.34.1
> 
