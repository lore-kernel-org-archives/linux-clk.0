Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37C17C05027
	for <linux-clk@archiver.kernel.org>; Fri, 20 Jan 2023 09:42:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbjATJmZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 20 Jan 2023 04:42:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229770AbjATJmY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 Jan 2023 04:42:24 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C16445205
        for <linux-clk@vger.kernel.org>; Fri, 20 Jan 2023 01:42:22 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id r2so4302076wrv.7
        for <linux-clk@vger.kernel.org>; Fri, 20 Jan 2023 01:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=/gBJ3sFN5CxK6wYl6HVysdNUHMMHr2txe4LdApPF2Po=;
        b=xQdGezIY3CG4KYyGsbNqMw4mhk0P1QswC3K0Xe8FVKdCuFbd/gx0UUpcebZ2YyHzSH
         BSJpAdudEJLl8arWtZ/27pF3zzJ18bwocd6skg75Q1CxRoOr5yLs0owvdM6SIo0DOTy7
         i3WGt86zK/hEfr0LNotSuY5BFpSwmVYdtajiNCY4qrUky5XW3IeKCfW30CdCXrskxVgW
         rB61/EwdEeJ4rq+ZKw//GTjFrgpCY6pk/IGHclhaevpHr1dFOpYRN1rCMnu68pGTqAM2
         JFj264lHq6GIjIQhMYzvhCkx5iZJHeREPtTpWGJrpVzmwf76uUDGCdo0rIKs3YNtDo0e
         jkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/gBJ3sFN5CxK6wYl6HVysdNUHMMHr2txe4LdApPF2Po=;
        b=bu6AHKMG90pJUgv0BH+LZxIr/ARn1FNGIQz8gPL3vAWXj7mU7J+vVJSNsMMgCRHdNX
         atW2reJwQX4+J2qt3U7u2AufOIJf2TgrNq1LJimNIQvNPqRkLQDDHzV2AJdmIccJOExy
         UlMcgqII+dwWiBOUV07dykQT4CBV2ZY9Wz3LseutDSGEv7tgJE5Uph7+rliTyrLlsFRY
         6uoExtCMhwn17Up4/C8wv5czolooM4FXZH+A1HIpnQMc/RNw0C0VeaO2pD0mu1pml7Ng
         ABdL/5muOkKo98L1mwwKGEeT6yGzjJIltfbv6BgAFrZQvJe+HKzq2v/2x1FLojggBVgj
         mj/w==
X-Gm-Message-State: AFqh2kqgjq2OqK7COnvpH+0Vuvqs0Yo1CODE+2DxKUVSP4ByJY+OKJtq
        WrJEHTHS2LLqHkOL7UCGJ8o1Pg==
X-Google-Smtp-Source: AMrXdXsAm9JDrpxqZQeZF6jNE2Bb2hmU5RKfY53oOAjYb11owYPy49S8BpBP4v+Qa8803vn98g0ZZw==
X-Received: by 2002:a5d:6f15:0:b0:2bb:dcf9:482b with SMTP id ay21-20020a5d6f15000000b002bbdcf9482bmr14182202wrb.47.1674207740660;
        Fri, 20 Jan 2023 01:42:20 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id r10-20020adfda4a000000b0029a06f11022sm35720373wrl.112.2023.01.20.01.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 01:42:20 -0800 (PST)
References: <20230116074214.2326-1-yu.tu@amlogic.com>
 <20230116074214.2326-2-yu.tu@amlogic.com>
 <02b6b3a6-e2ad-8cbc-fa15-fbd2db6ada64@linaro.org>
 <7c0133a2-ea4d-645e-3df2-2bb832bbd498@amlogic.com>
User-agent: mu4e 1.8.10; emacs 28.2
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Yu Tu <yu.tu@amlogic.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     "kelvin . zhang" <Kelvin.Zhang@amlogic.com>,
        "qi . duan" <qi.duan@amlogic.com>
