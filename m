Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E97E5C433F5
	for <linux-clk@archiver.kernel.org>; Mon, 28 Feb 2022 09:23:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234259AbiB1JYF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Feb 2022 04:24:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232390AbiB1JYE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Feb 2022 04:24:04 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 400843F315
        for <linux-clk@vger.kernel.org>; Mon, 28 Feb 2022 01:23:25 -0800 (PST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0D1F53F1BC
        for <linux-clk@vger.kernel.org>; Mon, 28 Feb 2022 09:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646040204;
        bh=3AkK4RxGdbmTygJvwG++DDRYgKJ3fKlzb6qBUYAxPMU=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=N0Nm4jDly1cue8blHx8hict334E2zl2PKHO15Mu3HMR7eSulhod4RVlw3sRqcVt2R
         ABjuqvoqkl9Xm4lPEDBBoL3U7cLZtBb4QIrQBsM/k+nl4fUDvtIo2k9PNd7BMoWZJ8
         2/GFSNkDWEJggT8A/mkfQARBfjzYa72mqj6YppM3bp2PPPNKdIdTaKkwvGOH/bC0gg
         dGpClDRdGcF0XK+jNZGCVhKW7ygH10pWjgI1K44Xsf/SDpJn6OVAmsIA2HBI4KUsgS
         WFnv58j+n8IDAk3we9XkQRpfAop00nsfT9CgIm6K6SF7g0yAoveuAUB1tzm04QzI6B
         rF4scskyd5ZnQ==
Received: by mail-ed1-f71.google.com with SMTP id cm27-20020a0564020c9b00b004137effc24bso3669068edb.10
        for <linux-clk@vger.kernel.org>; Mon, 28 Feb 2022 01:23:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3AkK4RxGdbmTygJvwG++DDRYgKJ3fKlzb6qBUYAxPMU=;
        b=uJWBzwn8GzH5sA+R3oLclPQf7KMVlr05pFK3Dc81kpipK5AYsREXqOX8mZXgXPdEwV
         gOI4wP7aNP73ihYi2uHyFquAx6FfI1khTFgzSHrTlKeC59jlk6OBK65DUJsIqWS3Xt7x
         +Qsa9ZUaTYCbp6zbV2rdaS9qM1efqDRISqCSEXqvlRcCZDAPWCAlyC27sUysiTtTF+uF
         8ckpGw5YOTfs7HbUq44SK+OJhXbzBOssvOMCO5raY451LXf5QoFjYpnSlE0kXQ4BRdeQ
         xPLIs/RqCIEQnEPAXjzTVjLWlw3Z+MpftPPF5ikpJjNHYzrPvCkT0rSlObXXg0VvCqqf
         IajQ==
X-Gm-Message-State: AOAM531Ujw6M23F1n4IbmF7quK8VPUwGRgrtsrotlxHDHBNCHVBEXwyV
        2HH5UcDkzu1xd0qBXEgEhfWjdThlCIbfsXsP1P+d7TOPakfT/ed53qPZwoZukjYmSeqTBRpjdiR
        iXUixi5BYmISQpU3+KI/zKN/UF/aNBp1wU1GGsQ==
X-Received: by 2002:a17:906:4e83:b0:6d6:d5c8:1335 with SMTP id v3-20020a1709064e8300b006d6d5c81335mr433391eju.438.1646040203103;
        Mon, 28 Feb 2022 01:23:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvxpaUQXlZXrspRIYaQJ+p2vCjcouQfLVFcldvOi83NTKJnTIe0fV5+OZvji7GFV1Qn+rFmg==
X-Received: by 2002:a17:906:4e83:b0:6d6:d5c8:1335 with SMTP id v3-20020a1709064e8300b006d6d5c81335mr433376eju.438.1646040202852;
        Mon, 28 Feb 2022 01:23:22 -0800 (PST)
Received: from [192.168.0.133] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id w12-20020a17090649cc00b006d0bee77b9asm4187080ejv.72.2022.02.28.01.23.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Feb 2022 01:23:21 -0800 (PST)
Message-ID: <05310308-b0ff-56a0-83ac-855b1b795936@canonical.com>
Date:   Mon, 28 Feb 2022 10:23:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: add QCOM SM6125 display clock
 bindings
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220226200911.230030-1-marijn.suijten@somainline.org>
 <20220226200911.230030-3-marijn.suijten@somainline.org>
 <ea5d34c6-fe75-c096-d5b2-6a327c9d0ae5@canonical.com>
 <62ebb074-b8de-0dc3-2bbc-e43dca9d2ced@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <62ebb074-b8de-0dc3-2bbc-e43dca9d2ced@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 27/02/2022 22:43, Dmitry Baryshkov wrote:
> On 27/02/2022 13:03, Krzysztof Kozlowski wrote:
>> On 26/02/2022 21:09, Marijn Suijten wrote:
>>> From: Martin Botka <martin.botka@somainline.org>
>>>
>>> Add device tree bindings for display clock controller for
>>> Qualcomm Technology Inc's SM6125 SoC.
>>>
>>> Signed-off-by: Martin Botka <martin.botka@somainline.org>
>>> ---
>>>   .../bindings/clock/qcom,dispcc-sm6125.yaml    | 87 +++++++++++++++++++
>>>   .../dt-bindings/clock/qcom,dispcc-sm6125.h    | 41 +++++++++
>>>   2 files changed, 128 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
>>>   create mode 100644 include/dt-bindings/clock/qcom,dispcc-sm6125.h
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
>>> new file mode 100644
>>> index 000000000000..3465042d0d9f
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
>>> @@ -0,0 +1,87 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/clock/qcom,dispcc-sm6125.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Qualcomm Display Clock Controller Binding for SM6125
>>> +
>>> +maintainers:
>>> +  - Martin Botka <martin.botka@somainline.org>
>>> +
>>> +description: |
>>> +  Qualcomm display clock control module which supports the clocks and
>>> +  power domains on SM6125.
>>> +
>>> +  See also:
>>> +    dt-bindings/clock/qcom,dispcc-sm6125.h
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - qcom,sm6125-dispcc
>>> +
>>> +  clocks:
>>> +    items:
>>> +      - description: Board XO source
>>> +      - description: Byte clock from DSI PHY0
>>> +      - description: Pixel clock from DSI PHY0
>>> +      - description: Pixel clock from DSI PHY1
>>> +      - description: Link clock from DP PHY
>>> +      - description: VCO DIV clock from DP PHY
>>> +      - description: AHB config clock from GCC
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: bi_tcxo
>>> +      - const: dsi0_phy_pll_out_byteclk
>>> +      - const: dsi0_phy_pll_out_dsiclk
>>> +      - const: dsi1_phy_pll_out_dsiclk
>>> +      - const: dp_phy_pll_link_clk
>>> +      - const: dp_phy_pll_vco_div_clk
>>> +      - const: cfg_ahb_clk
>>> +
>>> +  '#clock-cells':
>>> +    const: 1
>>> +
>>> +  '#power-domain-cells':
>>> +    const: 1
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - clocks
>>> +  - clock-names
>>> +  - '#clock-cells'
>>> +  - '#power-domain-cells'
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/clock/qcom,rpmcc.h>
>>> +    #include <dt-bindings/clock/qcom,gcc-sm6125.h>
>>> +    clock-controller@5f00000 {
>>> +      compatible = "qcom,sm6125-dispcc";
>>> +      reg = <0x5f00000 0x20000>;
>>> +      clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
>>> +               <&dsi0_phy 0>,
>>> +               <&dsi0_phy 1>,
>>> +               <0>,
>>
>> This does not look like a valid phandle. This clock is required, isn't it?
> 
> Not, it's not required for general dispcc support.
> dispcc uses DSI and DP PHY clocks to provide respective pixel/byte/etc 
> clocks. However if support for DP is not enabled, the dispcc can work 
> w/o DP phy clock. Thus we typically add 0 phandles as placeholders for 
> DSI/DP clock sources and populate them as support for respective 
> interfaces gets implemented.
> 

Then the clock is optional, isn't it? While not modeling it as optional?


Best regards,
Krzysztof
