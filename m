Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43DA5EB64DD
	for <linux-clk@archiver.kernel.org>; Fri, 28 Jul 2023 06:56:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233192AbjG1G4d (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 Jul 2023 02:56:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232574AbjG1G4c (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 28 Jul 2023 02:56:32 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A0A7D9
        for <linux-clk@vger.kernel.org>; Thu, 27 Jul 2023 23:56:31 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b9338e4695so26760581fa.2
        for <linux-clk@vger.kernel.org>; Thu, 27 Jul 2023 23:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690527389; x=1691132189;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VreCUFB5kzGwTE8bquwu9Z+e/3ur68r7J1DSeuRNyD0=;
        b=mZMoLWHG65XVvEKR0LLV5dcFIfEmOy1dHPGwEpWl6Ycs+Nn/5eVIpe/oBc8WhzJ01P
         yRt96GOC2eBD0uVFm3f0cxOtIMcZ5myDymUaF24dyu2GC2dXHVMgHrNfLdsmT8M2W2Wa
         5FaL/lhCHlMPmCnPJ0e75xb6+ImJiri/Ft/O/ta2IS2FD17ZHbHAMIUKTyQkcoulK8Jb
         oBbkYrqkB52fZgnlqV2F7vILuXeZ14DiK86/XAonltRWQzvunsqVvh1DvORLVllYhQBG
         9sZN0VfvLJ0uYd9vme4a05booi6SNECqnQRBN9h+E/iviHqwtMjT5risZs59Jk5yGC7q
         AHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690527389; x=1691132189;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VreCUFB5kzGwTE8bquwu9Z+e/3ur68r7J1DSeuRNyD0=;
        b=Wl7geqfUwnuG3TcwGlaVg42yA6dIhN6hDzek47b1Huh2wnwVFCTpdUvGxtDlX9oCOh
         3L8qFsXOTQIr9D6gM3Bn7YPnrHvuzGt7WHOfOOJcnSHP0VO1Us2Y+Z7LZvM7Xq+/o9OW
         lc0KR3TTYOiq5YD7DiJ2Wfb34qgLUK0tQqaFnK5OnKJCINCN5rQfrGJEVuAqSNdjC9Or
         5g1WQM1Zbq0iz47bFMGQOq+NOJaSoQ05TD5/T4WdnIDRDsmuWa+EjORgeGwMY4tNljbD
         hiHvj/0iRrQDpoGbwqnGbBTwLXHpy/tCJQrCXICVIm96gWSjloslkI9f8XSAk4UAJgn+
         jXkg==
X-Gm-Message-State: ABy/qLafAHINnjsr3Yaxyf3kgEwtz4hpCAEB+bGnbhAdc2R4rH3VSvsC
        e3kNXU3LSCr9iB4abUveveDsMw==
X-Google-Smtp-Source: APBJJlHWClCWS/slPCAYZeik+Paow8nKYb/tCOT5BCx46pLAs+0QX8CmCibw+N7CVPFDBcN0mib7Tw==
X-Received: by 2002:a05:651c:206:b0:2b9:c4ce:558f with SMTP id y6-20020a05651c020600b002b9c4ce558fmr959873ljn.37.1690527389232;
        Thu, 27 Jul 2023 23:56:29 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id p20-20020a1c7414000000b003fbdd9c72aasm3440570wmc.21.2023.07.27.23.56.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 23:56:28 -0700 (PDT)
Message-ID: <c735bf62-9d06-c46f-fe80-d9fc88ab847f@linaro.org>
Date:   Fri, 28 Jul 2023 08:56:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3] dt-bindings: clock: versal: Convert the
 xlnx,zynqmp-clk.txt to yaml
To:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        devicetree@vger.kernel.org
Cc:     git@amd.com, linux-clk@vger.kernel.org, michal.simek@amd.com,
        conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com
References: <20230724111843.18706-1-shubhrajyoti.datta@amd.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230724111843.18706-1-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 24/07/2023 13:18, Shubhrajyoti Datta wrote:
> Convert the xlnx,zynqmp-clk.txt to yaml.
> versal-clk.yaml already exists that's why ZynqMP is converted and
> merged.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>


> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - xlnx,zynqmp-clk
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: PS reference clock
> +            - description: reference clock for video system
> +            - description: alternative PS reference clock
> +            - description: auxiliary reference clock
> +            - description: transceiver reference clock
> +            - description: (E)MIO clock source  (Optional clock)
> +            - description: GEM emio clock  (Optional clock)
> +            - description: Watchdog external clock (Optional clock)

This is 8 items, not 7 as your top-level property says.

> +
> +        clock-names:
> +          items:
> +            - const: pss_ref_clk
> +            - const: video_clk
> +            - const: pss_alt_ref_clk
> +            - const: aux_ref_clk
> +            - const: gt_crx_ref_clk
> +            - pattern: "^mio_clk[00-77]+.*$"
> +            - pattern: "gem[0-3]+_emio_clk.*$"
> +            - pattern: "swdt[0-1]+_ext_clk.*$"
> +


Best regards,
Krzysztof

