Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2674C54EBC
	for <linux-clk@archiver.kernel.org>; Thu, 12 Jan 2023 14:36:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238551AbjALOgK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 Jan 2023 09:36:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238694AbjALOfV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Jan 2023 09:35:21 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C69DA64D7
        for <linux-clk@vger.kernel.org>; Thu, 12 Jan 2023 06:26:29 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id p25so13315638ljn.12
        for <linux-clk@vger.kernel.org>; Thu, 12 Jan 2023 06:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bsc4EAKKTxYCvNSLv80E8LC03scDkG5xtdO4gYUmQGo=;
        b=NzsBgK105XQd9OS+5ponIiPuOlC95ooeQqNUkDLag4jN+dy9h9gQep8y2K4xs6Ak7p
         yQ+EpvWqmLwjdSK62t4mX+gEneyH2B9r2UMtuJPIV9mZd0dCzKWNcWl9OPlG2ZBzo3ha
         fH0Lho2c1ozm49au+VgP73eCSOgJvHymbAqdylvIcRpAoH1zCQcaOwK3+znlF9QZM2bs
         gkIMdCbexZQnHs6KXJz+MECpv0uVYgyA8VRSBzNRTR2mN/wj42wWJnEDrLtBn/9CvRE8
         DY5OrfnVdOazcmC0/aFF0UlHcXCe8TQs4JMwSRPRVTBmgTYDub+RbiYfhrVQkf5ML/gZ
         G3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bsc4EAKKTxYCvNSLv80E8LC03scDkG5xtdO4gYUmQGo=;
        b=Yp2OiGGS45j4vKtMGXUL2Axj9rqG5UO+ATXPaqI7lNTYlgC2ywrUSTq4IcGscQfX9D
         qnFG6gDnwNP87dYlN3WJiRo6BwcGShfVG8LljYvoosBrrDDnDyul+wa9d4nedlEpkBuM
         vQPF7YDXBm0Q6ZsQO4khZARjcsnr8+m8DKYE49ohjKxUSWtfDVVqZnc7GJZ3G4jFFhpa
         Zca0asn+Yx92hz8yYsxZxaVOD5/4Ih0xFjUieOW3Mg+ZmaQw33fiubQ2krSXztX8LJVF
         nCxzbpf4ofto5kUL8yy5vsBj/1ri5MZfLBR2DFLfGNp7BYRSe8TPmtlP6FIoDV7/T/Xk
         HQsA==
X-Gm-Message-State: AFqh2krYR/gaipCelCX6y5OhCOx91wm12x7o6VuMeCbnZ9l0aQzDP1w7
        VOoEA1zXfQWkWfvT140uCEkpdg==
X-Google-Smtp-Source: AMrXdXuyF1PfREmqHM9m1RfmiOtd8k0kWZ0MXMI8qZjKI6JTMOt1KWBIhpeBmzxS5DC7QJ9CKVa20w==
X-Received: by 2002:a2e:a54d:0:b0:27f:bc58:3926 with SMTP id e13-20020a2ea54d000000b0027fbc583926mr20674382ljn.43.1673533588166;
        Thu, 12 Jan 2023 06:26:28 -0800 (PST)
Received: from [192.168.1.101] (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id h14-20020a05651c124e00b0027fd474e7aasm2209409ljh.74.2023.01.12.06.26.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 06:26:25 -0800 (PST)
Message-ID: <ef48571a-3456-d62f-a4cc-62e0f43507f9@linaro.org>
Date:   Thu, 12 Jan 2023 15:26:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 08/13] clk: qcom: cpu-8996: move
 qcom_cpu_clk_msm8996_acd_init call
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
 <20230111192004.2509750-9-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230111192004.2509750-9-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 11.01.2023 20:19, Dmitry Baryshkov wrote:
