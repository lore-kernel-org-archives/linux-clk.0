Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B18ABC4332F
	for <linux-clk@archiver.kernel.org>; Thu, 20 Oct 2022 04:36:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbiJTEgW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 Oct 2022 00:36:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbiJTEgV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Oct 2022 00:36:21 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8169160ED0
        for <linux-clk@vger.kernel.org>; Wed, 19 Oct 2022 21:36:20 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id pb15so1813842pjb.5
        for <linux-clk@vger.kernel.org>; Wed, 19 Oct 2022 21:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o17RQhlYUBZsMUmpb8StxU8A9Z3KXwBN0N+ZYEngB1E=;
        b=VtPEHdzhQMEWZw3owOIfjqIu3ZJVH0Wzl/cMEq++H/LvWPcPqd3qbMf1ACg8pFU0tM
         /PJH1dDYxvocWs01HDEzzdsES93RJEa6FiXbRbX6/lHhoZiWrQRx1TLkPgOJnCvVZMPI
         G9XADsRhdhLo7T228yY7PXtoXi7VEWJayJncCQ0r7YuARykYmWK/uPHizwuRYusubjnr
         i/yP6fQtmIwa4Vs6mLxh11CgN2vmXNouV8vq5shWcixAhLiMMsjyCGAYtvGa6LLlY8cr
         WCLyxAXusmezvVr6Nt6lsRhAra18fVI57dFv6RNB0uuxlAQRR14BPtgu91/nM0Oiw8pF
         Fxvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o17RQhlYUBZsMUmpb8StxU8A9Z3KXwBN0N+ZYEngB1E=;
        b=p7EFjrpKpubSHlMu8GPlR8JF+X5aZAuKsF9zLZUq+MFhDBTQ29O6SVGe48trArkQXF
         ElKvGjCKOqkSAws9HL4FDbZ6vYJJuJRPbSe98ju7N2Hk6x0Mj5IqvhtGr0f5SlhCy/5J
         hrQEX6Nv9IvhepOF4em4v14+/XwHHc9d7MG7fV94UQt7briPjzMKe3mU67z6Z08SQNMs
         4yb9y/XU5/oQ8H34WFCHvoJJzyEcb82f3gR/fHJI/Vxgh0X4xvI7JDfQGMKJiL/TNGnq
         iWatMYNKAKGfYYyIjS6ypVdSzK23e31dw0dxSbjdXwPTZk5BAqUw1/PlG36vDyXhNNP3
         SK+A==
X-Gm-Message-State: ACrzQf1P3g05sIcfDUu6zRP+VVoXvgcGj9dpRj+TdvTl4j1/K+F1raA7
        KNbJ9qmFRA/Z2utVNFkiqVdECvOkd3W7Iw==
X-Google-Smtp-Source: AMsMyM6JMa9WLiFbvoVx4vYwYCZzPiim1UptyMJUVWSD81py6SUfnrjSxJDxjmTh1qKJOoEy59NARg==
X-Received: by 2002:a17:90b:691:b0:20d:6171:c94 with SMTP id m17-20020a17090b069100b0020d61710c94mr47924799pjz.25.1666240580413;
        Wed, 19 Oct 2022 21:36:20 -0700 (PDT)
Received: from localhost ([122.172.86.128])
        by smtp.gmail.com with ESMTPSA id a29-20020aa795bd000000b0056234327070sm12602800pfk.95.2022.10.19.21.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 21:36:10 -0700 (PDT)
Date:   Thu, 20 Oct 2022 10:06:05 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     =?utf-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
        Viresh Kumar <vireshk@kernel.org>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 4/6] clk: spear: Fix CLCD clock definition on SPEAr600
Message-ID: <20221020043605.hyytaxyth2j5xnag@vireshk-i7>
References: <20221019133208.319626-1-kory.maincent@bootlin.com>
 <20221019133208.319626-5-kory.maincent@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221019133208.319626-5-kory.maincent@bootlin.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19-10-22, 15:32, Köry Maincent wrote:
> From: Kory Maincent <kory.maincent@bootlin.com>
> 
> There is no SPEAr600 device named "clcd". Instead, the description of the
> CLCD (color liquid crystal display controller) name is "fc200000.clcd", so
> we should associate the CLCD gateable clock to this device name.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>  drivers/clk/spear/spear6xx_clock.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/spear/spear6xx_clock.c b/drivers/clk/spear/spear6xx_clock.c
> index c192a9141b86..ee0ed89f2954 100644
> --- a/drivers/clk/spear/spear6xx_clock.c
> +++ b/drivers/clk/spear/spear6xx_clock.c
> @@ -207,7 +207,7 @@ void __init spear6xx_clk_init(void __iomem *misc_base)
>  
>  	clk = clk_register_gate(NULL, "clcd_clk", "clcd_mclk", 0,
>  			PERIP1_CLK_ENB, CLCD_CLK_ENB, 0, &_lock);
> -	clk_register_clkdev(clk, NULL, "clcd");
> +	clk_register_clkdev(clk, NULL, "fc200000.clcd");
>  
>  	/* gpt clocks */
>  	clk = clk_register_gpt("gpt0_1_syn_clk", "pll1_clk", 0, PRSC0_CLK_CFG,

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
