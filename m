Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3EDBC7EE21
	for <linux-clk@archiver.kernel.org>; Tue,  2 May 2023 08:37:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233588AbjEBIhJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 2 May 2023 04:37:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233745AbjEBIhB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 2 May 2023 04:37:01 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B41B446A9
        for <linux-clk@vger.kernel.org>; Tue,  2 May 2023 01:36:59 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3010889c6ebso2024719f8f.2
        for <linux-clk@vger.kernel.org>; Tue, 02 May 2023 01:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683016618; x=1685608618;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1WSe5xqDpk0+ctJixcPhOu7az5cg4xL6zGEjyZ5vq68=;
        b=ZjBIPSKR9w7vbVF0504IgPvNTVwoEAYaiRGH6bbqEgY7cxpvOhcItSxUSvADV8bu6d
         G3p4+RntXywMk8wSx8N3yD1gJrWiM9udz3N1ZATdoZzE0J1bVHtcACoutqw1pzQp78e+
         vleI4xatCEbZLTo9SKsANaXiZfEYJBD9eFcVrPhGMdDRa8d/VU46rnSj+yFJWQ2CeFge
         +PqReyszXuHFFBa4eo2oGfefukhKRMU03U5QRrJzm7DJtP0WQbTA0xNJhanpJs0MlDvI
         SUQdeYn7ly5e9zZW+xocbFg/hsSVpyuqhod5eH0x6Oz1/D9Bpe5Gvk6wZDkksy4LKiRU
         ku6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683016618; x=1685608618;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1WSe5xqDpk0+ctJixcPhOu7az5cg4xL6zGEjyZ5vq68=;
        b=fBYAfNS03rMaAB8DMlELV/DDihWjtBKlqQ5TLpDbBFYsNoVn2WO5rqRE1Ru6TRCZjf
         WPTJNncirWs7/X6JSDZHQMwEl4Xn8SSgyJZtridb6Zz6gIqdY8V/qCKOIo6XkiGaCjxV
         fUfuBr5YiATq08g973Gm3V37aXBbmon0FAPHI0+k+UyYk71qmFKdsGTNkR0UeN3BQzES
         GYIO3Vych+YpYIZtx6xxLGGUsekNJkZP26oi7FugBkZFWmNQlUC/oBNiwu3k9Aix+bLZ
         +3qgTAyK7c11jus6/t8wCnKjO7UtpfKl3b/RaK0tKGg/UTKVyZOGgOon2FilMWaAw30c
         5icQ==
X-Gm-Message-State: AC+VfDxsuuhYAw/Ze3ks9CqRhklxlrHiapUP8Gzf8AOOZ4NxNNzJrHER
        qMkeIGyFjcRpABXDjQyPOno4bw==
X-Google-Smtp-Source: ACHHUZ5oWcCDaAcb7Dfhh4s0MtRRiVGetYohgTXFxKOia+z3vJXXGP7r8Px8652qlSo9q5cq+286gQ==
X-Received: by 2002:a5d:4fcc:0:b0:306:32c4:7e7b with SMTP id h12-20020a5d4fcc000000b0030632c47e7bmr2716985wrw.41.1683016618170;
        Tue, 02 May 2023 01:36:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:e265:b513:556a:4149? ([2a01:e0a:982:cbb0:e265:b513:556a:4149])
        by smtp.gmail.com with ESMTPSA id z2-20020a5d4c82000000b003021288a56dsm29430640wrs.115.2023.05.02.01.36.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 01:36:57 -0700 (PDT)
Message-ID: <37a56a24-8d7e-ad98-bdb2-d7ef82db5a48@linaro.org>
Date:   Tue, 2 May 2023 10:36:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 09/10] ARM: dts: qcom-mdm9615: specify clocks for the lcc
 device
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230501203401.41393-1-dmitry.baryshkov@linaro.org>
 <20230501203401.41393-10-dmitry.baryshkov@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230501203401.41393-10-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 01/05/2023 22:34, Dmitry Baryshkov wrote:
> Specify clocks used by the LCC device on the MDM9615 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm/boot/dts/qcom-mdm9615.dtsi | 16 +++++++++++++++-
>   1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom-mdm9615.dtsi
> index b40c52ddf9b4..556abe90cf5b 100644
> --- a/arch/arm/boot/dts/qcom-mdm9615.dtsi
> +++ b/arch/arm/boot/dts/qcom-mdm9615.dtsi
> @@ -39,7 +39,7 @@ cpu-pmu {
>   	};
>   
>   	clocks {
> -		cxo_board {
> +		cxo_board: cxo_board {
>   			compatible = "fixed-clock";
>   			#clock-cells = <0>;
>   			clock-frequency = <19200000>;
> @@ -113,6 +113,20 @@ lcc: clock-controller@28000000 {
>   			reg = <0x28000000 0x1000>;
>   			#clock-cells = <1>;
>   			#reset-cells = <1>;
> +			clocks = <&cxo_board>,
> +				 <&gcc PLL4_VOTE>,
> +				 <0>,
> +				 <0>, <0>,
> +				 <0>, <0>,
> +				 <0>;
> +			clock-names = "cxo",
> +				      "pll4_vote",
> +				      "mi2s_codec_clk",
> +				      "codec_i2s_mic_codec_clk",
> +				      "spare_i2s_mic_codec_clk",
> +				      "codec_i2s_spkr_codec_clk",
> +				      "spare_i2s_spkr_codec_clk",
> +				      "pcm_codec_clk";
>   		};
>   
>   		l2cc: clock-controller@2011000 {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
