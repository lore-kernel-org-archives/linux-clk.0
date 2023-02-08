Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E6CC05027
	for <linux-clk@archiver.kernel.org>; Wed,  8 Feb 2023 16:44:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231393AbjBHQoK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Feb 2023 11:44:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231563AbjBHQoH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Feb 2023 11:44:07 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7618D4ECD
        for <linux-clk@vger.kernel.org>; Wed,  8 Feb 2023 08:43:39 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id qw12so52643231ejc.2
        for <linux-clk@vger.kernel.org>; Wed, 08 Feb 2023 08:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ASbsE/XmAlMrDircKHKs5lE92BDcQ2dh7PvE1hQ63fE=;
        b=EXIefF7NkFQhnz6WXVJgBWhSVN0YZG69qlxFwlhMrse5t8dtnaNwCPZFR/u/pLt3gE
         V/DWB8M+haVNDAKX3i7vWpjm/AWl2OgxMj8E40xbBxYraC5wsGXEMXy/rjkIAsvJfdx7
         K/b9dUDLIRuFELLr1IGqZa5ry9VZBqV6eTQJxJbB/IBX66DcLa4DVIuLIAFcd/+7LY1y
         9fUW/FIKj6lqMVcr+wd6ewBSL5QvYdZLWr0aNqmEzyIJ8KhKWdYZUdPsz1cpyK5WGNuD
         oZpEiOtRxqhoWJTKf0E1YNTt4WanKcqrC2qJgFeBDZzgPH8x4iMIwwAHtoSA8WfMIHa3
         jw9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ASbsE/XmAlMrDircKHKs5lE92BDcQ2dh7PvE1hQ63fE=;
        b=FDU5ECpVgHNbU8PZEeVvMGDivZ1A/R7mb1+BiGzBlsXViSa7ZvdgQQMh5UcBFM7MoR
         NgK3V49tPnmqVBhcpyqumMW0jYXtW9Se+zN/6gYyjRcCoifOqXvXgABEal2tj3hpbSom
         8LuhC0Bewuy9j2td8PuTo8Oaj+65U+Gbf/2VnMvwPpH/PJOIXWefFA3SO8F7jb1IyC8D
         N7nzvEeSBdwp+uszjMy3xuT4m4BLWtIBcnpMr1ANSX4M24k+kzAeFt22hFQFcQmtvtGh
         XKwH1UnODG9f0CDkHOmHYalF1caglOWN6bOpmBsdSH2Ec3xdDABOrrC1HoJsMXTsyKW8
         NMQA==
X-Gm-Message-State: AO0yUKWs4dTzfgf932cTbkaCWAXJ64off9/SGRbOcrt3PY8iKP17TM93
        o1u6G7tTs3YVu8/NRmi8BPdKdA==
X-Google-Smtp-Source: AK7set+RAX84i4gKstXtg9gLaHvp4VUWeWIP8mak3bhwJw+R/hfeFhIOdVQu3SHtfkpRQcIdY6Zvrg==
X-Received: by 2002:a17:906:1286:b0:88f:9c29:d232 with SMTP id k6-20020a170906128600b0088f9c29d232mr8545358ejb.57.1675874617446;
        Wed, 08 Feb 2023 08:43:37 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id t21-20020a170906609500b008a58c3b8daesm3912331ejj.164.2023.02.08.08.43.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 08:43:37 -0800 (PST)
Message-ID: <9ac637ef-ab11-518a-b5bd-243712a482b3@linaro.org>
Date:   Wed, 8 Feb 2023 17:43:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: sm8350-hdk: enable GPU
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
        devicetree@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
References: <20230206145707.122937-1-dmitry.baryshkov@linaro.org>
 <20230206145707.122937-9-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230206145707.122937-9-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 6.02.2023 15:57, Dmitry Baryshkov wrote:
> Enable the GPU on the SM8350-HDK device. The ZAP shader is required for
> the GPU to function properly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> index df841230d1b7..5e744423a673 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> @@ -284,6 +284,14 @@ &gpi_dma1 {
>  	status = "okay";
>  };
>  
> +&gpu {
> +	status = "okay";
> +
> +	zap-shader {
> +		firmware-name = "qcom/sm8350/a660_zap.mbn";
> +	};
> +};
> +
>  &i2c15 {
>  	clock-frequency = <400000>;
>  	status = "okay";
