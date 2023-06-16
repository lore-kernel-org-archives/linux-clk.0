Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 558ADEB64DA
	for <linux-clk@archiver.kernel.org>; Fri, 16 Jun 2023 11:33:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243664AbjFPLd4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Jun 2023 07:33:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241806AbjFPLdy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 16 Jun 2023 07:33:54 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 088A8295B
        for <linux-clk@vger.kernel.org>; Fri, 16 Jun 2023 04:33:53 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-514ab6cb529so3609484a12.1
        for <linux-clk@vger.kernel.org>; Fri, 16 Jun 2023 04:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686915231; x=1689507231;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vnCBULjwaeoKSSjtKcAIMInnLKiE524xqLou3I4mzIY=;
        b=BzjzuQgJYIshv6bcYud1qHQiywtb1eZ8d+MShkxuxN3EJDxICt070sEJ0JJL7EEZqt
         u/pHAQ2DsV8ngkLgbpYKLS/D2PuXq0Wc5uhV4XxQzWecNdsJQmKfFl3h2T/ndhDWq90i
         SxH3a6OkswRDlbuZ5UKmFpm0bwJWecwrCb3ou+GUVfA5dMQj1tWqNXc2WT/3977ka5+f
         vI7eGEX97OQRjPg4ZY1XQYpDwSqHcII1L4JzlIoRUyAClKNuZlmWidjutaM1NKaLbHkJ
         XfqIxSRJiCyCYD49u9Z5cXqTtls+ko5E0de6qSUDctt7lAU9e/8vUL0jx3n6PZvP01N4
         N81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686915231; x=1689507231;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vnCBULjwaeoKSSjtKcAIMInnLKiE524xqLou3I4mzIY=;
        b=L/PkBmCLAEK+fEj8FCJXEGi6khBYqLCjAa9vgAIk/dTdtiC9AgRdLJiZ+nwxL6b7bg
         RlrS237oGm+4Q/WtTPX0JhdtCv73zC0OtBUNoI96Gp3/tPFuB+pI9o9YbNE4/JRZVrOT
         +Eh5OEisgl6IA6kylzp+qNiv2eKHGTRWQ3K/12R6+ErY5Rsv80/uOYvLhterUAh4MR2Z
         oSsoGLi9WgsDzYUstjZEZCWUPCel9oOIytpd4axeVgLTrF0w/lujfCI0myAlrz4vSnF/
         f/4Gk1sfoX6X5OLWkYwbY9p8shDemr7qKfAN1VqzjqUhSg88hpOVwkK6/R5bSdMOAf1s
         jnpQ==
X-Gm-Message-State: AC+VfDxypDnxy832Q4Ws9n6PJaU2VGzdig4SNE1KOYISfXC5rOreve4L
        ge9jV+s+hUzLb7XYmtYLp883s/O9sxCl/VrESwo=
X-Google-Smtp-Source: ACHHUZ5cEJy8okqiTA6pGSDD4tP30kklvbaWhufgQI9cqL7BYN2Ux0OGcf6oNZHMSOUjHxJKR+CmEw==
X-Received: by 2002:a05:6402:5216:b0:514:a5cf:745b with SMTP id s22-20020a056402521600b00514a5cf745bmr7337833edd.3.1686915231435;
        Fri, 16 Jun 2023 04:33:51 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id l14-20020aa7c30e000000b00514b0f6a75esm9684653edq.97.2023.06.16.04.33.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jun 2023 04:33:50 -0700 (PDT)
Message-ID: <cee56c57-060a-2fce-a2af-25404b9afe48@linaro.org>
Date:   Fri, 16 Jun 2023 13:33:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/2] dt-bindings: clock: Update GCC clocks for QDU1000 and
 QRU1000 SoCs
To:     Imran Shaik <quic_imrashai@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Melody Olvera <quic_molvera@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>
References: <20230616104941.921555-1-quic_imrashai@quicinc.com>
 <20230616104941.921555-2-quic_imrashai@quicinc.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230616104941.921555-2-quic_imrashai@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16/06/2023 12:49, Imran Shaik wrote:
> Update the qcom GCC clock bindings and add v2 compatible string for QDU1000
> and QRU1000 SoCs.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
> ---
>  .../devicetree/bindings/clock/qcom,qdu1000-gcc.yaml         | 6 +++++-
>  include/dt-bindings/clock/qcom,qdu1000-gcc.h                | 4 +++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,qdu1000-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qdu1000-gcc.yaml
> index 767a9d03aa32..030953d258c1 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,qdu1000-gcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,qdu1000-gcc.yaml
> @@ -8,6 +8,8 @@ title: Qualcomm Global Clock & Reset Controller for QDU1000 and QRU1000
>  
>  maintainers:
>    - Melody Olvera <quic_molvera@quicinc.com>
> +  - Taniya Das <quic_tdas@quicinc.com>
> +  - Imran Shaik <quic_imrashai@quicinc.com>

I appreciate adding more maintainers, it is welcomed and needed.

However many of Qualcomm folks, including some of you, did not care
enough to fix their old/incorrect email in existing entries, thus we
have hundreds of wrong addresses and email bounces.

We already raised this internally and publicly, with just small effect,
so I am not sure what to do more. For me, allowing to have outdated
email in maintainers is an easiest proof that maintainer does not care.
Adding more maintainer entries, while maintainer does not care, would
not feel right. Maybe let's start with fixing existing entries?

>  
>  description: |
>    Qualcomm global clock control module which supports the clocks, resets and
> @@ -17,7 +19,9 @@ description: |
>  
>  properties:
>    compatible:
> -    const: qcom,qdu1000-gcc
> +    enum:
> +      - qcom,qdu1000-gcc
> +      - qcom,qdu1000-gcc-v2

It's the same block, isn't it? What is the "v2" exactly?

Best regards,
Krzysztof

