Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E26C7EE24
	for <linux-clk@archiver.kernel.org>; Wed, 10 May 2023 07:13:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236464AbjEJHNK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 May 2023 03:13:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236462AbjEJHNH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 May 2023 03:13:07 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB02565AA
        for <linux-clk@vger.kernel.org>; Wed, 10 May 2023 00:13:03 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-966287b0f72so791008066b.0
        for <linux-clk@vger.kernel.org>; Wed, 10 May 2023 00:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683702782; x=1686294782;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0zYCKWsfnxi/fMQaNP95jNUwShMn3UuUKrQkbxNuAUc=;
        b=B2yQAEPaadWCszIh2qfAkHbBbh54nDXcamotBGjnsu4NTRxofx07A0J6bcr9gPbH7Y
         8IF4hWFF0l4Bej94pX+Sec9m1EjRhxMOKIFdVnAL678DCQtpa4aKNPpk823J/bRzQo8s
         8u/4e493BuC17dhup/fygVQSVneQ6SHqaUjGjYyUj66SJtaVS4IFBx40fsmr/4+142Gf
         smQZMdtvScKtXqk+scK8XdYttOrM0unPWv8hJezCVJ5bd17fVrjZvnuiU6tY0KAkhRAb
         AZZ++pTxh7riwjaw9myoMEnmCeXGGeFjUXds3EUu4Ubiocx2qNoveWsCkXd5a+lcXoFp
         snIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683702782; x=1686294782;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0zYCKWsfnxi/fMQaNP95jNUwShMn3UuUKrQkbxNuAUc=;
        b=P/IrqUqLuCRv1Krw4fmMYU6QfqCm0DWvyW/6Z5N9z9uA2wdLJU7FisQa+hGqrEk/SS
         Xw5Do2wCOLhk0JgGpF6FPW/z8otDHl7npYCEqSO0VnyFP3liu/aJ+mNWXd3fgBcY59qr
         Jzn3S3P6koxE+ojgxjW3HwKfShp6SZB6X5kc781rl9q5riEQrOfBUPmpWnAJInCAkQb/
         shUgHZ4cnZapZr85bTfCRpEv94N47Vc9w1Ayg7Y1mAV1fGGv55hRZkBENdF6Ag8yg7sD
         fb41Yo1u5H+TIG6LBh0iLh8bDDILEaOQz7qBu7wfvIMLFIs19iMx59zh0b7msk6BtWqs
         iw4w==
X-Gm-Message-State: AC+VfDxub4TwxnQnjNJU/RGJFlFtJUqBNIf8iBKvc63w3PW3+VuqNxl5
        D+ATIBMC8I0t0oW6dfu02t6nOA==
X-Google-Smtp-Source: ACHHUZ73lltVGSVflUN3AR7vtW31X5vop/ZCpl71mxGhEbCxGOWBjcw46dmCTSVAKpvTX4NtsuXk6w==
X-Received: by 2002:a17:907:3686:b0:94a:56ec:7f12 with SMTP id bi6-20020a170907368600b0094a56ec7f12mr15345280ejc.30.1683702782235;
        Wed, 10 May 2023 00:13:02 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c175:a0f9:6928:8c9d? ([2a02:810d:15c0:828:c175:a0f9:6928:8c9d])
        by smtp.gmail.com with ESMTPSA id lt14-20020a170906fa8e00b0094efdfe60dcsm2240768ejb.206.2023.05.10.00.13.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 00:13:01 -0700 (PDT)
Message-ID: <d48ded3e-7a14-e859-f330-dfffe103eb56@linaro.org>
Date:   Wed, 10 May 2023 09:13:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/4] dt-bindings: clock: qcom: Add SM8550 video clock
 controller
Content-Language: en-US
To:     Jagadeesh Kona <quic_jkona@quicinc.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230509161218.11979-1-quic_jkona@quicinc.com>
 <20230509161218.11979-3-quic_jkona@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230509161218.11979-3-quic_jkona@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 09/05/2023 18:12, Jagadeesh Kona wrote:
> Add device tree bindings for the video clock controller on Qualcomm
> SM8550 platform.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  .../bindings/clock/qcom,sm8550-videocc.yaml   | 77 +++++++++++++++++++
>  .../dt-bindings/clock/qcom,sm8550-videocc.h   | 38 +++++++++
>  2 files changed, 115 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8550-videocc.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,sm8550-videocc.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-videocc.yaml
> new file mode 100644
> index 000000000000..107af5e9af89
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-videocc.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,sm8550-videocc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Video Clock & Reset Controller on SM8550
> +
> +maintainers:
> +  - Jagadeesh Kona <quic_jkona@quicinc.com>
> +  - Taniya Das <quic_tdas@quicinc.com>
> +
> +description: |
> +  Qualcomm video clock control module provides the clocks, resets and power
> +  domains on SM8550.
> +
> +  See also:: include/dt-bindings/clock/qcom,videocc-sm8550.h
> +
> +properties:
> +  compatible:
> +    const: qcom,sm8550-videocc

Nope, looks 100% the same as sm8450, put it there.

https://lore.kernel.org/all/20230509172148.7627-2-quic_tdas@quicinc.com/

Best regards,
Krzysztof

