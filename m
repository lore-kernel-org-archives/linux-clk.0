Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A9E4C4332F
	for <linux-clk@archiver.kernel.org>; Wed, 16 Nov 2022 22:09:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234000AbiKPWJ5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Nov 2022 17:09:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233476AbiKPWJ4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Nov 2022 17:09:56 -0500
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3B9A6A6B0;
        Wed, 16 Nov 2022 14:09:55 -0800 (PST)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-13b6c1c89bdso45858fac.13;
        Wed, 16 Nov 2022 14:09:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jw1yoo+4ZX3f+L+425h9MTVqYZoAVRJPKumy0cdjiik=;
        b=HNUJ2mX+Id3oCTVfspQvtk7nOmqucvB7ImFIVHLgJUf6dV/aL6iJkqwbuJkuWp7S/q
         MqXqeY19gDbz41MOR/hQGy/RPi8HGiaRQyLIWYMjPOfVz7qmwZxy7DcBdC8D7Z9v/JHP
         neoGc19NO/1E6dSySJ3kuK+WOvy0zBlV0CcsLjRJSlZUOL6ZVy9ialWJ2qy4ofs8Cho3
         fz8MkPGIbKZDkY0p2+TeITdKQegVoaOQNAwiHc+ZtVmZC3brp0ZL6RrDSK0/ruptbHLt
         B5n2GnR9muBQFbWckfB9MklxuN8Ly7BOUHOWn+quVQXMLw0ajx89XgqSc90zlpCSqTaI
         Q1Fw==
X-Gm-Message-State: ANoB5pkeBISPfqwW4hDj+pOew9zC6jwHT/LD20f7yqWPovAiR4gC6s08
        KQd2nVQrsQnxDYBO1QcN0A==
X-Google-Smtp-Source: AA0mqf6KH0l9o34qBzHvTxvjSR3iS8elJHxabA2vJ4mabAS8T1L5xJ7HXS0sBGcq91Uh8+qUbwprwA==
X-Received: by 2002:a05:6870:cb94:b0:13b:f801:efab with SMTP id ov20-20020a056870cb9400b0013bf801efabmr2933982oab.193.1668636593970;
        Wed, 16 Nov 2022 14:09:53 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z19-20020a0568301db300b006690f65a830sm7011617oti.14.2022.11.16.14.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 14:09:53 -0800 (PST)
Received: (nullmailer pid 1110375 invoked by uid 1000);
        Wed, 16 Nov 2022 22:09:55 -0000
Date:   Wed, 16 Nov 2022 16:09:55 -0600
From:   Rob Herring <robh@kernel.org>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc:     linux-clk@vger.kernel.org, git@amd.com, devicetree@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, michal.simek@xilinx.com,
        shubhrajyoti.datta@gmail.com, sboyd@kernel.org,
        mturquette@baylibre.com
Subject: Re: [PATCH v2 1/2] dt-bindings: clk: Add binding for versal clocking
 wizard
Message-ID: <20221116220955.GA1042427-robh@kernel.org>
References: <20221115145005.4747-1-shubhrajyoti.datta@amd.com>
 <20221115145005.4747-2-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221115145005.4747-2-shubhrajyoti.datta@amd.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Nov 15, 2022 at 08:20:04PM +0530, Shubhrajyoti Datta wrote:
> The Clocking Wizard for Versal adaptive compute acceleration platforms
> generates multiple configurable number of clock outputs.
> Add device tree binding for Versal clocking wizard support.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
> 
> Changes in v2:
> rename the clocks clk_in1 to in1 and s_axi_clk to s_axi in dt

Why? Now you don't match the other clocking wizard. Yes, 'clk' is kind 
of redundant, but making up different names for each version of h/w is 
worse.

What happened to using the same schema file so we aren't defining the 
same property (xlnx,nr-outputs) twice?

> Update the compatible to reflect versal
> 
>  .../clock/xlnx,versal-clk-wizard.yaml         | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/xlnx,versal-clk-wizard.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk-wizard.yaml b/Documentation/devicetree/bindings/clock/xlnx,versal-clk-wizard.yaml
> new file mode 100644
> index 000000000000..aaba91a57713
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/xlnx,versal-clk-wizard.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/xlnx,versal-clk-wizard.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Xilinx Versal clocking wizard
> +
> +maintainers:
> +  - Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> +
> +description:
> +  The clocking wizard is a soft ip clocking block of Xilinx Versal. The IP
> +  uses the input clock frequencies and generates the requested
> +  clock output.
> +
> +properties:
> +  compatible:
> +    const: xlnx,versal-clk-wizard
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  clocks:
> +    description: External input clocks to the given clock controller.
> +    items:
> +      - description: functional clock input
> +      - description: axi clock or the interface clock
> +
> +  clock-names:
> +    items:
> +      - const: in1
> +      - const: s_axi
> +
> +  xlnx,nr-outputs:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    maximum: 8
> +    description:
> +      Number of outputs.
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#clock-cells"
> +  - clocks
> +  - clock-names
> +  - xlnx,nr-outputs
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-generator@40040000 {
> +        compatible = "xlnx,versal-clk-wizard";
> +        reg = <0x40040000 0x1000>;
> +        #clock-cells = <1>;
> +        clocks = <&clkc 15>, <&clkc 15>;
> +        clock-names = "in1", "s_axi";
> +        xlnx,nr-outputs = <6>;
> +    };
> +...
> -- 
> 2.17.1
> 
> 
