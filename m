Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF973C43334
	for <linux-clk@archiver.kernel.org>; Sat, 16 Jul 2022 14:54:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231229AbiGPOys (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 16 Jul 2022 10:54:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229926AbiGPOyr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 16 Jul 2022 10:54:47 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12B301A829
        for <linux-clk@vger.kernel.org>; Sat, 16 Jul 2022 07:54:46 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id z12-20020a056830128c00b0061c8168d3faso3852362otp.7
        for <linux-clk@vger.kernel.org>; Sat, 16 Jul 2022 07:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ekPldm2A1SVt6kxU75sPPup61vgqjjJ2DCb2TpRe0gk=;
        b=JxEpfrwSqIHzHrXzQybnp31riyX3iEKfds8el+eDvc50Y1ubQe5s99VwZHKfkLpxF4
         cLs6sCd3TU41ZSbDShuqCsEyIJYi6YVjESGIM5Ofz82vcfijHM8VT7mNxro5FNEQ6kIH
         jXzRcAjo7+ZjxU0yHFPJBp8H0TRiUj9NMkcNkO+ViAj6z+A4PSf+TdW1upV+CcOTTPJu
         dm4Tcgp8ez816zkS7wzt8YdTe2/2W7Eaos5uo3FUYTFSzsoa27KEIL2yQxow8Pf32+eO
         rOorFTHeEDDys7GOPDgKe+WTh8VbBpuGsHadOe/2qY/7b+6Ls58Q5eIH0SjBYJK+a3pD
         Oi9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ekPldm2A1SVt6kxU75sPPup61vgqjjJ2DCb2TpRe0gk=;
        b=6WP2AdjfdO/KQbg6Bn2anc0p5lauIhFkI9XWeC/QUaCrKO+nJpWD406Ru1SOZfTT0a
         DugxgddcKFIfH9GFQ3rhw0hnfwK+OYmd0rezdhttlaXw2VkqpOcmlQzf7kw40Gavyh8c
         vJAggi6pBCGKNGvcNTfau40OtNqFpONTVaDJzparm4bDXmo1crzcrPmI1IiVZO6j4T2S
         6P6/eWCE9+FxGHm/wtMfNXuclGaOXp2RxFtUqelqJGD3+d3H1lGItfNy8PuC5PYjY3AN
         RPwzBVsMkmmTDyPJmvsl/9K19CQc4WSvDjsEgGIo7WVZ7PmA46iL9N+g5biuEeWM1xEP
         WHbw==
X-Gm-Message-State: AJIora/AdxpBwZ6fYWUHdTp1jrnlaLMPlbGdUQ4d7HMpJMENqW8r77S0
        wVIwElmiZXEoT4/SalnKpFdJSQ==
X-Google-Smtp-Source: AGRyM1sEFBcpxDdFdR1gAwvBYtPyOEd03azO1l5+Cj57kze/T0j64sULneyVIZwM4Xof3Vnn1TjOTQ==
X-Received: by 2002:a05:6830:2465:b0:61c:8d2e:215 with SMTP id x37-20020a056830246500b0061c8d2e0215mr1957724otr.116.1657983285360;
        Sat, 16 Jul 2022 07:54:45 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t4-20020a4a96c4000000b004356bc04240sm3044445ooi.5.2022.07.16.07.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 07:54:44 -0700 (PDT)
Date:   Sat, 16 Jul 2022 09:54:43 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Brian Masney <bmasney@redhat.com>
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        ahalaney@redhat.com, echanude@redhat.com
Subject: Re: [PATCH] clk: qcom: sc8280xp: add parent to gcc_ufs_phy_axi_clk
 for sa8540p
Message-ID: <YtLRM7vQhimGFimN@builder.lan>
References: <20220623142837.3140680-1-bmasney@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220623142837.3140680-1-bmasney@redhat.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu 23 Jun 09:28 CDT 2022, Brian Masney wrote:

> The sa8540p automotive board has the same SOC as the sc8280xp. In order
> to get the first UFS controller working on the sa8540p,
> GCC_UFS_REF_CLKREF_CLK needs to be setup as a parent to
> GCC_UFS_PHY_AXI_CLK.
> 
> This clock name came from the DTS for the downstream MSM 5.4 kernel
> sources for the sa8540p. It also references GCC_UFS_CARD_CLKREF_CLK,
> however that wasn't needed to get the first UFS controller working.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
> I originally added this under GCC_UFS_PHY_PHY_AUX_CLK since that's
> what's in the downstream DTS. I was getting errors about
> GCC_UFS_PHY_AXI_CLK being stuck at off so I moved it there.
> 
> Also I don't have access to any documentation for this board so I'm
> hoping that someone with docs access can verify that this is the
> appropriate place to put this.
> 
>  drivers/clk/qcom/gcc-sc8280xp.c | 27 ++++++++++++++-------------
>  1 file changed, 14 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sc8280xp.c b/drivers/clk/qcom/gcc-sc8280xp.c
> index 4b894442fdf5..4639b50da418 100644
> --- a/drivers/clk/qcom/gcc-sc8280xp.c
> +++ b/drivers/clk/qcom/gcc-sc8280xp.c
> @@ -5685,6 +5685,19 @@ static struct clk_branch gcc_ufs_phy_ahb_clk = {
>  	},
>  };
>  
> +static struct clk_branch gcc_ufs_ref_clkref_clk = {
> +	.halt_reg = 0x8c058,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x8c058,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "gcc_ufs_ref_clkref_clk",
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
>  static struct clk_branch gcc_ufs_phy_axi_clk = {
>  	.halt_reg = 0x77010,
>  	.halt_check = BRANCH_HALT_VOTED,
> @@ -5696,6 +5709,7 @@ static struct clk_branch gcc_ufs_phy_axi_clk = {
>  		.hw.init = &(const struct clk_init_data) {
>  			.name = "gcc_ufs_phy_axi_clk",
>  			.parent_hws = (const struct clk_hw*[]){
> +				&gcc_ufs_ref_clkref_clk.clkr.hw,

gcc_ufs_ref_clkref_clk isn't the parent of gcc_ufs_phy_axi_clk.

But I presume that if this works, then you're just enabling the ufs
clkref clock, indirectly. Seems reasonable that you should be specifying
gcc_ufs_ref_clkref_clk as "ref_clk" instead.

Could you please give that a go?

Regards,
Bjorn

>  				&gcc_ufs_phy_axi_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
> @@ -5899,19 +5913,6 @@ static struct clk_branch gcc_ufs_phy_unipro_core_hw_ctl_clk = {
>  	},
>  };
>  
> -static struct clk_branch gcc_ufs_ref_clkref_clk = {
> -	.halt_reg = 0x8c058,
> -	.halt_check = BRANCH_HALT,
> -	.clkr = {
> -		.enable_reg = 0x8c058,
> -		.enable_mask = BIT(0),
> -		.hw.init = &(const struct clk_init_data) {
> -			.name = "gcc_ufs_ref_clkref_clk",
> -			.ops = &clk_branch2_ops,
> -		},
> -	},
> -};
> -
>  static struct clk_branch gcc_usb2_hs0_clkref_clk = {
>  	.halt_reg = 0x8c044,
>  	.halt_check = BRANCH_HALT,
> -- 
> 2.36.1
> 
