Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 731F3C4321E
	for <linux-clk@archiver.kernel.org>; Fri,  2 Dec 2022 23:59:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234492AbiLBX7s (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Dec 2022 18:59:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234150AbiLBX7r (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Dec 2022 18:59:47 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49CD5C869F
        for <linux-clk@vger.kernel.org>; Fri,  2 Dec 2022 15:59:46 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id bp15so9679393lfb.13
        for <linux-clk@vger.kernel.org>; Fri, 02 Dec 2022 15:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gcx6EJrERIS41tFi54fuFIgkz5Y7a9ARxSk63zLAPZc=;
        b=EMffVBCmlKeK2weAjOGLRSTx+TU3bl0w45ZSkrz4fMkZ2gJsbG/nCF9q92PgjkYB6u
         +qNEXjHE7VmMP1CC+lGUNEc9Ks/TjY3cgwdEiJJB2qzDvFc4DWwc2l74xKG++hlFR9+5
         YTf7mGzd5HYyOv0yknYoiPABIsZk7Cj26FrxmLexg/pw4CV6SoBlpLOYkbgLKH4RGUnE
         vl5GSTfybXVjKL8EnWVPxlp86RaMoH0+L9Iqkjqz7oiRm+pcfWEclT4eEfY5EWFYqml8
         qdn13a/n1z5+PVKX+pugh4Zyve3Bm2VOkgVhw4OSdcA5votKUW3XxJLlq4IFEb4Tuquo
         w0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gcx6EJrERIS41tFi54fuFIgkz5Y7a9ARxSk63zLAPZc=;
        b=GZSJN8Tvk3Jcp6ECy7CvJd3vBDd57B2Zp7VHMqodI4TlKk4g3ZTW7eW+0nQPv7rQNo
         Shtr/UKuW168/lCPMReAzLU8iYSYy4Wt12Tzd6OLQkJELl7IRlTf8C94MWa7MqLa3yAQ
         oY7STnyecTwxWNxAt0UULIUN5QNikmJAGiPlfZ4wChXKiUYVLpLLV1INDxHR6o4KA+/A
         brfSbDkt4vAiwK4omSAWTQf+m2fmyCMid72uX2hymIEfZUC3KzTwu5z/ReeF30mlPdwp
         r3ytCaLWIJRp0jocTzoMxY4hXBy+0DvkzRo0zWwWXXH5Ovu7xDWdgWf15qDNSsIpuH7n
         4PyQ==
X-Gm-Message-State: ANoB5pl+SY3ZDZbytysZTaPwPsH2FkImrIDNUwKYuD6jJ6+li0M2/Y6p
        5roWZez/N790/p+MDxUkeNw0XLiv3tA6tjQO
X-Google-Smtp-Source: AA0mqf4XoC2QNoBx1FsO5mp11ykgbFUvoWnuryO1zNEcpffp3LGSyTQ9NbCL+sMhnOYM4iiXrVdhQg==
X-Received: by 2002:a05:6512:208a:b0:4b4:b2c6:5d28 with SMTP id t10-20020a056512208a00b004b4b2c65d28mr22647280lfr.47.1670025584689;
        Fri, 02 Dec 2022 15:59:44 -0800 (PST)
Received: from [192.168.1.101] (95.49.31.115.neoplus.adsl.tpnet.pl. [95.49.31.115])
        by smtp.gmail.com with ESMTPSA id u5-20020ac243c5000000b004b40c2fccfdsm1175762lfl.59.2022.12.02.15.59.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 15:59:43 -0800 (PST)
Message-ID: <8bbc5c50-8fe8-6557-d6b4-bcd41351e302@linaro.org>
Date:   Sat, 3 Dec 2022 00:59:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2] clk: qcom: rpmh: add support for SM6350 rpmh IPA clock
To:     Alex Elder <elder@linaro.org>, sboyd@kernel.org,
        mturquette@baylibre.com, andersson@kernel.org, agross@kernel.org
Cc:     Luca Weiss <luca.weiss@fairphone.com>, dmitry.baryshkov@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221202221240.225720-1-elder@linaro.org>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221202221240.225720-1-elder@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 2.12.2022 23:12, Alex Elder wrote:
> From: Luca Weiss <luca.weiss@fairphone.com>
> 
> The IPA core clock is required for SM6350.  Define it.
> 
> [elder@linaro.org: rebased with Dmitry's changes]
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> v2: This is now based on qualcomm/for-next.
> 
>  drivers/clk/qcom/clk-rpmh.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index 2c2ef4b6d130e..586a810c682ca 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -606,6 +606,7 @@ static struct clk_hw *sm6350_rpmh_clocks[] = {
>  	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_g4_ao.hw,
>  	[RPMH_QLINK_CLK]	= &clk_rpmh_qlink_div4.hw,
>  	[RPMH_QLINK_CLK_A]	= &clk_rpmh_qlink_div4_ao.hw,
> +	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
>  };
>  
>  static const struct clk_rpmh_desc clk_rpmh_sm6350 = {
