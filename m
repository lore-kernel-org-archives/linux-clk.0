Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA70C43217
	for <linux-clk@archiver.kernel.org>; Thu,  1 Dec 2022 19:21:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230270AbiLATVL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Dec 2022 14:21:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230078AbiLATVK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Dec 2022 14:21:10 -0500
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B202B8442
        for <linux-clk@vger.kernel.org>; Thu,  1 Dec 2022 11:21:09 -0800 (PST)
Received: by mail-qt1-x82b.google.com with SMTP id c15so2153454qtw.8
        for <linux-clk@vger.kernel.org>; Thu, 01 Dec 2022 11:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m3l9Hru9zxsVmXjR/Cm65h9q5P5eb7i2nlauadzrWu0=;
        b=mRtJJ1k5Y12YubQi+o90TJYq0/m7pkNz7LCs1WBdxSC76NEDrAQTOdkKsWVc8VG0yD
         6Ghh6lT1J+4VC5Q27hZRGJmB6v6Lg7Y2uDU9T+QoBTx/y4c5q4UZdlmHF0kXNCLp4TPE
         GDS3grnN22ZefPrZWJ8UPnHzqis4Utm7vMkjlfs4+oOBQP8EM3LMCi/xSZfQBQTMnI9I
         bVYWatsVK8xDz34YIk8DQEUxG+Sh4xJxb+kUOW7nQci1lm4SRbjeVNSGGd9/htK16R1b
         tOLy66/31j4kL6lUeO04ZBHCIeFP+NQzYULDaes2dFfGP0UU/Oq9ZtwmvHDPasPJ8pni
         /+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m3l9Hru9zxsVmXjR/Cm65h9q5P5eb7i2nlauadzrWu0=;
        b=y6NFfbc7knMxZNP/tIWx+vXNW8Id7IhkwzkicvRyK0TNecjEyzJ3HntZ0FXGezB0AK
         gOvggbaBmej/Nd00UieqDBJ3RWQg/L1AGm0SotJmFARqu7gytSOY1sDiVwHKtzAeh5gB
         3dyx1mCeR9Vhv7khPin1nQEnjW6BaAyO22jCYu2z6J44EkrILuErKcsmdn762DnJERfb
         ddlK2pEdMiLZifVc/t9tcgA3bUp2RI5es+M23jUXwOY2sGqA7Z/L6CLbeoirGRZKkUd4
         CYDWoDdtyqmRIi+iUAfuOENujzH2Qc6V8M/d950ighYrIt2YoWqNODYnvxrvltk7c5O3
         K4NQ==
X-Gm-Message-State: ANoB5pk7luXqx5Srd6Igy9vYLGkrhUQPkPr6ji33GgWg9aFDtoeL2mRC
        L9QXIrZz68Dix/ZgjV7P50OTiQ==
X-Google-Smtp-Source: AA0mqf5WDaMPxglxYtQp0m0d4DzHvyyjGSdoKOigjQP/VzcAxr+tpwS3KOPY68Ky47h2YUyT0j82HQ==
X-Received: by 2002:a37:44ce:0:b0:6fa:4335:5793 with SMTP id r197-20020a3744ce000000b006fa43355793mr41711054qka.242.1669922468293;
        Thu, 01 Dec 2022 11:21:08 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id c26-20020ac84e1a000000b00398ed306034sm2955066qtw.81.2022.12.01.11.21.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 11:21:08 -0800 (PST)
Message-ID: <b9ecc4bf-67c6-b7bf-6a5b-5cce6a86c3da@linaro.org>
Date:   Thu, 1 Dec 2022 13:21:07 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 5/8] clk: qcom: rpmh: rename ARC clock data
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20221130131001.20912-1-dmitry.baryshkov@linaro.org>
 <20221130131001.20912-6-dmitry.baryshkov@linaro.org>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <20221130131001.20912-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 11/30/22 7:09 AM, Dmitry Baryshkov wrote:
> RPMH ARC clocks are frequently shared between several platfoms. It makes
> little sense to encode the SoC name into the clock name, if the same
> clock is used for other SoCs.
> 
> Rework the ARC clocks defintions to remove the SoC name. Keep the

s/clocks/clock/

> userspace-visible clock name, but encode the divider into the variable
> name. This also make it obvious which divider is used by the platform,

s/make/makes/

> making the code less error-prone.

You could do this as multiple patches:  one to distinguish the
clock symbol name from the user space name; one for formulating
the divider symbol name; and one for eliminating the platform.

I think if you do the first one, you could make that change to
all clock types at once, cleanly.

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org > ---
>   drivers/clk/qcom/clk-rpmh.c | 86 ++++++++++++++++++-------------------
>   1 file changed, 43 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index 5044f9fa156d..bd6cb07b6154 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -70,15 +70,15 @@ struct clk_rpmh_desc {
>   
>   static DEFINE_MUTEX(rpmh_clk_lock);
>   
> -#define __DEFINE_CLK_RPMH(_platform, _name, _res_name,			\
> +#define __DEFINE_CLK_RPMH(_platform, _name, _cname, _res_name,		\
>   			  _res_en_offset, _res_on, _div)		\

Maybe _clk_name instead of _cname?

					-Alex

> -	static struct clk_rpmh _platform##_##_name##_ao;		\
> -	static struct clk_rpmh _platform##_##_name = {			\
> +	static struct clk_rpmh _platform##_##_cname##_ao;		\
> +	static struct clk_rpmh _platform##_##_cname = {			\
>   		.res_name = _res_name,					\
>   		.res_addr = _res_en_offset,				\
>   		.res_on_val = _res_on,					\
>   		.div = _div,						\
> -		.peer = &_platform##_##_name##_ao,			\
> +		.peer = &_platform##_##_cname##_ao,			\
>   		.valid_state_mask = (BIT(RPMH_WAKE_ONLY_STATE) |	\
>   				      BIT(RPMH_ACTIVE_ONLY_STATE) |	\
>   				      BIT(RPMH_SLEEP_STATE)),		\

. . .
