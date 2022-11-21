Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87F5BC4332F
	for <linux-clk@archiver.kernel.org>; Mon, 21 Nov 2022 20:25:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbiKUUZT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Nov 2022 15:25:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbiKUUZS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Nov 2022 15:25:18 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9AEE58BE7
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 12:25:14 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id z4so6961428wrr.3
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 12:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s8XCWIoNJx+zOHXlaBX5GAAQYuNWepS6xNmfTP4LxGA=;
        b=kOPMnLuIUxyBy9vQVQkK6kuqjk3XbD1wMzY1cbzoDy+BKAJLPpETMGwmrqjszpNDHm
         3oGpoXZkvpnmZh12KtMZxhTESDGVX+koQVNG0FbnF0sXhJFa7tKGgy2wtjiBDWvBkI5G
         elAs+HQKfhhrHyxOYPvAhh2UvH3RgHWE2cWq12/39GBDT9l4E0OeC6zd24Wai3kYQhqI
         kEC/YxTZjl7bflKOulW0kw5KFyAK42rpqjRF5UxjhoEubnOtFhUtRE4x2Q0d+1cWotAF
         jJ52NK2AEw/AxIFGwBXGUlJgAMTk4W70k8d8zWpWloQSCHRlrExp+wEYEI9DjGNgXxwX
         G9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s8XCWIoNJx+zOHXlaBX5GAAQYuNWepS6xNmfTP4LxGA=;
        b=BLNVIVg1p+ffS0We34VODkeKfHaoGKYDulm3ICN3P9FjIADKrmqlwz3WCMB2rfGRS+
         AfgfKyX4H+PYUqJyBqU2ntKvE+q1OOtK7jeXS1B4nGJWY5haIpZxTN0g09X1O88l641K
         jeHv5JWPEfEijq4lfIgimkC7lwN2Ukw8mAJP1rM23OjzV2ZhvjJ1WEGOFG14lvBcp8lQ
         4KEzJ4Ctr5F07tnXofUB25SlAU5tC44T08AOwqgY0I0ySd1RaU8MjOiydOlm09pXN844
         Oq6wzuth7ehZ/p0X85eSgWMngKF2wgdrcSMCkr9VkZs0GJcf5GpLCtV+SRkFBjfbAszg
         l7ag==
X-Gm-Message-State: ANoB5pm9X9qSSmODGRNRHn+sax/X8zfmcxkrI6Qu78ReVEVYXZARordD
        UhrUnVWfpcGNy9H6XAy7SIyn6A==
X-Google-Smtp-Source: AA0mqf4EJHtZyBnKBbvQAYAA9oMyDl9oHoEZtWufNhjo4fdZR68vc8+WBz/qi0g8wYERQ8lUp4A5lA==
X-Received: by 2002:adf:ed8b:0:b0:241:d375:88b6 with SMTP id c11-20020adfed8b000000b00241d37588b6mr4525252wro.88.1669062313404;
        Mon, 21 Nov 2022 12:25:13 -0800 (PST)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id r13-20020a056000014d00b0024165454262sm12119514wrx.11.2022.11.21.12.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 12:25:12 -0800 (PST)
Date:   Mon, 21 Nov 2022 22:25:11 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc:     linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
        michael@amarulasolutions.com, Abel Vesa <abelvesa@kernel.org>,
        Anson Huang <Anson.Huang@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 5/5] clk: imx8mn: fix imx8mn_enet_phy_sels clocks list
Message-ID: <Y3vep1zwBikjsB0R@linaro.org>
References: <20221117113637.1978703-1-dario.binacchi@amarulasolutions.com>
 <20221117113637.1978703-6-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221117113637.1978703-6-dario.binacchi@amarulasolutions.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-11-17 12:36:37, Dario Binacchi wrote:
> According to the "Clock Root" table of the reference manual (document
> IMX8MNRM Rev 2, 07/2022):
> 
>      Clock Root         offset     Source Select (CCM_TARGET_ROOTn[MUX])
>         ...              ...                    ...
>  ENET_PHY_REF_CLK_ROOT  0xAA80            000 - 24M_REF_CLK
>                                           001 - SYSTEM_PLL2_DIV20
>                                           010 - SYSTEM_PLL2_DIV8
>                                           011 - SYSTEM_PLL2_DIV5
>                                           100 - SYSTEM_PLL2_DIV2
>                                           101 - AUDIO_PLL1_CLK
>                                           110 - VIDEO_PLL_CLK
>                                           111 - AUDIO_PLL2_CLK
>         ...              ...                    ...
> 
> while the imx8mn_enet_phy_sels list didn't contained audio_pll1_out for
> source select bits 101b.
> 
> Fixes: 96d6392b54dbb ("clk: imx: Add support for i.MX8MN clock driver")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> 
> ---
> 
> (no changes since v1)
> 
>  drivers/clk/imx/clk-imx8mn.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
> index 37128c35198d..2afea905f7f3 100644
> --- a/drivers/clk/imx/clk-imx8mn.c
> +++ b/drivers/clk/imx/clk-imx8mn.c
> @@ -140,8 +140,8 @@ static const char * const imx8mn_enet_timer_sels[] = {"osc_24m", "sys_pll2_100m"
>  						      "clk_ext4", "video_pll_out", };
>  
>  static const char * const imx8mn_enet_phy_sels[] = {"osc_24m", "sys_pll2_50m", "sys_pll2_125m",
> -						    "sys_pll2_200m", "sys_pll2_500m", "video_pll_out",
> -						    "audio_pll2_out", };
> +						    "sys_pll2_200m", "sys_pll2_500m", "audio_pll1_out",
> +						    "video_pll_out", "audio_pll2_out", };
>  
>  static const char * const imx8mn_nand_sels[] = {"osc_24m", "sys_pll2_500m", "audio_pll1_out",
>  						"sys_pll1_400m", "audio_pll2_out", "sys_pll3_out",
> -- 
> 2.32.0
> 
