Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ACF6EB64DC
	for <linux-clk@archiver.kernel.org>; Sat,  1 Jul 2023 14:42:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbjGAOmF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 1 Jul 2023 10:42:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbjGAOmF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 1 Jul 2023 10:42:05 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F2F535B3
        for <linux-clk@vger.kernel.org>; Sat,  1 Jul 2023 07:42:04 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f122ff663eso4729297e87.2
        for <linux-clk@vger.kernel.org>; Sat, 01 Jul 2023 07:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688222522; x=1690814522;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BXnw/FEpPPpZ+WG4ZVob38IzcodUEaUVz8j/V8IP3fU=;
        b=EFLeI3PJZGpGQqlzawDupl04jL4AqEfMYNSBPa9G6ZoTmxnVbQFf5bhfUYdwdYSB45
         OZIjbKBhe9focaUCsALj7DjgvvLrBPbsV2IJV6nOaqO6riOEd2TVktjYb/P0arrBmgUb
         KpnsGzupfQaUcgD9TGykQUrwZ/XvcXun/7GMn2IBCbZOHAHgJyvLdCqm4q//eFtlgJMe
         PqRvP//yXPHazOav8hFEUSUdGFMd4IHLjHpAYMX7bHh4YRT6KymSCnoXXHYOqAoc4NQP
         1BgawP0FLeWVjogQje8c/+ueSQF10FXyWSHMkW3ssrcvT3M/s1t+/JuZOX/21KI7dZZb
         gYzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688222522; x=1690814522;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BXnw/FEpPPpZ+WG4ZVob38IzcodUEaUVz8j/V8IP3fU=;
        b=f2nPKeslqAoQ5PiF4D76xaRMvgX0PqLERLscznahWRNdyxK6eHrkugC5cM3lfvUuam
         UFw2DnPQRa/EX5+ot553vThxGWG/QivjOrtU+iP1B4EoQ26bCG6Bm19KxyoWyx6SOyIn
         AiegL+ZpGDmPCIlAjXLQSt2ZeDwQpooofdDximMMPt6Zx3Sl5Cw9QxoH7BpgxNnqkOnF
         736SOoZdyARRQwaRT74RSCw6mSKt12LyT2EY1ANozky36YNd0IGu3h04YglKYXqW/5So
         Nkq14tayMpPiuI8cuAGgbeYljJ2WgZ6AU5agBwjqk6Ycd00oAjTkpQvk437HUu8h4egu
         woVA==
X-Gm-Message-State: ABy/qLbus9LoyZulcAJ73V3S1APxIrdyF1afgbAidK0pl9LR1f/q8BVr
        jx1VPsHvTypIP98t6USfuyIVqw==
X-Google-Smtp-Source: APBJJlFgxcpnuG9pkZhBLIAnPiRu5vZzw3WH4/SWTKfNj2SJgXp0DmGQyw1cH/Pa56vLVz7wyMBM2Q==
X-Received: by 2002:a05:6512:15a8:b0:4fb:7933:dd4f with SMTP id bp40-20020a05651215a800b004fb7933dd4fmr5371505lfb.56.1688222521704;
        Sat, 01 Jul 2023 07:42:01 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id 20-20020ac24834000000b004f60f2979e6sm3413409lft.83.2023.07.01.07.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Jul 2023 07:42:01 -0700 (PDT)
Message-ID: <cd7b98b9-7a32-72f5-3997-6c332c295067@linaro.org>
Date:   Sat, 1 Jul 2023 16:41:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] clk: qcom: gcc-sm7150: Add CLK_OPS_PARENT_ENABLE to sdcc2
 rcg
Content-Language: en-US
To:     Danila Tikhonov <danila@jiaxyga.com>, agross@kernel.org,
        andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        davidwronek@gmail.com
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230630191944.20282-1-danila@jiaxyga.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230630191944.20282-1-danila@jiaxyga.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 30.06.2023 21:19, Danila Tikhonov wrote:
> Set .flags = CLK_OPS_PARENT_ENABLE to fix "gcc_sdcc2_apps_clk_src: rcg
> didn't update its configuration" error.
> 
> Fixes: a808d58ddf29 ("clk: qcom: Add Global Clock Controller (GCC) driver for SM7150")
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/gcc-sm7150.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/qcom/gcc-sm7150.c b/drivers/clk/qcom/gcc-sm7150.c
> index 6b628178f62c..6da87f0436d0 100644
> --- a/drivers/clk/qcom/gcc-sm7150.c
> +++ b/drivers/clk/qcom/gcc-sm7150.c
> @@ -739,6 +739,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
>  		.parent_data = gcc_parent_data_6,
>  		.num_parents = ARRAY_SIZE(gcc_parent_data_6),
>  		.ops = &clk_rcg2_floor_ops,
> +		.flags = CLK_OPS_PARENT_ENABLE,
>  	},
>  };
>  
