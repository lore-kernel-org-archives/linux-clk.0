Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75370C5479D
	for <linux-clk@archiver.kernel.org>; Wed, 11 Jan 2023 21:05:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230417AbjAKVFK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Jan 2023 16:05:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231527AbjAKVEc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 16:04:32 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE072271A2
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 13:04:14 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id bt23so25384977lfb.5
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 13:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k+ute2tLrstBdGOnMdk4pF94HYBDxVgW3cR+FQSFZQM=;
        b=o3WxW06Fc3yRZjumyD6nbrQzuEzlKp/7ws1m8Xl5EiBVEnaE67uBsdrm5jDYsDAxTY
         mAUTeW7eAFnroi/HU/7QOyCyNG1JeoQ/TYCPX3jsyF/fhO9EWHUJGrMRB64iqStgKewP
         ySDfjz8Geoe5k6SVrouMH85P686+S/KspoOi6I9oeJR/in5pldkfEwQWkWvXALlkpGnb
         WC/g83N0uejyRKmO94BPciKqh2GXU+fl9/aE5T8rBz0h/jTlF2bq7/8ft8K5qcND7pg3
         SAswNnRqt5pWzgnLwdG1TUpwX1/66PdyMnOgyFdiw/BMtd8JgoeXet9Qp+hceItIfSFc
         IQZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k+ute2tLrstBdGOnMdk4pF94HYBDxVgW3cR+FQSFZQM=;
        b=dMV63Yuq5ZfJenPNJjoU542edHjaIm3wLFKk5fA80Cb50Pwpv/1uiEP5U4VS+BO988
         axBFGgRfamXZidxn1C2ot5dxdHTmWvn9r0s3mq/RxSzOOAnUg+Foub5XQ5MaCwc97cNK
         qL6Ri/Re2rBjzRXscaxBR82zbJvY21AIscnEOnpY7ckw4NhxFFsyLq+K9Xf3W1q858CF
         jec6Lj+ecYNHGdc96iVUVkbV0FKqpk0X8Tu70QWu54fuZqnPz83XmQSUXXeiYtPvhftR
         YZln73U497vFNTGCLDwSSKHEg75EZvgt1FYkzQx+U9uRIZsfRSeSYXrR9JHrxEym6VCa
         2uBg==
X-Gm-Message-State: AFqh2kp33Dzp12FqpNwK1vo+F8mjULhJ3JPvZ8yEyYNiOY8sEtn41Sjc
        DJTAKHlUqMa17EZyR0kz1h5Agy0716SYNpfZ
X-Google-Smtp-Source: AMrXdXtG777ReHYimH5x66raXRhLJ7CDUOwHDbZrQtEx8zGvFdujt8D/w9SlbErxnbSODDFAM62tHw==
X-Received: by 2002:ac2:4478:0:b0:4a4:68b7:dedb with SMTP id y24-20020ac24478000000b004a468b7dedbmr2848573lfl.55.1673471053339;
        Wed, 11 Jan 2023 13:04:13 -0800 (PST)
Received: from [192.168.1.101] (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id s14-20020a056512314e00b004cc82404ff9sm1946433lfi.7.2023.01.11.13.04.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 13:04:12 -0800 (PST)
Message-ID: <9df6fc0f-2980-c20d-ea8f-28eb8fa4b75c@linaro.org>
Date:   Wed, 11 Jan 2023 22:04:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 07/13] clk: qcom: cpu-8996: setup PLLs before registering
 clocks
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
 <20230111192004.2509750-8-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230111192004.2509750-8-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 11.01.2023 20:19, Dmitry Baryshkov wrote:
> Setup all PLLs before registering clocks in the common clock framework.
> This ensures that the clocks are not accessed before being setup in the
> known way and that the CCF is in sync with the actual HW programming.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/clk-cpu-8996.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
> index ee7e18b37832..e390f4aadff1 100644
> --- a/drivers/clk/qcom/clk-cpu-8996.c
> +++ b/drivers/clk/qcom/clk-cpu-8996.c
> @@ -430,6 +430,11 @@ static int qcom_cpu_clk_msm8996_register_clks(struct device *dev,
>  {
>  	int i, ret;
>  
> +	clk_alpha_pll_configure(&pwrcl_pll, regmap, &hfpll_config);
> +	clk_alpha_pll_configure(&perfcl_pll, regmap, &hfpll_config);
> +	clk_alpha_pll_configure(&pwrcl_alt_pll, regmap, &altpll_config);
> +	clk_alpha_pll_configure(&perfcl_alt_pll, regmap, &altpll_config);
> +
>  	for (i = 0; i < ARRAY_SIZE(cpu_msm8996_hw_clks); i++) {
>  		ret = devm_clk_hw_register(dev, cpu_msm8996_hw_clks[i]);
>  		if (ret)
> @@ -442,11 +447,6 @@ static int qcom_cpu_clk_msm8996_register_clks(struct device *dev,
>  			return ret;
>  	}
>  
> -	clk_alpha_pll_configure(&pwrcl_pll, regmap, &hfpll_config);
> -	clk_alpha_pll_configure(&perfcl_pll, regmap, &hfpll_config);
> -	clk_alpha_pll_configure(&pwrcl_alt_pll, regmap, &altpll_config);
> -	clk_alpha_pll_configure(&perfcl_alt_pll, regmap, &altpll_config);
> -
>  	/* Enable alt PLLs */
>  	clk_prepare_enable(pwrcl_alt_pll.clkr.hw.clk);
>  	clk_prepare_enable(perfcl_alt_pll.clkr.hw.clk);
