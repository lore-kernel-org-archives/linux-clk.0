Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09992CCA479
	for <linux-clk@archiver.kernel.org>; Mon, 20 Jun 2022 12:06:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241769AbiFTMGK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Jun 2022 08:06:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242217AbiFTMGD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Jun 2022 08:06:03 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52B2A186CC
        for <linux-clk@vger.kernel.org>; Mon, 20 Jun 2022 05:06:01 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id g4so4537589lfv.9
        for <linux-clk@vger.kernel.org>; Mon, 20 Jun 2022 05:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=82QYcfCoHIkxTBHk/5RVq84im4ILcBAXqOFJXx+99PM=;
        b=HkJdG6KhJbXPXPXEaAmkeM23lanrFDpS7NQSFgM27x4ofrfJMmKSW5epJs6k7OFSVj
         nKZnyayMh0yTm68BpnEJNXgjc8nrCxIs+4pK9+YS4D9mTs5ZPNk9EQIXjMu+iKyrBqym
         ZtvippBeCMWqTkDgEh2cm1HWFcqsZJGxliaGz8blAv7lfHalxBNPpXozqmlgUbJBRFjY
         gRGktMIZkUYo/grmmlb1yLo9QpOAP3binz16kgZSkaNoPTqWGS42PHZFij8OlhTWqakW
         jjzXmIVyuxEePs1qyUQ2quPIV5kiU7/AgkbW7fvQQi7ipclyae3/dHb1T5hdiU7cF8Dv
         JATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=82QYcfCoHIkxTBHk/5RVq84im4ILcBAXqOFJXx+99PM=;
        b=Zx96MwNmnK0IEqA1c+VHt7A9j4cp/4QkckeSxYhvxe7n/WjArc5KqbPnXzsArxhpp9
         2kVKW6O6sJq8xAtQzLnpX5p0YgCXO7wmQIAqB+LWRwSSFpk23bU+hYvdupJDFdF/z90u
         FHQMP0fcCvHThRTidakZ7rUIDeDQqoj8TBh9alujuSRvZbXRtDyINjs8u8VjaTNVFalM
         bbhLs0tfqlp9UO41bmJc+o6m3q6m8zLlZMJCpc03o2pkYxHAR0YDM8odNn2rgZUCcNEc
         JlkdcQH3+nYJk/mLziPf4rTZpBjsWedYHkD8t9klwLbgnQ1i69GmvJ8EpETRS43mG64b
         OgUg==
X-Gm-Message-State: AJIora952EISFI4kUbl4Of4TSSTRLpnzjd9A/NsgtQKsr0u9iL6qwKe8
        jLpM0By5xQnbhLAy8eCdmQ0+2Q==
X-Google-Smtp-Source: AGRyM1tMLRSnjoX6l0fXGZ38PVj+xExPCA5zeKRwpmWG1QQdqxUqqPvJWeU53JQqu8uewWcNxjhrQA==
X-Received: by 2002:a05:6512:32c1:b0:479:33ba:4680 with SMTP id f1-20020a05651232c100b0047933ba4680mr13264795lfg.535.1655726759382;
        Mon, 20 Jun 2022 05:05:59 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w26-20020a05651c103a00b0025a6c330734sm558097ljm.68.2022.06.20.05.05.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 05:05:58 -0700 (PDT)
Message-ID: <a03bd852-5e3b-8029-a6f6-6dde91417122@linaro.org>
Date:   Mon, 20 Jun 2022 15:05:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 1/7] dt-bindings: clk: qcom,gcc-*: use qcom,gcc.yaml
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
References: <20220619212735.1244953-1-dmitry.baryshkov@linaro.org>
 <20220619212735.1244953-2-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220619212735.1244953-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 20/06/2022 00:27, Dmitry Baryshkov wrote:
> Use qcom,gcc.yaml which contains a set of properties common to most
> Qualcomm GCC bindings.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Forgot to carry over from v1:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

