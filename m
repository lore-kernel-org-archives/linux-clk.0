Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88161C77B7C
	for <linux-clk@archiver.kernel.org>; Fri, 26 May 2023 12:30:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230022AbjEZMax (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 May 2023 08:30:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242986AbjEZMav (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 May 2023 08:30:51 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6665110D1
        for <linux-clk@vger.kernel.org>; Fri, 26 May 2023 05:30:24 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-309553c5417so611066f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 26 May 2023 05:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685104187; x=1687696187;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7DgLeFcVKugZ1jHV952TG/acpJ3CYaYDRk+S+7y1opI=;
        b=JJvTXawYK+2eKFBee5z6PBwWI5k4qXYQepgb/dOh40ONIfiNE4vQ9C5JZS9sngNYhg
         jKAqABQKcPpFCxaSTHzNRTJh1NZA9QyRaeOZY1W6wo0FCJG+12yEHnJk2NO1DgadbHko
         SXSrT3LLSZujHZOb4HyIWpS8gGRib7Sl7sEBd71FdNT6s4mX2O4QpiCkFVa9qXC//z3n
         BL3r0fgeLMCTZ3qonHJ6AOvpUyATULG7xQO2b3uScW7N2yIporOw7/OnSPXyTG6/vxE6
         ky7koh3XPDV1LI+z3hdqe8uaxn4vkoTeZ6obSssLU6VS6sfAL7NtZTRBfKYS3+fqa4Eq
         /IPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685104187; x=1687696187;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7DgLeFcVKugZ1jHV952TG/acpJ3CYaYDRk+S+7y1opI=;
        b=Jy7TfOOcLPDCfrn/FHNoYyW6twzJYM39xR7ObRmPwXgQ+ef2lMfLAT+kFph5iuB/4q
         XOfwC8nci5yKVaxj9S+JmJKCejsQiqy4/JvBnm2XnMLYg0lAS3tnnfAHs6Nu1h1NBTLi
         05KkLtFhnx4Zab9BWSpUVGBzZE7h6K+IODSp2bnZDKSpO8YxfQGFPMxy7HOz1oN7Adt0
         2h5K/Mk+dcrZHc64J3z45BxWqxD7cH7D9c1TTfq7qzlcm0CsU4Nho3s+oi5RE80X2gv/
         9gEUQ2E4wl4NiLCP6XoDHjg1HcxjuiqmCE0GHPhvk9yYvz8WVANKeaGWU54vtvg0ssQd
         0Yjw==
X-Gm-Message-State: AC+VfDxBYdeyEL3YrUHmmtrACabFWn501o1Xc0A3iqKf0i/Ij7I8Yu6a
        e3RPu44I4UN6glXoALqR08htqw==
X-Google-Smtp-Source: ACHHUZ4Yzdh1OVvZfHTDfTPDF27Lm7PQ6wRYFT/sfIDkuo8DGhJzYx6iAQS1jK8kdTtAXhGTfBVkdw==
X-Received: by 2002:adf:f307:0:b0:30a:c89c:c338 with SMTP id i7-20020adff307000000b0030ac89cc338mr1348537wro.50.1685104186834;
        Fri, 26 May 2023 05:29:46 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id h3-20020a5d5483000000b00307c46f4f08sm2325314wrv.79.2023.05.26.05.29.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 05:29:46 -0700 (PDT)
Message-ID: <546876ba-970d-5cd5-648e-723698ca74fd@linaro.org>
Date:   Fri, 26 May 2023 13:29:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH V2 1/6] dt-bindings: clock: qcom: Add SM8550 camera clock
 controller
Content-Language: en-US
To:     Jagadeesh Kona <quic_jkona@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>
References: <20230525172142.9039-1-quic_jkona@quicinc.com>
 <20230525172142.9039-2-quic_jkona@quicinc.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230525172142.9039-2-quic_jkona@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 25/05/2023 18:21, Jagadeesh Kona wrote:
> Add device tree bindings for the camera clock controller on
> Qualcomm SM8550 platform.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
> Changes since V1:
>   - Removed new YAML file and reused SM8450 CAMCC YAML file for SM8550
> 
>   .../bindings/clock/qcom,sm8450-camcc.yaml     |   8 +-
>   include/dt-bindings/clock/qcom,sm8550-camcc.h | 187 ++++++++++++++++++
>   2 files changed, 193 insertions(+), 2 deletions(-)
>   create mode 100644 include/dt-bindings/clock/qcom,sm8550-camcc.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> index 87ae74166807..8dbc9004202f 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> @@ -13,11 +13,15 @@ description: |
>     Qualcomm camera clock control module provides the clocks, resets and power
>     domains on SM8450.
>   
> -  See also:: include/dt-bindings/clock/qcom,sm8450-camcc.h
> +  See also::
> +    include/dt-bindings/clock/qcom,sm8450-camcc.h
> +    include/dt-bindings/clock/qcom,sm8550-camcc.h
>   
>   properties:
>     compatible:
> -    const: qcom,sm8450-camcc
> +    enum:
> +      - qcom,sm8450-camcc
> +      - qcom,sm8550-camcc

Hmm,

So looking at Documentation/devicetree/bindings/clock/*camcc*.yaml we 
seem to be repeating yaml over and over again with no substantial 
difference between one description and another.

You've picked at the thread here by adding sm8550 into sm8450.

I think sm8250, sm8450, sm8550, sc7280 and ... probably sm6350 should 
live in the one yaml description 
Documentation/devicetree/bindings/clock/qcom,camcc.yaml

sm6350 looks a bit sparse/incomplete to me so perhaps leave that out. 
The others sc7280, sm8250, sm8450 and sm8550 can/should all be moved 
into the same yaml file with a list of compatibles.

---
bod
