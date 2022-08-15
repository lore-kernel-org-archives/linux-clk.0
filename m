Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F04D7C25B0E
	for <linux-clk@archiver.kernel.org>; Mon, 15 Aug 2022 08:56:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232406AbiHOI4K (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Aug 2022 04:56:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230423AbiHOI4J (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Aug 2022 04:56:09 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 767621BEBF
        for <linux-clk@vger.kernel.org>; Mon, 15 Aug 2022 01:56:07 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id bd26-20020a05600c1f1a00b003a5e82a6474so1957266wmb.4
        for <linux-clk@vger.kernel.org>; Mon, 15 Aug 2022 01:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=v5hR97e/qTREUkp5JZeR/iRVGz5CsnRy8vmciOBHjlI=;
        b=nmPrt2V6VgsW7SCOA20K6CehQN/O7Juwc1O2ZngeAd9mWmzoPYhYUW6bwTwfF03V1H
         s+I34LqBn1oEouADmpyiA/eWgjhGbL2B11VCxoTbANpD8mcD0dD7lbx5xesnrsHFuHNm
         MzbZ9fmtoDvk44LscDAX1CO92FIo6G2yU23nkNJQAvw+tOkON0EAQLaEIcd2cHdlMpzz
         fTb1wVLWjRUTQ9yAehBVPwlCnwfSVQtmpWrl2maZh2Ru5a+QQKTF4/S24KBPMMn47ExB
         jC8Nc//yS84Gfg5QOaI/TSqOrF47k0xGkANlbGuWnuXb4qbB4Z+rPPIgfeevZ3o98Mk6
         06Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=v5hR97e/qTREUkp5JZeR/iRVGz5CsnRy8vmciOBHjlI=;
        b=hoHLDxYzLhn1YbxkWqPP+67M3ogzgveBtXjCrDkVFNWIH3NgjEPBvp5ug/RSkJNykQ
         QZeCN7wmhc8ckNIQNFaw2YOB/KttsClFNw09BEgFxa8dKdHZKCCsZev4ac85BngHlMKS
         OuUTAHTwiH167TD9MIxZN8vjYjPGQqFIW3mMIXf7qxeM3vYkKO+9enRffsno4XO8lejM
         iiiZwwMN3gbbNTKrcK+jy07Cp8U+ynTzikntTgl3VHAUibUl7VoPcts4nkha3dHnVLtq
         zQmnLPhaNs8kC2buzfz07ZJ8rXS47WmzkCiRa2OlXiebW49ii+vmVe1PaY7w5nuNyaxU
         aLPA==
X-Gm-Message-State: ACgBeo0Ohw+YLZZGNrEFmVXqsAkDIsegMutWGoezPWCvh3JEUXTHDJE4
        gtDqtfxtv0+egt4LOetolPjyvg==
X-Google-Smtp-Source: AA6agR7qfrrl8M+Apau2RszgGLt5YMKpBoE+Es60MUI4fRPgameuYNGPb0cwHhsRNYevaowyh4n8Tw==
X-Received: by 2002:a05:600c:1549:b0:3a5:e92f:cc68 with SMTP id f9-20020a05600c154900b003a5e92fcc68mr4135239wmg.29.1660553766016;
        Mon, 15 Aug 2022 01:56:06 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id l40-20020a05600c1d2800b003a5b6086381sm9287547wms.48.2022.08.15.01.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 01:56:05 -0700 (PDT)
Date:   Mon, 15 Aug 2022 11:56:03 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, abelvesa@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
        Ye Li <ye.li@nxp.com>, Jacky Bai <ping.bai@nxp.com>
Subject: Re: [PATCH V2 4/8] clk: imx: clk-composite-93: check white_list
Message-ID: <YvoKI5GeiUrZLJHs@linaro.org>
References: <20220815013039.474970-1-peng.fan@oss.nxp.com>
 <20220815013039.474970-5-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220815013039.474970-5-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-08-15 09:30:35, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The CCM ROOT AUTHEN register WHITE_LIST indicate:
> Each bit in this field represent for one domain. Bit16~Bit31 represent
> for DOMAIN0~DOMAIN15 respectively. Only corresponding bit of the domains
> is set to 1 can change the registers of this Clock Root.
> 
> i.MX93 DID is 3, so if BIT(3 + WHITE_LIST_SHIFT) is 0, the clk should be
> set to read only. To make the imx93_clk_composite_flags be reusable,
> add a new parameter named did(domain id);
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> Reviewed-by: Ye Li <ye.li@nxp.com>
> Reviewed-by: Jacky Bai <ping.bai@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/clk/imx/clk-composite-93.c | 8 ++++++--
>  drivers/clk/imx/clk-imx93.c        | 2 +-
>  drivers/clk/imx/clk.h              | 5 +++--
>  3 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-composite-93.c b/drivers/clk/imx/clk-composite-93.c
> index 19f4037e6cca..74a66b0203e4 100644
> --- a/drivers/clk/imx/clk-composite-93.c
> +++ b/drivers/clk/imx/clk-composite-93.c
> @@ -28,6 +28,8 @@
>  #define TZ_NS_SHIFT	9
>  #define TZ_NS_MASK	BIT(9)
>  
> +#define WHITE_LIST_SHIFT	16
> +
>  static int imx93_clk_composite_wait_ready(struct clk_hw *hw, void __iomem *reg)
>  {
>  	int ret;
> @@ -180,7 +182,7 @@ static const struct clk_ops imx93_clk_composite_mux_ops = {
>  };
>  
>  struct clk_hw *imx93_clk_composite_flags(const char *name, const char * const *parent_names,
> -					 int num_parents, void __iomem *reg,
> +					 int num_parents, void __iomem *reg, u32 domain_id,
>  					 unsigned long flags)
>  {
>  	struct clk_hw *hw = ERR_PTR(-ENOMEM), *mux_hw;
> @@ -189,6 +191,7 @@ struct clk_hw *imx93_clk_composite_flags(const char *name, const char * const *p
>  	struct clk_gate *gate = NULL;
>  	struct clk_mux *mux = NULL;
>  	bool clk_ro = false;
> +	u32 authen;
>  
>  	mux = kzalloc(sizeof(*mux), GFP_KERNEL);
>  	if (!mux)
> @@ -211,7 +214,8 @@ struct clk_hw *imx93_clk_composite_flags(const char *name, const char * const *p
>  	div->lock = &imx_ccm_lock;
>  	div->flags = CLK_DIVIDER_ROUND_CLOSEST;
>  
> -	if (!(readl(reg + AUTHEN_OFFSET) & TZ_NS_MASK))
> +	authen = readl(reg + AUTHEN_OFFSET);
> +	if (!(authen & TZ_NS_MASK) || !(authen & BIT(WHITE_LIST_SHIFT + domain_id)))
>  		clk_ro = true;
>  
>  	if (clk_ro) {
> diff --git a/drivers/clk/imx/clk-imx93.c b/drivers/clk/imx/clk-imx93.c
> index 5099048b7916..0d5c11bb3659 100644
> --- a/drivers/clk/imx/clk-imx93.c
> +++ b/drivers/clk/imx/clk-imx93.c
> @@ -293,7 +293,7 @@ static int imx93_clocks_probe(struct platform_device *pdev)
>  		root = &root_array[i];
>  		clks[root->clk] = imx93_clk_composite_flags(root->name,
>  							    parent_names[root->sel],
> -							    4, base + root->off,
> +							    4, base + root->off, 3,
>  							    root->flags);
>  	}
>  
> diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
> index 5061a06468df..396a5ea75083 100644
> --- a/drivers/clk/imx/clk.h
> +++ b/drivers/clk/imx/clk.h
> @@ -445,9 +445,10 @@ struct clk_hw *imx93_clk_composite_flags(const char *name,
>  					 const char * const *parent_names,
>  					 int num_parents,
>  					 void __iomem *reg,
> +					 u32 domain_id,
>  					 unsigned long flags);
> -#define imx93_clk_composite(name, parent_names, num_parents, reg) \
> -	imx93_clk_composite_flags(name, parent_names, num_parents, reg, \
> +#define imx93_clk_composite(name, parent_names, num_parents, reg, domain_id) \
> +	imx93_clk_composite_flags(name, parent_names, num_parents, reg, domain_id \
>  				  CLK_SET_RATE_NO_REPARENT | CLK_OPS_PARENT_ENABLE)
>  
>  struct clk_hw *imx_clk_hw_divider_gate(const char *name, const char *parent_name,
> -- 
> 2.37.1
> 
