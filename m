Return-Path: <SRS0=9M9U=ZI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5233EC432C3
	for <linux-clk@archiver.kernel.org>; Sat, 16 Nov 2019 16:51:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1F08B2168B
	for <linux-clk@archiver.kernel.org>; Sat, 16 Nov 2019 16:51:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FWLT9g4U"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727955AbfKPQvy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 16 Nov 2019 11:51:54 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:40431 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727845AbfKPQvy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 16 Nov 2019 11:51:54 -0500
Received: by mail-pl1-f195.google.com with SMTP id e3so6887487plt.7
        for <linux-clk@vger.kernel.org>; Sat, 16 Nov 2019 08:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qMrORyW5nMBpE9AKOmWgk4rweWdkIqw2wY8VYo1ZNuw=;
        b=FWLT9g4UFegz5m0n49tzVHJELmdKRgGFBqeSyhH9+FGXPuU/C8e/gyZWv7yn1tANhK
         VKM2LufO6BnJJJlwaa/d3biZEHAZC6y0q+kz7alcmYmISgt3Z1iG5CVQTS9ZMXR4EQaJ
         4BUD1Z1B1URfSHVby2nSxdFlqc3D7Wh7d2VMkoLy8h5znZJNtTYN00Hgtqw8/2i5t/rG
         OXR1OkK+OeH8Jc2DB+8ujlZmyy6XdgGLti2bk5U/wnG890y8edvyIt34wLjl3d3GUkeG
         bwH5o1LIMSvXqysFyr2A3cLDbYpUGZohilzecher/Mpb/pYMo1Ojuq38aCBUjayT+OQA
         iFqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qMrORyW5nMBpE9AKOmWgk4rweWdkIqw2wY8VYo1ZNuw=;
        b=pjtQNI/DHwvdxDglnHXNfRvewTl+0bRIOAK/Tw+usFiJGsxLVkLH/1toxKnFQVgRPZ
         eoDVUxPBQMN/OTPfAenhYyGORc1hvWa/E/Lf/4810plCWugPEIe+8PB54KESYZue2nC4
         M7MKNHVE0VPpQsnvdsRuDgihFF6cvXyOF5qUGHn/n56X9RmPhbdTgGfKJTb6F4VUi8t6
         3H+nH8E9wekIfDZsWV/JAsc0h++qzCnxZrcG8Y/qWRAPROBnb+GfTsmGwOsApyhpL/7A
         KsSe/EnBMyNr3wzLYKixOS5AK4rpfl4+M5wVOGVU2KjrmuGXKiNosqcz+b9n/eb4hKUk
         iGOg==
X-Gm-Message-State: APjAAAUL77q5+IfZzIbBcM0bMHunAki8R1Q6nKZX6TsFFdGPYdsEF+on
        Ri1VutTkPwG19NjIMEvROY6ACQ==
X-Google-Smtp-Source: APXvYqxJB5qRcG+X9uSTKdLLV9ptpXEDL2uxLwsGNWjwy+IdDODv15+CLgU5miYSqIeiizqzRyaSOA==
X-Received: by 2002:a17:90a:a40f:: with SMTP id y15mr28378509pjp.106.1573923113464;
        Sat, 16 Nov 2019 08:51:53 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id x12sm14425032pfm.130.2019.11.16.08.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2019 08:51:52 -0800 (PST)
Date:   Sat, 16 Nov 2019 08:51:50 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Brian Masney <masneyb@onstation.org>
Cc:     sboyd@kernel.org, mturquette@baylibre.com, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, jonathan@marek.ca
Subject: Re: [PATCH] clk: qcom: mmcc8974: move gfx3d_clk_src from the mmcc to
 rpm
Message-ID: <20191116165150.GB25371@yoga>
References: <20191115123931.18919-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191115123931.18919-1-masneyb@onstation.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri 15 Nov 04:39 PST 2019, Brian Masney wrote:

> gfx3d_clk_src for msm8974 was introduced into the MMCC by
> commit d8b212014e69 ("clk: qcom: Add support for MSM8974's multimedia
> clock controller (MMCC)") to ensure that all of the clocks for
> this platform are documented upstream. This clock actually belongs
> on the RPM. Since then, commit 685dc94b7d8f ("clk: qcom: smd-rpmcc:
> Add msm8974 clocks") was introduced, which contains the proper
> definition for gfx3d_clk_src. Let's drop the definition from the
> mmcc and register the clock with the rpm instead.
> 
> This change was tested on a Nexus 5 (hammerhead) phone.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/clk/qcom/clk-smd-rpm.c  |  2 ++
>  drivers/clk/qcom/mmcc-msm8974.c | 13 -------------
>  2 files changed, 2 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index 60aae7543608..2db31dbe47e9 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -486,6 +486,8 @@ static struct clk_smd_rpm *msm8974_clks[] = {
>  	[RPM_SMD_MMSSNOC_AHB_CLK]	= &msm8974_mmssnoc_ahb_clk,
>  	[RPM_SMD_MMSSNOC_AHB_A_CLK]	= &msm8974_mmssnoc_ahb_a_clk,
>  	[RPM_SMD_BIMC_CLK]		= &msm8974_bimc_clk,
> +	[RPM_SMD_GFX3D_CLK_SRC]		= &msm8974_gfx3d_clk_src,
> +	[RPM_SMD_GFX3D_A_CLK_SRC]	= &msm8974_gfx3d_a_clk_src,
>  	[RPM_SMD_BIMC_A_CLK]		= &msm8974_bimc_a_clk,
>  	[RPM_SMD_OCMEMGX_CLK]		= &msm8974_ocmemgx_clk,
>  	[RPM_SMD_OCMEMGX_A_CLK]		= &msm8974_ocmemgx_a_clk,
> diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
> index bcb0a397ef91..015426262d08 100644
> --- a/drivers/clk/qcom/mmcc-msm8974.c
> +++ b/drivers/clk/qcom/mmcc-msm8974.c
> @@ -452,18 +452,6 @@ static struct clk_rcg2 mdp_clk_src = {
>  	},
>  };
>  
> -static struct clk_rcg2 gfx3d_clk_src = {
> -	.cmd_rcgr = 0x4000,
> -	.hid_width = 5,
> -	.parent_map = mmcc_xo_mmpll0_1_2_gpll0_map,
> -	.clkr.hw.init = &(struct clk_init_data){
> -		.name = "gfx3d_clk_src",
> -		.parent_names = mmcc_xo_mmpll0_1_2_gpll0,
> -		.num_parents = 5,
> -		.ops = &clk_rcg2_ops,
> -	},
> -};
> -
>  static struct freq_tbl ftbl_camss_jpeg_jpeg0_2_clk[] = {
>  	F(75000000, P_GPLL0, 8, 0, 0),
>  	F(133330000, P_GPLL0, 4.5, 0, 0),
> @@ -2411,7 +2399,6 @@ static struct clk_regmap *mmcc_msm8974_clocks[] = {
>  	[VFE0_CLK_SRC] = &vfe0_clk_src.clkr,
>  	[VFE1_CLK_SRC] = &vfe1_clk_src.clkr,
>  	[MDP_CLK_SRC] = &mdp_clk_src.clkr,
> -	[GFX3D_CLK_SRC] = &gfx3d_clk_src.clkr,
>  	[JPEG0_CLK_SRC] = &jpeg0_clk_src.clkr,
>  	[JPEG1_CLK_SRC] = &jpeg1_clk_src.clkr,
>  	[JPEG2_CLK_SRC] = &jpeg2_clk_src.clkr,
> -- 
> 2.21.0
> 
