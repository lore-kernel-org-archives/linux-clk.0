Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59670C77B70
	for <linux-clk@archiver.kernel.org>; Sun,  9 Apr 2023 13:44:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbjDINoi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 9 Apr 2023 09:44:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbjDINoh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 9 Apr 2023 09:44:37 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6C613A99
        for <linux-clk@vger.kernel.org>; Sun,  9 Apr 2023 06:44:36 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id qa44so6683659ejc.4
        for <linux-clk@vger.kernel.org>; Sun, 09 Apr 2023 06:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681047875; x=1683639875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XkDkuaBPjpy+EJtSPevUxDWOfOvzo71cgS8AvzVvmes=;
        b=kGpQFbNrH/sZl9SHXTheP1vIDUq6XbItuidowGQMpGZlUuUhOXLwcsudyVGHF4ivaz
         ZevGcIeeF8jhx6gckp/kYIYg4cmNG1mrt4N3jdfzMNUlsXyWKv1fKRAuMulC7kQO7hSE
         0/W15kGG/f0SihfSwTvmX3dNmxgp7UnyRRKi2DtdGaNVNCivv3a1nPp0BQj7CyvmC1Js
         UWwcYXuHGQUaT3D1Oj1gUB5rM4mwwgVZJBo1MWl1SSFAlhtMo8cA1qdoeBnQ+kij/f8q
         3sTRg1DmJgT/urbI0/KynQt2IJ5e1iWmhcrBsEUpSi2f/jzw2X9YAKR5Hukak8c0psZk
         6+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681047875; x=1683639875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XkDkuaBPjpy+EJtSPevUxDWOfOvzo71cgS8AvzVvmes=;
        b=nMSWbxvyKW1tRVMtKOpBC34qQ3MK+eT1K8bwQKJJkcLkYjROiTYSJehNQAk5u5WrFa
         MIMLGrdgPnDB1070H2eK4D1Yod+R+93VZVyCISS1v0DmMX1G1LRv3P0QKo0apcoT+sib
         9BezRCM2Rdln2djHJQCqDqcgP39+QhXx9vTU8f7q73GQq0OVqx08YsM+mX7HzXkPdYIb
         wKp00BC99Wrp/RpJIrgbatYOj3M5xLxact5A2NoMp/r4CsJdDta3DbKMu8+dxKyooJ6B
         bn0Qpj9V3ZQlx8qv5dkcCa4yKvMp/d3uddFlmGuUy9VwXAKFv9Tj05kD2IFuIL/QNhp0
         OKQA==
X-Gm-Message-State: AAQBX9ev14jtJ1sIMkflObmgdCBOXoiFDxLERofcpZZrIxIRR9mrrTCB
        v0mJRGyLoooR9HGwf1TZFRGqHg==
X-Google-Smtp-Source: AKy350bNFZIuIh+vV8kCLJfSB+asCNAdxTw09g9zMvMd/eWOiygIOtcmHZksluJaGdImKJABTV5gGQ==
X-Received: by 2002:a17:906:2706:b0:947:71bf:ca19 with SMTP id z6-20020a170906270600b0094771bfca19mr3853980ejc.65.1681047875261;
        Sun, 09 Apr 2023 06:44:35 -0700 (PDT)
Received: from linaro.org ([188.25.26.161])
        by smtp.gmail.com with ESMTPSA id a12-20020a17090680cc00b00922a79e79c2sm4142096ejx.217.2023.04.09.06.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Apr 2023 06:44:34 -0700 (PDT)
Date:   Sun, 9 Apr 2023 16:44:33 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>, Jacky Bai <ping.bai@nxp.com>
Subject: Re: [PATCH V3 1/7] clk: imx: fracn-gppll: fix the rate table
Message-ID: <ZDLBQYpdR9OUkes9@linaro.org>
References: <20230403095300.3386988-1-peng.fan@oss.nxp.com>
 <20230403095300.3386988-2-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230403095300.3386988-2-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-04-03 17:52:54, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The Fvco should be range 2.4GHz to 5GHz, the original table voilate the
> spec, so update the table to fix it.
> 
> Fixes: c196175acdd3 ("clk: imx: clk-fracn-gppll: Add more freq config for video pll")
> Fixes: 044034efbeea ("clk: imx: clk-fracn-gppll: fix mfd value")
> Fixes: 1b26cb8a77a4 ("clk: imx: support fracn gppll")
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/clk/imx/clk-fracn-gppll.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-fracn-gppll.c b/drivers/clk/imx/clk-fracn-gppll.c
> index a2aaa14fc1ae..ec50c41e2a4c 100644
> --- a/drivers/clk/imx/clk-fracn-gppll.c
> +++ b/drivers/clk/imx/clk-fracn-gppll.c
> @@ -60,18 +60,20 @@ struct clk_fracn_gppll {
>  };
>  
>  /*
> - * Fvco = Fref * (MFI + MFN / MFD)
> - * Fout = Fvco / (rdiv * odiv)
> + * Fvco = (Fref / rdiv) * (MFI + MFN / MFD)
> + * Fout = Fvco / odiv
> + * The (Fref / rdiv) should be in range 20MHz to 40MHz
> + * The Fvco should be in range 2.5Ghz to 5Ghz
>   */
>  static const struct imx_fracn_gppll_rate_table fracn_tbl[] = {
> -	PLL_FRACN_GP(650000000U, 81, 0, 1, 0, 3),
> +	PLL_FRACN_GP(650000000U, 162, 50, 100, 0, 6),
>  	PLL_FRACN_GP(594000000U, 198, 0, 1, 0, 8),
> -	PLL_FRACN_GP(560000000U, 70, 0, 1, 0, 3),
> -	PLL_FRACN_GP(498000000U, 83, 0, 1, 0, 4),
> +	PLL_FRACN_GP(560000000U, 140, 0, 1, 0, 6),
> +	PLL_FRACN_GP(498000000U, 166, 0, 1, 0, 8),
>  	PLL_FRACN_GP(484000000U, 121, 0, 1, 0, 6),
>  	PLL_FRACN_GP(445333333U, 167, 0, 1, 0, 9),
> -	PLL_FRACN_GP(400000000U, 50, 0, 1, 0, 3),
> -	PLL_FRACN_GP(393216000U, 81, 92, 100, 0, 5)
> +	PLL_FRACN_GP(400000000U, 200, 0, 1, 0, 12),
> +	PLL_FRACN_GP(393216000U, 163, 84, 100, 0, 10)
>  };
>  
>  struct imx_fracn_gppll_clk imx_fracn_gppll = {
> -- 
> 2.37.1
> 
