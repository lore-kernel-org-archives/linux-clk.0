Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46998C7EE2C
	for <linux-clk@archiver.kernel.org>; Thu, 24 Aug 2023 18:10:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231822AbjHXSKU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Aug 2023 14:10:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242993AbjHXSKS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 24 Aug 2023 14:10:18 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 680141BDC
        for <linux-clk@vger.kernel.org>; Thu, 24 Aug 2023 11:10:15 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-99bcf2de59cso7881766b.0
        for <linux-clk@vger.kernel.org>; Thu, 24 Aug 2023 11:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692900614; x=1693505414;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J6mGu+vItjjNV4zY7FbQDAFgR7t3lk2A3umS/8njaFE=;
        b=v/D/sQP8ng02i4fU6asAERGx6yOf5H7v3AbLPE9b3NasxOqZ9eZJgzGyXJGJ1RqREa
         AqtPe1PZUo1K71fnZZfDyoH4c8/12D+WYnU67PgwC73050uZnFPKnmbRU8+tlOU6VmfQ
         FBTzH+T6qraEzSTKkxvwoQoZn/HYFCCGwpYK/GgEBjl8kNfG07oJMu9ibapWMKHTVj3e
         6OX8fEDRZaQdsrC1FKSN4rug9Nk22v7KdFGHmTxSjonOp8BsrbjSoc20Ezi09dFEBvlM
         AlaHvvySwgmH4pr9rye32UrMeU6cru8vmTPdqleaDZ9DkWamN1AGPY1+tAD6biSBz0WC
         8zHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692900614; x=1693505414;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J6mGu+vItjjNV4zY7FbQDAFgR7t3lk2A3umS/8njaFE=;
        b=GYEu9PV8FLNVX8c5JP7GQEZM4q4SHTfHoJKlIwI3n6Nhm/bAnuefKx32BNlJU5YhXq
         0sQMf+bJfWXw2XmRgcM+Bd3G6mn8YXOiSP1DyykM3DazvoANN34wP65KURqWLC2aMBpm
         A47UqgFrarB/glbgmncNIITqaYmBMmS0syOV5IhsEtIaBv9g3xa/FgzCxK7sUntkc6B9
         0vSSD5oHc/YNjvwCU6zOH9vzjjILNzY4qh1zjmQwLD66kOfnIygDDKIDl/V82p0K7v+h
         KkqWDG+uDS6ZzgiWwGfdMISMVIgPlY++rY8oklyLnw1MD1QhSe+B0sj7BeGdraqzL/Lf
         ZR/A==
X-Gm-Message-State: AOJu0Yx0UX0bwlyRAyfkd0fsDGIisYgNK8JarWekM6Xs4ehUXX1hVO6A
        Ib2qZciU0ZTvM5yzHy73YA/g5g==
X-Google-Smtp-Source: AGHT+IHC03VZHX6r8eAXA6FznTMk+aaRDkAzn7su3T/xEtwghxzqA0FrMAgHLLnd8EHBJz2gAPTFEQ==
X-Received: by 2002:a17:907:789a:b0:99c:e037:e4b8 with SMTP id ku26-20020a170907789a00b0099ce037e4b8mr13152361ejc.72.1692900613819;
        Thu, 24 Aug 2023 11:10:13 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id k20-20020a1709063e1400b00992b71d8f19sm11272711eji.133.2023.08.24.11.10.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 11:10:13 -0700 (PDT)
Message-ID: <161de126-87b0-3440-8517-330b529c3fb6@linaro.org>
Date:   Thu, 24 Aug 2023 20:10:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 3/4] dt-bindings: clock: qcom: Add GCC clocks for SM4450
Content-Language: en-US
To:     Ajit Pandey <quic_ajipan@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230824173410.550126-1-quic_ajipan@quicinc.com>
 <20230824173410.550126-4-quic_ajipan@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230824173410.550126-4-quic_ajipan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 24/08/2023 19:34, Ajit Pandey wrote:
> Add support for qcom global clock controller bindings for SM4450 platform.
> 
> Signed-off-by: Ajit Pandey <quic_ajipan@quicinc.com>
> ---
>  .../bindings/clock/qcom,sm4450-gcc.yaml       |  54 +++++
>  include/dt-bindings/clock/qcom,sm4450-gcc.h   | 197 ++++++++++++++++++
>  2 files changed, 251 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm4450-gcc.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,sm4450-gcc.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm4450-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm4450-gcc.yaml
> new file mode 100644
> index 000000000000..8c767bdf7f9d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm4450-gcc.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,sm4450-gcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Global Clock & Reset Controller on SM4450
> +
> +maintainers:
> +  - Ajit Pandey <quic_ajipan@quicinc.com>
> +  - Taniya Das <quic_tdas@quicinc.com>
> +
> +description: |
> +  Qualcomm global clock control module provides the clocks, resets and power
> +  domains on SM4450
> +
> +  See also:: include/dt-bindings/clock/qcom,sm4450-gcc.h
> +
> +properties:
> +  compatible:
> +    const: qcom,sm4450-gcc
> +
> +  clocks:
> +    items:
> +      - description: Board XO source
> +      - description: Sleep clock source
> +      - description: UFS Phy Rx symbol 0 clock source (Optional clock)
> +      - description: UFS Phy Rx symbol 1 clock source (Optional clock)
> +      - description: UFS Phy Tx symbol 0 clock source (Optional clock)
> +      - description: USB3 Phy wrapper pipe clock source (Optional clock)

I doubt that these are really optional clocks. They are set as parents
of your clocks in the controller, so if these clocks are physically
missing, how does the clock controller work?


Best regards,
Krzysztof

