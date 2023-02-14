Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8641C61DA4
	for <linux-clk@archiver.kernel.org>; Tue, 14 Feb 2023 11:40:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230492AbjBNLkZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Feb 2023 06:40:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbjBNLkZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Feb 2023 06:40:25 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB4F5227A1
        for <linux-clk@vger.kernel.org>; Tue, 14 Feb 2023 03:40:22 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id qb15so37254751ejc.1
        for <linux-clk@vger.kernel.org>; Tue, 14 Feb 2023 03:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FPG8OJVJ0csSf4Rc1GcY+mEqG5u9bgOvlOo4MpOz4O0=;
        b=j9MCVaenphPaj9mPD0h+wONuloGrEkr9qvcZ/5PV44ycw6O3JZgX6gtXZSxJqlC09z
         xZ9GeXjOHaDx4mcrDE9kR/zy4XwBeL70S8AXFJAOt0S3cYiSXyzkDtneFByVudqsCJXc
         BaqaFDtyJX1Oe+DsvN8kkFamrXDmbUbgWMTvMSCJDOSQDabXBj0XvqwiZ7ijYgTljVE9
         +AwDDacgwdv9QIcbdtK1yjY04i7wlbKM4HQZqfRu0qJ+ej/9Xvw5ntBNFlljU/3g4nqY
         NQOhgQ3chMktAjr4hhZntppsZ2GAbfjVEn1F5XuOS85NtNYVR2Q9/CK3xkvaGvgO8dgs
         h93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FPG8OJVJ0csSf4Rc1GcY+mEqG5u9bgOvlOo4MpOz4O0=;
        b=y/GdwQgJlnrOVmdBP/wGRZdn9N81C+6941qXXHwguzDGva6YODoqyXH0HP3P/x0RyX
         NWNfqrUdn02OXRRVQF38mmohiZEO89uT35NNcgQAR9bab+Dj2qIAn1BVFflER6SEbuQ/
         D1N5c0OrKXCkrxlPgKAfIQb6K8xGR73+dOR9IFdf0fGPbnN9H9Q4YwdzDfITVtPKJLFc
         yTHT2fzJjuDYfVFFTkB0rODeL5D9PuaDUh1JsC6WibEBlRN+0apIYPeYHn4Z14Ugdc9z
         BLrLN//IMLy36VODC1cSsFE/EdNQ+LCV8iSlamr0R3tkxw3+YX3/vHljGbNFZuGgMESh
         51HQ==
X-Gm-Message-State: AO0yUKUCsu26i4ZV5QUT1w6bgaEc2ZmXPFWFPX9AQciA72MNoCj0Un8w
        PamsIFWEsTcZve2Vmbwg8He62dA7EnXeI0E/fGc=
X-Google-Smtp-Source: AK7set/SHNdtjfNV92i9uHdt5wf+uVNLNUUwxB7fk5m9C6JvbZ3UQUv/bDH+dIqvKZNg3IkKeRndRA==
X-Received: by 2002:a17:907:98ee:b0:879:43d5:3832 with SMTP id ke14-20020a17090798ee00b0087943d53832mr1537760ejc.14.1676374821388;
        Tue, 14 Feb 2023 03:40:21 -0800 (PST)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
        by smtp.gmail.com with ESMTPSA id v1-20020a170906b00100b0087862f45a29sm8158675ejy.174.2023.02.14.03.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 03:40:20 -0800 (PST)
Date:   Tue, 14 Feb 2023 12:40:19 +0100
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: r8a77995: Fix VIN parent clock
Message-ID: <Y+tzI303JienDXNm@oden.dyn.berto.se>
References: <9b655843a260e06fa6f3349cdafac180e2bf38a5.1676368776.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9b655843a260e06fa6f3349cdafac180e2bf38a5.1676368776.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2023-02-14 11:02:07 +0100, Geert Uytterhoeven wrote:
> According to the R-Car Series, 3rd Generation Hardware User’s Manual
> Rev. 2.30, the parent clock of the Video Input Module (VIN) on R-Car D3
> is S3D1.  Update the driver to match the documentation.
> 
> This has no functional impact, as both S1D2 and S3D1 have the same clock
> rate, and are always-on clocks.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be queued in renesas-clk-for-v6.4.
> 
>  drivers/clk/renesas/r8a77995-cpg-mssr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/renesas/r8a77995-cpg-mssr.c b/drivers/clk/renesas/r8a77995-cpg-mssr.c
> index 24ba9093a72f7341..3a73f6f911dd5160 100644
> --- a/drivers/clk/renesas/r8a77995-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a77995-cpg-mssr.c
> @@ -167,7 +167,7 @@ static const struct mssr_mod_clk r8a77995_mod_clks[] __initconst = {
>  	DEF_MOD("du0",			 724,	R8A77995_CLK_S1D1),
>  	DEF_MOD("lvds",			 727,	R8A77995_CLK_S2D1),
>  	DEF_MOD("mlp",			 802,	R8A77995_CLK_S2D1),
> -	DEF_MOD("vin4",			 807,	R8A77995_CLK_S1D2),
> +	DEF_MOD("vin4",			 807,	R8A77995_CLK_S3D1),
>  	DEF_MOD("etheravb",		 812,	R8A77995_CLK_S3D2),
>  	DEF_MOD("imr0",			 823,	R8A77995_CLK_S1D2),
>  	DEF_MOD("gpio6",		 906,	R8A77995_CLK_S3D4),
> -- 
> 2.34.1
> 

-- 
Kind Regards,
Niklas Söderlund
