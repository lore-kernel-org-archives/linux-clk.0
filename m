Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67953C25B47
	for <linux-clk@archiver.kernel.org>; Wed, 25 Oct 2023 08:48:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234484AbjJYIsG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 Oct 2023 04:48:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234483AbjJYIrq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Oct 2023 04:47:46 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AE9A10F7
        for <linux-clk@vger.kernel.org>; Wed, 25 Oct 2023 01:47:26 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2c515527310so77628971fa.2
        for <linux-clk@vger.kernel.org>; Wed, 25 Oct 2023 01:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698223644; x=1698828444; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AWLunRg+mdtBWttUW92XIFkEVDjp3aPObiDCT739YI8=;
        b=fB7uULUi1pn0+9AkBACyt++CU31BzVQvbvXjRlZ2dWk0xItPqvJdqotwAQafix/U/S
         jxU9yUtZiWlPpIZfm3hCJbon2qzbLMmgvhPA/OLelYm22CxhJuhi9WrLKWkY56Y13GIc
         XrMH9DRNscQRdbQ6mqQ8WYvxf4iNgPaO9Shy6ktGmnS0Ym1coY3E7HO4kFyB0XBQO86Q
         yhxbA42kO99svHyCD+cElPFuswMCVu1CV48OCOKaM+AJ1njKIWGwx6FN3n/uht3fPBH0
         7NqnccbmfjXv2HAfMWCG3yvteYneexFz48BZb6gYvIFlH0WeaGu+k9Ug5f8ibvFqbfaE
         3yrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698223644; x=1698828444;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AWLunRg+mdtBWttUW92XIFkEVDjp3aPObiDCT739YI8=;
        b=TCpXjtQrnLDXkDwH8I4GvePO/DVB7bhXjdmXQ2gNYJZfZtmE/wnn8jNKm4S37oFbdh
         qfGxa4Pbs2Vw13qh5v+/ahlLgaLIGTKAbkBTj5+13luLjhLIpFtRR5n49E1gPkY94aPZ
         OKtzi0qbAcxdzrd/j06vk4P7evlSRfGNawKZyPlNj1Rdo6JkykLT1svEKH5TnKUYjFeh
         acgtQG8qUzDyHN6oEvVpk4s/BLfcZEHj2mC6foZEkXlezm4Qvs3GBRvZeEqJP1PqZPV6
         lf5dfF8qSGT3e702Fvk1Jkf73h6oMBdKrlbqNY+YJYjWMPoeQ/7iz0B0RRbS1SjL2cnN
         0dag==
X-Gm-Message-State: AOJu0YyOKdnfSmWrZhyt/I2unyKAbHbkIjsdCWDp22k+D/zMYF96sbfI
        MVjuXtXF1wK+HZbBWfxYw/SPY9EHhJuW33jxrg4=
X-Google-Smtp-Source: AGHT+IEafQID4C58Vd4asshYumAJa15oxm3wsXK3dPqRvDIJ2A6H8umL7F5QWjcQQICDpZ6VpnJjKA==
X-Received: by 2002:a2e:9882:0:b0:2c5:183d:42bf with SMTP id b2-20020a2e9882000000b002c5183d42bfmr9960635ljj.45.1698223644604;
        Wed, 25 Oct 2023 01:47:24 -0700 (PDT)
Received: from [172.30.204.57] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id p13-20020a2e9a8d000000b002c5122f13b8sm2320875lji.30.2023.10.25.01.47.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 01:47:24 -0700 (PDT)
Message-ID: <467bc514-1cff-4bc5-a553-fd1ef0886ee5@linaro.org>
Date:   Wed, 25 Oct 2023 10:47:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] clk: qcom: rpmh: add clocks for SM8650
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231025-topic-sm8650-upstream-clocks-v1-0-c89b59594caf@linaro.org>
 <20231025-topic-sm8650-upstream-clocks-v1-10-c89b59594caf@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231025-topic-sm8650-upstream-clocks-v1-10-c89b59594caf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 10/25/23 09:32, Neil Armstrong wrote:
> Add RPMH Clocks for the SM8650 platform.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
[...]

> +static struct clk_hw *sm8650_rpmh_clocks[] = {
> +	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
> +	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
> +	[RPMH_LN_BB_CLK1]	= &clk_rpmh_clk6_a2.hw,
> +	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_clk6_a2_ao.hw,
> +	[RPMH_LN_BB_CLK2]	= &clk_rpmh_clk7_a2.hw,
> +	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_clk7_a2_ao.hw,
> +	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a2.hw,
> +	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a2_ao.hw,
> +	[RPMH_RF_CLK1]		= &clk_rpmh_clk1_a1.hw,
> +	[RPMH_RF_CLK1_A]	= &clk_rpmh_clk1_a1_ao.hw,
> +	[RPMH_RF_CLK2]		= &clk_rpmh_clk2_a1.hw,
> +	[RPMH_RF_CLK2_A]	= &clk_rpmh_clk2_a1_ao.hw,
> +	/* missing RPMh resource address for clka3 */
So, the downstream driver suggested it's there but CMD-DB disagrees?

Can we get a confirmation whether it should be there?

Konrad
