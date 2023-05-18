Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08A5AC7EE2C
	for <linux-clk@archiver.kernel.org>; Thu, 18 May 2023 14:47:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbjEROrY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 May 2023 10:47:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231409AbjEROrX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 May 2023 10:47:23 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B39D5ED
        for <linux-clk@vger.kernel.org>; Thu, 18 May 2023 07:47:20 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f41dceb93bso14241855e9.1
        for <linux-clk@vger.kernel.org>; Thu, 18 May 2023 07:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684421239; x=1687013239;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yDBEuoUjsMeXeGglUpAZz8d6CHTHUIcGZvlON+jPeXE=;
        b=U0qLJwoxanc+BIMEZK4r0Tm9+/MUIzaxAYW2rOjcTOs67VpLqmkivk2zCH1yJeb0T+
         rO6+BxasE1rAY/ywcE4OiBe+yH+iCjFg9tEQ1VAMQn8VvHwHamapQsfcRn4ICF2vnbyO
         CvbPM0TDZSlENuNdlhLJCorgeue6Z2NTOn9v3djDYDfjJhGC1Q5pFqEFZXVKbQk5jT/Z
         dafgWFq6Voro5pEgVBFskBbIv31agJfoB1phBlUxyTjfToMHvE3ZG0Rsq1s+9L8TvXvv
         GZsOW6rzyLB0oYMoajRm5YO/HxcetaNaXRjnTCkteRoye7WtD5Ds02+42Rq4cv6x6al+
         zAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684421239; x=1687013239;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDBEuoUjsMeXeGglUpAZz8d6CHTHUIcGZvlON+jPeXE=;
        b=VCe9iIK9o4/VrfACk61WseAy71/UjsGxJqZamv04MyOV+Dr6CMmV6w+vrWKC/POJq8
         OYZs/uTyF54njsXuWLwJ35+dOi/VHtZ289CMDvySHaNovtbDnl4Meoxi7keynYxwTQck
         bINhN7snwfErWGSkH1LvfXa1bQAfNqoRG+1zmFyQomv8lLS6lefGYif0A/MpLqjU2hKL
         AJ3ejJGg6n1rHCbr3ceuJHA4O8QOVuTDxLMAAAGmAYOgxmspRVWkxqwvDq5LHsaGT21U
         2TJoRDfUIzdogZh5Q8hSr+PApwIhBTfv6FbBW1fZSCI/8EuGb1aWJ+9g49q1NsJqG8I7
         YW6g==
X-Gm-Message-State: AC+VfDzFdyLDDlBLfFqJGPwLQXzqsd9PEaK1qqnWGpgs9YHpiYUrnpC2
        nFKXfpBzoAWluoEX2E+VxCYmznm8qdLe6UfTDyI=
X-Google-Smtp-Source: ACHHUZ68CxX66KdwAN3Hb9B1Mqd1VfgWH3+VE+r0QSCsHyq8FpVU19p8QsRX435Dp8x/u4fUK7f1Fw==
X-Received: by 2002:adf:d846:0:b0:309:5029:b071 with SMTP id k6-20020adfd846000000b003095029b071mr468871wrl.45.1684421239158;
        Thu, 18 May 2023 07:47:19 -0700 (PDT)
Received: from linaro.org ([86.121.163.20])
        by smtp.gmail.com with ESMTPSA id m39-20020a05600c3b2700b003f07ef4e3e0sm9947880wms.0.2023.05.18.07.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 07:47:18 -0700 (PDT)
Date:   Thu, 18 May 2023 17:47:16 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] clk: imx: scu: use _safe list iterator to avoid a use
 after free
Message-ID: <ZGY6dAuo8QM8i/tA@linaro.org>
References: <0793fbd1-d2b5-4ec2-9403-3c39343a3e2d@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0793fbd1-d2b5-4ec2-9403-3c39343a3e2d@kili.mountain>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-04-19 17:23:01, Dan Carpenter wrote:
> This loop is freeing "clk" so it needs to use list_for_each_entry_safe().
> Otherwise it dereferences a freed variable to get the next item on the
> loop.
> 
> Fixes: 77d8f3068c63 ("clk: imx: scu: add two cells binding support")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/clk/imx/clk-scu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
> index 1e6870f3671f..db307890e4c1 100644
> --- a/drivers/clk/imx/clk-scu.c
> +++ b/drivers/clk/imx/clk-scu.c
> @@ -707,11 +707,11 @@ struct clk_hw *imx_clk_scu_alloc_dev(const char *name,
>  
>  void imx_clk_scu_unregister(void)
>  {
> -	struct imx_scu_clk_node *clk;
> +	struct imx_scu_clk_node *clk, *n;
>  	int i;
>  
>  	for (i = 0; i < IMX_SC_R_LAST; i++) {
> -		list_for_each_entry(clk, &imx_scu_clks[i], node) {
> +		list_for_each_entry_safe(clk, n, &imx_scu_clks[i], node) {
>  			clk_hw_unregister(clk->hw);
>  			kfree(clk);
>  		}
> -- 
> 2.39.2
> 
