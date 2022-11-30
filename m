Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DF21C4332F
	for <linux-clk@archiver.kernel.org>; Wed, 30 Nov 2022 13:26:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234741AbiK3N0p (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Nov 2022 08:26:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbiK3N0o (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Nov 2022 08:26:44 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB1A55289B
        for <linux-clk@vger.kernel.org>; Wed, 30 Nov 2022 05:26:42 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id j4so26973248lfk.0
        for <linux-clk@vger.kernel.org>; Wed, 30 Nov 2022 05:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XyDGkYajv+Nfdoc9qAKpKOjBInJYCoPIt9VVyTaGnKI=;
        b=SbtsxOYtyQP2Ke4+fVx1pp69pG7dOTubKux1lUaWRMNp28vf9WaITUBrVL84ybKq9G
         OYinGDy26yEoTz6xh4/UOtS6VAV3rFrfZUlpcqst16I5UDi4e3bQsZGDf/tAXWoHjoi9
         8N5EqRXa1vDSSVMc5XyPlrsYQrk5Zi9V6qZSjaNwHqFWO3tjUHalbAYEbV8vzUOxY1qm
         H2cNTnBAh0fH5zsOsPlRd3SaeKMYUm1SJ4DnzEkHtONdxhmquyOoGBirE1+5aJow07wR
         cQ21mq74kbJY4QHnc6oW88poNBVldSjx9NarEqtFH7WSulDEfm091ztNVZDCJfUnJZQb
         zsLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XyDGkYajv+Nfdoc9qAKpKOjBInJYCoPIt9VVyTaGnKI=;
        b=QFfMYF0Wxu21G6c8kc5PoqExitKN4uhHeJ4nBVirNLxHh3IInhZbIpq6RlstKOB5M1
         Wvn8n3mb/O9+hpm1z9116YCXZB5MmU8XDuMV1+rFgNFyBVN8JZNVnsEUxYUxeCOIO6Rv
         KCrXuX+ASc0ujmw6GT0M24giyeydNhsUb+V31GpH3A4up4Qam34HGPzYrjyf9z8ZiqSf
         WlHlNryCokD0DtCaOUmBg04wRounqEEV3JeEDK7j9NhGiVIwnLGF4+sGjr1pkngX/i0a
         dV9PjxoAF9TD8GQVy1GHavBeqftMIDTAJKb+gaDufJabhY3uzLUOU9uuGdIAEyC9KuzT
         y3gA==
X-Gm-Message-State: ANoB5plLVp9gHgG/HuCuSaU0B/2FVRaMtVgECuiX5dvKPCQOkxdu01hx
        s0t39JBjRRnyBvt6EOyhs8TBdA==
X-Google-Smtp-Source: AA0mqf5xs7rZeFWD2ORNxFIDDmXxfLMor1Qo1A9ZvI9bpkv0jyhhGT36SVHiDaC5a520jXsvKMquKg==
X-Received: by 2002:a05:6512:118b:b0:4a4:77a8:45a4 with SMTP id g11-20020a056512118b00b004a477a845a4mr19885471lfr.654.1669814799721;
        Wed, 30 Nov 2022 05:26:39 -0800 (PST)
Received: from [192.168.1.101] (95.49.125.236.neoplus.adsl.tpnet.pl. [95.49.125.236])
        by smtp.gmail.com with ESMTPSA id e10-20020a05651c038a00b00279811b20aasm136133ljp.2.2022.11.30.05.26.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 05:26:39 -0800 (PST)
Message-ID: <2ff1d4c1-284f-fd2e-022d-e286b6752098@linaro.org>
Date:   Wed, 30 Nov 2022 14:26:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 7/8] clk: qcom: rpmh: remove the last traces of the
 platform usage
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
References: <20221130131001.20912-1-dmitry.baryshkov@linaro.org>
 <20221130131001.20912-8-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221130131001.20912-8-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 30.11.2022 14:10, Dmitry Baryshkov wrote:
> Simplify __DEFINE_CLK_RPMH macros to use clk_rpmh directly instead of
> passing it through the `_platform' argument.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/clk-rpmh.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index dcac84614b06..2bcf725dd919 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -70,15 +70,15 @@ struct clk_rpmh_desc {
>  
>  static DEFINE_MUTEX(rpmh_clk_lock);
>  
> -#define __DEFINE_CLK_RPMH(_platform, _name, _cname, _res_name,		\
> +#define __DEFINE_CLK_RPMH(_name, _cname, _res_name,			\
>  			  _res_en_offset, _res_on, _div)		\
> -	static struct clk_rpmh _platform##_##_cname##_ao;		\
> -	static struct clk_rpmh _platform##_##_cname = {			\
> +	static struct clk_rpmh clk_rpmh_##_cname##_ao;			\
> +	static struct clk_rpmh clk_rpmh_##_cname = {			\
>  		.res_name = _res_name,					\
>  		.res_addr = _res_en_offset,				\
>  		.res_on_val = _res_on,					\
>  		.div = _div,						\
> -		.peer = &_platform##_##_cname##_ao,			\
> +		.peer = &clk_rpmh_##_cname##_ao,				\
>  		.valid_state_mask = (BIT(RPMH_WAKE_ONLY_STATE) |	\
>  				      BIT(RPMH_ACTIVE_ONLY_STATE) |	\
>  				      BIT(RPMH_SLEEP_STATE)),		\
> @@ -92,12 +92,12 @@ static DEFINE_MUTEX(rpmh_clk_lock);
>  			.num_parents = 1,				\
>  		},							\
>  	};								\
> -	static struct clk_rpmh _platform##_##_cname##_ao= {		\
> +	static struct clk_rpmh clk_rpmh_##_cname##_ao= {			\
>  		.res_name = _res_name,					\
>  		.res_addr = _res_en_offset,				\
>  		.res_on_val = _res_on,					\
>  		.div = _div,						\
> -		.peer = &_platform##_##_cname,				\
> +		.peer = &clk_rpmh_##_cname,				\
>  		.valid_state_mask = (BIT(RPMH_WAKE_ONLY_STATE) |	\
>  					BIT(RPMH_ACTIVE_ONLY_STATE)),	\
>  		.hw.init = &(struct clk_init_data){			\
> @@ -112,11 +112,11 @@ static DEFINE_MUTEX(rpmh_clk_lock);
>  	}
>  
>  #define DEFINE_CLK_RPMH_ARC(_name, _res_name, _res_on, _div)		\
> -	__DEFINE_CLK_RPMH(clk_rpmh, _name, _name##_##div##_div, _res_name, \
> +	__DEFINE_CLK_RPMH(_name, _name##_##div##_div, _res_name,	\
>  			  CLK_RPMH_ARC_EN_OFFSET, _res_on, _div)
>  
>  #define DEFINE_CLK_RPMH_VRM(_name, _suffix, _res_name, _div)		\
> -	__DEFINE_CLK_RPMH(clk_rpmh, _name, _name##_suffix, _res_name,	\
> +	__DEFINE_CLK_RPMH(_name, _name##_suffix, _res_name,		\
>  			  CLK_RPMH_VRM_EN_OFFSET, 1, _div)
>  
>  #define DEFINE_CLK_RPMH_BCM(_name, _res_name)				\
