Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C360C54EBD
	for <linux-clk@archiver.kernel.org>; Thu, 12 Jan 2023 14:56:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240233AbjALO4I (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 Jan 2023 09:56:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239902AbjALOzY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Jan 2023 09:55:24 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 510BEEA9
        for <linux-clk@vger.kernel.org>; Thu, 12 Jan 2023 06:42:27 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id bu8so28716410lfb.4
        for <linux-clk@vger.kernel.org>; Thu, 12 Jan 2023 06:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=95qyaAj5QfX7lSiB7DEtag0jDt+J2mjB9PU+R87ARrE=;
        b=ckZKqYFQqSSPLMR2Ucnaei+F2Uq484VtDa3BHQX6q2xju7aUNRV1Gyl5ccnC6LNf1z
         +nd61hX+40U+WiDWYMdc03NviFcLVxs19Mj8duTOYXmaxgqTZV/z07NIxpSVO/7A16ak
         ZZZjbhU7Pulq26f8Zj9gOmf21zTg83yjFQSxSh4svnzl0HPYagJ6ca8X6ew1d1OEQOkV
         Rt4wlUceGWbjIu1vX82iCNAERGsj8dKFog3TZt/o7vjZLEW/dr6UqwEGpmvijsAAHwQS
         I/9XsnyjCvcZj+A+1vmuUfX0jww0TEns7hEEmd2TgofQRGY9e4q5IAf5L9qQ53klNxDJ
         Wejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=95qyaAj5QfX7lSiB7DEtag0jDt+J2mjB9PU+R87ARrE=;
        b=xno3ohnWF1LbW9P9NcDjQu1xopm/z6OwR4Jm3lnccMPlJM4jz6zZ6wVnZRTtli852M
         wshkP/19VznTiVDPToK66Dx98VPhVuHSFOWv6o0xIGO/EUMz3ezL1VY7jGKfwVfVFECn
         9cxS5UiGpw1POOoJMnmbY9YYiP7iOuy0juKREjAon0wQIgC15ipLPBzWxhZhmw8ZMsmF
         6HydkVuU9rJ50kFqlenjO/zB+ZVzFMGurTVB+UsCE64hIFo4whXHli91QY5cUqwYByMi
         NBUgjdTAcOHPCt4WeO/AP5u2N5HbEwqPDtEAWK37qxpBfG+pakUm6Cto91W6zIsDXIbL
         WCVQ==
X-Gm-Message-State: AFqh2krOhPlKFb50QZbvHxX+8HWGDp5/jTeq1lgEq5DjHS0S1iI1Uyk9
        tnZKjfG0+N3tKogOEMHqHesN1Q==
X-Google-Smtp-Source: AMrXdXtXeYmwh+eKEMx7MRNGjCJBE4Wu8Yh8z+YrERuMJPNruEkTdpyLkiUWUF9zl73hqzpCfv5QGg==
X-Received: by 2002:a19:8c5a:0:b0:4cc:85e5:2f68 with SMTP id i26-20020a198c5a000000b004cc85e52f68mr3330602lfj.2.1673534545694;
        Thu, 12 Jan 2023 06:42:25 -0800 (PST)
Received: from [192.168.1.101] (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id s9-20020ac24649000000b004cb08757441sm3278680lfo.199.2023.01.12.06.42.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 06:42:23 -0800 (PST)
Message-ID: <bc20f230-5ebc-676c-2165-031b82dca063@linaro.org>
Date:   Thu, 12 Jan 2023 15:42:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 12/13] clk: qcom: cpu-8996: change setup sequence to
 follow vendor kernel
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
References: <20230111192004.2509750-1-dmitry.baryshkov@linaro.org>
 <20230111192004.2509750-13-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230111192004.2509750-13-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 11.01.2023 20:20, Dmitry Baryshkov wrote:
> Add missing register writes to CPU clocks setup procedure. This makes it
> follow the setup procedure used in msm-3.18 kernel.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/clk-cpu-8996.c | 31 +++++++++++++++++++++++++++++--
>  1 file changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
> index b53cddc4bca3..78a18b95c48b 100644
> --- a/drivers/clk/qcom/clk-cpu-8996.c
> +++ b/drivers/clk/qcom/clk-cpu-8996.c
> @@ -76,10 +76,16 @@ enum _pmux_input {
>  #define PWRCL_REG_OFFSET 0x0
>  #define PERFCL_REG_OFFSET 0x80000
>  #define MUX_OFFSET	0x40
> +#define CLK_CTL_OFFSET 0x44
> +#define CLK_CTL_AUTO_CLK_SEL BIT(8)
>  #define ALT_PLL_OFFSET	0x100
>  #define SSSCTL_OFFSET 0x160
> +#define PSCTL_OFFSET 0x164
>  
>  #define PMUX_MASK	0x3
> +#define MUX_AUTO_CLK_SEL_ALWAYS_ON_MASK GENMASK(5, 4)
> +#define MUX_AUTO_CLK_SEL_ALWAYS_ON_GPLL0_SEL \
> +	FIELD_PREP(MUX_AUTO_CLK_SEL_ALWAYS_ON_MASK, 0x03)
>  
>  static const u8 prim_pll_regs[PLL_OFF_MAX_REGS] = {
>  	[PLL_OFF_L_VAL] = 0x04,
> @@ -439,6 +445,14 @@ static int qcom_cpu_clk_msm8996_register_clks(struct device *dev,
>  	/* Ensure write goes through before PLLs are reconfigured */
>  	udelay(5);
>  
> +	/* Set the auto clock sel always-on source to GPLL0/2 (300MHz) */
> +	regmap_update_bits(regmap, PWRCL_REG_OFFSET + MUX_OFFSET,
> +			   MUX_AUTO_CLK_SEL_ALWAYS_ON_MASK,
> +			   MUX_AUTO_CLK_SEL_ALWAYS_ON_GPLL0_SEL);
> +	regmap_update_bits(regmap, PERFCL_REG_OFFSET + MUX_OFFSET,
> +			   MUX_AUTO_CLK_SEL_ALWAYS_ON_MASK,
> +			   MUX_AUTO_CLK_SEL_ALWAYS_ON_GPLL0_SEL);
> +
>  	clk_alpha_pll_configure(&pwrcl_pll, regmap, &hfpll_config);
>  	clk_alpha_pll_configure(&perfcl_pll, regmap, &hfpll_config);
>  	clk_alpha_pll_configure(&pwrcl_alt_pll, regmap, &altpll_config);
> @@ -447,11 +461,24 @@ static int qcom_cpu_clk_msm8996_register_clks(struct device *dev,
>  	/* Wait for PLL(s) to lock */
>          udelay(50);
>  
> +	/* Enable auto clock selection for both clusters */
> +	regmap_update_bits(regmap, PWRCL_REG_OFFSET + CLK_CTL_OFFSET,
> +			   CLK_CTL_AUTO_CLK_SEL, CLK_CTL_AUTO_CLK_SEL);
> +	regmap_update_bits(regmap, PERFCL_REG_OFFSET + CLK_CTL_OFFSET,
> +			   CLK_CTL_AUTO_CLK_SEL, CLK_CTL_AUTO_CLK_SEL);
> +
> +	/* Ensure write goes through before muxes are switched */
> +	udelay(5);
> +
>  	qcom_cpu_clk_msm8996_acd_init(regmap);
>  
> +	/* Pulse swallower and soft-start settings */
> +	regmap_write(regmap, PWRCL_REG_OFFSET + PSCTL_OFFSET, 0x00030005);
> +	regmap_write(regmap, PERFCL_REG_OFFSET + PSCTL_OFFSET, 0x00030005);
> +
>  	/* Switch clusters to use the ACD leg */
> -	regmap_write(regmap, PWRCL_REG_OFFSET + MUX_OFFSET, 0x2);
> -	regmap_write(regmap, PERFCL_REG_OFFSET + MUX_OFFSET, 0x2);
> +	regmap_write(regmap, PWRCL_REG_OFFSET + MUX_OFFSET, 0x32);
> +	regmap_write(regmap, PERFCL_REG_OFFSET + MUX_OFFSET, 0x32);
>  
>  	for (i = 0; i < ARRAY_SIZE(cpu_msm8996_hw_clks); i++) {
>  		ret = devm_clk_hw_register(dev, cpu_msm8996_hw_clks[i]);
