Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6783CECAAA1
	for <linux-clk@archiver.kernel.org>; Thu, 27 Oct 2022 12:42:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234916AbiJ0Mmi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Oct 2022 08:42:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233619AbiJ0Mmh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Oct 2022 08:42:37 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1359829361
        for <linux-clk@vger.kernel.org>; Thu, 27 Oct 2022 05:42:36 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id k19so1931774lji.2
        for <linux-clk@vger.kernel.org>; Thu, 27 Oct 2022 05:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v3Nc72b690gEq9FOu83an5jQGVVWDfDu6QhQ6g28Bd4=;
        b=YIevQDdkUH92m6ggfbFjUI64CpKuLAFwlOWzcaYHGh0VVMllHDXXMZyDK1IUS9SPc8
         zzemPdeA1rMSr4hr7aVxpbbh/RbV+nW8jySItcpWrKRK7/MQzhDT6lcuDIjc5SERIpw6
         7ML+exxhMjrPr2vNyfWJKEd4uftJQ0re3zxC3xz5tu2HOx1Gn9MnILv5MGfiFs8sYYle
         gMEwZnkDU61el0zrC5QYWB/9plxm5F+g82/Bej/ABnxi75mLseToZOutZdAgAxY3NnCV
         yI4d4k7UxLu1ou4K0LPmillYJK6KQUm5pkyqcXiHLXZL5g8JEUEy+JMXst7yL5lB8XNx
         RaEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v3Nc72b690gEq9FOu83an5jQGVVWDfDu6QhQ6g28Bd4=;
        b=tIKTERzLuooW4rEf/ifB9LvcwEmO0/a3nrthwriEPIah67W1bB526d6kvTasLFbvJk
         yJRNMU6CwpLwrDTxBouR7MFZ3FTo44wgNCXqyu6RUszMxofrt4R/gXTKZNdoA0eNFIUk
         dvw6cm7FiN1ENjRmXm7b9lECkxSiAfx7mqdjObiNZQUN5EJxQ82xnyrPVSeln94kOaUE
         W1Aij8iNVyfklJOQX+Hia7kRpGhghCVIqNjf9C3WRVLyje7BfQdvTnFQcsDopU7nRqeE
         8d4mPB1w1JAoL4eR3pKMp63Ig3xU1BDIZF+B+dB8Oqp6dA7hNsGZwxnrC8d45YeZG6VM
         L34A==
X-Gm-Message-State: ACrzQf18HtuMvwZDybzgJE+b9qo10ugbI2fsrhO1Bc7qH1XtwK6rEZHH
        u7y2IDx3NagPD3jK64ze6WkX7g==
X-Google-Smtp-Source: AMsMyM70UthF0zhGlnOpSzC2royUK9/b1nvq2imdjfg07dDz5E+Jw4jlKPOynqljuxkrJfi/nGcelQ==
X-Received: by 2002:a2e:a44a:0:b0:26e:177:d166 with SMTP id v10-20020a2ea44a000000b0026e0177d166mr18373949ljn.520.1666874554427;
        Thu, 27 Oct 2022 05:42:34 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id r6-20020a2e8e26000000b0026acfbbcb7esm221355ljk.12.2022.10.27.05.42.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 05:42:34 -0700 (PDT)
Message-ID: <e32be4c0-56ea-6999-92e6-3b51792a5255@linaro.org>
Date:   Thu, 27 Oct 2022 15:42:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v1 4/5] clk: qcom: dispcc-sm8250: Add missing EDP clocks
 for sm8350
Content-Language: en-GB
To:     Robert Foss <robert.foss@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>
References: <20221027123432.1818530-1-robert.foss@linaro.org>
 <20221027123432.1818530-4-robert.foss@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221027123432.1818530-4-robert.foss@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 27/10/2022 15:34, Robert Foss wrote:
> SM8350 supports embedded displayport, but the clocks for this
> were previously not enabled.

I'd say 'not accounted for' instead. Bjorn has added eDP clocks, but 
they were following the 8150 (no div_clk_src) and the offsets were not 
updated.

> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>   drivers/clk/qcom/dispcc-sm8250.c | 22 +++++++++++++++++++++-
>   1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
> index a7606580cf22..d2aaa44ed3d4 100644
> --- a/drivers/clk/qcom/dispcc-sm8250.c
> +++ b/drivers/clk/qcom/dispcc-sm8250.c
> @@ -462,6 +462,20 @@ static struct clk_branch disp_cc_mdss_edp_link_clk = {
>   	},
>   };
>   
> +static struct clk_regmap_div disp_cc_mdss_edp_link_div_clk_src = {
> +	.reg = 0x2288,
> +	.shift = 0,
> +	.width = 2,
> +	.clkr.hw.init = &(struct clk_init_data) {
> +		.name = "disp_cc_mdss_edp_link_div_clk_src",
> +		.parent_hws = (const struct clk_hw*[]){
> +			&disp_cc_mdss_edp_link_clk_src.clkr.hw,
> +		},
> +		.num_parents = 1,
> +		.ops = &clk_regmap_div_ro_ops,
> +	},
> +};
> +
>   static struct clk_branch disp_cc_mdss_edp_link_intf_clk = {
>   	.halt_reg = 0x2074,
>   	.halt_check = BRANCH_HALT,
> @@ -471,7 +485,7 @@ static struct clk_branch disp_cc_mdss_edp_link_intf_clk = {
>   		.hw.init = &(struct clk_init_data){
>   			.name = "disp_cc_mdss_edp_link_intf_clk",
>   			.parent_hws = (const struct clk_hw*[]){
> -				&disp_cc_mdss_edp_link_clk_src.clkr.hw,
> +				&disp_cc_mdss_edp_link_div_clk_src.clkr.hw,
>   			},
>   			.num_parents = 1,
>   			.flags = CLK_GET_RATE_NOCACHE,
> @@ -1175,6 +1189,7 @@ static struct clk_regmap *disp_cc_sm8250_clocks[] = {
>   	[DISP_CC_MDSS_EDP_GTC_CLK_SRC] = &disp_cc_mdss_edp_gtc_clk_src.clkr,
>   	[DISP_CC_MDSS_EDP_LINK_CLK] = &disp_cc_mdss_edp_link_clk.clkr,
>   	[DISP_CC_MDSS_EDP_LINK_CLK_SRC] = &disp_cc_mdss_edp_link_clk_src.clkr,
> +	[DISP_CC_MDSS_EDP_LINK_DIV_CLK_SRC] = &disp_cc_mdss_edp_link_div_clk_src.clkr,
>   	[DISP_CC_MDSS_EDP_LINK_INTF_CLK] = &disp_cc_mdss_edp_link_intf_clk.clkr,
>   	[DISP_CC_MDSS_EDP_PIXEL_CLK] = &disp_cc_mdss_edp_pixel_clk.clkr,
>   	[DISP_CC_MDSS_EDP_PIXEL_CLK_SRC] = &disp_cc_mdss_edp_pixel_clk_src.clkr,
> @@ -1285,7 +1300,11 @@ static int disp_cc_sm8250_probe(struct platform_device *pdev)
>   			&disp_cc_mdss_dp_pixel1_clk_src,
>   			&disp_cc_mdss_dp_pixel2_clk_src,
>   			&disp_cc_mdss_dp_pixel_clk_src,
> +			&disp_cc_mdss_edp_aux_clk_src,
> +			&disp_cc_mdss_edp_link_clk_src,
> +			&disp_cc_mdss_edp_pixel_clk_src,
>   			&disp_cc_mdss_esc0_clk_src,
> +			&disp_cc_mdss_esc1_clk_src,
>   			&disp_cc_mdss_mdp_clk_src,
>   			&disp_cc_mdss_pclk0_clk_src,
>   			&disp_cc_mdss_pclk1_clk_src,
> @@ -1297,6 +1316,7 @@ static int disp_cc_sm8250_probe(struct platform_device *pdev)
>   			&disp_cc_mdss_byte1_div_clk_src,
>   			&disp_cc_mdss_dp_link1_div_clk_src,
>   			&disp_cc_mdss_dp_link_div_clk_src,
> +			&disp_cc_mdss_edp_link_div_clk_src,
>   		};
>   		unsigned int i;
>   		static bool offset_applied;

-- 
With best wishes
Dmitry

