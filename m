Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA10CECAAD5
	for <linux-clk@archiver.kernel.org>; Fri,  2 Sep 2022 19:35:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230342AbiIBTf5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Sep 2022 15:35:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230336AbiIBTfz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Sep 2022 15:35:55 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8268FD87E5
        for <linux-clk@vger.kernel.org>; Fri,  2 Sep 2022 12:35:52 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id v16so3518681wrm.8
        for <linux-clk@vger.kernel.org>; Fri, 02 Sep 2022 12:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=T/yia6VscjVg9lKFE0AZwhYiMtREgLkGPOBsdI4ZOMw=;
        b=eGWa7bKHYl2Nz+WSVKuek/89mZFFJO04byxlX4ef3ZKdyHmKWjt8V5HSKcA0SO7+BB
         8sezSC+tip0hoL50+gA90+17rq34nljG+JylbfYIKC+nCrl1fT6LgBNdgmplZ2D9lNBC
         IwHbGwqnNi1xacWEei/qzP0xdhqkWKCCn4bIjVN7jo0NdhIl9k14RIjZ0nrDGt+et9L0
         y6sca1h7IsgXoN8sxmQC7+yBhJshVjbRPyOUVHVxPtqr59bhFTeVfz7djyNGg+GFbBZK
         l3aN7WN82xLn4ziGTpSlSE1WY94+QS3ju9Rl+kqUDrV4xYe+Sb9ez1o4Urx941zb/tTQ
         yvjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=T/yia6VscjVg9lKFE0AZwhYiMtREgLkGPOBsdI4ZOMw=;
        b=YHt9BPllnb0vSn42YamqVbvf4ybYeqPlEj34Liw+4cG2sy80HDNOEmCpT4wsxhCaor
         hTy5nOpnKKhmAKKQ4XF/xFm+2bIH5s8aRSrSq72ZLsPAEvQaCBtV5PQKapKfrj3DkyRK
         HWMKwDuH/05ixAg9MEKMp//EWoMNu0DpIvtOlio0op0yQoFFE5LKd+YjLH543oykM7+K
         9lbzGt1VwwxVztzzJ4Cs6iP+X4Sf2/X0i3YK4esAxOuRQV+4DfYBynlA7wQGCKZGfL5D
         nsH4oOGDO1gSaEyceRAkHXXbiytAAyVg3EaNXM3PNa9t8SyKUYVysmpFoY+9kp44Ej6u
         a/sg==
X-Gm-Message-State: ACgBeo0Tp0qUCl0Fkx2LqteGmTnzA7G944DUMeYGtvvDt6whqgtmOUhd
        P8frNWeVuontG0747X87Sj6g8w==
X-Google-Smtp-Source: AA6agR6fwsbL5snUTUdHCaiK0SNJivEidWO0mT7PNvT5SeOJiRU3048OfxhzYCccpXyv/2u1SpCrFQ==
X-Received: by 2002:adf:f592:0:b0:225:2f5e:6a99 with SMTP id f18-20020adff592000000b002252f5e6a99mr19302290wro.593.1662147350584;
        Fri, 02 Sep 2022 12:35:50 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id bg15-20020a05600c3c8f00b003a4f08495b7sm10552034wmb.34.2022.09.02.12.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 12:35:49 -0700 (PDT)
Date:   Fri, 2 Sep 2022 22:35:46 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V3 0/8] clk: imx93: new gate API and composite update
Message-ID: <YxJbEmO7oI3wNll2@linaro.org>
References: <20220830033137.4149542-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220830033137.4149542-1-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-08-30 11:31:29, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> 
> V3:
>  Add R-b
>  Drop of_match_ptr in patch 2, so I drop Abel's R-b in this patch.
> 
> V2:
>  Add A-b from Rob
>  Add a new patch 2 reported by intel test robot
>  Use Abel's new address for sending mail
> 
> The current clk driver use gate API as i.MX8M*, the gate2 API use 0x3 as
> val/mask, however i.MX93 LPCG DIRECT use BIT0 as on/off gate. So clk
> disable unused actually not gate off the LPCG clocks.
> And i.MX93 has AUTHEN feature, so add a new API to support i.MX93 clk gate.
> 
> i.MX93 CCM ROOT has slice busy check bit when updating register value, add
> check. CCM ROOT also has AUTHEN whitelist, so add DID check.
> 
> Besides the gate/composite update, add MU[X] and SAI IPG clk in this
> patchset
> 
> This patchset has got reviewed in NXP internal, so I keep R-b tag here.
> For those that have some change compared with downstream, R-b tag dropped.

Applied all, except patch no. 2. Will wait for Stephen to pick that one
up since it is a fix and so it might need to go through his clk/fixes.
If not, I'll apply it to my tree along with the others.

> 
> Peng Fan (8):
>   dt-bindings: clock: imx93-clock: add more MU/SAI clocks
>   clk: imx93: drop of_match_ptr
>   clk: imx: clk-composite-93: check slice busy
>   clk: imx: clk-composite-93: check white_list
>   clk: imx: add i.MX93 clk gate
>   clk: imx93: switch to use new clk gate API
>   clk: imx93: add MU1/2 clock
>   clk: imx93: add SAI IPG clk
> 
>  drivers/clk/imx/Makefile                |   2 +-
>  drivers/clk/imx/clk-composite-93.c      | 171 +++++++++++++++++++-
>  drivers/clk/imx/clk-gate-93.c           | 199 ++++++++++++++++++++++++
>  drivers/clk/imx/clk-imx93.c             |  32 ++--
>  drivers/clk/imx/clk.h                   |   9 +-
>  include/dt-bindings/clock/imx93-clock.h |   9 +-
>  6 files changed, 402 insertions(+), 20 deletions(-)
>  create mode 100644 drivers/clk/imx/clk-gate-93.c
> 
> -- 
> 2.37.1
> 
