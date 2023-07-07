Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6269EB64D9
	for <linux-clk@archiver.kernel.org>; Fri,  7 Jul 2023 22:28:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230289AbjGGW2E (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Jul 2023 18:28:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbjGGW2D (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 7 Jul 2023 18:28:03 -0400
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A6ED2125;
        Fri,  7 Jul 2023 15:28:01 -0700 (PDT)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3456fda4ed1so9799615ab.0;
        Fri, 07 Jul 2023 15:28:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688768881; x=1691360881;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=56EyUDBChnxdpTRKBdVO1sD+qiaQ0xjE0Q15UIHjxIs=;
        b=Dbz9zRwDSsaOxnx+7qubb1di/gbhm5okPgK20EXCdwB4RAbwNOy2E01N96n4xhHA4k
         uiT4IxJUqASxkhUN408v3PbJwjtIzvoH+FnzEFP2IoVGQerlyoA87hpxEJvABf1bFdig
         JQDL2wC1gs+svY+qSA2AU3ApZIg6A++bMEmYhA4SuK9JgSwkxpNgMmIWgCRyklCownWc
         3u4Ewyf28ncu0LE336IUPpm8ztZcNTdT4bhaQ6Za6L0wOm0tuaReQ3T41Kbe5u5IG+Cz
         mCooPbswhI5+sZVNCOOHEb0gDyCYJPcBErtL4YGp1Bk7iGIArl/QPp0ffu8x3TH9pv2a
         jWGg==
X-Gm-Message-State: ABy/qLbj7KtgzUbbCVRZHtrN68MtNyAaDDxYej7JhbRYtdmYUYpHfo3O
        WWQG7wqOgic0+5yFVg3FOrZZs2EVaQ==
X-Google-Smtp-Source: APBJJlHtm1LZWONsuEnFS1vDREZaeD3Yc+orTzrojiYVEdy1ehcSWL8ksd8C5wr+Py66mMapMCJOZA==
X-Received: by 2002:a92:c803:0:b0:345:cc4d:bb7b with SMTP id v3-20020a92c803000000b00345cc4dbb7bmr6335723iln.6.1688768880773;
        Fri, 07 Jul 2023 15:28:00 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id e17-20020a92d751000000b00345d6e8ded4sm1589854ilq.25.2023.07.07.15.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 15:27:59 -0700 (PDT)
Received: (nullmailer pid 1083394 invoked by uid 1000);
        Fri, 07 Jul 2023 22:27:58 -0000
Date:   Fri, 7 Jul 2023 16:27:58 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] dt-bindings: clock: convert BCM53573 ILP clock to the
 json-schema
Message-ID: <20230707222758.GA1079635-robh@kernel.org>
References: <20230707130322.9375-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230707130322.9375-1-zajec5@gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Jul 07, 2023 at 03:03:22PM +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This helps validating DTS files.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  .../bindings/clock/brcm,bcm53573-ilp.txt      | 36 -------------
>  .../bindings/clock/brcm,bcm53573-ilp.yaml     | 51 +++++++++++++++++++
>  2 files changed, 51 insertions(+), 36 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm53573-ilp.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm53573-ilp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/brcm,bcm53573-ilp.txt b/Documentation/devicetree/bindings/clock/brcm,bcm53573-ilp.txt
> deleted file mode 100644
> index 2ebb107331dd..000000000000
> --- a/Documentation/devicetree/bindings/clock/brcm,bcm53573-ilp.txt
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -Broadcom BCM53573 ILP clock
> -===========================
> -
> -This binding uses the common clock binding:
> -    Documentation/devicetree/bindings/clock/clock-bindings.txt
> -
> -This binding is used for ILP clock (sometimes referred as "slow clock")
> -on Broadcom BCM53573 devices using Cortex-A7 CPU.
> -
> -ILP's rate has to be calculated on runtime and it depends on ALP clock
> -which has to be referenced.
> -
> -This clock is part of PMU (Power Management Unit), a Broadcom's device
> -handing power-related aspects. Its node must be sub-node of the PMU
> -device.
> -
> -Required properties:
> -- compatible: "brcm,bcm53573-ilp"
> -- clocks: has to reference an ALP clock
> -- #clock-cells: should be <0>
> -- clock-output-names: from common clock bindings, should contain clock
> -		      name
> -
> -Example:
> -
> -pmu@18012000 {
> -	compatible = "simple-mfd", "syscon";

Really, the binding for this block needs to be converted or added first. 
That means adding a specific compatible for the "pmu".

> -	reg = <0x18012000 0x00001000>;
> -
> -	ilp {
> -		compatible = "brcm,bcm53573-ilp";
> -		clocks = <&alp>;
> -		#clock-cells = <0>;
> -		clock-output-names = "ilp";

And this binding is simple enough it could be part of the parent 
binding, but either way is fine.

> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/clock/brcm,bcm53573-ilp.yaml b/Documentation/devicetree/bindings/clock/brcm,bcm53573-ilp.yaml
> new file mode 100644
> index 000000000000..648f68a53119
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/brcm,bcm53573-ilp.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/brcm,bcm53573-ilp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom BCM53573 ILP clock
> +
> +maintainers:
> +  - Rafał Miłecki <rafal@milecki.pl>
> +
> +description: |
> +  This binding is used for ILP clock (sometimes referred as "slow clock")
> +  on Broadcom BCM53573 devices using Cortex-A7 CPU.
> +
> +  ILP's rate has to be calculated on runtime and it depends on ALP clock
> +  which has to be referenced.
> +
> +  This clock is part of PMU (Power Management Unit), a Broadcom's device
> +  handing power-related aspects. Its node must be sub-node of the PMU
> +  device.
> +
> +properties:
> +  compatible:
> +    const: brcm,bcm53573-ilp
> +
> +  clocks:
> +    description: ALP clock
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 0
> +
> +  clock-output-names:
> +    const: ilp
> +
> +required:
> +  - clocks
> +  - "#clock-cells"
> +  - clock-output-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    ilp {

clock-controller {

> +      compatible = "brcm,bcm53573-ilp";
> +      clocks = <&alp>;
> +      #clock-cells = <0>;
> +      clock-output-names = "ilp";
> +    };
> -- 
> 2.35.3
> 
