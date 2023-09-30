Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AB15E7735F
	for <linux-clk@archiver.kernel.org>; Sat, 30 Sep 2023 16:39:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234544AbjI3Qjm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 30 Sep 2023 12:39:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234543AbjI3Qjm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 30 Sep 2023 12:39:42 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E16FE3
        for <linux-clk@vger.kernel.org>; Sat, 30 Sep 2023 09:39:39 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5046bf37ec1so14254929e87.1
        for <linux-clk@vger.kernel.org>; Sat, 30 Sep 2023 09:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696091978; x=1696696778; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YsYBBmmijjJDdkK90sdg+zbm+nxIwxTrAlWHp+1fd+Y=;
        b=tKfzMxouj0rTv7eFFPkSoAy5jZG53xL9Di7sLREnIWQ359Kd/4SbaHXTuw825QOVLL
         xAn1JpUdC9yhcC3RpUNp76QafwEC5qfrRC42TDECWViN/VbEK8480KaDNdC51yWUPn05
         CTxO8kGSN96lmcF4Syu0KYkYmtKccTTGIkqpyQxNZrZVog6cNE1L+sNR0jDEHk/i2NvB
         s5+tLbx6dxBWhG/uM3UHEO8Sh4qiIkfrwg3CCgv4dGPn+AvUCM7wVDmK1a9gEWkeczVz
         L65xGTZfw9X3synDM8oUM8gBgLfaKLqbimDry9Oe3v19H6A7bUYocPb9cG/M+hMhgA5o
         7ZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696091978; x=1696696778;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YsYBBmmijjJDdkK90sdg+zbm+nxIwxTrAlWHp+1fd+Y=;
        b=D/FXFeAnx8DIKS5vC19vgSYCvvTR2saA6+pHaxhFJoxPOwAy1yQzs1QOmxRMCott4V
         VY8PO5eYQQ1T6aGMub3LWml71RWl8MeGWMp9EQ5zlLgau9w/wgSJcrojWoDe1YLoluvl
         7o0whxsOco0U4cS+TBKTDkwhDqf9lNB4mP91Uk7nSnOBz/VwAcaLeCN3k8EAMj0wE4nb
         HM7+NVx87Fa0IreqbrZqmRVEJnHEnASieo1r1d731dOgena5i5AP/GUCnWyviWJzOFvf
         84w0tQjOpOmJCVVOGj//znpQWQDgq/vtFAVnd0ZSzPdGBld1wbHstPqAt7EHoMKS8d4D
         anrg==
X-Gm-Message-State: AOJu0YzunHkpvJ8EfOIXEAz874t6W2lbCvDUzkyoG2kpTra2yIWZ3W/Y
        mm1y7Q2Dzp7+E+Jv+1KATEDWdw==
X-Google-Smtp-Source: AGHT+IFr3dQkMdLil9aL+fiLH6DJaCxg6l8S9ad5Yn5oom2bZvCmuy/LmStKXHHz+8npOZLwHjMfzA==
X-Received: by 2002:a05:6512:3e20:b0:503:28cb:c073 with SMTP id i32-20020a0565123e2000b0050328cbc073mr7954114lfv.58.1696091977744;
        Sat, 30 Sep 2023 09:39:37 -0700 (PDT)
Received: from ?IPV6:2a00:f41:906b:9c4e:a878:12c9:4d61:a6f2? ([2a00:f41:906b:9c4e:a878:12c9:4d61:a6f2])
        by smtp.gmail.com with ESMTPSA id c19-20020a197613000000b005033948f108sm3895415lff.272.2023.09.30.09.39.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Sep 2023 09:39:37 -0700 (PDT)
Message-ID: <ba0399d3-c3a5-0458-3668-e734fafe2f1a@linaro.org>
Date:   Sat, 30 Sep 2023 18:39:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 4/5] clk: qcom: camcc-sc8280xp: Add sc8280xp CAMCC
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        andersson@kernel.org, agross@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        jonathan@marek.ca, quic_tdas@quicinc.com,
        vladimir.zapolskiy@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230930134114.1816590-1-bryan.odonoghue@linaro.org>
 <20230930134114.1816590-5-bryan.odonoghue@linaro.org>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230930134114.1816590-5-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 9/30/23 15:41, Bryan O'Donoghue wrote:
> Add the sc8280xp CAMCC driver which follows the sdm845 CAMCC lineage
> with additional CCI and IFE blocks and more granular clock parentage.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
[...]

> +static struct clk_branch camcc_gdsc_clk = {
> +	.halt_reg = 0xc1e4,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0xc1e4,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data){
> +			.name = "camcc_gdsc_clk",
> +			.parent_hws = (const struct clk_hw*[]){
> +				&camcc_xo_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
"meh"

Is this clock only necessary for the GDSC to turn on?

I wanted to say "just chuck it into gdsc.cxcs", but upon actually 
reading the code, I realized that just doing so doesn't event turn the 
referenced clocks on.. That's.. a realization.. I think I'll be able to 
solve a couple bugs with this knowledge..



[...]

> +	ret = qcom_cc_really_probe(pdev, &camcc_sc8280xp_desc, regmap);
This conflicts with [1]

> +	if (ret)
> +		goto err_put_rpm;

[...]

> +
> +static int __init camcc_sc8280xp_init(void)
> +{
> +	return platform_driver_register(&camcc_sc8280xp_driver);
> +}
> +subsys_initcall(camcc_sc8280xp_init);
  module_platform_driver, please

Konrad

[1] 
https://lore.kernel.org/linux-arm-msm/20230923112105.18102-4-quic_luoj@quicinc.com/
