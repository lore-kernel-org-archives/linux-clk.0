Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBFCEC761A6
	for <linux-clk@archiver.kernel.org>; Fri, 31 Mar 2023 19:59:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbjCaT7G (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 31 Mar 2023 15:59:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230473AbjCaT7F (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 31 Mar 2023 15:59:05 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 587CD18F
        for <linux-clk@vger.kernel.org>; Fri, 31 Mar 2023 12:58:38 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id s13so13542697wmr.4
        for <linux-clk@vger.kernel.org>; Fri, 31 Mar 2023 12:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680292717;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c6UaV33OnUIePT3ovgSxUs2ozSo5dTYIiTHi7oaH6Rc=;
        b=VHkY3U5u8IyEq2PLPezuuruBPo8YeM5e0mMTLvwlVsfdEhHAxmVV/14fpofH8PoAwA
         qrnztRGrYVEywQT3vJqSX91BFB40D2I+vVAbZHR4O5oSL//9QykI1oirRaQgSuNKCnUI
         sFpjSxnwMbT0BC1hY50wIVLR4DVyOJ0K5yIHNL3mC6r8QTWL6AyK1yMkD5n6M9zIBf2P
         oAFGbHRL6POVOmb430ZhdqUmNw7FmIeZabO6j7vANm/MIEs9A15OYl5k6tR3lEeVCd05
         dG+fd6G8pB/JMM9gs0DNmkUzYGkI09yJruWnP4JcZln61J03DbNYT13lMf2q+qpenBiM
         ychQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680292717;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c6UaV33OnUIePT3ovgSxUs2ozSo5dTYIiTHi7oaH6Rc=;
        b=SLIhRcgejynu2MuYkSk49Qy/zBVYKg0/w61iaUNaSF9xgSKQuTmfE/bOgcCs8HJmVo
         qxNIgBfbNHRsGQeGusCfdPdOTU1H3nINDW90abkrqB0MCEgUhkNjBecXJgjkGLZnEwCm
         3oMGM1brG5DAppsWm7XAny6VBwXZpjD8Kv3E3rhFaZ6W9ojvXgzEPGiR9sUbwmPOnG4M
         qT0lPrCqnJVrsREYG1w/AhNW980icYXsOfpunEZ8o10XAbQEqzZQ0e8t570AsrK6jQcx
         quCHyXDdH/48Q+DuudHfGDzZxd3Ix27JK5ezfPbzA4hFTur1CzPiujPBjWefjB8xG2Tr
         2lrg==
X-Gm-Message-State: AO0yUKXQSqGHfv83JFHP8Cr0wnapGeYAfOdyOQBiXFsiu8mLe+A79iRq
        JsRHsArYvaKVzDWXVkUjHuD+3g==
X-Google-Smtp-Source: AK7set9R6265xOKCcbCeQ79S0Pi8TT5LtzoUu4/5E3fh0vBQTTsp5YvSGFFPiE4Nova7L65iUOa8Rw==
X-Received: by 2002:a05:600c:3795:b0:3ed:a82d:dffb with SMTP id o21-20020a05600c379500b003eda82ddffbmr20212662wmr.40.1680292716805;
        Fri, 31 Mar 2023 12:58:36 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id o5-20020a05600c510500b003ef5bb63f13sm11056854wms.10.2023.03.31.12.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 12:58:36 -0700 (PDT)
Date:   Fri, 31 Mar 2023 22:58:34 +0300
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
Message-ID: <ZCc7agfv1Kvkh04l@linaro.org>
References: <20230321135324.1286359-1-alexander.stein@ew.tq-group.com>
 <ZCbXC6A4lgxc4wO4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZCbXC6A4lgxc4wO4@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-03-31 15:50:19, Abel Vesa wrote:
> On 23-03-21 14:53:24, Alexander Stein wrote:
> > Make sure to keep UART clocks enabled during kernel init if
> > earlyprintk or earlycon are active.
> > 
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> 
> Applied, thanks!
> 
> [1/1] clk: imx6ul: retain early UART clocks during kernel init
>       commit: edc6476d334adaeedf899c70e61264305155fd70
> 
> Best regards,
> --
> Abel Vesa <abel.vesa@linaro.org>


Actually dropped, because of this:
https://lore.kernel.org/all/202304010336.L6H9SxmK-lkp@intel.com/

Rebase and resend if needed, please.

> 
> > ---
> > Apparently i.MX6UL was missed in commit 0822f933735c ("clk: imx6: retain
> > early UART clocks during kernel init"). But as commit 379c9a24cc23 ("clk:
> > imx: Fix reparenting of UARTs not associated with stdout") changes the
> > calling signature it's not warranting a Fixes for the old commit.
> > 
> >  drivers/clk/imx/clk-imx6ul.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/clk/imx/clk-imx6ul.c b/drivers/clk/imx/clk-imx6ul.c
> > index 206e4c43f68f..26578e407d3e 100644
> > --- a/drivers/clk/imx/clk-imx6ul.c
> > +++ b/drivers/clk/imx/clk-imx6ul.c
> > @@ -510,6 +510,8 @@ static void __init imx6ul_clocks_init(struct device_node *ccm_node)
> >  		clk_set_parent(hws[IMX6ULL_CLK_EPDC_PRE_SEL]->clk, hws[IMX6UL_CLK_PLL3_PFD2]->clk);
> >  
> >  	clk_set_parent(hws[IMX6UL_CLK_ENFC_SEL]->clk, hws[IMX6UL_CLK_PLL2_PFD2]->clk);
> > +
> > +	imx_register_uart_clocks(2);
> >  }
> >  
> >  CLK_OF_DECLARE(imx6ul, "fsl,imx6ul-ccm", imx6ul_clocks_init);
> > -- 
> > 2.34.1
> > 
