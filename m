Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 494F9FA3741
	for <linux-clk@archiver.kernel.org>; Thu, 27 Oct 2022 15:54:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234810AbiJ0Py5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Oct 2022 11:54:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235344AbiJ0Pyz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Oct 2022 11:54:55 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEA3787695
        for <linux-clk@vger.kernel.org>; Thu, 27 Oct 2022 08:54:54 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id c23so1441420qtw.8
        for <linux-clk@vger.kernel.org>; Thu, 27 Oct 2022 08:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HturbGbwp3GvmoZ/FiRE5yoA3qBUo4vXn8C99Hxcd48=;
        b=gJX1rB+iwcgnRVFxhnz2/zyOpU5YqFhoZJx5jMsfZKExTWRBLUzchNPG5nu9KvK1DJ
         DMNIUY0ya8yNoL5vtNSkI/67mqt5Y1oxrCg52QKDo3rGpSBAsLbByEmy7hRVtZ58HQO2
         qAEm3e+6RzskboNsvD8tmugITSVUVdVvshLpnc9gP07KyUR9mhystSvfN5gTNRu6QQdD
         tx33Bsv10xEdnNdvzGmw4N7muXvGnY0bAolXb+blfi8XI+sU/TOU7HXOShK0YVlc8k+h
         9kGImrBycJWjuFQkTx82MjuduDnWXid+atTKBk+02BPQITl0SPpLKRO37Nv7kdDwMyXf
         o8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HturbGbwp3GvmoZ/FiRE5yoA3qBUo4vXn8C99Hxcd48=;
        b=5FF9aSW/A1R3m9RCCtQwOoN9Pl719rVor2PtZckHJc4jhYJfW9mikgN/ogOsMfpZR+
         gq2/ljEW8kL5uuyp6iKsRtGqlE5twz2amHAXEW5iDakjD2xhkqUzGfTE8l1tbCMtKiun
         XIsXo7RDNPCk1Tv2jaPpSsXokQsb61MDysfec7VGf/XGRRPzusCgYJREJ+gkZcpohHd9
         bQKWxkYA1WhLrRVZmBVoEWZtH2hUV8BlLcL+iHQObsNT1MnQLdkvAImZgGV4O7RCvC8d
         HTXZqbAWbz8HasxbGWcd/0lxvlCLZ6/ZUjlqrrJlrvmqicHb/DuHm990QHM3h4zUINDb
         TqNQ==
X-Gm-Message-State: ACrzQf3KMww0vBPvkBzQnSUApi8FV1X2uUPtWR+AFE9NLfJnl4wjJqwL
        M3KdYABtRokjb0f1++aRkZYGvA==
X-Google-Smtp-Source: AMsMyM4Igr3MpGoZUSH0BGc8qDbbpQ0Ayv+zh3D21NMx0D0Pvf2I/bu9qQND43lee8lFRI9LdwkmNw==
X-Received: by 2002:ac8:7f44:0:b0:39c:e770:27fd with SMTP id g4-20020ac87f44000000b0039ce77027fdmr42495373qtk.478.1666886093840;
        Thu, 27 Oct 2022 08:54:53 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id x2-20020ac87ec2000000b00398a7c860c2sm1070851qtj.4.2022.10.27.08.54.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 08:54:53 -0700 (PDT)
Message-ID: <e5009a33-1f71-1fe3-3a06-98bba031fdf0@linaro.org>
Date:   Thu, 27 Oct 2022 11:54:51 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3 1/5] dt-bindings: clock: Add QDU1000 and QRU1000 GCC
 clock bindings
Content-Language: en-US
To:     Melody Olvera <quic_molvera@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221026190441.4002212-1-quic_molvera@quicinc.com>
 <20221026190441.4002212-2-quic_molvera@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221026190441.4002212-2-quic_molvera@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 26/10/2022 15:04, Melody Olvera wrote:
> Add device tree bindings for global clock controller on QDU1000 and
> QRU1000 SoCs.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  .../bindings/clock/qcom,gcc-qdu1000.yaml      |  77 ++++++++
>  include/dt-bindings/clock/qcom,gcc-qdu1000.h  | 170 ++++++++++++++++++
>  2 files changed, 247 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-qdu1000.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-qdu1000.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-qdu1000.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-qdu1000.yaml
> new file mode 100644
> index 000000000000..ad460d628ffc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-qdu1000.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,gcc-qdu1000.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Global Clock & Reset Controller for QDU1000 and QRU1000
> +
> +allOf:
> +  - $ref: qcom,gcc.yaml#
> +
> +maintainers:
> +  - Melody Olvera <quic_molvera@quicinc.com>
> +
> +description: |
> +  Qualcomm global clock control module which supports the clocks, resets and
> +  power domains on QDU1000 and QRU1000
> +
> +  See also:
> +  - include/dt-bindings/clock/qcom,gcc-qdu1000.h
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,gcc-qdu1000
> +      - const: syscon
> +
> +  clocks:
> +    items:
> +      - description: Board XO source
> +      - description: Sleep clock source
> +      - description: PCIE 0 Pipe clock source
> +      - description: PCIE 0 Phy Auxiliary clock source
> +      - description: USB3 Phy wrapper pipe clock source
> +    minItems: 2

Why the clocks are optional?

> +
> +  clock-names:
> +    items:
> +      - const: bi_tcxo
> +      - const: sleep_clk
> +      - const: pcie_0_pipe_clk
> +    minItems: 2

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.


Best regards,
Krzysztof