Subject: Re: [PATCH V6 1/3] dt-bindings: clock: document Amlogic S4 SoC PLL
 & peripheral clock controller
Date:   Fri, 20 Jan 2023 10:37:36 +0100
In-reply-to: <7c0133a2-ea4d-645e-3df2-2bb832bbd498@amlogic.com>
Message-ID: <1j5yd1y22r.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Mon 16 Jan 2023 at 17:31, Yu Tu <yu.tu@amlogic.com> wrote:

> Hi Krzysztof,
> 	Thank you for your quick reply.
>
> On 2023/1/16 16:29, Krzysztof Kozlowski wrote:
>> [ EXTERNAL EMAIL ]
>> On 16/01/2023 08:42, Yu Tu wrote:
>>> Add the S4 PLL & peripheral clock controller dt-bindings in the s4 SoC
>>> family.
>>>
>>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
>>> ---
>>>   .../clock/amlogic,s4-peripherals-clkc.yaml    | 104 ++++++++++++++
>>>   .../bindings/clock/amlogic,s4-pll-clkc.yaml   |  50 +++++++
>>>   MAINTAINERS                                   |   1 +
>>>   .../clock/amlogic,s4-peripherals-clkc.h       | 131 ++++++++++++++++++
>>>   .../dt-bindings/clock/amlogic,s4-pll-clkc.h   |  30 ++++
>>>   5 files changed, 316 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-peripherals-clkc.yaml
>>>   create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
>>>   create mode 100644 include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
>>>   create mode 100644 include/dt-bindings/clock/amlogic,s4-pll-clkc.h
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/clock/amlogic,s4-peripherals-clkc.yaml
>>> b/Documentation/devicetree/bindings/clock/amlogic,s4-peripherals-clkc.yaml
>>> new file mode 100644
>>> index 000000000000..2deeff497754
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/clock/amlogic,s4-peripherals-clkc.yaml
>>> @@ -0,0 +1,104 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/clock/amlogic,s4-peripherals-clkc.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Amlogic Meson S serials Peripherals Clock Controller
>>> +
>>> +maintainers:
>>> +  - Neil Armstrong <neil.armstrong@linaro.org>
>>> +  - Jerome Brunet <jbrunet@baylibre.com>
>>> +  - Yu Tu <yu.tu@amlogic.com>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: amlogic,s4-peripherals-clkc
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    items:
>>> +      - description: input fixed pll div2
>>> +      - description: input fixed pll div2p5
>>> +      - description: input fixed pll div3
>>> +      - description: input fixed pll div4
>>> +      - description: input fixed pll div5
>>> +      - description: input fixed pll div7
>>> +      - description: input hifi pll
>>> +      - description: input gp0 pll
>>> +      - description: input mpll0
>>> +      - description: input mpll1
>>> +      - description: input mpll2
>>> +      - description: input mpll3
>>> +      - description: input hdmi pll
>>> +      - description: input oscillator (usually at 24MHz)
>>> +      - description: input external 32kHz reference (optional)
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: fclk_div2
>>> +      - const: fclk_div2p5
>>> +      - const: fclk_div3
>>> +      - const: fclk_div4
>>> +      - const: fclk_div5
>>> +      - const: fclk_div7
>>> +      - const: hifi_pll
>>> +      - const: gp0_pll
>>> +      - const: mpll0
>>> +      - const: mpll1
>>> +      - const: mpll2
>>> +      - const: mpll3
>>> +      - const: hdmi_pll
>>> +      - const: xtal
>>> +      - const: ext_32k
>>> +
>>> +  "#clock-cells":
>>> +    const: 1
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - clocks
>>> +  - clock-names
>>> +  - "#clock-cells"
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/clock/amlogic,s4-peripherals-clkc.h>
>>> +
>>> +    /* 32KHz reference crystal */
>>> +    ext_32k: ref32k {
>>> +        compatible = "fixed-clock";
>>> +        #clock-cells = <0>;
>>> +        clock-frequency = <32000>;
>>> +    };
>> This wasn't here before. Drop it. It is trivial and it is not needed to
>> illustrate your device bindings. All clock bindings use it...
>> 
>
> I'm fine with that. I don't know if Jerome agrees with that. Wait for
> him. See what he says.

