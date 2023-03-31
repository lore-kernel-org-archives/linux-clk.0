Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD09C6FD18
	for <linux-clk@archiver.kernel.org>; Fri, 31 Mar 2023 12:51:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232349AbjCaMvb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 31 Mar 2023 08:51:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232404AbjCaMvK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 31 Mar 2023 08:51:10 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 019E52061C
        for <linux-clk@vger.kernel.org>; Fri, 31 Mar 2023 05:50:32 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id v6-20020a05600c470600b003f034269c96so3536099wmo.4
        for <linux-clk@vger.kernel.org>; Fri, 31 Mar 2023 05:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680267021;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tQOcaJo0gjfdjDN9Kz62Il382Hb0T1MZkR+qKXhlg4c=;
        b=fRHkHxjHpIMI1mgZ4M4btKrnOe0sFl5otr4Cu32Cu5QIu6LPakVq+xreCKdQ5XhAiN
         b95O479bK8ZEMxhR9iAH565ceHfzlAy5q0reJLlcVGqaNStulaIW0F9DjNJPpIr37lKv
         fYSo6sauCYsM3Z6RT20E3wcayf7CwCH7syH0MEN5sMS2YX+LRRE4O5l89FfYVNcwL62P
         JcXACvtZXOT+9uS/r44LB2DXANag+7PpqUm5N1OL9VfhPZcyQl0WBRjSCrkiaHmiz0mb
         fGQGDF9zHQRz4wA1MVET4l3MvNajZNZnQ27hKOdxbCC9yXv2v3T95BlS1MkNLg0Oyv67
         xqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680267021;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tQOcaJo0gjfdjDN9Kz62Il382Hb0T1MZkR+qKXhlg4c=;
        b=15/ZhREOxAp1qSmFO5NoHORxyAWV8oD6xTI510kS3jze8jCJ+xVtHMiHgxHntwYxip
         1e4uKLpBtQEpviPpUmhVKKBdketyA4ITFAhXUq4P2TXp6AdoxAyAQm4mZtf7H4nGLBQ+
         JkRMigdl9LmU/80mYh8ck2bdpc9k45QVolHf23tfuSHDha3GfsogL0yrucZD7dTZUHiz
         9c/TO/XQ5tmiKJeWroTTfJuLCcaCGQ7iThCSPEelqqlxG5H5EJjKfyHx3MJyjXUuVgNc
         i8iRpahU/BlaL2EBZ7Ld9SkaZDbuSEzR791c+ahIHM5eTI+UDcsbi0JXN019OH+7wAlS
         SEBA==
X-Gm-Message-State: AO0yUKX6auHWRFFrh9gWtuXeTPBopGrm4rf4BXRvHLClxBzx66E9A8fp
        NXU1dNtFNZ1bf0sMwjPFrUC3+w==
X-Google-Smtp-Source: AK7set9Yd7xSI/pfgzBWTUd8cSHqADDuRA2IypgwQeaHoXHb9vy5hJiefUKdVhF2f6lcyy1sH0Inqg==
X-Received: by 2002:a05:600c:b54:b0:3ed:b6ad:54d with SMTP id k20-20020a05600c0b5400b003edb6ad054dmr20022209wmr.18.1680267021220;
        Fri, 31 Mar 2023 05:50:21 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id n23-20020a05600c3b9700b003ede04deb14sm9577046wms.48.2023.03.31.05.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 05:50:20 -0700 (PDT)
Date:   Fri, 31 Mar 2023 15:50:19 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/1] clk: imx6ul: retain early UART clocks during kernel
 init
Message-ID: <ZCbXC6A4lgxc4wO4@linaro.org>
References: <20230321135324.1286359-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230321135324.1286359-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-03-21 14:53:24, Alexander Stein wrote:
> Make sure to keep UART clocks enabled during kernel init if
> earlyprintk or earlycon are active.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied, thanks!

[1/1] clk: imx6ul: retain early UART clocks during kernel init
      commit: edc6476d334adaeedf899c70e61264305155fd70

Best regards,
--
Abel Vesa <abel.vesa@linaro.org>

> ---
> Apparently i.MX6UL was missed in commit 0822f933735c ("clk: imx6: retain
> early UART clocks during kernel init"). But as commit 379c9a24cc23 ("clk:
> imx: Fix reparenting of UARTs not associated with stdout") changes the
> calling signature it's not warranting a Fixes for the old commit.
> 
>  drivers/clk/imx/clk-imx6ul.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/imx/clk-imx6ul.c b/drivers/clk/imx/clk-imx6ul.c
> index 206e4c43f68f..26578e407d3e 100644
> --- a/drivers/clk/imx/clk-imx6ul.c
> +++ b/drivers/clk/imx/clk-imx6ul.c
> @@ -510,6 +510,8 @@ static void __init imx6ul_clocks_init(struct device_node *ccm_node)
>  		clk_set_parent(hws[IMX6ULL_CLK_EPDC_PRE_SEL]->clk, hws[IMX6UL_CLK_PLL3_PFD2]->clk);
>  
>  	clk_set_parent(hws[IMX6UL_CLK_ENFC_SEL]->clk, hws[IMX6UL_CLK_PLL2_PFD2]->clk);
> +
> +	imx_register_uart_clocks(2);
>  }
>  
>  CLK_OF_DECLARE(imx6ul, "fsl,imx6ul-ccm", imx6ul_clocks_init);
> -- 
> 2.34.1
> 
