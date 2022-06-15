Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D12B9C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 15 Jun 2022 21:39:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238652AbiFOVje (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Jun 2022 17:39:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239542AbiFOVjc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Jun 2022 17:39:32 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50EEB3A71E
        for <linux-clk@vger.kernel.org>; Wed, 15 Jun 2022 14:39:30 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id l2-20020a05600c4f0200b0039c55c50482so1864988wmq.0
        for <linux-clk@vger.kernel.org>; Wed, 15 Jun 2022 14:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WpusKpAzg0hzv8C88L2NfhQCj3t1rbCxTG8xdEpeKi4=;
        b=D72wyUSjwhe3g68sMln2+qn5FBWg4wyIQ282P98Y9FLg/uOw75/r8xjwSvMDC+y+B2
         GimaJ+6Mpvw3RvWV55qtYmOvVcHudTgLhg2gh0v9DQMecqAd+q0kmYI6gPrzw+c94aeD
         SDNuh6V7dAlGf/mvhlvu0OcSO0tgaKr7zyM1NyR7mFry5SeP+E56TOiWb9gbbd70Dvng
         SZVzp+o22+JxsnHFoL1qMopdYlv5hNQI3VH7Vdy0XZKc19VQ9sdJXYg23sVvpc7d/iWv
         qA5RVUlCsh+0lrLKIA5m+rDNYDBSAzaqKtFqC6TNkdkvlaLbdXtO1ryua8va8OlfPNem
         IlAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WpusKpAzg0hzv8C88L2NfhQCj3t1rbCxTG8xdEpeKi4=;
        b=uRc+OybWiyeQ6nv49Pq9SONk2JOLC9wzjPbb4yQh4drPj3m7ab2Xa3YSZM20alOvTA
         cClA1nnCC2b8z2k4VdLEWfBndJsKmH5CvDSH6D8COxXfbpVZ4x+3XSpCvBPycVlH+uJd
         z9OTk52f2f5BastgvklG3JMshFtH3JJFiYZkmV2srcwC3NSmrINmMG7Y4rcpAgfq/oVG
         GUUGp5CJ9sopQ604Sgs0SGQxE+i55SIvaVkxhY2RmKS8sgeDidvbzlgEoEmtJ+dEjNCC
         k0u0VNG7VKZBtmB0PzqMGK4qCMW9pfsy+e4bxKcB2i8M56ehmHMSkNCI5rrFENRv/f49
         uwJw==
X-Gm-Message-State: AJIora/X+i0j9L+oQTFi/2EIIk556eN8de8EcBc1aQslEm657dTrN+Pu
        h0H+Z8MZni6dV+1R4B8JQr0jJg==
X-Google-Smtp-Source: AGRyM1uA1JoEm0yyw1h2ZMgcEu5LMwPS+9HcFXWg6jmJtRcEx8pnHC+9fzlznVBv5APjHJVFU5AEKg==
X-Received: by 2002:a05:600c:acb:b0:397:bdb:ffea with SMTP id c11-20020a05600c0acb00b003970bdbffeamr1555565wmr.56.1655329168946;
        Wed, 15 Jun 2022 14:39:28 -0700 (PDT)
Received: from ryzen ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id o18-20020a5d6852000000b0021552eebde6sm71670wrw.32.2022.06.15.14.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 14:39:28 -0700 (PDT)
Date:   Thu, 16 Jun 2022 00:39:27 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     abel.vesa@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 3/7] clk: imx93: Correct the edma1's parent clock
Message-ID: <YqpRjwTVZU12H4Gb@ryzen>
References: <20220609132902.3504651-1-peng.fan@oss.nxp.com>
 <20220609132902.3504651-4-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220609132902.3504651-4-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-06-09 21:28:58, Peng Fan (OSS) wrote:
> From: Jacky Bai <ping.bai@nxp.com>
>
> For EDMA1 in AONMIX, its parent clock should be from cm33_root,
> so Correct it.
>
> Fixes: 24defbe194b65("clk: imx: add i.MX93 clk")
> Reviewed-by: Peng Fan <peng.fan@nxp.com>

The reviews done internally do no count in upstream.
I think that's the rule. So drop the R-b tags from all patches.
Keep only the S-o-b tags.

With that fixed, you can add:

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/clk/imx/clk-imx93.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/imx/clk-imx93.c b/drivers/clk/imx/clk-imx93.c
> index 26885bd3971c..f5c9fa40491c 100644
> --- a/drivers/clk/imx/clk-imx93.c
> +++ b/drivers/clk/imx/clk-imx93.c
> @@ -160,7 +160,7 @@ static const struct imx93_clk_ccgr {
>  	{ IMX93_CLK_SEMA2_GATE,		"sema2",	"bus_wakeup_root",	0x8480, },
>  	{ IMX93_CLK_MU_A_GATE,		"mu_a",		"bus_aon_root",		0x84c0, },
>  	{ IMX93_CLK_MU_B_GATE,		"mu_b",		"bus_aon_root",		0x8500, },
> -	{ IMX93_CLK_EDMA1_GATE,		"edma1",	"wakeup_axi_root",	0x8540, },
> +	{ IMX93_CLK_EDMA1_GATE,		"edma1",	"m33_root",		0x8540, },
>  	{ IMX93_CLK_EDMA2_GATE,		"edma2",	"wakeup_axi_root",	0x8580, },
>  	{ IMX93_CLK_FLEXSPI1_GATE,	"flexspi",	"flexspi_root",		0x8640, },
>  	{ IMX93_CLK_GPIO1_GATE,		"gpio1",	"m33_root",		0x8880, },
> --
> 2.25.1
>
