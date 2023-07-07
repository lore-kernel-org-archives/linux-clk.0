Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31798EB64DA
	for <linux-clk@archiver.kernel.org>; Fri,  7 Jul 2023 07:49:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231952AbjGGHs7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Jul 2023 03:48:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230022AbjGGHsy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 7 Jul 2023 03:48:54 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 130141BF8
        for <linux-clk@vger.kernel.org>; Fri,  7 Jul 2023 00:48:51 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-39eab4bbe8aso1335497b6e.1
        for <linux-clk@vger.kernel.org>; Fri, 07 Jul 2023 00:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688716130; x=1691308130;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/LCjr+cuH+NJAsAXTiAPRO4kalBBWaZ+qG4jAlnUXZY=;
        b=iwyP5V94RKwUB/1xSAZZkkbeIZFR4ZKxGbxCJM9aIKU6y++3ZxG98NV5qSv6j+DScr
         vn3cOaViOrUsdxQo8D37F0rpRRb3dnNJCC9pz3JNH4KBZuwi948GdwLz0a4sWd428Glh
         Hu+yQIvHoa+ROkUFCK+8uOrFIUf1icgpZNCVDeUF3uVuKtzfaZWRnm1bYviRWnSe1nGx
         nJeWl+MpazeidyBMDKw+P1IInASuQS3ERRCKic+vC1u9spUS0MvUJ8fPnsUxWqa/sTdY
         wjDSfmeN4RYXKklRs0xVfIcGZW5W0iZ+0+q3hGTA5Dsa0HGUU4U27o3+yyvq7O5k8MmV
         /klA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688716130; x=1691308130;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/LCjr+cuH+NJAsAXTiAPRO4kalBBWaZ+qG4jAlnUXZY=;
        b=KHcUrx4Ufz8YKpW89OeyNmJAGhztDFcZUiXBcI/8UXSbtMN+jhAfJ0tkLhNbn+cBvd
         2+/KhR5agxBBU40NGUKbOuSQ+P7sKbR3ooak8XwDJ2u7ondgaHw+YtTbGCaWHwU73dRe
         fff35Wdv4izXqrtG6YWtAT8/l/sGfb3zlVh5tOMh1LS5uOxSVj2P8Psfv6AvQAKe85+y
         eQlVWONBj87QWAxm5yymXi0DgJ+6xoQPbVsMprXYeWlxLl5eMFTIAuvmN8svwhL5bdWl
         bX0rukoclrD8/5LKw0ZBGfqgowu1s03F6dLIL6Bs9JAvfpc6LQBtBcrPBTxA19VuyQOB
         mjxg==
X-Gm-Message-State: ABy/qLZCmlVepBLxQVIBiBSPOy4tQ/eYd5zcxl24WJ7xoZfyNO7h2nAF
        PhNMWMuybr9Cscl12lH7yoJB
X-Google-Smtp-Source: APBJJlFpwnowiM4nrJtcv62LyKSBYid7lTgmFUdpc7b52Ijj6VBz2JlsvAjypxJX67wD+jV9y5qfZg==
X-Received: by 2002:a54:4506:0:b0:3a1:f2fc:7e13 with SMTP id l6-20020a544506000000b003a1f2fc7e13mr3609586oil.57.1688716130378;
        Fri, 07 Jul 2023 00:48:50 -0700 (PDT)
Received: from thinkpad ([117.216.120.82])
        by smtp.gmail.com with ESMTPSA id ff3-20020a056a002f4300b006815fbe3245sm2350985pfb.37.2023.07.07.00.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 00:48:49 -0700 (PDT)
Date:   Fri, 7 Jul 2023 13:18:42 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 3/3] clk: qcom: gcc-sc8280xp: Add missing GDSCs
Message-ID: <20230707074842.GL6001@thinkpad>
References: <20230620-topic-sc8280_gccgdsc-v2-0-562c1428c10d@linaro.org>
 <20230620-topic-sc8280_gccgdsc-v2-3-562c1428c10d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230620-topic-sc8280_gccgdsc-v2-3-562c1428c10d@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Jun 26, 2023 at 07:48:08PM +0200, Konrad Dybcio wrote:
> There are 10 more GDSCs that we've not been caring about, and by extension
> (and perhaps even more importantly), not putting to sleep. Add them.
> 
> Fixes: d65d005f9a6c ("clk: qcom: add sc8280xp GCC driver")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

One nit below:

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

