Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4EB0C76188
	for <linux-clk@archiver.kernel.org>; Mon,  3 Apr 2023 20:39:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233495AbjDCUjb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Apr 2023 16:39:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232915AbjDCUjZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Apr 2023 16:39:25 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E1A9173C
        for <linux-clk@vger.kernel.org>; Mon,  3 Apr 2023 13:39:15 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id t4so25424552wra.7
        for <linux-clk@vger.kernel.org>; Mon, 03 Apr 2023 13:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680554354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8W33znYIAl2DMyLncbJoqCopj/H6Dvst/McCNbNede4=;
        b=aqN6rHZLCar/09kDSX23dhRO9TE6+zp5ZBhXizjjLoiA2bJ8NgApcvuPz1q2WwsZrD
         2kFRTjggRG1o9yQaYJuN8bOA10f3SiClaNt99XjI5bWqN7GyPlCf+JjsN7om6K3+lRHC
         v58+eBgq6Dy/iUV4YZOdWEWbPIpGUlaii/2QSbIuafUr9uJH1s2VaDHLv2xRug/yB69u
         KQ01ulzTWkt3yGK+I7CRag0Zo/a5tz/L7JFav860fGdUj9GK6wEJ4oxS9j0DANQmBL/E
         8EDSid2M8ryO4aPHomrjVUF97O8amMTeBRrBai12ixdDITAsCMJ/honqoFEZjsXKi0jw
         Owug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680554354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8W33znYIAl2DMyLncbJoqCopj/H6Dvst/McCNbNede4=;
        b=O6wZoIReGJCJCxKC+1FoCZKFVWBtSpC/X8FPxs+KNaeVHWqhE2eBopGIrEUvrzWPbB
         JOq1DqSs6x+cvoNJdd/JbCKBbI8v6P/bOrygVKElDdV1M1TMiwgrRBw6eDKfby1ITGgg
         Wdj4bZAKqXnDjS+1EbcapLfYHKmFy+k5O6QfrvYFWXNpXxRBkuogPy4OeIp9U/Onewq7
         Kx5/SeEnC2l2UFxTsuGj6W7U4Nio5pGspVLfzlWr/cdUraUvKtB2jKemqLiw4Syspcl6
         cT0eqSK3P/BOHBPicq5dWAByuZhP4u2l3qAkKxeADAmRh2BJvTc6mWfuz8fuMe6iaJnS
         Xmaw==
X-Gm-Message-State: AAQBX9e7tQCFEmh6+4GclSh8j4ef0YgOCss0xd39JZDc0BNeFzI3ZAKY
        /M7SlqOPyICwrFfEoCFkiz2hAA==
X-Google-Smtp-Source: AKy350YyFexgg+NYJQCh9I/uLB6xaL4WoSYOUrK8XcxLQm3830fqtBhPHXAE9Y7PxeJU7wWXoNVzhQ==
X-Received: by 2002:adf:fa4c:0:b0:2da:75c5:e127 with SMTP id y12-20020adffa4c000000b002da75c5e127mr25515578wrr.23.1680554353766;
        Mon, 03 Apr 2023 13:39:13 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id z6-20020a5d4d06000000b002e6d4ac31a3sm8183664wrt.72.2023.04.03.13.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 13:39:13 -0700 (PDT)
Date:   Mon, 3 Apr 2023 23:39:11 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, abelvesa@kernel.org,
        peng.fan@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        heiko@sntech.de, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2 2/4] clk: imx: Remove values for mmask and nmask in
 struct clk_fractional_divider
Message-ID: <ZCs5bwy63l8E91AM@linaro.org>
References: <cover.1680423909.git.christophe.jaillet@wanadoo.fr>
 <187a2266c3a034a593a151d6e5e6b21118043b5d.1680423909.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <187a2266c3a034a593a151d6e5e6b21118043b5d.1680423909.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-04-02 11:42:05, Christophe JAILLET wrote:
> Now that fractional_divider clk computes mmask and nmask when needed, there
> is no more need to provide them explicitly anymore.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/clk/imx/clk-composite-7ulp.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-composite-7ulp.c b/drivers/clk/imx/clk-composite-7ulp.c
> index 4eedd45dbaa8..e208ddc51133 100644
> --- a/drivers/clk/imx/clk-composite-7ulp.c
> +++ b/drivers/clk/imx/clk-composite-7ulp.c
> @@ -19,10 +19,8 @@
>  #define PCG_CGC_SHIFT	30
>  #define PCG_FRAC_SHIFT	3
>  #define PCG_FRAC_WIDTH	1
> -#define PCG_FRAC_MASK	BIT(3)
>  #define PCG_PCD_SHIFT	0
>  #define PCG_PCD_WIDTH	3
> -#define PCG_PCD_MASK	0x7
>  
>  #define SW_RST		BIT(28)
>  
> @@ -102,10 +100,8 @@ static struct clk_hw *imx_ulp_clk_hw_composite(const char *name,
>  		fd->reg = reg;
>  		fd->mshift = PCG_FRAC_SHIFT;
>  		fd->mwidth = PCG_FRAC_WIDTH;
> -		fd->mmask  = PCG_FRAC_MASK;
>  		fd->nshift = PCG_PCD_SHIFT;
>  		fd->nwidth = PCG_PCD_WIDTH;
> -		fd->nmask = PCG_PCD_MASK;
>  		fd->flags = CLK_FRAC_DIVIDER_ZERO_BASED;
>  		if (has_swrst)
>  			fd->lock = &imx_ccm_lock;
> -- 
> 2.34.1
> 
