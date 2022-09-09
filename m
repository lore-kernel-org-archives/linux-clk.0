Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98FC9ECAAD3
	for <linux-clk@archiver.kernel.org>; Fri,  9 Sep 2022 07:54:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230260AbiIIHyk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Sep 2022 03:54:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230359AbiIIHyS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Sep 2022 03:54:18 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE166125195
        for <linux-clk@vger.kernel.org>; Fri,  9 Sep 2022 00:51:46 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id bq23so1322903lfb.7
        for <linux-clk@vger.kernel.org>; Fri, 09 Sep 2022 00:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=ygzgjfyjBg7Clr0C0/hvEem9VU5MhWDZEtuQgO95Dqc=;
        b=JJOyZppM2dF9iD2mrjF0mK2AeXPh4IMzalwQP3saFldlVO0bHw+xTzPhpo2TTwe3Dv
         Zr8hf4ucu0A2l+VKWxpCIBDP+AEQdWdmx0MmdGWDcm9SAsIMsrwdfr1yJ1pI5O+Zg0+c
         hX7La09cORywi0VAzAinGex5d3Mo93rYVpmkrTpmXdvSPpX4wpP/rqnR5uSBtRnXFogR
         Ytnv2xfn0KTnpFjRmefWpwwHOUzK50uVsHejiKWG/9JC5hgz3GjV3NIOr4C5HoIpx71u
         fbeTClvddNceBArKP4/rG+8nc31Ig1YhYw0ulZ0vFwrx/ChhNHRhe/3E+9VtCtjxS5yR
         6Wdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ygzgjfyjBg7Clr0C0/hvEem9VU5MhWDZEtuQgO95Dqc=;
        b=m8esUEo+JH8yF1tGL+dNx8Kha4v3N5vm3tDq2Fv/YKzXwSi59M5pV3H1bAHLzCxFwd
         VWIhUcYFaw6GJX+gMNYWfJN28zQG8/dtd1n2cJpOhUowk0GmjWBvYQcrysHhyJRZLx7F
         M+H6t2UwlUsTMbqOzJjMg0YIUSHzjyMQ/1JxeFHfOgYJesLAF8Y/C+pTIhwpxMZdgmr6
         iPOQQHJXRmZtXCykvngBKrMY0BBjrLWkh8NaxWdzxASIOr8Bo5gwEj1ricwuBzVCFGT7
         EGZiYcOxLyQnYDXckonBqDupiZaEKVHONmi2bCrJcfQT4lzQzb9Tklj9ZTsWxLtvhGiG
         6oiA==
X-Gm-Message-State: ACgBeo06WU8W1dB3QPETxlLCenMS4MtoTrTchiKXNuiJJamPDj0sbwk0
        39WnT44nvjTHNz5M9l/lE0Jp2w==
X-Google-Smtp-Source: AA6agR5hbacADbxwVDJCWoFcJTqmA/zt/dH6rfE6jrL04ZeNbuSaNE0c/tLl+nkU3UJedss9Sma4Ig==
X-Received: by 2002:a05:6512:3409:b0:48a:ef04:4ec2 with SMTP id i9-20020a056512340900b0048aef044ec2mr4311008lfr.230.1662709904599;
        Fri, 09 Sep 2022 00:51:44 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id v8-20020a056512348800b0049707888a61sm157964lfr.293.2022.09.09.00.51.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 00:51:44 -0700 (PDT)
Message-ID: <df2f3529-cb9b-1b45-14f0-61d8a60943c3@linaro.org>
Date:   Fri, 9 Sep 2022 09:51:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: qcom: add bindings for dispcc
 on SM8450
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220908222850.3552050-1-dmitry.baryshkov@linaro.org>
 <20220908222850.3552050-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220908222850.3552050-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 09/09/2022 00:28, Dmitry Baryshkov wrote:
> Add device tree bindings for the display clock controller on Qualcomm
> SM8450 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I think I reviewed it...

> ---
>  .../bindings/clock/qcom,sm8450-dispcc.yaml    |  98 +++++++++++++++++
>  .../dt-bindings/clock/qcom,sm8450-dispcc.h    | 103 ++++++++++++++++++
>  2 files changed, 201 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8450-dispcc.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,sm8450-dispcc.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-dispcc.yaml
> new file mode 100644
> index 000000000000..467544eea1ac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-dispcc.yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,sm8450-dispcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display Clock & Reset Controller Binding for SM8450

Drop "Binding"

> +
> +maintainers:
> +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> +
> +description: |
> +  Qualcomm display clock control module which supports the clocks, resets and
> +  power domains on SM8450.
> +
> +  See also:
> +    dt-bindings/clock/qcom,sm8450-dispcc.h

This is not fixed (Bjorn's comment - full path).

> +
> +properties:

With both above fixed:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