> ---
>  drivers/clk/qcom/gcc-sc8280xp.c | 100 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 100 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gcc-sc8280xp.c b/drivers/clk/qcom/gcc-sc8280xp.c
> index 64bea886322d..3e1a62fa3a07 100644
> --- a/drivers/clk/qcom/gcc-sc8280xp.c
> +++ b/drivers/clk/qcom/gcc-sc8280xp.c
> @@ -6897,6 +6897,96 @@ static struct gdsc emac_1_gdsc = {
>  	.flags = RETAIN_FF_ENABLE,
>  };
>  
> +static struct gdsc usb4_1_gdsc = {
> +	.gdscr = 0xb8004,
> +	.pd = {
> +		.name = "usb4_1_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = RETAIN_FF_ENABLE,
> +};
> +
> +static struct gdsc usb4_gdsc = {
> +	.gdscr = 0x2a004,
> +	.pd = {
> +		.name = "usb4_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = RETAIN_FF_ENABLE,
> +};

Can we group the USB GDSCs together?

- Mani

> +
> +static struct gdsc hlos1_vote_mmnoc_mmu_tbu_hf0_gdsc = {
> +	.gdscr = 0x7d050,
> +	.pd = {
> +		.name = "hlos1_vote_mmnoc_mmu_tbu_hf0_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = VOTABLE,
> +};
> +
> +static struct gdsc hlos1_vote_mmnoc_mmu_tbu_hf1_gdsc = {
> +	.gdscr = 0x7d058,
> +	.pd = {
> +		.name = "hlos1_vote_mmnoc_mmu_tbu_hf1_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = VOTABLE,
> +};
> +
> +static struct gdsc hlos1_vote_mmnoc_mmu_tbu_sf0_gdsc = {
> +	.gdscr = 0x7d054,
> +	.pd = {
> +		.name = "hlos1_vote_mmnoc_mmu_tbu_sf0_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = VOTABLE,
> +};
> +
> +static struct gdsc hlos1_vote_mmnoc_mmu_tbu_sf1_gdsc = {
> +	.gdscr = 0x7d06c,
> +	.pd = {
> +		.name = "hlos1_vote_mmnoc_mmu_tbu_sf1_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = VOTABLE,
> +};
> +
> +static struct gdsc hlos1_vote_turing_mmu_tbu0_gdsc = {
> +	.gdscr = 0x7d05c,
> +	.pd = {
> +		.name = "hlos1_vote_turing_mmu_tbu0_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = VOTABLE,
> +};
> +
> +static struct gdsc hlos1_vote_turing_mmu_tbu1_gdsc = {
> +	.gdscr = 0x7d060,
> +	.pd = {
> +		.name = "hlos1_vote_turing_mmu_tbu1_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = VOTABLE,
> +};
> +
> +static struct gdsc hlos1_vote_turing_mmu_tbu2_gdsc = {
> +	.gdscr = 0x7d0a0,
> +	.pd = {
> +		.name = "hlos1_vote_turing_mmu_tbu2_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = VOTABLE,
> +};
> +
> +static struct gdsc hlos1_vote_turing_mmu_tbu3_gdsc = {
> +	.gdscr = 0x7d0a4,
> +	.pd = {
> +		.name = "hlos1_vote_turing_mmu_tbu3_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = VOTABLE,
> +};
> +
>  static struct clk_regmap *gcc_sc8280xp_clocks[] = {
>  	[GCC_AGGRE_NOC_PCIE0_TUNNEL_AXI_CLK] = &gcc_aggre_noc_pcie0_tunnel_axi_clk.clkr,
>  	[GCC_AGGRE_NOC_PCIE1_TUNNEL_AXI_CLK] = &gcc_aggre_noc_pcie1_tunnel_axi_clk.clkr,
> @@ -7377,6 +7467,16 @@ static struct gdsc *gcc_sc8280xp_gdscs[] = {
>  	[USB30_SEC_GDSC] = &usb30_sec_gdsc,
>  	[EMAC_0_GDSC] = &emac_0_gdsc,
>  	[EMAC_1_GDSC] = &emac_1_gdsc,
> +	[USB4_1_GDSC] = &usb4_1_gdsc,
> +	[USB4_GDSC] = &usb4_gdsc,
> +	[HLOS1_VOTE_MMNOC_MMU_TBU_HF0_GDSC] = &hlos1_vote_mmnoc_mmu_tbu_hf0_gdsc,
> +	[HLOS1_VOTE_MMNOC_MMU_TBU_HF1_GDSC] = &hlos1_vote_mmnoc_mmu_tbu_hf1_gdsc,
> +	[HLOS1_VOTE_MMNOC_MMU_TBU_SF0_GDSC] = &hlos1_vote_mmnoc_mmu_tbu_sf0_gdsc,
> +	[HLOS1_VOTE_MMNOC_MMU_TBU_SF1_GDSC] = &hlos1_vote_mmnoc_mmu_tbu_sf1_gdsc,
> +	[HLOS1_VOTE_TURING_MMU_TBU0_GDSC] = &hlos1_vote_turing_mmu_tbu0_gdsc,
> +	[HLOS1_VOTE_TURING_MMU_TBU1_GDSC] = &hlos1_vote_turing_mmu_tbu1_gdsc,
> +	[HLOS1_VOTE_TURING_MMU_TBU2_GDSC] = &hlos1_vote_turing_mmu_tbu2_gdsc,
> +	[HLOS1_VOTE_TURING_MMU_TBU3_GDSC] = &hlos1_vote_turing_mmu_tbu3_gdsc,
>  };
>  
>  static const struct clk_rcg_dfs_data gcc_dfs_clocks[] = {
> 
> -- 
> 2.41.0
> 

-- 
மணிவண்ணன் சதாசிவம்
