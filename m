Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 456DFC38147
	for <linux-clk@archiver.kernel.org>; Wed, 18 Jan 2023 13:52:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230408AbjARNwA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Jan 2023 08:52:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230130AbjARNvg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Jan 2023 08:51:36 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE4EB2659A
        for <linux-clk@vger.kernel.org>; Wed, 18 Jan 2023 05:22:26 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id vw16so20039918ejc.12
        for <linux-clk@vger.kernel.org>; Wed, 18 Jan 2023 05:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SyETya9J8nxAxFrENMnlTL//0+Ln7pMx/qK2596DM28=;
        b=XsiJYGgNlxZHyqh9V2BLU6R0hJmWC96Cf0IqgWjC2xCMob6bkx+XT5obQcHg+mVkVn
         uv+sCDZOJfC9cN1TICvfQ/Zm1TwDNzWtvlf+l3tjSLpkexi6z5M+lB4DdX0Mz7BUsxfN
         N6JhFfdKy0VY2kkpZ2q0Rtno/1KBk42j6Bp6RXlQEzgZaEZtXrLtomED+SSZCZ2buLKi
         tbncdt8EIwyMjTYAi9n0YaFRIb5AHXmsrm6Ew0x5egNQrIu5XN3DsOsfpqf9c8gVlNbh
         ZwsmaYW9ocEATG7lgVzTRrrOijDXgWRqeZfJhuIuq9e3gy401Pc6C+2mPvDwqcrz8v/4
         rXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SyETya9J8nxAxFrENMnlTL//0+Ln7pMx/qK2596DM28=;
        b=rntbYU/9Ecx4enoey3P0byl5MWc2L1a5ijr/3FMl0bxZPGbjVEeLw/tGLCNt/J2DrI
         CThGtlhmgkL50mdK7e8YS7YFramV9Lzl352mFYiuKr/BmADDRc5Oa+C8f9EODo7cYoj1
         G/uDWunBKsQrEgXVAck2e5ppqk6smcmdammwBgxSeyAbKWYVuJZNtTGxqc7fdC+o2VKx
         kO4ZeybMyd7WYPdzwIY7IVZhXy5P6GzMRdeS98IKcJb9p2LcfjRNzYWap4GkIcmsnGl4
         Qhi5pI8ae6wMB7NiqhhYN71Le0VaLFYc5LpXOh61nnE2nel9bYwh/tOcF19at1NweQgg
         Oo1Q==
X-Gm-Message-State: AFqh2krMGZ8ouFOMQvMSPkic5HrzAKTbO3f8S/4+JSWcV/5sFR9MJ57q
        3G0UjlxgIbrhrHMCHA/nQYWgcw==
X-Google-Smtp-Source: AMrXdXumI3LnLjrODIkRwdlfVo7XPFCzuq1zMuzKCmbVt3UZy2jZB9Y230A2uuDcYxpzosH4jmICAw==
X-Received: by 2002:a17:907:6746:b0:84d:1c67:97d7 with SMTP id qm6-20020a170907674600b0084d1c6797d7mr7664734ejc.30.1674048145282;
        Wed, 18 Jan 2023 05:22:25 -0800 (PST)
Received: from [192.168.1.101] (abxh252.neoplus.adsl.tpnet.pl. [83.9.1.252])
        by smtp.gmail.com with ESMTPSA id lj1-20020a170906f9c100b0078d22b0bcf2sm14586201ejb.168.2023.01.18.05.22.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 05:22:24 -0800 (PST)
Message-ID: <f4e65645-3951-3a38-63fd-d96f48608737@linaro.org>
Date:   Wed, 18 Jan 2023 14:22:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] clk: qcom: rpmh: remove duplicate IPA clock reference
Content-Language: en-US
To:     Arnd Bergmann <arnd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Alex Elder <elder@linaro.org>,
        Richard Acayan <mailingradian@gmail.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230117170217.2462320-1-arnd@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230117170217.2462320-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 17.01.2023 18:02, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> One of the ones that were recently added was already there:
> 
> drivers/clk/qcom/clk-rpmh.c:578:35: error: initialized field overwritten [-Werror=override-init]
>   578 |         [RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
> 
> Fixes: aa055bf158cd ("clk: qcom: rpmh: define IPA clocks where required")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/clk-rpmh.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index 393b83f6020e..45ee370f3307 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -575,7 +575,6 @@ static struct clk_hw *sc8280xp_rpmh_clocks[] = {
>  	[RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
>  	[RPMH_PKA_CLK]          = &clk_rpmh_pka.hw,
>  	[RPMH_HWKM_CLK]         = &clk_rpmh_hwkm.hw,
> -	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
>  };
>  
>  static const struct clk_rpmh_desc clk_rpmh_sc8280xp = {
