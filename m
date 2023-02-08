Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 242C1C05027
	for <linux-clk@archiver.kernel.org>; Wed,  8 Feb 2023 07:59:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230296AbjBHH7O (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Feb 2023 02:59:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230514AbjBHH7N (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Feb 2023 02:59:13 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D9AB40FC
        for <linux-clk@vger.kernel.org>; Tue,  7 Feb 2023 23:59:12 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id a2so15571212wrd.6
        for <linux-clk@vger.kernel.org>; Tue, 07 Feb 2023 23:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Iha5ih5pi40Uq95ORSqdUV5vaYyiSrb+gqp8UNGyj+8=;
        b=UbNQ7pDOypVy4XNndKASwRl06GLy5Wpj9rc+POCSGcKObs8irxHvWh0R+8t83zT5y7
         YBwpF3LlINy4wmutT6+CcFppJtP8V1bMe8hPX2bG2zOHNsrVWSC3YeGwhQorPbBuONZG
         zM3ZXsOIgshxY1dF7gzIU+6WyEeAOE06sA7PF9/GXd25K3YcsX0CRnveO/KDPKqihqeJ
         o7zghPWr1A3sCGURjLsRw4xGy3wf4Io8KtQIimlCANv6oZSi319sLdMT4+X7oWcbbVAg
         nXOcxgJNS0udQYg038CsnxadhEScWP0ZW16nfZaROQRMGRrYW8Tjd5+KLgB+yoW1kkat
         QA5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Iha5ih5pi40Uq95ORSqdUV5vaYyiSrb+gqp8UNGyj+8=;
        b=WoVu0Go2Yu19Vo6Uc68fl6f8Z+LOLjilIuHZT6K637ywzGzPqqxvop3d+Jeo3iI4Y+
         YMzhJzJ2HItWINAeIQFdAqzznMuf+4Tz+xiW5nsUkzHgIn1mxjr5bywooqpIQXhhw71A
         ho3zNh4jwednzwUYeH8+7W2031myk7/HaCnnZN55vNNKrcszwcYF6nclLkQyhtogRVCt
         ihjiNanHgj5ERPQaaOs+vr1vtaxpLDWDjbAZpNPHYwOUWyuywE9YSYu/M3d+Env0Fvgf
         4fv5b6o0FRNbyopvP54fZ3LLXrHLGVJPmHdU6EmCLz2xdzSE/DR6Atlw7vWzYVCEDedu
         apvw==
X-Gm-Message-State: AO0yUKWmj58ZWF+QaXq4WeP7V0NzeoVc6CjCLfJUF27St2TJZu0DCsbD
        txinYOf6ece5FRqmj9N8S8bIGg==
X-Google-Smtp-Source: AK7set+0QSaZKKGUasK/GTkGxCqWa8NyBajSTpo1Ik3pWxHqZQaDKXYDIv6zmeZRXMCJlOuLBgvmGg==
X-Received: by 2002:a5d:595f:0:b0:2c3:ddd2:f74c with SMTP id e31-20020a5d595f000000b002c3ddd2f74cmr5452874wri.49.1675843150609;
        Tue, 07 Feb 2023 23:59:10 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o5-20020a5d62c5000000b002c3e1e1dcd7sm9518840wrv.104.2023.02.07.23.59.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 23:59:10 -0800 (PST)
Message-ID: <dbc93125-afd5-9ed9-7b45-0d79f728b4a5@linaro.org>
Date:   Wed, 8 Feb 2023 08:59:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V3 2/5] arm64: dts: qcom: Add support for Crashdump
 collection on IPQ9574
Content-Language: en-US
To:     Poovendhan Selvaraj <quic_poovendh@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, lee@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        jassisinghbrar@gmail.com, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, arnd@arndb.de, marcel.ziswiler@toradex.com,
        robimarko@gmail.com, dmitry.baryshkov@linaro.org,
        nfraprado@collabora.com, broonie@kernel.org,
        quic_gurus@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_devipriy@quicinc.com
References: <20230208053332.16537-1-quic_poovendh@quicinc.com>
 <20230208053332.16537-3-quic_poovendh@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230208053332.16537-3-quic_poovendh@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 08/02/2023 06:33, Poovendhan Selvaraj wrote:
> Enable Crashdump collection in ipq9574
> 
> Co-developed-by: Anusha Rao <quic_anusha@quicinc.com>
> Signed-off-by: Anusha Rao <quic_anusha@quicinc.com>
> Co-developed-by: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
> Signed-off-by: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
> Signed-off-by: Poovendhan Selvaraj <quic_poovendh@quicinc.com>
> ---
>  Changes in V3:
> 	- No changes
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> index 2b86ba17bb32..9c4523f50a57 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> @@ -81,6 +81,13 @@
>  		reg = <0x0 0x40000000 0x0 0x0>;
>  	};
>  
> +	firmware {
> +		scm {
> +			compatible = "qcom,scm-ipq9574", "qcom,scm";
> +			qcom,dload-mode = <&tcsr_boot_misc 0>;
> +		};
> +	};
> +
>  	pmu {
>  		compatible = "arm,cortex-a73-pmu";
>  		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
> @@ -95,11 +102,17 @@
>  		#address-cells = <2>;
>  		#size-cells = <2>;
>  		ranges;
> -

I don't think anything improved here - still unrelated change.


Best regards,
Krzysztof

