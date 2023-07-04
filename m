Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B78D3EB64D9
	for <linux-clk@archiver.kernel.org>; Tue,  4 Jul 2023 08:03:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230471AbjGDIDJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Jul 2023 04:03:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231249AbjGDICq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Jul 2023 04:02:46 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12262E5F
        for <linux-clk@vger.kernel.org>; Tue,  4 Jul 2023 01:02:39 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-51d80c5c834so9501081a12.1
        for <linux-clk@vger.kernel.org>; Tue, 04 Jul 2023 01:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688457757; x=1691049757;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yBZPI8glJqIUeXhqVRAMT4N4I6Vuww3+N8Gf1+RF6eg=;
        b=A2IEtShJbjKpwGTdVrHcrDd4B6aTMvHQ2LMjreMTZS6SAURNgYuypXFUZHxb/taqUR
         2HW+6514DjeJsL+S43lF/gccbk655IkQ/PIc3wc7yOu3uHrSSwrj5w+3n57yyyg5tIkG
         EZvOdJV55bzGa2IRL+1vFYVXuB3CNbFmMEn2hQjFY+FK8PNQf6EzgXvXRpFiR6nKYNfB
         zbQeb/Rcez+EMySJxtuGNB6v52GLemDYdsbQdcg8YbQsbYNGvxhGrMRbHiV+suU7LhTf
         H0NRXYD5ibwRKn5wwWfuyBLmuYh2OkbcXQUbjEuQY8nxvAB2nw3RdPGgoJgBjJDgUWxA
         erHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688457757; x=1691049757;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yBZPI8glJqIUeXhqVRAMT4N4I6Vuww3+N8Gf1+RF6eg=;
        b=Ks5oBW5T2O888ZZxY4VEHg53y5wV/XqzKCsUSe2uzi+fJq2N26v+vy7pbm33y+NBiY
         fF1mPAVFW6APp1l6p/ud0qR0KcKBrD3YRX2w0JBovfbEWAHlefMK8VF6pBNwvrFMwQ9z
         Qw0/wlYqf5dgRpuhYN+M9UCQrbInTn1Zgmx9Sb4U9B3aAvIatIdGxaq3OYaM6C1VsghL
         /hV7ESHVx6zhJ6JHIiM6o8nQQYgHNBHc+cj3f2ePJ8UpNknUDygzA0X3SWfzD4e7y0Nb
         GiY3FjTYJSNA5su15wMlnuCaBX6bHs48UuarN+uUgb13kCG8/w8ZKXR+NA9t3BofC8yp
         +t1A==
X-Gm-Message-State: ABy/qLYCRAWirZK3egJpXmAk5MXlnEfgpcmOkXWFif/KIAL066MXwWWW
        YCaGn2lt3Z2DzdIiBB9xbykdFg==
X-Google-Smtp-Source: APBJJlH717oPGFv+MjoFn80oa7HNgr/u6Yrl7/XZuLT5Lhy/wGRwAFSGpyBAiRmiDQc7Muh+xJqIcQ==
X-Received: by 2002:a05:6402:b1a:b0:51d:914a:9f3d with SMTP id bm26-20020a0564020b1a00b0051d914a9f3dmr12953207edb.10.1688457757473;
        Tue, 04 Jul 2023 01:02:37 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id s19-20020a056402165300b0051d9df5dd2fsm9370643edx.72.2023.07.04.01.02.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 01:02:37 -0700 (PDT)
Message-ID: <85771493-a06a-b92d-51c5-c7771443b563@linaro.org>
Date:   Tue, 4 Jul 2023 10:02:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/3] dt-bindings: clock: imx8-acm: Add audio clock mux
 support
Content-Language: en-US
To:     Shengjiu Wang <shengjiu.wang@nxp.com>, abelvesa@kernel.org,
        peng.fan@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        shengjiu.wang@gmail.com
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1688449175-1677-1-git-send-email-shengjiu.wang@nxp.com>
 <1688449175-1677-2-git-send-email-shengjiu.wang@nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1688449175-1677-2-git-send-email-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 04/07/2023 07:39, Shengjiu Wang wrote:
> Add the clock dt-binding file for audio clock mux. which
> is the IP for i.MX8QM, i.MX8QXP, i.MX8DXL.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Except what the bot already pointed out:

> ---
>  .../devicetree/bindings/clock/imx8-acm.yaml   | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/imx8-acm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/imx8-acm.yaml b/Documentation/devicetree/bindings/clock/imx8-acm.yaml
> new file mode 100644
> index 000000000000..820c06b81aa6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/imx8-acm.yaml

Filename matching compatible. At least vendor prefix is missing.


> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/imx8-acm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP i.MX8 Audio Clock Mux Binding
> +
> +maintainers:
> +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> +
> +description: |
> +  NXP i.MX8 Audio Clock Mux is dedicated clock muxing IP
> +  used to control Audio related clock on the SoC.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nxp,imx8qm-acm
> +      - nxp,imx8qxp-acm
> +      - nxp,imx8dxl-acm
> +
> +  reg:
> +    maxItems: 1
> +
> +  power-domains:
> +    minItems: 13
> +    maxItems: 21


21 power domains? What's this? Why clock device make entire SoC awake?

Anyway, you need to list them.

> +
> +  '#clock-cells':
> +    const: 1
> +    description:
> +      The clock consumer should specify the desired clock by having the clock
> +      ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx8-clock.h
> +      for the full list of i.MX8 ACM clock IDs.
> +
> +required:
> +  - compatible
> +  - reg
> +  - power-domains
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  # Clock Control Module node:
> +  - |
> +    #include <dt-bindings/firmware/imx/rsrc.h>
> +
> +    acm@59e00000 {


Node names should be generic. See also explanation and list of examples
in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +        compatible = "nxp,imx8qxp-acm";
> +        reg = <0x59e00000 0x1D0000>;

Don't mix hexes. Only lower-case.

Please perform some basic review in NXP before sending it.

Best regards,
Krzysztof

