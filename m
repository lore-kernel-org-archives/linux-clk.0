Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3815C4332F
	for <linux-clk@archiver.kernel.org>; Tue, 18 Oct 2022 13:46:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231176AbiJRNqF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Oct 2022 09:46:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231163AbiJRNqC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Oct 2022 09:46:02 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8C03A2218
        for <linux-clk@vger.kernel.org>; Tue, 18 Oct 2022 06:45:56 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id r19so9631131qtx.6
        for <linux-clk@vger.kernel.org>; Tue, 18 Oct 2022 06:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=drTjJKcD8QJOd10zQ0gum6cJSH3rnvYwTkLWAPWtxQ8=;
        b=J5zc6fWalORUSCdW1JctbKrNHS0caAhuRwj/l9+2ZWLPK56QNsX8ofOMISnF75kO1b
         wDPDD5RVf607JAIQNn+zPEkowObf1NgW6Ck45kB8RUtDmEhMkqOQV9VoSQqfV0pufqyN
         rNRS3i1FS7DgePYL8ggzvVHF8ooR7oiCG1ahazTF+iqItUJQPMYdi+BFPlqzf2da3zZ2
         sqGRMVsIKdZqPbJYTLGhsZ4w/wY1EwAOhte9jADyXxC4nfupWmUV6Dnd4+Y53mLVP3QF
         rO8UxqQt2RfIAt9NziZB5CoCDZcdqIb+0Ynk9wo6dPYcHDyTH9OK6NcA16FrJdOTvYJM
         lqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=drTjJKcD8QJOd10zQ0gum6cJSH3rnvYwTkLWAPWtxQ8=;
        b=cp4XDXGc6YZhZpu+ouGS0dV7t/rbQn26XeFoRvmx5L3cU4G0k+/CpLUsuOSHRq556F
         +8Iz8Tz6H6/bVMC+caYHYQuWeH/CVftB54iJR8O0kYhN3mzigHdqL1ClpKJTfvgQxOFX
         sgW0Qu4WFgeabqLjUdP5wyOyh49hlLX5mqU0F6NKylKLtw0dgflmSyC6KJarlLO/wRmw
         KR6vVlYuE60xsx0CVyibgVcXinp0Z4lxUcAx6/PLn0hPBsBEo4Tt3rse1uhvi7bjcxNQ
         GafAJQn+Q4acGrF1fpf/8YPcIkhHGc/bG5RIVbbizAwfriTbPwbjxoqP4eoQ7I2eWHLF
         cTUQ==
X-Gm-Message-State: ACrzQf0N5mNlDZD8m5dWOgq55nflUEE4L/vn1NFytMTvOo26FyFf/gqq
        z97SWV+t9Y2LbwOIGIms9uS8rQ==
X-Google-Smtp-Source: AMsMyM4JkuiI01HNBhFX//zuBopPACdJXHKVAHoOUBuLa+96jKJfM3o2PgCLeFHCwdEj+oTWnZGs7A==
X-Received: by 2002:ac8:5cc3:0:b0:39c:f695:d39b with SMTP id s3-20020ac85cc3000000b0039cf695d39bmr1592305qta.468.1666100754519;
        Tue, 18 Oct 2022 06:45:54 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id bi26-20020a05620a319a00b006ce7bb8518bsm2514104qkb.5.2022.10.18.06.45.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Oct 2022 06:45:53 -0700 (PDT)
Message-ID: <37dfc849-a822-661f-4816-f8fe917a1e2c@linaro.org>
Date:   Tue, 18 Oct 2022 09:45:47 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v1 3/3] dt-bindings: clock: add loongson2k clock binding
Content-Language: en-US
To:     Yinbo Zhu <zhuyinbo@loongson.cn>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Jianmin Lv <lvjianmin@loongson.cn>,
        Yang Li <yang.lee@linux.alibaba.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
References: <20221018130531.301-1-zhuyinbo@loongson.cn>
 <20221018130531.301-3-zhuyinbo@loongson.cn>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221018130531.301-3-zhuyinbo@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18/10/2022 09:05, Yinbo Zhu wrote:
> Add the loongson2k clock binding with DT schema format using
> json-schema.
> 
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
> ---
>  .../bindings/clock/loongson,ls2k-clk.yaml     | 77 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml b/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml
> new file mode 100644
> index 000000000000..cf42e7cd4c7e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/loongson,ls2k-clk.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Loongson2 SoC Clock Control Module Binding

Drop "Binding"

> +
> +maintainers:
> +  - Yinbo Zhu <zhuyinbo@loongson.cn>
> +
> +description: |
> +  Loongson2 SoC clock control module is an integrated clock controller, which
> +  generates and supplies to all modules.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - loongson,ls2k-clk
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1

maxItems instead

> +
> +  clock-names:
> +    minItems: 1

Just list the items here.

> +
> +  '#clock-cells':
> +    const: 1
> +    description:
> +      The clock consumer should specify the desired clock by having the clock
> +      ID in its "clocks" phandle cell. See include/dt-bindings/clock/loongson2-clock.h
> +      for the full list of loongson2 SoC clock IDs.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: loongson,ls2k-clk
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: 100m refclk
> +        clock-names:
> +          items:
> +            - const: refclk_100m

Drop entire allOf and move the contents to top level.

Name just: "ref_100m"

>  

Best regards,
Krzysztof

