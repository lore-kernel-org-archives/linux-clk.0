Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57926C54EED
	for <linux-clk@archiver.kernel.org>; Mon, 30 Jan 2023 13:56:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236638AbjA3N4p (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 30 Jan 2023 08:56:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236635AbjA3N4o (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 30 Jan 2023 08:56:44 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2468339BAE
        for <linux-clk@vger.kernel.org>; Mon, 30 Jan 2023 05:56:43 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id s3so11032861edd.4
        for <linux-clk@vger.kernel.org>; Mon, 30 Jan 2023 05:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HIivJHPowHeZUWSb5eWWSatKUzvxAvJV/oBmgCSEnTI=;
        b=UOzB0+4gSqzRZQyWPHFM0GnZTKuyMyPazcsJc2D4PD7Mvlb2IHENmqZqSxCN/ykF0O
         qNxZZ5ifHM4uxjQcezdL13rI0MditPwkz117rwL/3iVjUAsJKyZp6+DuOHGrLu9nBvrP
         oylTyo60RYCurrN9CC2Dws9NKOFcLsjLW0hUd/MUMxlN6t8KFGxBfllYeelRvZHRXUyg
         diVDbP+ANJdqef1F9h3Swdao84OS3lPNWkveUrs/kiHsLSMiANi4XUP+3QEnVXBs4hO8
         EWTVZCVXxmnew/689ow4f81FCWrwCb8LH6yS8Fn/KJXx6gzPe47jsBYl0/ttACHrT20u
         K5iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HIivJHPowHeZUWSb5eWWSatKUzvxAvJV/oBmgCSEnTI=;
        b=Yg7SKKre1xRNKijwyFCL/jVyXr4A9aPAhFaAu+CtGVsSnepA6wVnE8fziZDCrHNoD4
         nwPmLC+upM1KxWSww1t3LIhv54e/WAaI/GYyfBEysP5Ov+WFumLU3hDlE9AsjTWtW0ph
         1Fu9/VsWFeSryeLci5gK1nsJRRrlrMJIago6i4xz2YRG8E5qHtv58n6sRh6Z4zn+GlrU
         odVHDamBTaCRnDVddZJkpLRL2t3C9hQ4H1D19h52O/5Fd74D+DT94KA2Ao4U5CRsvsL+
         FHmiEwkTrVEoXJTxMBOKxJrsVhPuWzplTL+iw8W3sxuBhqli2tgV35/+pNhZIEPY9Vkb
         0O9w==
X-Gm-Message-State: AFqh2kpvZsAYohP0MlMpm0daiJz0rv3yN06zVuZyStTTizIQXtxu01OI
        N+mvuDbZxSkVr01f2Y4rUnroBA==
X-Google-Smtp-Source: AMrXdXtGSxdM3KDNtASwc51ztcqlxtmCgbywVajJhtrGX89ohrIm6mLTrz5kwU02UjXHrKR2iNTpFA==
X-Received: by 2002:a05:6402:35c1:b0:49b:52b3:cae6 with SMTP id z1-20020a05640235c100b0049b52b3cae6mr69120818edc.30.1675087001679;
        Mon, 30 Jan 2023 05:56:41 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id f9-20020a056402354900b0049e9e9204basm6771273edd.21.2023.01.30.05.56.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 05:56:41 -0800 (PST)
Message-ID: <ece98f84-0384-c919-b681-62e133a37a61@linaro.org>
Date:   Mon, 30 Jan 2023 14:56:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH] clk: qcom: gcc-qcs404: fix duplicate initializer warning
Content-Language: en-US
To:     Arnd Bergmann <arnd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230130135555.3268172-1-arnd@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230130135555.3268172-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 30.01.2023 14:55, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> In one of the clocks, a redundant initialization for .num_parents
> got left behind by a recent patch:
> 
> drivers/clk/qcom/gcc-qcs404.c:63:32: error: initialized field overwritten [-Werror=override-init]
>    63 |                 .num_parents = 1,
>       |                                ^
> 
> Fixes: 2ce81afa0c7c ("clk: qcom: gcc-qcs404: sort out the cxo clock")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/gcc-qcs404.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
> index 5f58dd82d3fe..a39c4990b29d 100644
> --- a/drivers/clk/qcom/gcc-qcs404.c
> +++ b/drivers/clk/qcom/gcc-qcs404.c
> @@ -60,7 +60,6 @@ static struct clk_fixed_factor cxo = {
>  		.name = "cxo",
>  		.parent_data = gcc_parent_data_1,
>  		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
> -		.num_parents = 1,
>  		.ops = &clk_fixed_factor_ops,
>  	},
>  };
