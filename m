Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29DE7C6FD18
	for <linux-clk@archiver.kernel.org>; Tue, 25 Apr 2023 13:44:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234234AbjDYNoS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Apr 2023 09:44:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234186AbjDYNoP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Apr 2023 09:44:15 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0796AE58
        for <linux-clk@vger.kernel.org>; Tue, 25 Apr 2023 06:44:14 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-94ef0a8546fso914392366b.1
        for <linux-clk@vger.kernel.org>; Tue, 25 Apr 2023 06:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682430252; x=1685022252;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JEdRBIVNpKBeEtTf2V0pnx1RgdetECiJy/vNAh6/A7o=;
        b=zIolGGcNUZTwywYcnLd5gqq5D3pbP7tkeR2DRJ3pKeTVfgPYKRGBtODmkfILSPA4pI
         YZhuwhg7e8wjeseolpX77bUzWSm+VgjCgeM1vVHRaYLDlnLivVDPK9bVu89epyIxJRA6
         M0XlVroEMB7vD2p9SV4kGuk6wGYpcCq9nSTWlO4ovZjmXerrAc4Y1sCS2R9dXDTFuVaW
         ZZs9XDZ8Sjq2g+jfCKz/mpt1N2mzeMHwebC89X/B+38ymcRi7efAAXFX0AlxZWJtT/8D
         pJjc8DHS66RLSJT63bZ96ciaUn8VXJO0AocDTnSJW2Zq9jK1nciUKI8zUngy8X4pkjlm
         caNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682430252; x=1685022252;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JEdRBIVNpKBeEtTf2V0pnx1RgdetECiJy/vNAh6/A7o=;
        b=Ya5jGx/8xVRvmr/oXRN8hEsNlpUUc/z0dnKKR7A3bLVKgK8T2ibwziRkKZ4GT3HDk5
         EKDnIC5aOOH2eBy/606kLKLxTOTHXyv9cga/hZhqySBCY92ZyBX0/D0wE+rf0e4v6QYL
         QgVTeIK3Ipw4thgQW48x4+jbTqnKlCADD4fjHOyyHOv1ZbeLdYpcI3TH+hZxcwvrItSv
         GUEQCbSMtsxo+HXIdgXDg27b58gBs8/iDske2QOQOFmQxxqqJsdzKi3sBBmA7JS0rRKK
         OC6FcARIBSOcE5YxlHTq3HKk+0xeIHfWhkqSBETromG2LIzw4h/VDQFP06lqVBefS4h8
         AVYQ==
X-Gm-Message-State: AAQBX9fC8V3jl7YjL4E7e3zqMzxFuIYKFlJZr+cN5mTdGkAa3GqZtSqf
        M58HM03YFWe6FZ0z7f5qGvz5sg==
X-Google-Smtp-Source: AKy350bhue30eF54tT/ujbt9TygS7DEofqGRu9TE88RP8Udstp37H6+lOTCb8DidCPSz8ktwGI9xeQ==
X-Received: by 2002:a17:906:a3da:b0:94f:2b80:f3b4 with SMTP id ca26-20020a170906a3da00b0094f2b80f3b4mr14085813ejb.69.1682430252333;
        Tue, 25 Apr 2023 06:44:12 -0700 (PDT)
Received: from [172.23.2.104] ([195.167.132.10])
        by smtp.gmail.com with ESMTPSA id jo2-20020a170906f6c200b009538cc79241sm6835561ejb.56.2023.04.25.06.44.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Apr 2023 06:44:11 -0700 (PDT)
Message-ID: <094e0cec-5a9b-abfc-74b0-9d3af10f9275@linaro.org>
Date:   Tue, 25 Apr 2023 14:44:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] clk: qcom: gcc-ipq6018: Use floor ops for sdcc clocks
To:     Mantas Pucka <mantas@8devices.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1682413909-24927-1-git-send-email-mantas@8devices.com>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <1682413909-24927-1-git-send-email-mantas@8devices.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 4/25/23 10:11, Mantas Pucka wrote:
> SDCC clocks must be rounded down to avoid overclocking the controller.
>
> Fixes: d9db07f088af ("clk: qcom: Add ipq6018 Global Clock Controller support")
> Signed-off-by: Mantas Pucka <mantas@8devices.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>


Konrad

> v2: remove unnecessary newline in commit message
>
>   drivers/clk/qcom/gcc-ipq6018.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/qcom/gcc-ipq6018.c b/drivers/clk/qcom/gcc-ipq6018.c
> index 3f9c2f61a5d9..5c5d1b04ea7a 100644
> --- a/drivers/clk/qcom/gcc-ipq6018.c
> +++ b/drivers/clk/qcom/gcc-ipq6018.c
> @@ -1654,7 +1654,7 @@ static struct clk_rcg2 sdcc1_apps_clk_src = {
>   		.name = "sdcc1_apps_clk_src",
>   		.parent_data = gcc_xo_gpll0_gpll2_gpll0_out_main_div2,
>   		.num_parents = 4,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_floor_ops,
>   	},
>   };
>   
