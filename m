Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB1ABC4167B
	for <linux-clk@archiver.kernel.org>; Sat, 17 Dec 2022 15:16:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229730AbiLQPQw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 17 Dec 2022 10:16:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbiLQPQs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 17 Dec 2022 10:16:48 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F183412758
        for <linux-clk@vger.kernel.org>; Sat, 17 Dec 2022 07:16:47 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id o6so2868255lfi.5
        for <linux-clk@vger.kernel.org>; Sat, 17 Dec 2022 07:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sdCuqxHb3n44bHgmX4xKgo7Ya1cdTdkrnUB0QPiyggE=;
        b=x1ThgDXJI7Wriv6cPdpqZtIkAGEFdRGR1rruha8nNKJRHBKnhXunGN3DNw7EvC5dwM
         OaEHzAb5nvEw4oi8h/Q5GPz4JpgII4uQWT5XDdjlJRahOzvDEVViG9mqWt7fREaGuClA
         kS/1prjPiLlhUuNs0eyemIMmpNvdqmIhunpyAUswX7ZtV1G91RHSb/8MYw57AChLLoRF
         GZlD9BFxDXUkxhGXSyd1H1KmoTjud67DZS9Ms2aIOGBrlw8XhMAHW/TE9+7E8cbuPHtm
         Sz9DQdpXKhqv7mARXV96f8GCB5tfl9iOovLfeX7fuK/jGikwQqJl4I2BkU6E/7I7Lydd
         kY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sdCuqxHb3n44bHgmX4xKgo7Ya1cdTdkrnUB0QPiyggE=;
        b=WmInfDNvhQ/ZkR+KxpVh49fahgef89zSBwNTzhs/P7pa9zZJBcH6eZ6fvKvu1rx+c+
         2k+MjqdxnFLVVVqLForEkxI5HLIWkrbRGZrFgPhdNXxa8b2GaoqDwiltrKpjPNO6p8Kt
         5euSvzEaa3KhVtcuOXj5Yintn+ovJApHl8VGSJO6U0JtMGJ6R7wASB4kYExypAZ9kWMX
         mTlHUE857Q1jmaWq5tRQZ2UmCMafnR2V9griHfkrm42Mkb1g7/z7ryGqORtez48l6/pf
         PKPfB/uPGgolGNRZgCQPvm/zMDsIKgyjVcLR9XbtGXVBzE0synot3cGnkchd5vAR+sBt
         QbKQ==
X-Gm-Message-State: ANoB5pnj8Ut/uwD61CRpLuuAyLDZn3x8vC+zPilqu5UCLRzYKCKSYrLA
        xDiIfviyydO4MInLQHf8qUhFgQ==
X-Google-Smtp-Source: AA0mqf5zNke67lY2UWhQNLP9BDPz9J85h1BRL4DxzfU7fMypeJ+bzkZHVE3Jq3DBufeeWUmhqINCNQ==
X-Received: by 2002:ac2:44a4:0:b0:4b5:8504:7072 with SMTP id c4-20020ac244a4000000b004b585047072mr9248570lfm.14.1671290206387;
        Sat, 17 Dec 2022 07:16:46 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id u2-20020ac24c22000000b004979db5aa5bsm535838lfq.223.2022.12.17.07.16.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Dec 2022 07:16:45 -0800 (PST)
Message-ID: <26115ec3-a892-5040-049c-92ee19c28df0@linaro.org>
Date:   Sat, 17 Dec 2022 16:16:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 14/15] arm64: dts: qcom: qcs404: add power-domains-cells
 to gcc node
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
 <20221217001730.540502-15-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221217001730.540502-15-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 17.12.2022 01:17, Dmitry Baryshkov wrote:
> As gcc now provides two GDSCs, add #power-domain-cells property to the
> gcc device node.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/qcs404.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> index ffc4b081bb62..b72542631337 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> @@ -729,6 +729,7 @@ gcc: clock-controller@1800000 {
>  			reg = <0x01800000 0x80000>;
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
>  
>  			assigned-clocks = <&gcc GCC_APSS_AHB_CLK_SRC>;
>  			assigned-clock-rates = <19200000>;
