Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC51FC433EF
	for <linux-clk@archiver.kernel.org>; Wed, 13 Apr 2022 02:45:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231862AbiDMCrl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 12 Apr 2022 22:47:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231761AbiDMCrZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 12 Apr 2022 22:47:25 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 974636350
        for <linux-clk@vger.kernel.org>; Tue, 12 Apr 2022 19:45:05 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id q129so736623oif.4
        for <linux-clk@vger.kernel.org>; Tue, 12 Apr 2022 19:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UuOOoFGnWc9VTndoEuvNPq13NPX/r0x7qzJUtDKizUo=;
        b=wxWpc3OLtS75cPwf+clCogJs/ZF7f0xw/7i2EAoQvF0aQqMeFXrId6Fstd2zde6j/i
         w5vOIwJCzam3RIJoe/FK4As+94AixxAT1NMIRd1KfxyR0WwvtPL3vEUNwZgEwdkgJpr/
         bY/phAEXQSkVHl+d/PNPBA+KktdLyPMXkG6s4ssTee7SbBMq3VMLpjEFeNw/mwqaURMX
         u+zFOMOVzMU3XtWaJGk/MPooSsdQRWQ3M/wue1fAPhiSq7dmAYFz1zhJkGJ/DtG+kMXP
         wY3eqC3PrJC2fZkeS68mXn254klyOmEHeseGVP2bdjyNFqu2YKehzliKEpt5eaoWXGtl
         r2gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UuOOoFGnWc9VTndoEuvNPq13NPX/r0x7qzJUtDKizUo=;
        b=SZl4OJPufdNf3sCSAFIaWYES6GIFbaSWFsYIA/Cc5SHxivFkvR1gYKsHJ5zw87fMOt
         Ia5L0OkKoyZcFRUvMIPHngV2YJVFPyyDnuQZX2WXj773qcDKyWZaLicKoLQAN0hYe6kB
         zSYuvF4UPPiZRuZXGfESnQhhtcOm7NDTp7oNO9UQ9KtSVxlDi22zJrnivlY74JAyZgYW
         0EYmuN0fItWSKMiUKQ65KRhBJShumCzOlFY9aN/NnjoCXWCd195Q93AEQK2ouJX6xReC
         wtJ61Kwkkv9NkxZzR94YK/AZXG2G/qJYPHB6ayzcWKzhgDp5o0EkgFtDz3GHOgOX1y+w
         inrg==
X-Gm-Message-State: AOAM531sIDtpM8I1mKFA9ITgizuVbVqU3w8GRlTdm/HMftmu0FqUySg1
        f4wydMbY8XmFl31pKfqiV3Zo3g==
X-Google-Smtp-Source: ABdhPJxEOwHg4iFGlMEG3Gks82u0WXv60WXp2MVSam88PUT9GiA9gAlP1Dk8LtmiC257E2mbah0qlA==
X-Received: by 2002:aca:90c:0:b0:2ec:f120:c705 with SMTP id 12-20020aca090c000000b002ecf120c705mr3118406oij.46.1649817904923;
        Tue, 12 Apr 2022 19:45:04 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id k22-20020a056870959600b000d277c48d18sm15258269oao.3.2022.04.12.19.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 19:45:04 -0700 (PDT)
Date:   Tue, 12 Apr 2022 21:45:02 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 4/7] clk: qcom: clk-alpha-pll: limit exported symbols
 to GPL licensed code
Message-ID: <YlY5Lk3fgYO2hCaA@builder.lan>
References: <20220314114211.1636574-1-vladimir.zapolskiy@linaro.org>
 <20220314114248.1636620-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220314114248.1636620-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon 14 Mar 06:42 CDT 2022, Vladimir Zapolskiy wrote:

> Unify all exported PLL clock configuration functions and data structures
> as GPL symbols.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index 288692f0ea39..47879ee5a677 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -1823,7 +1823,7 @@ const struct clk_ops clk_alpha_pll_lucid_5lpe_ops = {
>  	.round_rate = clk_alpha_pll_round_rate,
>  	.set_rate = alpha_pll_lucid_5lpe_set_rate,
>  };
> -EXPORT_SYMBOL(clk_alpha_pll_lucid_5lpe_ops);
> +EXPORT_SYMBOL_GPL(clk_alpha_pll_lucid_5lpe_ops);
>  
>  const struct clk_ops clk_alpha_pll_fixed_lucid_5lpe_ops = {
>  	.enable = alpha_pll_lucid_5lpe_enable,
> @@ -1832,14 +1832,14 @@ const struct clk_ops clk_alpha_pll_fixed_lucid_5lpe_ops = {
>  	.recalc_rate = clk_trion_pll_recalc_rate,
>  	.round_rate = clk_alpha_pll_round_rate,
>  };
> -EXPORT_SYMBOL(clk_alpha_pll_fixed_lucid_5lpe_ops);
> +EXPORT_SYMBOL_GPL(clk_alpha_pll_fixed_lucid_5lpe_ops);
>  
>  const struct clk_ops clk_alpha_pll_postdiv_lucid_5lpe_ops = {
>  	.recalc_rate = clk_alpha_pll_postdiv_fabia_recalc_rate,
>  	.round_rate = clk_alpha_pll_postdiv_fabia_round_rate,
>  	.set_rate = clk_lucid_5lpe_pll_postdiv_set_rate,
>  };
> -EXPORT_SYMBOL(clk_alpha_pll_postdiv_lucid_5lpe_ops);
> +EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_lucid_5lpe_ops);
>  
>  void clk_zonda_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>  			     const struct alpha_pll_config *config)
> @@ -1992,7 +1992,7 @@ const struct clk_ops clk_alpha_pll_zonda_ops = {
>  	.round_rate = clk_alpha_pll_round_rate,
>  	.set_rate = clk_zonda_pll_set_rate,
>  };
> -EXPORT_SYMBOL(clk_alpha_pll_zonda_ops);
> +EXPORT_SYMBOL_GPL(clk_alpha_pll_zonda_ops);
>  
>  static int alpha_pll_lucid_evo_enable(struct clk_hw *hw)
>  {
> -- 
> 2.33.0
> 
