Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C675C54EBE
	for <linux-clk@archiver.kernel.org>; Fri, 13 Jan 2023 15:27:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230222AbjAMP1o (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 Jan 2023 10:27:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230026AbjAMP1M (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Jan 2023 10:27:12 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8569381C25
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 07:20:10 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id q2so22791443ljp.6
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 07:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SSgTXFHyKy3EKW5amzFNddURi7wwL3JPtHEB4W2PJIQ=;
        b=E+Ko3HoaAn/SbNq2+BoHjVxHOcFXzxcMw5eAnMS7INVdgfQwkd47z0/mJOV5XoH498
         scTjG3apXZotcgyYBbdTB1cUhowgMekHOy1hfNWvlASySy0yRd7gG4cWcB5FR7gy/508
         BxaNCdVHU/hZlmXCX11/vmpk7b3qlV3Mom9au2tVJ36szclEsWxoaKG1SrKU1+5r6TmC
         phFiurVXNenluvCVRtvFrmBL5DAxUUj/0PoGhJp1toeZdMGZkQujloCxNS+e1QNClM3X
         HsvM8DnHrtWSbIkFQrovljY1C8ndbwfkHRDo85zbuIaZCICMW2Dr1oAdkQ2yKx7O2mff
         64mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SSgTXFHyKy3EKW5amzFNddURi7wwL3JPtHEB4W2PJIQ=;
        b=yhEHbAmOuKmUasgwJXdC/ss8J0CV2DaZo76p6EuuVrd7GuC4tsQ4Al3iGU+Ttg3HsW
         LUXJGsN9YrEfh2xZRW9zg62B1PODJdkt2AAZO5o1jFElJjsuRUd5KZ3V4rhTkDIvZ2oD
         /pNmm4GQ4UklRYhx9Strjij/ZAmq+0/rTcoW5kUBN2FvxIwfFFWp1+sgmYyHzVQsLMJB
         fWLGlZyvNUDxqlrP9gOrxY9Bf43k1eyruRb150HP8Unm4vGHtuCCiafxyaGe2Q8oC4bX
         HHWIi92werTEl0gUVhouEJdy8glzlD5IhoDsj8hwj4wGbJEMLQZP3IZXu1C01Tx4+DeY
         Makg==
X-Gm-Message-State: AFqh2kp/b4aPOVfrQUaPRWkLLNWfTg1e+HTp9gKerrhMNRMXYPdz/rP6
        zIwhDgyyoIC3B5pLvgRXKRWbxA==
X-Google-Smtp-Source: AMrXdXtlAwax9wzqDnNUzguINen9TYLIV91ebf6KZx6f+zkSZhQ803ZvgPpY7xs8wCz4XL7zPvUNXw==
X-Received: by 2002:a2e:a48a:0:b0:281:e762:35aa with SMTP id h10-20020a2ea48a000000b00281e76235aamr62619lji.3.1673623208570;
        Fri, 13 Jan 2023 07:20:08 -0800 (PST)
Received: from [192.168.1.101] (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id p6-20020a2ea406000000b00289cfd2088csm693673ljn.73.2023.01.13.07.20.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 07:20:08 -0800 (PST)
Message-ID: <b87ab80d-0936-5a5a-25da-35c0dbdede33@linaro.org>
Date:   Fri, 13 Jan 2023 16:20:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 6/6] clk: qcom: Fix APSS PLL and RCG Configuration
Content-Language: en-US
To:     devi priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, jassisinghbrar@gmail.com,
        catalin.marinas@arm.com, will@kernel.org, shawnguo@kernel.org,
        arnd@arndb.de, marcel.ziswiler@toradex.com,
        dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
        broonie@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_poovendh@quicinc.com
References: <20230113143647.14961-1-quic_devipriy@quicinc.com>
 <20230113143647.14961-7-quic_devipriy@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230113143647.14961-7-quic_devipriy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 13.01.2023 15:36, devi priya wrote:
> Included CLK_IS_CRITICAL flag which helps to properly enable
> the APSS PLL during bootup.
Please describe the issue and not only the user-visible impact it
makes. Does the PLL get shut down by clk_ignore_unused? Maybe you
would be interested in the sync_state changes that landed in recent
-next that may solve it for you?

I don't think it should be always-on, as you have an alternate source
for low power modes, adding CLK_IS_CRITICAL will keep the PLL enabled
even if you're not using it.

> clk_rcg2_ops should be used for APSS clock RCG, as other ops
> will not configure the RCG register
RCG register meaning RCG register*s*, meaning in this case M/N/D
which would be required for proper rate setting and not only input
switching (which arguably doesn't seem to be of much concern on a
single-parent clock)? This all is not obvious..

Konrad
> 
> Co-developed-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: devi priya <quic_devipriy@quicinc.com>
> ---
>  drivers/clk/qcom/apss-ipq-pll.c | 1 +
>  drivers/clk/qcom/apss-ipq6018.c | 8 +++++++-
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/apss-ipq-pll.c b/drivers/clk/qcom/apss-ipq-pll.c
> index dd0c01bf5a98..75486a124fcd 100644
> --- a/drivers/clk/qcom/apss-ipq-pll.c
> +++ b/drivers/clk/qcom/apss-ipq-pll.c
> @@ -33,6 +33,7 @@ static struct clk_alpha_pll ipq_pll = {
>  			},
>  			.num_parents = 1,
>  			.ops = &clk_alpha_pll_huayra_ops,
> +			.flags = CLK_IS_CRITICAL,
>  		},
>  	},
>  };
> diff --git a/drivers/clk/qcom/apss-ipq6018.c b/drivers/clk/qcom/apss-ipq6018.c
> index f2f502e2d5a4..0d0e7196a4dc 100644
> --- a/drivers/clk/qcom/apss-ipq6018.c
> +++ b/drivers/clk/qcom/apss-ipq6018.c
> @@ -33,15 +33,21 @@ static const struct parent_map parents_apcs_alias0_clk_src_map[] = {
>  	{ P_APSS_PLL_EARLY, 5 },
>  };
>  
> +static const struct freq_tbl ftbl_apcs_alias0_clk_src[] = {
> +	{ .src = P_APSS_PLL_EARLY, .pre_div = 1 },
> +	{ }
> +};
> +
>  static struct clk_rcg2 apcs_alias0_clk_src = {
>  	.cmd_rcgr = 0x0050,
> +	.freq_tbl = ftbl_apcs_alias0_clk_src,
>  	.hid_width = 5,
>  	.parent_map = parents_apcs_alias0_clk_src_map,
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "apcs_alias0_clk_src",
>  		.parent_data = parents_apcs_alias0_clk_src,
>  		.num_parents = ARRAY_SIZE(parents_apcs_alias0_clk_src),
> -		.ops = &clk_rcg2_mux_closest_ops,
> +		.ops = &clk_rcg2_ops,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
