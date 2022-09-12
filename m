Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 152BBC6FA82
	for <linux-clk@archiver.kernel.org>; Mon, 12 Sep 2022 19:46:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbiILTqb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Sep 2022 15:46:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbiILTqa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Sep 2022 15:46:30 -0400
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38E6347B80;
        Mon, 12 Sep 2022 12:46:29 -0700 (PDT)
Received: by mail-ot1-f45.google.com with SMTP id t8-20020a9d5908000000b0063b41908168so6586801oth.8;
        Mon, 12 Sep 2022 12:46:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=fm5bPtneHW7sGF3CxsmjRWFYrIwe2I803tgYA+S1Ptk=;
        b=CUfxvJcoxXE9hgQoty1GiahXVAV0qsSaGAH8s+31qFz0tqqm3es9b3Kf24KtDB6Pnj
         6GPRNV83jRKbNdTgqyfU0GuiEtH7uUVgVsPlGQvxnjF5irvvqEyNWQy/mACmGXCfR+sN
         rfT+uLJ1lBdVCkMny9ytyYTzAPrzxVCAb5wY3/iBjkHanLJN7OTltG9j4pJbHNT2486s
         XsV0B0GSBRsvLFIaXiR7T5819vllJVjRrTODyg+FoGcR/B/P82PatE4KvKv0EAtTEaMK
         aP69+NgNpmMyRXTKZontWEoY2er70P3rXvL0Qaf1Waf1NUerkRJMT4RlHvkDyRweR6i2
         xKtA==
X-Gm-Message-State: ACgBeo0j+aNFRolP1xmJroLWScK6AzalkE3q+wMhSrA/WKSNxlduRmUe
        ju65JJR2Wc0kVE/BzntAVw==
X-Google-Smtp-Source: AA6agR5nMVJJBnc7j0bzhEyfc8Sxw0CW8vby1Jit5kU9podnIKLYJq/RHRPx27ltLuTc9Bm85IOlzA==
X-Received: by 2002:a9d:386:0:b0:655:ced8:8e43 with SMTP id f6-20020a9d0386000000b00655ced88e43mr4391360otf.62.1663011988269;
        Mon, 12 Sep 2022 12:46:28 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t6-20020a4a8246000000b0044b491ccf97sm4499403oog.25.2022.09.12.12.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 12:46:27 -0700 (PDT)
Received: (nullmailer pid 1718508 invoked by uid 1000);
        Mon, 12 Sep 2022 19:46:26 -0000
Date:   Mon, 12 Sep 2022 14:46:26 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sean Anderson <sean.anderson@seco.com>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Madalin Bucur <madalin.bucur@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Camelia Alexandra Groza <camelia.groza@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/8] dt-bindings: phy: Add Lynx 10G phy binding
Message-ID: <20220912194626.GA1687952-robh@kernel.org>
References: <20220902213721.946138-1-sean.anderson@seco.com>
 <20220902213721.946138-3-sean.anderson@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220902213721.946138-3-sean.anderson@seco.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Sep 02, 2022 at 05:37:15PM -0400, Sean Anderson wrote:
