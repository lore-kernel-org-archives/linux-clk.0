Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B467C43334
	for <linux-clk@archiver.kernel.org>; Thu, 23 Jun 2022 15:32:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232031AbiFWPcf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 23 Jun 2022 11:32:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231905AbiFWPcf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 23 Jun 2022 11:32:35 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 04A2B41997
        for <linux-clk@vger.kernel.org>; Thu, 23 Jun 2022 08:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655998352;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=b2n5xLD7AQDK+GpcG4O4X1piM0yxBHUCyVpdCvBcmLA=;
        b=S5cyvcpU1NI+RYtM/nYMvX9oqoLb9NUQParyUrmbZc3sR9Q3w/IG1l0w4hxGyFbpaHSVhS
        0QJB171zxroBhehOycPvGO525DM6QUOFtwl8NS94ZHS1Lr7qqYcz+Do4zqKOIULQVd9BRa
        q5CtWrHeO8tckiWc44I18Dhxi2l7MfQ=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-481-tzu-BiZKPPmJGDiO7pXbvg-1; Thu, 23 Jun 2022 11:32:30 -0400
X-MC-Unique: tzu-BiZKPPmJGDiO7pXbvg-1
Received: by mail-qk1-f199.google.com with SMTP id bi36-20020a05620a31a400b006a79f0706e5so23882531qkb.2
        for <linux-clk@vger.kernel.org>; Thu, 23 Jun 2022 08:32:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=b2n5xLD7AQDK+GpcG4O4X1piM0yxBHUCyVpdCvBcmLA=;
        b=X2pT/uRpDhuCLeMb4Con8P0v/gf01DI97oINiw84O/aJW9+uhy8bB00tKemHggqKdc
         IfscWaV/xWk+J98fvhFhV/IaBXFh2YViAiFCvFm1vQ1MT0GcxPOcxJLzhwHtl/wEnk3D
         Q7N+Q4g0NiyeEwDzzPEOwLFFYRa9L6bXZ85Ssn64AEgPhUIlAzs5608nhtUTfyM7g6Ff
         uJSy7VKUaldzcIvqushzTeDrVgCC9oNA1SxMqVTYnIbObr3WnYpq87lrfgY67NmVy/QY
         KThQYvLXNDC1c/yRpeevpshqITJ2SNGi5TDx4/9veu8Rt2x2eH2KQelhsjFUxps5gHri
         TwWQ==
X-Gm-Message-State: AJIora91PADvbtQ9SpBnW38g+/3+EowYMcMC1TISsyRKR/INAw2xAU9x
        KHUueMiwfp03UcNxj1kILJsN/OLujeHb1/OjZnzqtm7Qe45Ws2Nq5IjQyV2hy89a3ouXskY6AKZ
        CM0gjc9IUXlU6qCar83pn
X-Received: by 2002:a05:6214:29ca:b0:46b:92c5:9f3b with SMTP id gh10-20020a05621429ca00b0046b92c59f3bmr32129041qvb.20.1655998349429;
        Thu, 23 Jun 2022 08:32:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v3ddAmHP4GNMm6NGiuKRAyJLCHiaGoJECW7QzVyWqpeYX0hMGqRDuYk0d3CinVTSkb2kBBeA==
X-Received: by 2002:a05:6214:29ca:b0:46b:92c5:9f3b with SMTP id gh10-20020a05621429ca00b0046b92c59f3bmr32129018qvb.20.1655998349055;
        Thu, 23 Jun 2022 08:32:29 -0700 (PDT)
Received: from halaneylaptop ([2600:1700:1ff0:d0e0::46])
        by smtp.gmail.com with ESMTPSA id y29-20020a37f61d000000b006a3325fd985sm18291762qkj.13.2022.06.23.08.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 08:32:28 -0700 (PDT)
Date:   Thu, 23 Jun 2022 10:32:26 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Brian Masney <bmasney@redhat.com>
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        echanude@redhat.com
Subject: Re: [PATCH] clk: qcom: sc8280xp: add parent to gcc_ufs_phy_axi_clk
 for sa8540p
Message-ID: <20220623153226.drrbx2jolrxxe7as@halaneylaptop>
References: <20220623142837.3140680-1-bmasney@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220623142837.3140680-1-bmasney@redhat.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jun 23, 2022 at 10:28:37AM -0400, Brian Masney wrote:
> The sa8540p automotive board has the same SOC as the sc8280xp. In order
> to get the first UFS controller working on the sa8540p,
> GCC_UFS_REF_CLKREF_CLK needs to be setup as a parent to
> GCC_UFS_PHY_AXI_CLK.
> 
> This clock name came from the DTS for the downstream MSM 5.4 kernel
> sources for the sa8540p. It also references GCC_UFS_CARD_CLKREF_CLK,
> however that wasn't needed to get the first UFS controller working.
> 

I'm not knowledgable enough on the clock subsystem or have access to
documentation to comment on correctness outside of the 5.4 MSM kernel
you mentioned, but I think this probably deserves a Fixes: tag?

I can at least also comment that without this change the sa8540p doesn't
boot on the QDrive3 boards we have.

Thanks,
Andrew

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

