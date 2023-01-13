Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D24AC54EBD
	for <linux-clk@archiver.kernel.org>; Fri, 13 Jan 2023 15:20:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbjAMPUN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 Jan 2023 10:20:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbjAMPTo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Jan 2023 10:19:44 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18BD2D66
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 07:13:35 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id g13so33572077lfv.7
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 07:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zUYGeT36rdUoWdmbRVQkbA4vrtGHPM/cta2o4YS1FyY=;
        b=uPDu9VmAG8xj/S26qpUk1CnS0UmsreGp/NEqPwXtGnKwecwZ2Ctbm5Yp0ixsx3z6hs
         jaJlNR/j/ohUPAx9Uxj5sJ6oxTcPVcFt5MLC7tckK6YRicxHWYB9fk1spCyGSNklIkS7
         nR5/dS1/wCjhHDY/cma/xgxqf6ZIzdGOKDBSr+4YuRmwzjei2vO33aTbIADbVu0OVDdV
         myAXOkPG0Udo86lU2BZbm0IhL/dw0f3i6SlIxebB8vlNhShjjIeF7G1CPu/SPF4pk+c6
         /W7dBB497Sjy2JKRBD2JfHtEcYxPYDOB8vi9509zoFvngAONQ9BLdZl4+5U+hL6PBvtV
         mgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zUYGeT36rdUoWdmbRVQkbA4vrtGHPM/cta2o4YS1FyY=;
        b=JqypDta4wN3tNTUdBnvD703UI1scGy8v2vByWTXSCdfIZw1/BKCEIE2LBbBZIZrUEB
         dAEiQZpxSRgAJW80XCBUJAV5WpbsJb8sjbedvPBwHTX0uZanP4ehM8X9lryW1HemLlNG
         19hO4/jDREpPq4rksTYdBvCVb4GHA760wB+dxly290d+iBl+mIDK56fy0iqbPNkYVFSk
         Nvv+pg0rzHsEH9hzEPW02UpvA7d5Ngu4SK9Utc927RCJIZo00ggMY5a3o7ZmqWRIpMqx
         IrfmfRGA/ePElK9K3sphAwL938D0nYjAkBXPx9gpCUBKKVXr53+hlvz3i/itIKP1E52R
         6+CQ==
X-Gm-Message-State: AFqh2kpiD75d+6g78Ra0Sn2VzmcvlfP3zE5ijNQnPSWQ3ZduKDz7wCVD
        qUonFj3BWOUTNA/i1TokvRQDsQ==
X-Google-Smtp-Source: AMrXdXsNFSB4i5fU5BCEY1bOU1s3DzBggRjE5V04XQ1OXzn1osBJ2odaHVEsTW5dMNL9bNp01Oa7Ng==
X-Received: by 2002:a05:6512:b23:b0:4cb:d3:3b99 with SMTP id w35-20020a0565120b2300b004cb00d33b99mr22731307lfu.36.1673622813471;
        Fri, 13 Jan 2023 07:13:33 -0800 (PST)
Received: from [192.168.1.101] (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id f7-20020ac25327000000b004b4ea0f4e25sm3892681lfh.301.2023.01.13.07.13.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 07:13:33 -0800 (PST)
Message-ID: <83718846-1c51-d102-d11a-a14860be8454@linaro.org>
Date:   Fri, 13 Jan 2023 16:13:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 5/6] dt-bindings: mailbox: Add compatible for IPQ9574
Content-Language: en-US
To:     devi priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, jassisinghbrar@gmail.com,
        catalin.marinas@arm.com, will@kernel.org, shawnguo@kernel.org,
        arnd@arndb.de, marcel.ziswiler@toradex.com,
        dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
        broonie@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_poovendh@quicinc.com
References: <20230113143647.14961-1-quic_devipriy@quicinc.com>
 <20230113143647.14961-6-quic_devipriy@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230113143647.14961-6-quic_devipriy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 13.01.2023 15:36, devi priya wrote:
> Add the mailbox compatible string for IPQ9574 SoC
> 
> Co-developed-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: devi priya <quic_devipriy@quicinc.com>
> ---
Binding changes should come before driver changes, so that
you're not introducing an "illegal" compatible and only
"legalize" it later - please reorder the patch.

Konrad
>  .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml     | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> index 943f9472ae10..9e076758a58a 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> @@ -20,6 +20,7 @@ properties:
>            - enum:
>                - qcom,ipq6018-apcs-apps-global
>                - qcom,ipq8074-apcs-apps-global
> +              - qcom,ipq9574-apcs-apps-global
>                - qcom,msm8976-apcs-kpss-global
>                - qcom,msm8996-apcs-hmss-global
>                - qcom,msm8998-apcs-hmss-global
> @@ -113,6 +114,7 @@ allOf:
>            enum:
>              - qcom,ipq6018-apcs-apps-global
>              - qcom,ipq8074-apcs-apps-global
> +            - qcom,ipq9574-apcs-apps-global
>      then:
>        properties:
>          clocks:
> @@ -129,6 +131,7 @@ allOf:
>            enum:
>              - qcom,ipq6018-apcs-apps-global
>              - qcom,ipq8074-apcs-apps-global
> +            - qcom,ipq9574-apcs-apps-global
>      then:
>        properties:
>          '#clock-cells':
