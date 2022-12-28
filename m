Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06888C4167B
	for <linux-clk@archiver.kernel.org>; Wed, 28 Dec 2022 13:41:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233059AbiL1NlH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Dec 2022 08:41:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232989AbiL1Nkz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Dec 2022 08:40:55 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19D022DEF
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 05:40:54 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id 1so23657467lfz.4
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 05:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4i2uJsRL3nzPu1gdZaZgpIGJk0GpvjIC6PNGi3jAeB8=;
        b=U7KNHz3tANKG1VmtUfDV2r1T0hR1v+rg1CE2onkuXq5kj4CXlhTeVt48RybYwWJ6Qj
         0DmMqHYNuNT0d6Er4ASy+cGnsPya9xm4Ki9pKV3MGfhpqOOcXgAWnP9oFYCsYXuplYya
         wBZCh/ryvv3e/dLX1mxXNfvxvoQ1oPheRP2VGGiL4euoN/iqxzVsiC7UTRO836+pyPNV
         A1RoCqtTy3URyuWBoh4oX6hAQ9IWpJ7T29FXBe6xnrq+P9f2ZrJrYBb145fPZkLF1KA/
         /hOmjkVbqjjfGm5cgjOm+eXIHMzmR7eAjaVQeS/tsp80c3LuSwu7LauU1vVyRQ0w3vfe
         5qBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4i2uJsRL3nzPu1gdZaZgpIGJk0GpvjIC6PNGi3jAeB8=;
        b=QyB4EmF3n5HJyxDTpC3wJ9IO5B+d7hj9pweMZsp1N2xzeUPdVOMsACUAoeZgRp2UaN
         tVGok/ON4UgHLnfIHRXmT+mSrzFRYB9THDvq7zakuk3eLtz6uo9ziECJDh4r2RjR2/rJ
         YYUajzSJBICv3dadMO7NzHSVrXHxU0ouPRkV2jRSUB767IX5KMJciAk7dLXhEFTzboKM
         J4yiC4oVpiJEiHoIGxklOYqg2UZtv3hONbUKU3OD0NaOmxj2ROWHK+FDjwQotJEFHrmv
         jfr87J9OXqBrzq86DEUF82cQXmdZmlezJAEcsJELS7sjZAyZlVNcRwztEDwCxqWu3Afy
         v8pw==
X-Gm-Message-State: AFqh2kopjit6nJ7R1K4d6yGvespthfqHKIS2TVuOC83cBknEMGJXQyxw
        LZDstz83M+cZOZbVHkA1pVzNaw==
X-Google-Smtp-Source: AMrXdXu3c6oHTl4LlgWbUAyonznWhvMnGKV+QB0UA9viQg92SZJa6FmJ0IHCxTPhKliXifMumRYEmw==
X-Received: by 2002:ac2:5fcf:0:b0:4b5:5ca8:93bc with SMTP id q15-20020ac25fcf000000b004b55ca893bcmr6686724lfg.23.1672234852470;
        Wed, 28 Dec 2022 05:40:52 -0800 (PST)
Received: from [192.168.1.101] (abyl184.neoplus.adsl.tpnet.pl. [83.9.31.184])
        by smtp.gmail.com with ESMTPSA id u12-20020ac258cc000000b0049fff3f645esm2637399lfo.70.2022.12.28.05.40.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Dec 2022 05:40:52 -0800 (PST)
Message-ID: <fd1242bd-018b-34ea-e875-c1b2126270bc@linaro.org>
Date:   Wed, 28 Dec 2022 14:40:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 14/16] clk: qcom: gcc-sm8350: get rid of test clock
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
References: <20221228133243.3052132-1-dmitry.baryshkov@linaro.org>
 <20221228133243.3052132-15-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221228133243.3052132-15-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 28.12.2022 14:32, Dmitry Baryshkov wrote:
