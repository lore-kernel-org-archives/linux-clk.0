Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A1D9C433FE
	for <linux-clk@archiver.kernel.org>; Fri,  4 Nov 2022 20:52:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229495AbiKDUwj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Nov 2022 16:52:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbiKDUwi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Nov 2022 16:52:38 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2067E1DF33
        for <linux-clk@vger.kernel.org>; Fri,  4 Nov 2022 13:52:37 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id sc25so16236325ejc.12
        for <linux-clk@vger.kernel.org>; Fri, 04 Nov 2022 13:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r6oMO7pq4PUJ0DCAGwSe+XGvbvHl1TD87arJYlCOgpg=;
        b=E1EdimKdqHIv7dRAutHb4qxXK4A1jGDzKMQ9SeWB+i2u429ntFZSdtXrkVDQz5DXJX
         TFjdgMQTzvFiZUVwBidOq2RDfU38mC/w/VonzZXvrWI0cBdEBa6QRqaPyDxPMzvXatRs
         K5OGhYsWBLApTEs2AlM/NdtwO5sGv2zYPzm/i1YmQ5wsHsyv9ctyJAgwiBNcFZYtIl9C
         WT1lmh7wp7gMPd4ew+SxZ3sEs1ZzAmkGPFUB77e8k/Kyf5IbtEO0Wu7FBn0hdvPUu4xW
         Ph3ehZRPWZx1JH2m7QFCYJQ8yl2xOXzcmzqJo/zwkS7tOglZtm6Qn55DhDWCdA0YkWut
         e9ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6oMO7pq4PUJ0DCAGwSe+XGvbvHl1TD87arJYlCOgpg=;
        b=3/ZST5sQdisf4plNw7Qeto5TmB3e1GgucAODT928gA2cjcumHP5rT6+uzb2I/8Tx5A
         S8zHPrjXNN+vG5zcf7R5zY8MnVFuEtDe2/lMwlRj9TWLoMpRdCckYnrL2O7vf88g0oQz
         wA2nKVEtpjHJBF0Tme9EfeXnxBVCl58O3e3moxdQszE11F3lnU0Uof90ApTtf11QruY0
         gGMaAOSIlR25gH7TzNrtC9QqUB3XgY4HDv408KjAzy2Q88tLmnpqYAcM+DztllCPn5vT
         +KYZhZaXXwFi9D/ts1iCKgnSKdF9nc7jTxn2aCWswlM7dH3wXB6lS3SQ2H6n681g6Gh+
         mR8w==
X-Gm-Message-State: ACrzQf3j3A2ewmaEI03yUz4B3j8vRSpl9eb75LI5ucnyheY7lTzp846L
        BlX+ZtHKpQoVi/OmfelqRRps7Q==
X-Google-Smtp-Source: AMsMyM7rXraWMimKExlRNc9vxGFX6UxJa3+YBbsihMifk2wtFPEwgfz0XrXhZkvJMRSS1gYb+fteCw==
X-Received: by 2002:a17:907:7da6:b0:791:997e:58fc with SMTP id oz38-20020a1709077da600b00791997e58fcmr37053761ejc.385.1667595155658;
        Fri, 04 Nov 2022 13:52:35 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id p16-20020aa7d310000000b004618f2127d2sm230628edq.57.2022.11.04.13.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 13:52:35 -0700 (PDT)
Date:   Fri, 4 Nov 2022 22:52:33 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>, Ye Li <ye.li@nxp.com>
Subject: Re: [PATCH 2/6] clk: imx93: correct enet clock
Message-ID: <Y2V7kdOOYZGQS0OS@linaro.org>
References: <20221028095211.2598312-1-peng.fan@oss.nxp.com>
 <20221028095211.2598312-3-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028095211.2598312-3-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-10-28 17:52:07, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Per update Reference Mannual, correct the enet clock parent to
> wakeup_axi_root.
> 
> Fixes: 24defbe194b6 ("clk: imx: add i.MX93 clk")
> Reviewed-by: Ye Li <ye.li@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/clk/imx/clk-imx93.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-imx93.c b/drivers/clk/imx/clk-imx93.c
> index 9ef3fcbdd951..7fdc30062a46 100644
> --- a/drivers/clk/imx/clk-imx93.c
> +++ b/drivers/clk/imx/clk-imx93.c
> @@ -240,7 +240,7 @@ static const struct imx93_clk_ccgr {
>  	{ IMX93_CLK_AUD_XCVR_GATE,	"aud_xcvr",	"audio_xcvr_root",	0x9b80, },
>  	{ IMX93_CLK_SPDIF_GATE,		"spdif",	"spdif_root",		0x9c00, },
>  	{ IMX93_CLK_HSIO_32K_GATE,	"hsio_32k",	"osc_32k",		0x9dc0, },
> -	{ IMX93_CLK_ENET1_GATE,		"enet1",	"enet_root",		0x9e00, },
> +	{ IMX93_CLK_ENET1_GATE,		"enet1",	"wakeup_axi_root",	0x9e00, },
>  	{ IMX93_CLK_ENET_QOS_GATE,	"enet_qos",	"wakeup_axi_root",	0x9e40, },
>  	{ IMX93_CLK_SYS_CNT_GATE,	"sys_cnt",	"osc_24m",		0x9e80, },
>  	{ IMX93_CLK_TSTMR1_GATE,	"tstmr1",	"bus_aon_root",		0x9ec0, },
> -- 
> 2.37.1
> 
