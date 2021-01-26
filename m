Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A241C433DB
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jan 2021 14:06:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 581E122B2C
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jan 2021 14:06:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392696AbhAZOC7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 Jan 2021 09:02:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392685AbhAZOCN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 26 Jan 2021 09:02:13 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 111C0C061A29
        for <linux-clk@vger.kernel.org>; Tue, 26 Jan 2021 06:01:33 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id f6so16224824ots.9
        for <linux-clk@vger.kernel.org>; Tue, 26 Jan 2021 06:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=NHa1jl4XStlNfdm47A2wF7pRtMVv0tqg694ijeAKGgo=;
        b=g48UNgtY8ZF9l+UqD4BTLmVeRhst8Pa1/qJsYTnCprsve24Bn1PuxRDF408fhTOAbc
         RDSGqwKhkI0m1sWgZpdMYR6G5g9COhZWbrxvhynGVEkweBtuS61qb3dshLM7n5vLNFEl
         fZ1z/YV7IUR6SItFyy7ksH/+qhQrj25o0ximz3dvVuIPI/SMDHFRMMU6h1aj+vPqkkOD
         JfJrNIoGO3a2bkNf/RH/rke1zU+HKGnW9yR8ycGO7PicvIQMNM1yl9JFLdHL8Kn1nh4B
         55bCIPhPhTBpY5aZPfU3eJNmbZoF2df8+bRnUnw9M3OuMtmZCcTf1lvedvRh6J7lxehw
         zy0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=NHa1jl4XStlNfdm47A2wF7pRtMVv0tqg694ijeAKGgo=;
        b=e6NEfM+P7z+sf58MLWAt2ajtt0yr9kFcL8gwIahlyuvU8w814cnWHSdGdXSQJ/0RaV
         6+jVnbE4rbyFP47/KeVt5crXUCY790GE+vJ1huNO4zuh1nzSYTkYUGuhpUqbGh/BGSec
         Nynz3hvGWFgsLev3OxOwkzbmuVx1CAt+Gh1QEpfntvwrNWTOCLnsoi45PSJBaMkqO9PE
         72N0ogECtCTLetVkugGjg8rG/mzBdSbR6VsCrcMQbyhFES2B7rXkXPeM3J+bDuIJRd7i
         ianvvLR09/AVLeyj9aV7ooMoNtEvvTbf8DnQ7z1WdqyMwF4duaT89GVVJJOQw8pynFKQ
         HFxg==
X-Gm-Message-State: AOAM5318yA+xBTTN4f03knWHDENnPPvTCYXWEq0uO4hnp+2mZBFsueF4
        AQxZ/aFCPI7p3bku2Im0p8iy8w==
X-Google-Smtp-Source: ABdhPJx8qKP3uJzg1vWvJWHFk8p3ugyjVEg/omR7n0I6N2mia7sWVH4kq6wxy0T3NTsKCzKM1uieYw==
X-Received: by 2002:a05:6830:1041:: with SMTP id b1mr3997810otp.335.1611669692143;
        Tue, 26 Jan 2021 06:01:32 -0800 (PST)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z8sm3858515oon.10.2021.01.26.06.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 06:01:31 -0800 (PST)
Date:   Tue, 26 Jan 2021 08:01:29 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 13/21] clk: qcom: gcc-ipq4019: Remove unused variable
 'ret'
Message-ID: <20210126140129.GD1241218@yoga>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
 <20210126124540.3320214-14-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210126124540.3320214-14-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue 26 Jan 06:45 CST 2021, Lee Jones wrote:

> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/clk/qcom/gcc-ipq4019.c: In function ‘clk_cpu_div_set_rate’:
>  drivers/clk/qcom/gcc-ipq4019.c:1279:6: warning: variable ‘ret’ set but not used [-Wunused-but-set-variable]
> 
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-clk@vger.kernel.org

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/clk/qcom/gcc-ipq4019.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq4019.c
> index ef5137fd50f3f..8abad4032de71 100644
> --- a/drivers/clk/qcom/gcc-ipq4019.c
> +++ b/drivers/clk/qcom/gcc-ipq4019.c
> @@ -1276,16 +1276,15 @@ static int clk_cpu_div_set_rate(struct clk_hw *hw, unsigned long rate,
>  	struct clk_fepll *pll = to_clk_fepll(hw);
>  	const struct freq_tbl *f;
>  	u32 mask;
> -	int ret;
>  
>  	f = qcom_find_freq(pll->freq_tbl, rate);
>  	if (!f)
>  		return -EINVAL;
>  
>  	mask = (BIT(pll->cdiv.width) - 1) << pll->cdiv.shift;
> -	ret = regmap_update_bits(pll->cdiv.clkr.regmap,
> -				 pll->cdiv.reg, mask,
> -				 f->pre_div << pll->cdiv.shift);
> +	regmap_update_bits(pll->cdiv.clkr.regmap,
> +			   pll->cdiv.reg, mask,
> +			   f->pre_div << pll->cdiv.shift);
>  	/*
>  	 * There is no status bit which can be checked for successful CPU
>  	 * divider update operation so using delay for the same.
> -- 
> 2.25.1
> 
