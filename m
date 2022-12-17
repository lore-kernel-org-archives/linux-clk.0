Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B9A9C4332F
	for <linux-clk@archiver.kernel.org>; Sat, 17 Dec 2022 15:07:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229898AbiLQPH3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 17 Dec 2022 10:07:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229892AbiLQPH2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 17 Dec 2022 10:07:28 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8279F14098
        for <linux-clk@vger.kernel.org>; Sat, 17 Dec 2022 07:07:25 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id s10so5037084ljg.1
        for <linux-clk@vger.kernel.org>; Sat, 17 Dec 2022 07:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N+C2rsWEZAUNOIs0pA4k88PpEFqoQfoM+Ko5vyiVlJ4=;
        b=nm4eiPxm2pgomggnDHMdJhpk6WH+gw2E5/53rZJ3APYxonSPxNPFVG7Gy0Yd9aiGRs
         rcT7jzKgT+s53fAd4KZweYZ7XFNGxP6T5UmKGpp10n116svfYh2ASlF0mGHH/r2JvIGr
         4qlON6qMD5q1XuveS1zBCMGGdB5wc+lGKxJ76nHE6x4FCfEE/H8BKLXyz5vPBtJrKmRu
         D291YkZj4afRyC/mR3nZlO0vWWeRi6K5Ah/iPMToMalgo2dEHqzrWR/REXAGVUFPesNi
         BkIk7M4XvSmycAo5i2HLbmrXMQ4nwOoFEszUMNmdGkdcJkOJb+CWAL1/2FB6GN4Do7zq
         e1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N+C2rsWEZAUNOIs0pA4k88PpEFqoQfoM+Ko5vyiVlJ4=;
        b=cVfZt6ujjN7sl+zo4M9ikMlYJakZKfHo7voG1Y98iUGBpSYotT3jNzBNjayoe1IjcH
         RikxaDGqU48LX9P+F/WXmauCGJjH6zWw/lMMb38HX1jqZNAHaOULRGmMDMN0L70uz/+3
         9c2yMqgLUeDe692tRtqoiO6prkfMBAIDtQIxngmJevnz7UM1APCtknoJYFU7nfREyfCZ
         qxWDuICbFkYB5iuq/aRTLfkXKUH/NPba36QVwrLw/c41yqL6ILFRGB6aOUmO+izt0OQu
         lHR3e+BhqTrevDyjnzSyzQMJBDGwWBasZnQBwpTRBVdO1FxAkeUXoEIJ/qF7azSREEfo
         7QXQ==
X-Gm-Message-State: ANoB5pkZvsfkHPGsOXrLg1Q7oLjYaa1oaAH2R2HKMrIDORGLarVjAnoL
        eF0LHt3n1DBUZ8GSY0UDF6s7FQ==
X-Google-Smtp-Source: AA0mqf7QKSNxH+7+RAgIUVi2z22WSzsfCmpxwIZyFXmapcmIVrSwAAXESfa5WonuUmsaC7mdXr6HKQ==
X-Received: by 2002:a2e:7819:0:b0:279:d3ba:81c1 with SMTP id t25-20020a2e7819000000b00279d3ba81c1mr9777167ljc.31.1671289643719;
        Sat, 17 Dec 2022 07:07:23 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id bf38-20020a2eaa26000000b00277045dcb5bsm375755ljb.97.2022.12.17.07.07.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Dec 2022 07:07:23 -0800 (PST)
Message-ID: <4b6e90d7-12c6-828c-d816-718ba93b88b8@linaro.org>
Date:   Sat, 17 Dec 2022 16:07:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 04/15] clk: qcom: gcc-qcs404: use ARRAY_SIZE instead of
 specifying num_parents
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
 <20221217001730.540502-5-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221217001730.540502-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 17.12.2022 01:17, Dmitry Baryshkov wrote:
> Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
> adding/removing entries to/from parent_data/names/hws easy and errorproof.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/gcc-qcs404.c | 86 +++++++++++++++++------------------
>  1 file changed, 43 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
> index 46d314d69250..f60a0ab42da1 100644
> --- a/drivers/clk/qcom/gcc-qcs404.c
> +++ b/drivers/clk/qcom/gcc-qcs404.c
> @@ -440,7 +440,7 @@ static struct clk_rcg2 apss_ahb_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "apss_ahb_clk_src",
>  		.parent_names = gcc_parent_names_ao_0,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_parent_names_ao_0),
>  		.flags = CLK_IS_CRITICAL,
>  		.ops = &clk_rcg2_ops,
>  	},
> @@ -461,7 +461,7 @@ static struct clk_rcg2 blsp1_qup0_i2c_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_qup0_i2c_apps_clk_src",
>  		.parent_names = gcc_parent_names_0,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -486,7 +486,7 @@ static struct clk_rcg2 blsp1_qup0_spi_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_qup0_spi_apps_clk_src",
>  		.parent_names = gcc_parent_names_0,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -500,7 +500,7 @@ static struct clk_rcg2 blsp1_qup1_i2c_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_qup1_i2c_apps_clk_src",
>  		.parent_names = gcc_parent_names_0,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -525,7 +525,7 @@ static struct clk_rcg2 blsp1_qup1_spi_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_qup1_spi_apps_clk_src",
>  		.parent_names = gcc_parent_names_0,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -539,7 +539,7 @@ static struct clk_rcg2 blsp1_qup2_i2c_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_qup2_i2c_apps_clk_src",
>  		.parent_names = gcc_parent_names_0,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -565,7 +565,7 @@ static struct clk_rcg2 blsp1_qup2_spi_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_qup2_spi_apps_clk_src",
>  		.parent_names = gcc_parent_names_0,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -579,7 +579,7 @@ static struct clk_rcg2 blsp1_qup3_i2c_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_qup3_i2c_apps_clk_src",
>  		.parent_names = gcc_parent_names_0,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -593,7 +593,7 @@ static struct clk_rcg2 blsp1_qup3_spi_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_qup3_spi_apps_clk_src",
>  		.parent_names = gcc_parent_names_0,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -607,7 +607,7 @@ static struct clk_rcg2 blsp1_qup4_i2c_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_qup4_i2c_apps_clk_src",
>  		.parent_names = gcc_parent_names_0,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -621,7 +621,7 @@ static struct clk_rcg2 blsp1_qup4_spi_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_qup4_spi_apps_clk_src",
>  		.parent_names = gcc_parent_names_0,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -655,7 +655,7 @@ static struct clk_rcg2 blsp1_uart0_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_uart0_apps_clk_src",
>  		.parent_names = gcc_parent_names_0,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -669,7 +669,7 @@ static struct clk_rcg2 blsp1_uart1_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_uart1_apps_clk_src",
>  		.parent_names = gcc_parent_names_0,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -683,7 +683,7 @@ static struct clk_rcg2 blsp1_uart2_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_uart2_apps_clk_src",
>  		.parent_names = gcc_parent_names_0,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -698,7 +698,7 @@ static struct clk_rcg2 blsp1_uart3_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp1_uart3_apps_clk_src",
>  		.parent_names = gcc_parent_names_0,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -712,7 +712,7 @@ static struct clk_rcg2 blsp2_qup0_i2c_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp2_qup0_i2c_apps_clk_src",
>  		.parent_names = gcc_parent_names_0,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -726,7 +726,7 @@ static struct clk_rcg2 blsp2_qup0_spi_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp2_qup0_spi_apps_clk_src",
>  		.parent_names = gcc_parent_names_0,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -740,7 +740,7 @@ static struct clk_rcg2 blsp2_uart0_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "blsp2_uart0_apps_clk_src",
>  		.parent_names = gcc_parent_names_0,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -753,7 +753,7 @@ static struct clk_rcg2 byte0_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "byte0_clk_src",
>  		.parent_names = gcc_parent_names_5,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(gcc_parent_names_5),
>  		.flags = CLK_SET_RATE_PARENT,
>  		.ops = &clk_byte2_ops,
>  	},
> @@ -776,7 +776,7 @@ static struct clk_rcg2 emac_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "emac_clk_src",
>  		.parent_names = gcc_parent_names_4,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_parent_names_4),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -797,7 +797,7 @@ static struct clk_rcg2 emac_ptp_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "emac_ptp_clk_src",
>  		.parent_names = gcc_parent_names_4,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_parent_names_4),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -816,7 +816,7 @@ static struct clk_rcg2 esc0_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "esc0_clk_src",
>  		.parent_names = gcc_parent_names_6,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(gcc_parent_names_6),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -850,7 +850,7 @@ static struct clk_rcg2 gfx3d_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gfx3d_clk_src",
>  		.parent_names = gcc_parent_names_7,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(gcc_parent_names_7),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -871,7 +871,7 @@ static struct clk_rcg2 gp1_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gp1_clk_src",
>  		.parent_names = gcc_parent_names_2,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(gcc_parent_names_2),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -885,7 +885,7 @@ static struct clk_rcg2 gp2_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gp2_clk_src",
>  		.parent_names = gcc_parent_names_2,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(gcc_parent_names_2),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -899,7 +899,7 @@ static struct clk_rcg2 gp3_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gp3_clk_src",
>  		.parent_names = gcc_parent_names_2,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(gcc_parent_names_2),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -913,7 +913,7 @@ static struct clk_rcg2 hdmi_app_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "hdmi_app_clk_src",
>  		.parent_names = gcc_parent_names_1,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_parent_names_1),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -927,7 +927,7 @@ static struct clk_rcg2 hdmi_pclk_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "hdmi_pclk_clk_src",
>  		.parent_names = gcc_parent_names_8,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_parent_names_8),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -954,7 +954,7 @@ static struct clk_rcg2 mdp_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "mdp_clk_src",
>  		.parent_names = gcc_parent_names_9,
> -		.num_parents = 5,
> +		.num_parents = ARRAY_SIZE(gcc_parent_names_9),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -973,7 +973,7 @@ static struct clk_rcg2 pcie_0_aux_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "pcie_0_aux_clk_src",
>  		.parent_names = gcc_parent_names_10,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_parent_names_10),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -994,7 +994,7 @@ static struct clk_rcg2 pcie_0_pipe_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "pcie_0_pipe_clk_src",
>  		.parent_names = gcc_parent_names_11,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_parent_names_11),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1007,7 +1007,7 @@ static struct clk_rcg2 pclk0_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "pclk0_clk_src",
>  		.parent_names = gcc_parent_names_12,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(gcc_parent_names_12),
>  		.flags = CLK_SET_RATE_PARENT,
>  		.ops = &clk_pixel_ops,
>  	},
> @@ -1028,7 +1028,7 @@ static struct clk_rcg2 pdm2_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "pdm2_clk_src",
>  		.parent_names = gcc_parent_names_0,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1056,7 +1056,7 @@ static struct clk_rcg2 sdcc1_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "sdcc1_apps_clk_src",
>  		.parent_names = gcc_parent_names_13,
> -		.num_parents = 5,
> +		.num_parents = ARRAY_SIZE(gcc_parent_names_13),
>  		.ops = &clk_rcg2_floor_ops,
>  	},
>  };
> @@ -1076,7 +1076,7 @@ static struct clk_rcg2 sdcc1_ice_core_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "sdcc1_ice_core_clk_src",
>  		.parent_names = gcc_parent_names_3,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(gcc_parent_names_3),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1102,7 +1102,7 @@ static struct clk_rcg2 sdcc2_apps_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "sdcc2_apps_clk_src",
>  		.parent_names = gcc_parent_names_14,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(gcc_parent_names_14),
>  		.ops = &clk_rcg2_floor_ops,
>  	},
>  };
> @@ -1116,7 +1116,7 @@ static struct clk_rcg2 usb20_mock_utmi_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "usb20_mock_utmi_clk_src",
>  		.parent_names = gcc_parent_names_1,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_parent_names_1),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1138,7 +1138,7 @@ static struct clk_rcg2 usb30_master_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "usb30_master_clk_src",
>  		.parent_names = gcc_parent_names_0,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1152,7 +1152,7 @@ static struct clk_rcg2 usb30_mock_utmi_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "usb30_mock_utmi_clk_src",
>  		.parent_names = gcc_parent_names_1,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_parent_names_1),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1166,7 +1166,7 @@ static struct clk_rcg2 usb3_phy_aux_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "usb3_phy_aux_clk_src",
>  		.parent_names = gcc_parent_names_1,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_parent_names_1),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1189,7 +1189,7 @@ static struct clk_rcg2 usb_hs_system_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "usb_hs_system_clk_src",
>  		.parent_names = gcc_parent_names_3,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(gcc_parent_names_3),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1203,7 +1203,7 @@ static struct clk_rcg2 vsync_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "vsync_clk_src",
>  		.parent_names = gcc_parent_names_15,
> -		.num_parents = 3,
> +		.num_parents = ARRAY_SIZE(gcc_parent_names_15),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1225,7 +1225,7 @@ static struct clk_rcg2 cdsp_bimc_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data) {
>  		.name = "cdsp_bimc_clk_src",
>  		.parent_names = gcc_parent_names_16,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(gcc_parent_names_16),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