> ---
>   .../bindings/clock/qcom,gcc-msm8976.yaml      | 21 +++-------------
>   .../bindings/clock/qcom,gcc-msm8994.yaml      | 21 +++-------------
>   .../bindings/clock/qcom,gcc-msm8996.yaml      | 25 +++----------------
>   .../bindings/clock/qcom,gcc-msm8998.yaml      | 25 +++----------------
>   .../bindings/clock/qcom,gcc-qcm2290.yaml      | 25 +++----------------
>   .../bindings/clock/qcom,gcc-sc7180.yaml       | 25 +++----------------
>   .../bindings/clock/qcom,gcc-sc7280.yaml       | 21 +++-------------
>   .../bindings/clock/qcom,gcc-sc8180x.yaml      | 25 +++----------------
>   .../bindings/clock/qcom,gcc-sc8280xp.yaml     | 21 +++-------------
>   .../bindings/clock/qcom,gcc-sdm845.yaml       | 25 +++----------------
>   .../bindings/clock/qcom,gcc-sdx55.yaml        | 21 +++-------------
>   .../bindings/clock/qcom,gcc-sdx65.yaml        | 21 +++-------------
>   .../bindings/clock/qcom,gcc-sm6115.yaml       | 25 +++----------------
>   .../bindings/clock/qcom,gcc-sm6125.yaml       | 25 +++----------------
>   .../bindings/clock/qcom,gcc-sm6350.yaml       | 25 +++----------------
>   .../bindings/clock/qcom,gcc-sm8150.yaml       | 25 +++----------------
>   .../bindings/clock/qcom,gcc-sm8250.yaml       | 25 +++----------------
>   .../bindings/clock/qcom,gcc-sm8350.yaml       | 21 +++-------------
>   .../bindings/clock/qcom,gcc-sm8450.yaml       | 21 +++-------------
>   19 files changed, 76 insertions(+), 367 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8976.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8976.yaml
> index f3430b159caa..4b7d69518371 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8976.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8976.yaml
> @@ -45,29 +45,16 @@ properties:
>       description:
>         Phandle to voltage regulator providing power to the GX domain.
>   
> -  '#clock-cells':
> -    const: 1
> -
> -  '#reset-cells':
> -    const: 1
> -
> -  '#power-domain-cells':
> -    const: 1
> -
> -  reg:
> -    maxItems: 1
> -
>   required:
>     - compatible
> -  - reg
>     - clocks
>     - clock-names
>     - vdd_gfx-supply
> -  - '#clock-cells'
> -  - '#reset-cells'
> -  - '#power-domain-cells'
>   
> -additionalProperties: false
> +allOf:
> +  - $ref: qcom,gcc.yaml#
> +
> +unevaluatedProperties: false
>   
>   examples:
>     - |
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml
> index 22e67b238bb6..7b9fef6d9b23 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml
> @@ -32,28 +32,15 @@ properties:
>         - const: xo
>         - const: sleep
>   
> -  '#clock-cells':
> -    const: 1
> -
> -  '#reset-cells':
> -    const: 1
> -
> -  '#power-domain-cells':
> -    const: 1
> -
> -  reg:
> -    maxItems: 1
> -
>   required:
>     - compatible
>     - clocks
>     - clock-names
> -  - reg
> -  - '#clock-cells'
> -  - '#reset-cells'
> -  - '#power-domain-cells'
>   
> -additionalProperties: false
> +allOf:
> +  - $ref: qcom,gcc.yaml#
> +
> +unevaluatedProperties: false
>   
>   examples:
>     - |
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8996.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8996.yaml
> index 5a5b2214f0ca..70f7d3101bd3 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8996.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8996.yaml
> @@ -33,30 +33,13 @@ properties:
>         - const: cxo2
>         - const: sleep_clk
>   
> -  '#clock-cells':
> -    const: 1
> -
> -  '#reset-cells':
> -    const: 1
> -
> -  '#power-domain-cells':
> -    const: 1
> -
> -  reg:
> -    maxItems: 1
> -
> -  protected-clocks:
> -    description:
> -      Protected clock specifier list as per common clock binding.
> -
>   required:
>     - compatible
> -  - reg
> -  - '#clock-cells'
> -  - '#reset-cells'
> -  - '#power-domain-cells'
>   
> -additionalProperties: false
> +allOf:
> +  - $ref: qcom,gcc.yaml#
> +
> +unevaluatedProperties: false
>   
>   examples:
>     - |
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml
> index 8151c0a05649..544a2335cf05 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml
> @@ -37,32 +37,15 @@ properties:
>         - const: core_bi_pll_test_se # Optional clock
>       minItems: 2
>   
> -  '#clock-cells':
> -    const: 1
> -
> -  '#reset-cells':
> -    const: 1
> -
> -  '#power-domain-cells':
> -    const: 1
> -
> -  reg:
> -    maxItems: 1
> -
> -  protected-clocks:
> -    description:
> -      Protected clock specifier list as per common clock binding.
> -
>   required:
>     - compatible
>     - clocks
>     - clock-names
> -  - reg
> -  - '#clock-cells'
> -  - '#reset-cells'
> -  - '#power-domain-cells'
>   
> -additionalProperties: false
> +allOf:
> +  - $ref: qcom,gcc.yaml#
> +
> +unevaluatedProperties: false
>   
>   examples:
>     - |
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-qcm2290.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-qcm2290.yaml
> index 5de9c8263138..aec37e3f5e30 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-qcm2290.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-qcm2290.yaml
> @@ -30,32 +30,15 @@ properties:
>         - const: bi_tcxo
>         - const: sleep_clk
>   
> -  '#clock-cells':
> -    const: 1
> -
> -  '#reset-cells':
> -    const: 1
> -
> -  '#power-domain-cells':
> -    const: 1
> -
> -  reg:
> -    maxItems: 1
> -
> -  protected-clocks:
> -    description:
> -      Protected clock specifier list as per common clock binding.
> -
>   required:
>     - compatible
>     - clocks
>     - clock-names
> -  - reg
> -  - '#clock-cells'
> -  - '#reset-cells'
> -  - '#power-domain-cells'
>   
> -additionalProperties: false
> +allOf:
> +  - $ref: qcom,gcc.yaml#
> +
> +unevaluatedProperties: false
>   
>   examples:
>     - |
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml
> index a404c8fbee67..e4d490e65d14 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml
> @@ -33,32 +33,15 @@ properties:
>         - const: bi_tcxo_ao
>         - const: sleep_clk
>   
> -  '#clock-cells':
> -    const: 1
> -
> -  '#reset-cells':
> -    const: 1
> -
> -  '#power-domain-cells':
> -    const: 1
> -
> -  reg:
> -    maxItems: 1
> -
> -  protected-clocks:
> -    description:
> -      Protected clock specifier list as per common clock binding.
> -
>   required:
>     - compatible
>     - clocks
>     - clock-names
> -  - reg
> -  - '#clock-cells'
> -  - '#reset-cells'
> -  - '#power-domain-cells'
>   
> -additionalProperties: false
> +allOf:
> +  - $ref: qcom,gcc.yaml#
> +
> +unevaluatedProperties: false
>   
>   examples:
>     - |
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sc7280.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sc7280.yaml
> index 5693b8997570..ea61367e5abc 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-sc7280.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sc7280.yaml
> @@ -44,28 +44,15 @@ properties:
>         - const: ufs_phy_tx_symbol_0_clk
>         - const: usb3_phy_wrapper_gcc_usb30_pipe_clk
>   
> -  '#clock-cells':
> -    const: 1
> -
> -  '#reset-cells':
> -    const: 1
> -
> -  '#power-domain-cells':
> -    const: 1
> -
> -  reg:
> -    maxItems: 1
> -
>   required:
>     - compatible
>     - clocks
>     - clock-names
> -  - reg
> -  - '#clock-cells'
> -  - '#reset-cells'
> -  - '#power-domain-cells'
>   
> -additionalProperties: false
> +allOf:
> +  - $ref: qcom,gcc.yaml#
> +
> +unevaluatedProperties: false
>   
>   examples:
>     - |
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sc8180x.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sc8180x.yaml
> index f03ef96e57fa..30b5d1215fa8 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-sc8180x.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sc8180x.yaml
> @@ -32,32 +32,15 @@ properties:
>         - const: bi_tcxo_ao
>         - const: sleep_clk
>   
> -  '#clock-cells':
> -    const: 1
> -
> -  '#reset-cells':
> -    const: 1
> -
> -  '#power-domain-cells':
> -    const: 1
> -
> -  reg:
> -    maxItems: 1
> -
> -  protected-clocks:
> -    description:
> -      Protected clock specifier list as per common clock binding.
> -
>   required:
>     - compatible
>     - clocks
>     - clock-names
> -  - reg
> -  - '#clock-cells'
> -  - '#reset-cells'
> -  - '#power-domain-cells'
>   
> -additionalProperties: false
> +allOf:
> +  - $ref: qcom,gcc.yaml#
> +
> +unevaluatedProperties: false
>   
>   examples:
>     - |
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sc8280xp.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sc8280xp.yaml
> index 0bcdc69c6f89..e33dea86fb9e 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-sc8280xp.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sc8280xp.yaml
> @@ -56,30 +56,17 @@ properties:
>         - description: First EMAC controller reference clock
>         - description: Second EMAC controller reference clock
>   
> -  '#clock-cells':
> -    const: 1
> -
> -  '#reset-cells':
> -    const: 1
> -
> -  '#power-domain-cells':
> -    const: 1
> -
> -  reg:
> -    maxItems: 1
> -
>     protected-clocks:
>       maxItems: 389
>   
>   required:
>     - compatible
>     - clocks
> -  - reg
> -  - '#clock-cells'
> -  - '#reset-cells'
> -  - '#power-domain-cells'
>   
> -additionalProperties: false
> +allOf:
> +  - $ref: qcom,gcc.yaml#
> +
> +unevaluatedProperties: false
>   
>   examples:
>     - |
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
> index d902f137ab17..2b8a35d8739e 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
> @@ -37,30 +37,13 @@ properties:
>         - const: pcie_0_pipe_clk
>         - const: pcie_1_pipe_clk
>   
> -  '#clock-cells':
> -    const: 1
> -
> -  '#reset-cells':
> -    const: 1
> -
> -  '#power-domain-cells':
> -    const: 1
> -
> -  reg:
> -    maxItems: 1
> -
> -  protected-clocks:
> -    description:
> -      Protected clock specifier list as per common clock binding.
> -
>   required:
>     - compatible
> -  - reg
> -  - '#clock-cells'
> -  - '#reset-cells'
> -  - '#power-domain-cells'
>   
> -additionalProperties: false
> +allOf:
> +  - $ref: qcom,gcc.yaml#
> +
> +unevaluatedProperties: false
>   
>   examples:
>     # Example for GCC for SDM845:
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml
> index b0d1c65aa354..13ffa16e0833 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml
> @@ -35,28 +35,15 @@ properties:
>         - const: core_bi_pll_test_se # Optional clock
>       minItems: 2
>   
> -  '#clock-cells':
> -    const: 1
> -
> -  '#reset-cells':
> -    const: 1
> -
> -  '#power-domain-cells':
> -    const: 1
> -
> -  reg:
> -    maxItems: 1
> -
>   required:
>     - compatible
>     - clocks
>     - clock-names
> -  - reg
> -  - '#clock-cells'
> -  - '#reset-cells'
> -  - '#power-domain-cells'
>   
> -additionalProperties: false
> +allOf:
> +  - $ref: qcom,gcc.yaml#
> +
> +unevaluatedProperties: false
>   
>   examples:
>     - |
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.yaml
> index 16c4cdc7b4d6..8a1419c4d465 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.yaml
> @@ -20,9 +20,6 @@ properties:
>     compatible:
>       const: qcom,gcc-sdx65
>   
> -  reg:
> -    maxItems: 1
> -
>     clocks:
>       items:
>         - description: Board XO source
> @@ -43,25 +40,15 @@ properties:
>         - const: core_bi_pll_test_se # Optional clock
>       minItems: 5
>   
> -  '#clock-cells':
> -    const: 1
> -
> -  '#reset-cells':
> -    const: 1
> -
> -  '#power-domain-cells':
> -    const: 1
> -
>   required:
>     - compatible
> -  - reg
>     - clocks
>     - clock-names
> -  - '#clock-cells'
> -  - '#reset-cells'
> -  - '#power-domain-cells'
>   
> -additionalProperties: false
> +allOf:
> +  - $ref: qcom,gcc.yaml#
> +
> +unevaluatedProperties: false
>   
>   examples:
>     - |
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm6115.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm6115.yaml
> index 26050da844d5..bb81a27a1b16 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm6115.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm6115.yaml
> @@ -30,32 +30,15 @@ properties:
>         - const: bi_tcxo
>         - const: sleep_clk
>   
> -  '#clock-cells':
> -    const: 1
> -
> -  '#reset-cells':
> -    const: 1
> -
> -  '#power-domain-cells':
> -    const: 1
> -
> -  reg:
> -    maxItems: 1
> -
> -  protected-clocks:
> -    description:
> -      Protected clock specifier list as per common clock binding.
> -
>   required:
>     - compatible
>     - clocks
>     - clock-names
> -  - reg
> -  - '#clock-cells'
> -  - '#reset-cells'
> -  - '#power-domain-cells'
>   
> -additionalProperties: false
> +allOf:
> +  - $ref: qcom,gcc.yaml#
> +
> +unevaluatedProperties: false
>   
>   examples:
>     - |
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm6125.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm6125.yaml
> index ab12b391effc..03e84e15815c 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm6125.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm6125.yaml
> @@ -30,32 +30,15 @@ properties:
>         - const: bi_tcxo
>         - const: sleep_clk
>   
> -  '#clock-cells':
> -    const: 1
> -
> -  '#reset-cells':
> -    const: 1
> -
> -  '#power-domain-cells':
> -    const: 1
> -
> -  reg:
> -    maxItems: 1
> -
> -  protected-clocks:
> -    description:
> -      Protected clock specifier list as per common clock binding.
> -
>   required:
>     - compatible
>     - clocks
>     - clock-names
> -  - reg
> -  - '#clock-cells'
> -  - '#reset-cells'
> -  - '#power-domain-cells'
>   
> -additionalProperties: false
> +allOf:
> +  - $ref: qcom,gcc.yaml#
> +
> +unevaluatedProperties: false
>   
>   examples:
>     - |
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml
> index 20926cd8293e..cbe98c01c085 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml
> @@ -32,32 +32,15 @@ properties:
>         - const: bi_tcxo_ao
>         - const: sleep_clk
>   
> -  '#clock-cells':
> -    const: 1
> -
> -  '#reset-cells':
> -    const: 1
> -
> -  '#power-domain-cells':
> -    const: 1
> -
> -  reg:
> -    maxItems: 1
> -
> -  protected-clocks:
> -    description:
> -      Protected clock specifier list as per common clock binding.
> -
>   required:
>     - compatible
>     - clocks
>     - clock-names
> -  - reg
> -  - '#clock-cells'
> -  - '#reset-cells'
> -  - '#power-domain-cells'
>   
> -additionalProperties: false
> +allOf:
> +  - $ref: qcom,gcc.yaml#
> +
> +unevaluatedProperties: false
>   
>   examples:
>     - |
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml
> index 12766a866625..0333ccb07d8d 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml
> @@ -31,32 +31,15 @@ properties:
>         - const: bi_tcxo
>         - const: sleep_clk
>   
> -  '#clock-cells':
> -    const: 1
> -
> -  '#reset-cells':
> -    const: 1
> -
> -  '#power-domain-cells':
> -    const: 1
> -
> -  reg:
> -    maxItems: 1
> -
> -  protected-clocks:
> -    description:
> -      Protected clock specifier list as per common clock binding.
> -
>   required:
>     - compatible
>     - clocks
>     - clock-names
> -  - reg
> -  - '#clock-cells'
> -  - '#reset-cells'
> -  - '#power-domain-cells'
>   
> -additionalProperties: false
> +allOf:
> +  - $ref: qcom,gcc.yaml#
> +
> +unevaluatedProperties: false
>   
>   examples:
>     - |
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
> index 80bd6caf5bc9..4e2a9cac0a91 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
> @@ -31,32 +31,15 @@ properties:
>         - const: bi_tcxo
>         - const: sleep_clk
>   
> -  '#clock-cells':
> -    const: 1
> -
> -  '#reset-cells':
> -    const: 1
> -
> -  '#power-domain-cells':
> -    const: 1
> -
> -  reg:
> -    maxItems: 1
> -
> -  protected-clocks:
> -    description:
> -      Protected clock specifier list as per common clock binding.
> -
>   required:
>     - compatible
>     - clocks
>     - clock-names
> -  - reg
> -  - '#clock-cells'
> -  - '#reset-cells'
> -  - '#power-domain-cells'
>   
> -additionalProperties: false
> +allOf:
> +  - $ref: qcom,gcc.yaml#
> +
> +unevaluatedProperties: false
>   
>   examples:
>     - |
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
> index 1122700dcc2b..3edbeca70a9c 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
> @@ -54,28 +54,15 @@ properties:
>         - const: usb3_uni_phy_sec_gcc_usb30_pipe_clk # Optional clock
>       minItems: 2
>   
> -  '#clock-cells':
> -    const: 1
> -
> -  '#reset-cells':
> -    const: 1
> -
> -  '#power-domain-cells':
> -    const: 1
> -
> -  reg:
> -    maxItems: 1
> -
>   required:
>     - compatible
>     - clocks
>     - clock-names
> -  - reg
> -  - '#clock-cells'
> -  - '#reset-cells'
> -  - '#power-domain-cells'
>   
> -additionalProperties: false
> +allOf:
> +  - $ref: qcom,gcc.yaml#
> +
> +unevaluatedProperties: false
>   
>   examples:
>     - |
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
> index 58d98a766de6..102ce6862e24 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
> @@ -46,28 +46,15 @@ properties:
>         - const: usb3_phy_wrapper_gcc_usb30_pipe_clk # Optional clock
>       minItems: 2
>   
> -  '#clock-cells':
> -    const: 1
> -
> -  '#reset-cells':
> -    const: 1
> -
> -  '#power-domain-cells':
> -    const: 1
> -
> -  reg:
> -    maxItems: 1
> -
>   required:
>     - compatible
> -  - reg
>     - clocks
>     - clock-names
> -  - '#clock-cells'
> -  - '#reset-cells'
> -  - '#power-domain-cells'
>   
> -additionalProperties: false
> +allOf:
> +  - $ref: qcom,gcc.yaml#
> +
> +unevaluatedProperties: false
>   
>   examples:
>     - |


-- 
With best wishes
Dmitry
