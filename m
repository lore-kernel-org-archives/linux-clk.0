Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99608C43334
	for <linux-clk@archiver.kernel.org>; Mon,  4 Jul 2022 14:04:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232549AbiGDOEx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 4 Jul 2022 10:04:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232934AbiGDOEw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 4 Jul 2022 10:04:52 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE3DA25F1
        for <linux-clk@vger.kernel.org>; Mon,  4 Jul 2022 07:04:50 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id e12so15971108lfr.6
        for <linux-clk@vger.kernel.org>; Mon, 04 Jul 2022 07:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=rsGLGImmqJHiDHb1+WwnYqEd/8jZefskys3h5JlVneg=;
        b=iOEUfAkbgMlvzJV8wTbsTIYSWia2cd8h4wEbug5cjfJD+nWhZS9fr5o0n/WApn+7c/
         jvvdlGxLrHBJejs8CGh0pJpPUpLABBgInxaNbHT8n/FjwdOcjFGRb9eqhNnEnfO0Wvca
         Qk8kIqJKGuX6tEuo/1zkg3jwaoJDh/H5smM+TuP0cmMolyhxcwU9t8NYzyiq8DZfyjOL
         fXA8sxWN/tSF5oKNq86Fz9w8C+nZ2ccYdbTZfQP1mWCnMimj5uM6YWZvRv81Pr2g6RxG
         ksL4HO37Djdd7YeE9oF3a+EmPCAO0odkJEuWGgQg8HFvySVKVW52owvLd2AQjivOCwvC
         qfiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rsGLGImmqJHiDHb1+WwnYqEd/8jZefskys3h5JlVneg=;
        b=zFjJSzZTXJyoX96KuTmPThVhEgnX9ewseA6a/nYYDZZ9lzLxYtLtw/PYDpOs7iMOjg
         NjevGedSRkBDsDtjPMUQcr4q7451Npa1NJ9Jc6H2LyuHjDrFp+ifqn2u8/46ascx/ORU
         JuWLl3X3Lc/oWzaTLG/W5zYEg9VPX1247KWjvoTwvEehHOq9sZTzirPVSIwQ23vOFS/4
         1/F3BMfcK6ZednrOccdzAra99Rrfat1GfC2yWAa7+sJ4EeOvzJpyYpG3SOXObnAGM63G
         01sqGmgNV3+tdo5oJOOnL/vCd5n7Vcz5Q+m4g4gU4yJbYji85Ee+34ZL02Ja0nE0vlY/
         GpgA==
X-Gm-Message-State: AJIora+i/PbpO8exQpvg6p+i84JiclV3pCz4ahwvRaomJnrs1etoiGLu
        YgnO1Tb9jwmCt+IKStCoxOuwLw==
X-Google-Smtp-Source: AGRyM1v3grJoQs3DlcVNMtWXaPEn/5IF0uq3/rPHkUTzMzI1BGZwUeje6eJY93REVviH42628+Gjyw==
X-Received: by 2002:a05:6512:398d:b0:482:d1b6:d7c2 with SMTP id j13-20020a056512398d00b00482d1b6d7c2mr531969lfu.628.1656943488771;
        Mon, 04 Jul 2022 07:04:48 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id m10-20020a056512358a00b0047255d21129sm5163689lfr.88.2022.07.04.07.04.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 07:04:48 -0700 (PDT)
Message-ID: <52af0501-d921-9ab3-6de8-c074a2d03885@linaro.org>
Date:   Mon, 4 Jul 2022 16:04:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/6] dt-bindings: clock: Add schema for MSM8909 GCC
Content-Language: en-US
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Dominik Kobinski <dominikkobinski314@gmail.com>
References: <20220704133000.2768380-1-stephan.gerhold@kernkonzept.com>
 <20220704133000.2768380-2-stephan.gerhold@kernkonzept.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220704133000.2768380-2-stephan.gerhold@kernkonzept.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 04/07/2022 15:29, Stephan Gerhold wrote:
> The Global Clock Controller (GCC) in the MSM8909 SoC provides clocks,
> resets and power domains for the various hardware blocks in the SoC.
> Add a DT schema to describe it, similar to other Qualcomm SoCs.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
> ---
>  .../bindings/clock/qcom,gcc-msm8909.yaml      |  56 +++++
>  include/dt-bindings/clock/qcom,gcc-msm8909.h  | 218 ++++++++++++++++++
>  2 files changed, 274 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8909.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8909.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8909.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8909.yaml
> new file mode 100644
> index 000000000000..79b50405864b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8909.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,gcc-msm8909.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Global Clock & Reset Controller Binding for MSM8909
> +
> +maintainers:
> +  - Stephan Gerhold <stephan@gerhold.net>
> +
> +description: |
> +  Qualcomm global clock control module which supports the clocks, resets and
> +  power domains on MSM8909.
> +
> +  See also:
> +  - dt-bindings/clock/qcom,gcc-msm8909.h
> +
> +properties:
> +  compatible:
> +    const: qcom,gcc-msm8909
> +
> +  clocks:
> +    items:
> +      - description: XO source
> +      - description: Sleep clock source
> +      - description: DSI phy instance 0 dsi clock
> +      - description: DSI phy instance 0 byte clock
> +
> +  clock-names:
> +    items:
> +      - const: xo
> +      - const: sleep_clk
> +      - const: dsi0pll
> +      - const: dsi0pllbyte
> +
> +required:
> +  - compatible

Aren't clocks also required? I would assume at least XO is necessary as
input.

> +
> +allOf:
> +  - $ref: qcom,gcc.yaml#
> +
> +unevaluatedProperties: false



Best regards,
Krzysztof
