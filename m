Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09CD5C4332F
	for <linux-clk@archiver.kernel.org>; Mon, 21 Nov 2022 19:19:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbiKUTTk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Nov 2022 14:19:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231311AbiKUTTg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Nov 2022 14:19:36 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CF1B60CC
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 11:19:35 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id g12so21285250wrs.10
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 11:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xAi8a3PnIsw1PomXHZEK5DhJnyCWSuGYAtIKDL2Vdxg=;
        b=S1d4PAXe/bvFwIlocpNBPJozaI16f1FDVcrsqavt/2ou6oQToHBj54jr2wiS/bRz8s
         J0iZEMBfyhp2aBIbWG2drSKdresl2LFBG3WIBtI38bE4pIGTwwWHC5W4sjqoIKujlYGH
         hcdZVsdPIAXZ8f9gKvPRaSC8yADvpEN4UC/f6NVedUv58qSDkSS54CBCQwHv5fIvhrad
         eoZeQ/fZTxJBvSjPdYrXpXLHfoI2WcZbw4lMB8N/RNrPAj2MNHNeXukFv57W3bwdVd9l
         mV3KbgG+p3PECdLs7RG6C9hItipSH0WBbwYtx/225+Uv7Mrvp60sswV3HcKYzmFqAk4A
         YiXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xAi8a3PnIsw1PomXHZEK5DhJnyCWSuGYAtIKDL2Vdxg=;
        b=liA+8M8h+D7pviqRBBDkErQmLrGrxIazLYESymsO+mpPZkIx3JXY0ufX0wzXb5/ghY
         IYaBDroch5rhNgNDpCFHvWdgXKS4tqJUG+oVGTSFrNcxZmEyUPX3DCLWE13nPBT5VDmV
         gwSHx46HWcJ/Sqc9hdOuKPoBKhjqhD6Z3VelJVFB0CsaoQx3HaWuXUyS4KSmSUGTXqkc
         PXRh0+LeiDTgEhHKSK1eYWuhCQvwAURAFaAiA0umlyfiMzycx8t4fwaCP+2YPFHc+9Zr
         qUBgpHN0FR/0qGHdcYoJvE8YZUK491kOLWR35f8a+19QaEUz/Hhr8dG05+AtwqN09Rca
         emvA==
X-Gm-Message-State: ANoB5pkNReeDOfct+OPf6TJ5EXbtUG7gnqMbqSjJ6IIvB1+PoZ1Lr8xQ
        PQ8D1+D8dUXjfLwBnR4n5D3DBQ==
X-Google-Smtp-Source: AA0mqf5p5mVVBPcNPVfslo0MoCa5w1wzbaHVw1TsDG4VhvmXy1UpOVDOMuRzZzAHIUMnIJCBorH+sQ==
X-Received: by 2002:a05:6000:1d97:b0:241:b99a:949f with SMTP id bk23-20020a0560001d9700b00241b99a949fmr11857563wrb.599.1669058373899;
        Mon, 21 Nov 2022 11:19:33 -0800 (PST)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id m7-20020a05600c4f4700b003b4fe03c881sm21052903wmq.48.2022.11.21.11.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 11:19:33 -0800 (PST)
Date:   Mon, 21 Nov 2022 21:19:31 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc:     linux-kernel@vger.kernel.org, michael@amarulasolutions.com,
        Amarula patchwork <linux-amarula@amarulasolutions.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: imx: DRY cleanup of imx_obtain_fixed_clock_hw()
Message-ID: <Y3vPQ4A/hjYHs8vD@linaro.org>
References: <20221113180945.1626061-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221113180945.1626061-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-11-13 19:09:44, Dario Binacchi wrote:
> The imx_obtain_fixed_clock() and imx_obtain_fixed_clock_hw() functions
> behave pretty similarly, DRY and call one from another.
> 
> No functional changes intended.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
>  drivers/clk/imx/clk.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk.c b/drivers/clk/imx/clk.c
> index 5582f18dd632..573b1a6ca1dc 100644
> --- a/drivers/clk/imx/clk.c
> +++ b/drivers/clk/imx/clk.c
> @@ -104,9 +104,7 @@ struct clk_hw *imx_obtain_fixed_clock_hw(
>  {
>  	struct clk *clk;
>  
> -	clk = imx_obtain_fixed_clock_from_dt(name);
> -	if (IS_ERR(clk))
> -		clk = imx_clk_fixed(name, rate);
> +	clk = imx_obtain_fixed_clock(name, rate);

NACK here. You're switching to a non "clk_hw" based variant that
should/would be removed in the near future.

In the future, we want the clock providers to not used "clk" based APIs.

Rule is, AFAIR, to use "clk" based APIs in clock consumer drivers only,
while using "clk_hw" based APIs in clock provider drivers only.

Right now, only the imx5 and vf610 clock provider drivers still use the
'clk' based API. Once those are switched to 'clk_hw' based, all the 'clk'
i.MX specific APIs will be removed for good.

>  	return __clk_get_hw(clk);
>  }
>  
> -- 
> 2.32.0
> 