> This adds a binding for the SerDes module found on QorIQ processors.
> Each phy is a subnode of the top-level device, possibly supporting
> multiple lanes and protocols. This "thick" #phy-cells is used due to
> allow for better organization of parameters. Note that the particular
> parameters necessary to select a protocol-controller/lane combination
> vary across different SoCs, and even within different SerDes on the same
> SoC.
> 
> The driver is designed to be able to completely reconfigure lanes at
> runtime. Generally, the phy consumer can select the appropriate
> protocol using set_mode.
> 
> There are two PLLs, each of which can be used as the master clock for
> each lane. Each PLL has its own reference. For the moment they are
> required, because it simplifies the driver implementation. Absent
> reference clocks can be modeled by a fixed-clock with a rate of 0.
> 
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> ---
> 
> (no changes since v4)
> 
> Changes in v4:
> - Use subnodes to describe lane configuration, instead of describing
>   PCCRs. This is the same style used by phy-cadence-sierra et al.
> 
> Changes in v3:
> - Manually expand yaml references
> - Add mode configuration to device tree
> 
> Changes in v2:
> - Rename to fsl,lynx-10g.yaml
> - Refer to the device in the documentation, rather than the binding
> - Move compatible first
> - Document phy cells in the description
> - Allow a value of 1 for phy-cells. This allows for compatibility with
>   the similar (but according to Ioana Ciornei different enough) lynx-28g
>   binding.
> - Remove minItems
> - Use list for clock-names
> - Fix example binding having too many cells in regs
> - Add #clock-cells. This will allow using assigned-clocks* to configure
>   the PLLs.
> - Document the structure of the compatible strings
> 
>  .../devicetree/bindings/phy/fsl,lynx-10g.yaml | 236 ++++++++++++++++++
>  1 file changed, 236 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml b/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
> new file mode 100644
> index 000000000000..59417e6172d7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
> @@ -0,0 +1,236 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/fsl,lynx-10g.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP Lynx 10G SerDes
> +
> +maintainers:
> +  - Sean Anderson <sean.anderson@seco.com>
> +
> +description: |
> +  These Lynx "SerDes" devices are found in NXP's QorIQ line of processors. The
> +  SerDes provides up to eight lanes. Each lane may be configured individually,
> +  or may be combined with adjacent lanes for a multi-lane protocol. The SerDes
> +  supports a variety of protocols, including up to 10G Ethernet, PCIe, SATA, and
> +  others. The specific protocols supported for each lane depend on the
> +  particular SoC.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - fsl,ls1046a-serdes
> +          - fsl,ls1088a-serdes
> +      - const: fsl,lynx-10g
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  "#clock-cells":
> +    const: 1
> +    description: |
> +      The cell contains an ID as described in dt-bindings/clock/fsl,lynx-10g.h.
> +      Note that when assigning a rate to a PLL, the PLL's rate is divided by
> +      1000 to avoid overflow. A rate of 5000000 corresponds to 5GHz.
> +
> +  clocks:
> +    maxItems: 2
> +    description: |
> +      Clock for each PLL reference clock input.
> +
> +  clock-names:
> +    minItems: 2
> +    maxItems: 2
> +    items:
> +      enum:
> +        - ref0
> +        - ref1
> +
> +  reg:
> +    maxItems: 1
> +
> +patternProperties:
> +  '^phy@':
> +    type: object
> +
> +    description: |
> +      A contiguous group of lanes which will be configured together. Each group
> +      corresponds to one phy device. Lanes not described by any group will be
> +      left as-is.
> +
> +    properties:
> +      "#phy-cells":
> +        const: 0
> +
> +      reg:
> +        minItems: 1
> +        maxItems: 8
> +        description:
> +          The lanes in the group. These must be listed in order. The first lane
> +          will have the FIRST_LANE bit set in GCR0. The order of lanes also
> +          determines the reset order (TRSTDIR).
> +
> +    patternProperties:
> +      '^(q?sgmii|xfi)':
> +        type: object
> +
> +        description: |
> +          A protocol controller which may control the group of lanes. Each
> +          controller is selected through the PCCRs. In addition to protocols
> +          desired for use by the OS, protocols which may have been configured
> +          by the bootloader must also be described. This ensures that only one
> +          protocol controller is attached to a group of lanes at once.
> +
> +        properties:
> +          fsl,pccr:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            description: |
> +              The index of the PCCR which configures this protocol controller.
> +              This is the same as the register name suffix. For example, PCCR8
> +              would use a value of 8 for an offset of 0x220 (0x200 + 4 * 8).
> +
> +          fsl,index:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            description: |
> +              The index of the protocol controller. This corresponds to the
> +              suffix in the documentation. For example, PEXa would be 0, PEXb
> +              1, etc. Generally, higher fields occupy lower bits.
> +
> +          fsl,cfg:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            minimum: 1
> +            description: |
> +              The configuration value to program into the protocol controller
> +              field.
> +
> +          fsl,type:

Use the common 'phy-type' here.

I don't love this binding, but it seems using phy cells here doesn't 
work and I don't have other suggestions. At the end of the day, it's 
just one device. I'll be less enthusiastic on the next one.

With the above change,

Reviewed-by: Rob Herring <robh@kernel.org>

Rob
