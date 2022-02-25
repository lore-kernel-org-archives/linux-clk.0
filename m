Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78ECFC433FE
	for <linux-clk@archiver.kernel.org>; Fri, 25 Feb 2022 18:48:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232714AbiBYSsq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Feb 2022 13:48:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232773AbiBYSso (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Feb 2022 13:48:44 -0500
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65EA3B3E;
        Fri, 25 Feb 2022 10:48:11 -0800 (PST)
Received: by mail-oo1-f44.google.com with SMTP id k13-20020a4a948d000000b003172f2f6bdfso7524230ooi.1;
        Fri, 25 Feb 2022 10:48:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TiRDmTRC748lY/e5kUiX3f9gibT5mBN/laLDJyTow8c=;
        b=WNAUk2MuGpKCf84bnrhkVWExlm8oh2f/RwlWFG+BWbN9N9v3jQzwPU2PvIRaZRL9ez
         HYjG/OMleSlBmEy6vq0Cqwc8VSj97hdmiW5OB35Iyb8lOmMPp/MvMrg9f2DHI0qfgthY
         PDeGTdsL+yEzD1QzXd2eLPCvVqPzWlMf0xAI1xRezrNyfqEp7wdMSCNgRFga8CKubLVZ
         Ea6Drdm+I6Ot+VtUjt2J/R+dDkTHJXVKIYDim1AB2kNPXGf+tzwm29yWIl7xFRnwziaA
         qzNsy0NN0i7cErduC/EHcEM/vGZx9H5b2Q8lcOLUU6obqZlHS3i9NtK9kloW7BiO65hg
         ZvLA==
X-Gm-Message-State: AOAM531vbHHSzBEvRjouc5js5EtqhunLce7tOfVRWd8fRt0VGXCaz6QF
        BlUDZz2+Ab62+IPViGRVHE4R6mNmuA==
X-Google-Smtp-Source: ABdhPJygYCfmcB2HkeYmuFV2qlbUOU1ve+6vkjYK3qkVDSSwrOym4GfoWRXoqMfXa0c0pJ1tTq2dAQ==
X-Received: by 2002:a05:6870:5aac:b0:d6:dc75:fea2 with SMTP id dt44-20020a0568705aac00b000d6dc75fea2mr2144336oab.212.1645814890706;
        Fri, 25 Feb 2022 10:48:10 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id r41-20020a056870582900b000d6cbaf589esm1682787oap.40.2022.02.25.10.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 10:48:10 -0800 (PST)
Received: (nullmailer pid 1232001 invoked by uid 1000);
        Fri, 25 Feb 2022 18:47:09 -0000
Date:   Fri, 25 Feb 2022 12:47:09 -0600
From:   Rob Herring <robh@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: clk: rs9: Add Renesas 9-series I2C
 PCIe clock generator
Message-ID: <YhkkLTqc8igZ9kzh@robh.at.kernel.org>
References: <20220219015003.507601-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220219015003.507601-1-marex@denx.de>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, Feb 19, 2022 at 02:50:01AM +0100, Marek Vasut wrote:
> Add binding for Renesas 9-series PCIe clock generators. This binding
> is designed to support 9FGV/9DBV/9DMV/9FGL/9DML/9QXL/9SQ series I2C
> PCIe clock generators, currently the only tested and supported chip
> is 9FGV0241.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: devicetree@vger.kernel.org
> To: linux-clk@vger.kernel.org
> ---
> V2: - Drop clock consumer from the binding example
>     - Make clocks, i.e. xtal, mandatory
> ---
>  .../bindings/clock/renesas,9series.yaml       | 96 +++++++++++++++++++
>  1 file changed, 96 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/renesas,9series.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/renesas,9series.yaml b/Documentation/devicetree/bindings/clock/renesas,9series.yaml
> new file mode 100644
> index 0000000000000..8eb56f38d99e9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/renesas,9series.yaml
> @@ -0,0 +1,96 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/renesas,9series.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Binding for Renesas 9-series I2C PCIe clock generators
> +
> +description: |
> +  The Renesas 9-series are I2C PCIe clock generators providing
> +  from 1 to 20 output clocks.
> +
> +  When referencing the provided clock in the DT using phandle
> +  and clock specifier, the following mapping applies:
> +
> +  - 9FGV0241:
> +    0 -- DIF0
> +    1 -- DIF1
> +
> +maintainers:
> +  - Marek Vasut <marex@denx.de>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,9fgv0241
> +
> +  reg:
> +    description: I2C device address
> +    enum: [ 0x68, 0x6a ]
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  clocks:
> +    items:
> +      - description: XTal input clock
> +
> +  renesas,out-amplitude:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 600000, 700000, 800000, 900000 ]
> +    description: Output clock signal amplitude in uV

Use the standard unit suffix, -microvolt.

> +
> +  renesas,out-spread-spectrum:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 100000, 99750, 99500 ]
> +    description: Output clock down spread in pcm

pcm?

> +
> +patternProperties:
> +  "^DIF[0-19]$":
> +    type: object
> +    description:
> +      Description of one of the outputs (DIF0..DIF19).

blank line

> +    properties:
> +      renesas,slew-rate:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [ 2000000, 3000000 ]
> +        description: Output clock slew rate select in V/ns

blank line

> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    /* 25MHz reference crystal */
> +    ref25: ref25m {
> +        compatible = "fixed-clock";
> +        #clock-cells = <0>;
> +        clock-frequency = <25000000>;
> +    };
> +
> +    i2c@0 {
> +        reg = <0x0 0x100>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        rs9: clock-generator@6a {
> +            compatible = "renesas,9fgv0241";
> +            reg = <0x6a>;
> +            #clock-cells = <1>;
> +
> +            clocks = <&ref25m>;
> +
> +            DIF0 {
> +                renesas,slew-rate = <3000000>;
> +            };
> +        };
> +    };
> +
> +...
> -- 
> 2.34.1
> 
> 
