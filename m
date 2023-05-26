Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A486FC77B7A
	for <linux-clk@archiver.kernel.org>; Fri, 26 May 2023 20:51:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243688AbjEZUvT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 May 2023 16:51:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243958AbjEZUvN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 May 2023 16:51:13 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E125E55
        for <linux-clk@vger.kernel.org>; Fri, 26 May 2023 13:51:09 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2af2696fd1cso12027371fa.2
        for <linux-clk@vger.kernel.org>; Fri, 26 May 2023 13:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685134267; x=1687726267;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z5AatKw6EtxzG9E4dF0UYt5pzjSCEqOZGHssidQMlz4=;
        b=CFWTVoeRCdniU+x2qGDJhodKgGHp1JKCle+Ga8fFPMpQ7B4BhuvPLNIgT2gNcBWdm/
         rmJ7+zhRGA6CfusOOvkE6UET4zEm7HKXXbh+9AR7VUFcS0AeuvvYB0dTERm7ZO1Z9tnc
         Ea39RjrFKznDv7D/pH8AQScSp3cSmSY6qfHGxmiizl+fCTnqfwLwzekBcTLkIXWr8+nk
         TF0zAPIqz8VKE6uVTAYzgP/RSPXJyH6SwKZgXPHq/6/QyY8TEkLNUQC4bN0/lnh3XQs+
         Oui3IOpPCgrKQs5GJUUM2HLW2rjR1OFZQ+3SlBpjkO8AUkNMsVv7gAwxub1v1K0pVseJ
         0Qxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685134267; x=1687726267;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z5AatKw6EtxzG9E4dF0UYt5pzjSCEqOZGHssidQMlz4=;
        b=HbdPwZ7SYZSjvLTDnZzAnO2zn1BOumsl71uNQtG09UICQmyb2hhJj+ruy1c1jqCBNd
         W3PTEoGD4RmfsGR+i+wxaXkN4M2PDE7S5gvTGbvsyp20Z5S27nUUmdfP6zGO27Ws45LT
         dU4mlmkFc/t23osyO/q3fT5/2wkqsTM1SCuxeCKnL7eUPfWhmBDLhnu4MxgoxoKRfm8h
         6cTrUla8+sNFD9rTwy9/Gs7k3/bdf9U+LpfYHt0QE441jlLmUDOTtP8C9Jv4HAFD03pN
         2uadszbPfY3YepbG9tzT9DD6lSRUJIrtUDnZU2SI+H+TEqwps5GYx9Cmmvn8768+I05b
         pdeA==
X-Gm-Message-State: AC+VfDxQP1cx6ZgjUpUHJTHqK1FlslMFf3B7f0Fm/GabM6hhitJ/Au90
        Fd0T4z/C17fdUpIklvfbO7m7tQ==
X-Google-Smtp-Source: ACHHUZ7eoEEQ+WYgy29uaLJ4siKa8UDIyEBc1moLD4g7vHo2xRi2pXCLl62zxT4o/c1z5ryQM/t2NA==
X-Received: by 2002:a2e:9e8e:0:b0:29f:58c6:986e with SMTP id f14-20020a2e9e8e000000b0029f58c6986emr821078ljk.52.1685134267123;
        Fri, 26 May 2023 13:51:07 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id p19-20020a2e9a93000000b002ad8fc8dda6sm935227lji.17.2023.05.26.13.51.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 13:51:06 -0700 (PDT)
Message-ID: <83465b41-3894-3490-e030-a523073e498f@linaro.org>
Date:   Fri, 26 May 2023 22:51:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] clk: qcom: gcc-ipq6018: update UBI32 PLL
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, andersson@kernel.org,
        agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230526190855.2941291-1-robimarko@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230526190855.2941291-1-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 26.05.2023 21:08, Robert Marko wrote:
> Update the UBI32 alpha PLL config to the latest values from the downstream
> QCA 5.4 kernel.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
>  drivers/clk/qcom/gcc-ipq6018.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gcc-ipq6018.c b/drivers/clk/qcom/gcc-ipq6018.c
> index 350ead66914ca..abd97b939850f 100644
> --- a/drivers/clk/qcom/gcc-ipq6018.c
> +++ b/drivers/clk/qcom/gcc-ipq6018.c
> @@ -4149,15 +4149,20 @@ static struct clk_branch gcc_dcc_clk = {
>  
>  static const struct alpha_pll_config ubi32_pll_config = {
>  	.l = 0x3e,
> -	.alpha = 0x57,
> +	.alpha = 0x6667,
>  	.config_ctl_val = 0x240d6aa8,
>  	.config_ctl_hi_val = 0x3c2,
> +	.config_ctl_val = 0x240d4828,
> +	.config_ctl_hi_val = 0x6,
>  	.main_output_mask = BIT(0),
>  	.aux_output_mask = BIT(1),
>  	.pre_div_val = 0x0,
>  	.pre_div_mask = BIT(12),
>  	.post_div_val = 0x0,
>  	.post_div_mask = GENMASK(9, 8),
> +	.alpha_en_mask = BIT(24),
> +	.test_ctl_val = 0x1C0000C0,
Please use lowercase hex.

Konrad
> +	.test_ctl_hi_val = 0x4000,
>  };
>  
>  static const struct alpha_pll_config nss_crypto_pll_config = {