> The test clock apparently it's not used by anyone upstream. Remove it.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/gcc-sm8350.c | 15 ---------------
>  1 file changed, 15 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sm8350.c b/drivers/clk/qcom/gcc-sm8350.c
> index c3731f96c8e6..af4a1ea28421 100644
> --- a/drivers/clk/qcom/gcc-sm8350.c
> +++ b/drivers/clk/qcom/gcc-sm8350.c
> @@ -22,7 +22,6 @@
>  
>  enum {
>  	P_BI_TCXO,
> -	P_CORE_BI_PLL_TEST_SE,
>  	P_GCC_GPLL0_OUT_EVEN,
>  	P_GCC_GPLL0_OUT_MAIN,
>  	P_GCC_GPLL4_OUT_MAIN,
> @@ -119,14 +118,12 @@ static const struct parent_map gcc_parent_map_0[] = {
>  	{ P_BI_TCXO, 0 },
>  	{ P_GCC_GPLL0_OUT_MAIN, 1 },
>  	{ P_GCC_GPLL0_OUT_EVEN, 6 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const struct clk_parent_data gcc_parent_data_0[] = {
>  	{ .fw_name = "bi_tcxo" },
>  	{ .hw = &gcc_gpll0.clkr.hw },
>  	{ .hw = &gcc_gpll0_out_even.clkr.hw },
> -	{ .fw_name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map gcc_parent_map_1[] = {
> @@ -134,7 +131,6 @@ static const struct parent_map gcc_parent_map_1[] = {
>  	{ P_GCC_GPLL0_OUT_MAIN, 1 },
>  	{ P_SLEEP_CLK, 5 },
>  	{ P_GCC_GPLL0_OUT_EVEN, 6 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const struct clk_parent_data gcc_parent_data_1[] = {
> @@ -142,29 +138,24 @@ static const struct clk_parent_data gcc_parent_data_1[] = {
>  	{ .hw = &gcc_gpll0.clkr.hw },
>  	{ .fw_name = "sleep_clk" },
>  	{ .hw = &gcc_gpll0_out_even.clkr.hw },
> -	{ .fw_name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map gcc_parent_map_2[] = {
>  	{ P_BI_TCXO, 0 },
>  	{ P_SLEEP_CLK, 5 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const struct clk_parent_data gcc_parent_data_2[] = {
>  	{ .fw_name = "bi_tcxo" },
>  	{ .fw_name = "sleep_clk" },
> -	{ .fw_name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map gcc_parent_map_3[] = {
>  	{ P_BI_TCXO, 0 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const struct clk_parent_data gcc_parent_data_3[] = {
>  	{ .fw_name = "bi_tcxo" },
> -	{ .fw_name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map gcc_parent_map_4[] = {
> @@ -193,7 +184,6 @@ static const struct parent_map gcc_parent_map_6[] = {
>  	{ P_GCC_GPLL9_OUT_MAIN, 2 },
>  	{ P_GCC_GPLL4_OUT_MAIN, 5 },
>  	{ P_GCC_GPLL0_OUT_EVEN, 6 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const struct clk_parent_data gcc_parent_data_6[] = {
> @@ -202,7 +192,6 @@ static const struct clk_parent_data gcc_parent_data_6[] = {
>  	{ .hw = &gcc_gpll9.clkr.hw },
>  	{ .hw = &gcc_gpll4.clkr.hw },
>  	{ .hw = &gcc_gpll0_out_even.clkr.hw },
> -	{ .fw_name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map gcc_parent_map_7[] = {
> @@ -267,25 +256,21 @@ static const struct clk_parent_data gcc_parent_data_12[] = {
>  
>  static const struct parent_map gcc_parent_map_13[] = {
>  	{ P_USB3_PHY_WRAPPER_GCC_USB30_PIPE_CLK, 0 },
> -	{ P_CORE_BI_PLL_TEST_SE, 1 },
>  	{ P_BI_TCXO, 2 },
>  };
>  
>  static const struct clk_parent_data gcc_parent_data_13[] = {
>  	{ .fw_name = "usb3_phy_wrapper_gcc_usb30_pipe_clk" },
> -	{ .fw_name = "core_bi_pll_test_se" },
>  	{ .fw_name = "bi_tcxo" },
>  };
>  
>  static const struct parent_map gcc_parent_map_14[] = {
>  	{ P_USB3_UNI_PHY_SEC_GCC_USB30_PIPE_CLK, 0 },
> -	{ P_CORE_BI_PLL_TEST_SE, 1 },
>  	{ P_BI_TCXO, 2 },
>  };
>  
>  static const struct clk_parent_data gcc_parent_data_14[] = {
>  	{ .fw_name = "usb3_uni_phy_sec_gcc_usb30_pipe_clk" },
> -	{ .fw_name = "core_bi_pll_test_se" },
>  	{ .fw_name = "bi_tcxo" },
>  };
>  
