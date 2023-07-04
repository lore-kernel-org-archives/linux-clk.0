Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6854EB64DA
	for <linux-clk@archiver.kernel.org>; Tue,  4 Jul 2023 18:06:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231419AbjGDSGZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Jul 2023 14:06:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbjGDSGY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Jul 2023 14:06:24 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91F0410CA
        for <linux-clk@vger.kernel.org>; Tue,  4 Jul 2023 11:06:23 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f9fdb0ef35so9485848e87.0
        for <linux-clk@vger.kernel.org>; Tue, 04 Jul 2023 11:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688493982; x=1691085982;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nNIWfih+PFK3OLIF8G59ioAmdnhh2DrduAI1lh/uY1U=;
        b=O94hBhVDk2edtOpkmJVM4EEoGpOXzzJ5Rg1g3pUi+QQMBdAN1my4vlUwZokzsFZJjd
         egHsvmcO3NLC0jzdPEHfzBtc5w2ZJDdyZsd/tND/3pU0S3BkZux5W9+f2c0vSevu/VYd
         Py52sSlgsSY+x4AsQqn016OpFEwdXNk7RxgGDUBdqNdU2HPOTI1jGsoj0dn7Jm5eDyWy
         YVl8UwE0tBvXHBTx6ahL+pYaRlmmEIHZlIjhVTf6BXpoTKHN3loSEzO6ee066as79jMi
         bM7U720DnZOT8VSYLUbpaXnM8Dqmr0jRvqakX+Mo7tkw8OJyci6nMm4F2nUNdvtKChKI
         lTZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688493982; x=1691085982;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nNIWfih+PFK3OLIF8G59ioAmdnhh2DrduAI1lh/uY1U=;
        b=TxsS9bzx8ssYuO1N56+6M1t9LSxYbtAeceVL4e+qn4AjqQmUPo8D2zq+4RZ94uar2D
         3QQfurg3ODc8S+uLN2hwzMUrK/g5hGxuBZ+ZWsOq6RFcXey6fQVqD0k6JjPenrGZPpYb
         G/WS6YjJ/YEjevAwEj7Wjt92AJ3dJTJAW+miinqXPYGmpfrCV4UGglbp0qSR6keeZjmj
         jz0bnTYueyeQ9VBn/cuyLLJJacBCsxsrq00VizSdfaiOPvCk6p5IZZ2DU113uxQM2cIG
         mghMYXwJYvOhJOF1JdniO6brdsBO9S3bTBFxSo9J/UEiz6TmO4L/4ydGSE3pt7x+GEQg
         vNzg==
X-Gm-Message-State: ABy/qLbRmF6fjFp+zYivxKDk0H9fOVMbo/X0N7/pfrqXEBKPBLDZ5vmo
        cVvtA/flnRWWrJL5Z/Y76YRNUg==
X-Google-Smtp-Source: APBJJlFpq1//36blgYI1RKgH0YiOTAjo4RhWReAooBPYyGIAbcZ28qb6BvaS4m9NBUlcEow3dp+djw==
X-Received: by 2002:a05:6512:3f1:b0:4f7:6976:2070 with SMTP id n17-20020a05651203f100b004f769762070mr8485265lfq.40.1688493981774;
        Tue, 04 Jul 2023 11:06:21 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id y25-20020ac255b9000000b004fbb20791f3sm1456202lfg.31.2023.07.04.11.06.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 11:06:21 -0700 (PDT)
Message-ID: <8ba85d65-51b7-8a66-f721-edb68e7617a8@linaro.org>
Date:   Tue, 4 Jul 2023 20:06:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 5/7] arm64: dts: qcom: pm6150: Add resin and rtc nodes
Content-Language: en-US
To:     David Wronek <davidwronek@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230704163848.169853-2-davidwronek@gmail.com>
 <20230704163848.169853-7-davidwronek@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230704163848.169853-7-davidwronek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 4.07.2023 18:31, David Wronek wrote:
> Add support for the RTC which is the same as on other PMICs and add the
> resin child node to the PM6150 PON device and disable it by default.
> 
> Signed-off-by: David Wronek <davidwronek@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/pm6150.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm6150.dtsi b/arch/arm64/boot/dts/qcom/pm6150.dtsi
> index 2e6afa296141..9a7c532f7a12 100644
> --- a/arch/arm64/boot/dts/qcom/pm6150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm6150.dtsi
> @@ -53,6 +53,14 @@ pm6150_pwrkey: pwrkey {
>  				bias-pull-up;
>  				linux,code = <KEY_POWER>;
>  			};
> +
> +			pm6150_resin: resin {
> +				compatible = "qcom,pm8941-resin";
> +				interrupts = <GIC_SPI 0x8 1 IRQ_TYPE_EDGE_BOTH>;
0x0 (GIC_SPI is a property of the ARM GIC, SPMI uses the interrupts
field in a rather hacky and specific way)

[...]

> +		rtc@6000 {
> +			compatible = "qcom,pm8941-rtc";
> +			reg = <0x6000>, <0x6100>;
> +			reg-names = "rtc", "alarm";
> +			interrupts = <0x0 0x61 0x1 IRQ_TYPE_NONE>;
IRQ_TYPE_EDGE_RISING

Konrad
> +		};
> +
>  		pm6150_gpios: gpio@c000 {
>  			compatible = "qcom,pm6150-gpio", "qcom,spmi-gpio";
>  			reg = <0xc000>;