This is a simple change related to your binding example.
Krzysztof is one of the DT maintainer. Please follow his recommendation.

>
>>> +
>>> +    clkc_periphs: clock-controller@fe000000 {
>>> +      compatible = "amlogic,s4-peripherals-clkc";
>>> +      reg = <0xfe000000 0x49c>;
>>> +      clocks = <&clkc_pll 3>,
>>> +              <&clkc_pll 13>,
>>> +              <&clkc_pll 5>,
>>> +              <&clkc_pll 7>,
>>> +              <&clkc_pll 9>,
>>> +              <&clkc_pll 11>,
>>> +              <&clkc_pll 17>,
>>> +              <&clkc_pll 15>,
>>> +              <&clkc_pll 25>,
>>> +              <&clkc_pll 27>,
>>> +              <&clkc_pll 29>,
>>> +              <&clkc_pll 31>,
>>> +              <&clkc_pll 20>,
>>> +              <&xtal>,
>>> +              <&ext_32k>;
>>> +      clock-names = "fclk_div2", "fclk_div2p5", "fclk_div3", "fclk_div4",
>>> +                    "fclk_div5", "fclk_div7", "hifi_pll", "gp0_pll",
>>> +                    "mpll0", "mpll1", "mpll2", "mpll3", "hdmi_pll", "xtal",
>>> +                    "ext_32k";
>>> +      #clock-cells = <1>;
>>> +    };
>>> +...
>>> diff --git
>>> a/Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
>>> b/Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
>>> new file mode 100644
>>> index 000000000000..aeda4861cebe
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
>>> @@ -0,0 +1,50 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/clock/amlogic,s4-pll-clkc.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Amlogic Meson S serials PLL Clock Controller
>>> +
>>> +maintainers:
>>> +  - Neil Armstrong <neil.armstrong@linaro.org>
>>> +  - Jerome Brunet <jbrunet@baylibre.com>
>>> +  - Yu Tu <yu.tu@amlogic.com>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: amlogic,s4-pll-clkc
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    maxItems: 1
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: xtal
>>> +
>>> +  "#clock-cells":
>>> +    const: 1
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - clocks
>>> +  - clock-names
>>> +  - "#clock-cells"
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    clkc_pll: clock-controller@fe008000 {
>>> +      compatible = "amlogic,s4-pll-clkc";
>>> +      reg = <0xfe008000 0x1e8>;
>>> +      clocks = <&xtal>;
>>> +      clock-names = "xtal";
>>> +      #clock-cells = <1>;
>>> +    };
>>> +
>>> +...
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index f61eb221415b..26c82beeffda 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -1897,6 +1897,7 @@ L:	linux-amlogic@lists.infradead.org
>>>   S:	Maintained
>>>   F:	Documentation/devicetree/bindings/clock/amlogic*
>>>   F:	drivers/clk/meson/
>>> +F:	include/dt-bindings/clock/amlogic*
>>>   F:	include/dt-bindings/clock/gxbb*
>>>   F:	include/dt-bindings/clock/meson*
>>>   diff --git a/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
>>> b/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
>>> new file mode 100644
>>> index 000000000000..bbec5094d5c3
>>> --- /dev/null
>>> +++ b/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
>>> @@ -0,0 +1,131 @@
>>> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
>> Unusual license... are you sure to license the bindings under GPLv4 or
>> GPLv5? Fine by me.
>> 
>
> Yes.
>
>> Best regards,
>> Krzysztof
>> 

