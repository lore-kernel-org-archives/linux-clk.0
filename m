Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03270C4332F
	for <linux-clk@archiver.kernel.org>; Sat, 17 Dec 2022 15:08:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbiLQPIv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 17 Dec 2022 10:08:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbiLQPIu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 17 Dec 2022 10:08:50 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E9421408E
        for <linux-clk@vger.kernel.org>; Sat, 17 Dec 2022 07:08:49 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id p36so7680165lfa.12
        for <linux-clk@vger.kernel.org>; Sat, 17 Dec 2022 07:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7+AAXNyn7D4ZBGrHZRVwibl7ejUX7z4qDKo/f6e91EE=;
        b=Sa0b8rbQmQVYQ/13uSKElmHawbEyW9ulmnd895VZB1yrJwLuyoWAp7+KyEbEbensFu
         ZggpHWQ0UUKQSJkNBGpIrCmbWttGcEJ255BzfQpUPiAabL5VsQe1GQwbZlMAeKA1RzDR
         /3iU07Wa2/Y7Fx/6E7JGvX7cUcBg57r39jH9N7YBx5QAiNWKZPX+wB9vbr53BDHxv04G
         ukkRDWMIWuk5fGvZTr3sB9jV7/TQUhj6cZuQE0l02l+XzkTxMYjYpKlvM8ti07uJOr1w
         IIDnqQkhecNWtx17gtCNa3HIy1b936wohLF0kBJJIo+xwAFJb+VTl3w7BkBUK0cNXdZN
         qr4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7+AAXNyn7D4ZBGrHZRVwibl7ejUX7z4qDKo/f6e91EE=;
        b=huYwSe68v6kPtJswMt0s9L4DWjkCB2uhxiHfTZoyPB4Vzxl/QFNfGMqyNftZMCR9KC
         WDPDRE6JVEmdKiCWOnmIfj/Fdcs5twosaou5wevPz1vms7DbSBE3PHRwuWz2DtLBNa0q
         kZHLD3/sFcXDYNvx9z94iutzvr2GCBTJ9OOBBss4XUAj6e+zkld+BmGUKfrTh8+CzBtY
         m81hW4q2Y18HgNK0w12wn834hX+5oNthGipQ8jBx12XQN3e1hbM0XQDVA+/2E+K07k2n
         ZL+q5+YDtnBPFVHYjkrLn2UpV++5UcQFqaiN/oWXBliVe2fgmBZSSfp2kiVTwbEduWzv
         2SEg==
X-Gm-Message-State: AFqh2krkOmvEDwdegMscBy1E+ZA/F5ZNZMclIipUTACUswYthh0QPl1+
        /p176DCYASsJ52VGz96An82IvQ==
X-Google-Smtp-Source: AMrXdXvUNttNkcx62RJR0XZ210Ami7+3OHcy8kcQI3gecJtPOddnwFLM29pf1svCB6q2tfPrPFrh1A==
X-Received: by 2002:a05:6512:e96:b0:4c0:91d0:e7ae with SMTP id bi22-20020a0565120e9600b004c091d0e7aemr2404609lfb.28.1671289729083;
        Sat, 17 Dec 2022 07:08:49 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id c14-20020ac25f6e000000b00497ab34bf5asm534973lfc.20.2022.12.17.07.08.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Dec 2022 07:08:48 -0800 (PST)
Message-ID: <0e4e1d76-cd47-f8e4-4ba1-e28578036b1b@linaro.org>
Date:   Sat, 17 Dec 2022 16:08:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 06/15] clk: qcom: gcc-qcs404: fix names of the DSI clocks
 used as parents
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
 <20221217001730.540502-7-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221217001730.540502-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 17.12.2022 01:17, Dmitry Baryshkov wrote:
> The QCS404 uses 28nm LPM DSI PHY, which registers dsi0pll and
> dsi0pllbyte clocks. Fix all DSI PHY clock names used as parents inside
> the GCC driver.
> 
> Fixes: 652f1813c113 ("clk: qcom: gcc: Add global clock controller driver for QCS404")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/gcc-qcs404.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
> index c48326da1bb3..23562096298d 100644
> --- a/drivers/clk/qcom/gcc-qcs404.c
> +++ b/drivers/clk/qcom/gcc-qcs404.c
> @@ -115,7 +115,7 @@ static const struct parent_map gcc_parent_map_5[] = {
>  
>  static const char * const gcc_parent_names_5[] = {
>  	"cxo",
> -	"dsi0pll_byteclk_src",
> +	"dsi0pllbyte",
>  	/* "gpll0_out_aux", */
>  	"core_bi_pll_test_se",
>  };
> @@ -129,7 +129,7 @@ static const struct parent_map gcc_parent_map_6[] = {
>  
>  static const char * const gcc_parent_names_6[] = {
>  	"cxo",
> -	"dsi0_phy_pll_out_byteclk",
> +	"dsi0pllbyte",
>  	/* "gpll0_out_aux", */
>  	"core_bi_pll_test_se",
>  };
> @@ -175,7 +175,7 @@ static const struct parent_map gcc_parent_map_9[] = {
>  static const char * const gcc_parent_names_9[] = {
>  	"cxo",
>  	"gpll0_out_main",
> -	"dsi0_phy_pll_out_dsiclk",
> +	"dsi0pll",
>  	"gpll6_out_aux",
>  	"core_bi_pll_test_se",
>  };
> @@ -213,7 +213,7 @@ static const struct parent_map gcc_parent_map_12[] = {
>  
>  static const char * const gcc_parent_names_12[] = {
>  	"cxo",
> -	"dsi0pll_pclk_src",
> +	"dsi0pll",
>  	/* "gpll0_out_aux", */
>  	"core_bi_pll_test_se",
>  };