> Initialize ACD configuration from qcom_cpu_clk_msm8996_register_clks(),
> before registering all clocks. This way we can be sure that the clock is
> fully configured before letting CCF touch it.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/clk-cpu-8996.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
> index e390f4aadff1..571ed52b3026 100644
> --- a/drivers/clk/qcom/clk-cpu-8996.c
> +++ b/drivers/clk/qcom/clk-cpu-8996.c
> @@ -425,6 +425,8 @@ static struct clk_regmap *cpu_msm8996_clks[] = {
>  	&perfcl_pmux.clkr,
>  };
>  
> +static void qcom_cpu_clk_msm8996_acd_init(struct regmap *regmap);
> +
>  static int qcom_cpu_clk_msm8996_register_clks(struct device *dev,
>  					      struct regmap *regmap)
>  {
> @@ -435,6 +437,8 @@ static int qcom_cpu_clk_msm8996_register_clks(struct device *dev,
>  	clk_alpha_pll_configure(&pwrcl_alt_pll, regmap, &altpll_config);
>  	clk_alpha_pll_configure(&perfcl_alt_pll, regmap, &altpll_config);
>  
> +	qcom_cpu_clk_msm8996_acd_init(regmap);
> +
>  	for (i = 0; i < ARRAY_SIZE(cpu_msm8996_hw_clks); i++) {
>  		ret = devm_clk_hw_register(dev, cpu_msm8996_hw_clks[i]);
>  		if (ret)
> @@ -467,9 +471,8 @@ static int qcom_cpu_clk_msm8996_register_clks(struct device *dev,
>  #define L2ACDSSCR_REG 0x589ULL
>  
>  static DEFINE_SPINLOCK(qcom_clk_acd_lock);
> -static void __iomem *base;
>  
> -static void qcom_cpu_clk_msm8996_acd_init(void __iomem *base)
> +static void qcom_cpu_clk_msm8996_acd_init(struct regmap *regmap)
>  {
>  	u64 hwid;
>  	u32 val;
> @@ -488,13 +491,13 @@ static void qcom_cpu_clk_msm8996_acd_init(void __iomem *base)
>  	kryo_l2_set_indirect_reg(L2ACDSSCR_REG, 0x00000601);
>  
>  	if (PWRCL_CPU_REG_MASK == (hwid | PWRCL_CPU_REG_MASK)) {
> -		writel(0xf, base + PWRCL_REG_OFFSET + SSSCTL_OFFSET);
> +		regmap_write(regmap, PWRCL_REG_OFFSET + SSSCTL_OFFSET, 0xf);
>  		kryo_l2_set_indirect_reg(L2ACDCR_REG, 0x002c5ffd);
>  	}
>  
>  	if (PERFCL_CPU_REG_MASK == (hwid | PERFCL_CPU_REG_MASK)) {
>  		kryo_l2_set_indirect_reg(L2ACDCR_REG, 0x002c5ffd);
> -		writel(0xf, base + PERFCL_REG_OFFSET + SSSCTL_OFFSET);
> +		regmap_write(regmap, PERFCL_REG_OFFSET + SSSCTL_OFFSET, 0xf);
>  	}
>  
>  out:
> @@ -509,7 +512,7 @@ static int cpu_clk_notifier_cb(struct notifier_block *nb, unsigned long event,
>  
>  	switch (event) {
>  	case PRE_RATE_CHANGE:
> -		qcom_cpu_clk_msm8996_acd_init(base);
> +		qcom_cpu_clk_msm8996_acd_init(cpuclk->clkr.regmap);
>  
>  		/*
>  		 * Avoid overvolting. clk_core_set_rate_nolock() walks from top
> @@ -538,6 +541,7 @@ static int cpu_clk_notifier_cb(struct notifier_block *nb, unsigned long event,
>  
>  static int qcom_cpu_clk_msm8996_driver_probe(struct platform_device *pdev)
>  {
> +	static void __iomem *base;
>  	struct regmap *regmap;
>  	struct clk_hw_onecell_data *data;
>  	struct device *dev = &pdev->dev;
> @@ -559,8 +563,6 @@ static int qcom_cpu_clk_msm8996_driver_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	qcom_cpu_clk_msm8996_acd_init(base);
> -
>  	data->hws[0] = &pwrcl_pmux.clkr.hw;
>  	data->hws[1] = &perfcl_pmux.clkr.hw;
>  	data->num = 2;
