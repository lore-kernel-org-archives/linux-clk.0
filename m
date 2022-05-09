Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A4FC433EF
	for <linux-clk@archiver.kernel.org>; Mon,  9 May 2022 07:38:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230249AbiEIHlT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 May 2022 03:41:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236130AbiEIH0j (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 May 2022 03:26:39 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A90F2703EF
        for <linux-clk@vger.kernel.org>; Mon,  9 May 2022 00:22:04 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id k27so15174408edk.4
        for <linux-clk@vger.kernel.org>; Mon, 09 May 2022 00:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=r8EzK3JJsKUErCg00miKoLyoqzj/mxXqLt2F2OYDn18=;
        b=h3nYTW6STSrguhBxcKdiMGFTd91R63i5a+BH8Ybs25nAbv51D6zqqTa0WixnBk0fqp
         txvE/7mCgql9wb7EaqGIafjIXnbDYOQkZPmhdNxScdRg5EHyltKa/SXLo0BMUxU5Svvq
         SvsoqBkuPTBP/cOBFmKmXncWPXHxr84Jpy8M9okii5HQPrL2gaZg+4GbTrHYmL6qq/Fc
         9x4tcxLBJ4H+AXyOmyQhh+NySursoKLAip6foicxUTW7V9Yi1um1X4XuzIR/yvBwqcG/
         zdI+EJx58KaVMqnse9A1qR5AYQAN6pikR4Sv4jxGkbmXB69J4xopjcp7bvYu5YsbNOsC
         if5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=r8EzK3JJsKUErCg00miKoLyoqzj/mxXqLt2F2OYDn18=;
        b=azBslPVovLHTdeLyhrTgIzzb/5sXh3PLhb13rNVR24eNzxB5pou7FFkxblZZFYPHEn
         bm6EvnbVwwVRh/4AJC+x7dj+U5oixax10d6DunorCaFOUpPZI6LB0M22gMzyF/fHmGJK
         Pw9Hxh3Iqf0/v0jJCLNVU7EzHUKhEfB+SOtEo1dulkn5j8r6NlJKjCEgNjAZrm41nFao
         rdmsD5blO57Ktt36/2rb9C1wosgfPz1Z45AeqyC0RvkseIbscQn8gMMM0CCV9EnTGbHA
         BtB/xU9mWBcB6LuvmB0htnHb934ZntnOGXhT6kVE1lCytK/UN7Fj/16S08WgOG/nOX0U
         ZU0Q==
X-Gm-Message-State: AOAM530BiBq18WFqStL4OYGRia/lgwSHx1xkh9MxJRtIYZDiR04m9H6t
        jyKuQ5fcOF2bo2OBgzqLBFCuYA==
X-Google-Smtp-Source: ABdhPJxc79htoQFhb6lZqPqWa/gAX0T5VaQupgDvXbnSToB3iz7+sI1cX79YGbfhWbB0c4V07AY0QA==
X-Received: by 2002:a05:6402:400f:b0:428:325a:b6bb with SMTP id d15-20020a056402400f00b00428325ab6bbmr16212581eda.145.1652080923245;
        Mon, 09 May 2022 00:22:03 -0700 (PDT)
Received: from [192.168.0.242] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id h25-20020a1709070b1900b006f3ef214e5esm4735367ejl.196.2022.05.09.00.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 May 2022 00:22:02 -0700 (PDT)
Message-ID: <c267066c-40b3-4afd-4050-edc1abfdeb1e@linaro.org>
Date:   Mon, 9 May 2022 09:22:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 07/11] dt-bindings: clocks: qcom,gcc-ipq8074: support
 power domains
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org
References: <20220508104855.78804-1-robimarko@gmail.com>
 <20220508104855.78804-7-robimarko@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220508104855.78804-7-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 08/05/2022 12:48, Robert Marko wrote:
> GCC inside of IPQ8074 also provides power management via built-in GDSCs.
> In order to do so, '#power-domain-cells' must be set to 1.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
>  .../devicetree/bindings/clock/qcom,gcc-ipq8074.yaml          | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml
> index 98572b4a9b60..e3e236e4ce7d 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml
> @@ -27,6 +27,9 @@ properties:
>    '#reset-cells':
>      const: 1
>  
> +  '#power-domain-cells':
> +    const: 1

It seems I reviewed your v2 - please put it before reset-cells. The same
in next hunks.


Best regards,
Krzysztof
