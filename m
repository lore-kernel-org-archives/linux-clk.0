Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 257D4C433F5
	for <linux-clk@archiver.kernel.org>; Fri, 30 Sep 2022 12:26:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230282AbiI3M0A (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Sep 2022 08:26:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231727AbiI3MZq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Sep 2022 08:25:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48D70A3D37;
        Fri, 30 Sep 2022 05:25:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A4F316231C;
        Fri, 30 Sep 2022 12:25:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14CD2C433B5;
        Fri, 30 Sep 2022 12:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664540740;
        bh=jaFHJbthRg/7oVUoCPCdosVEyKRFA6i68ZVYRNWMh9w=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=AA/1o6j5eYke9lQxbL9Rt795Y2Axw9/4HAcvsXZHMCrDINHq5CZqh7NwAyjauAI9B
         3Jx6Kh5+bCbbdepYuFs9C5zvAAKxiFrGOYy+9Kw1gUjVAYTlShv24Thnzec97ndnCT
         bG6YRy7pqWaxO2HOFVxwNSYgEYNFmZsfLZhfLQTaPtPIgt7Qbv2mCjJaIdibROk4fR
         H0mQTnMdXoIi2mK5Y5mjpaxdbR7IUCk9YTRgBFmleI0UBmC7IT9b+nakJ33Qt/bONA
         5EC6lAhw8qd7MrYBfm4OuLNzrWj6hkAkLTHKMQ+dIIY6hLPN98GJdKttM6aoH4fT7M
         0jmgy2ijHd/Rg==
Received: by mail-vk1-f174.google.com with SMTP id b15so2162063vkp.2;
        Fri, 30 Sep 2022 05:25:40 -0700 (PDT)
X-Gm-Message-State: ACrzQf30f3VUpuVnL4gRgmFB+5qWXeyj/92g3mU2cGSZc3TGNmZNPAxk
        +iQvjLhby1D7TkyVMnfVdXODgI3NX855YTQveQ==
X-Google-Smtp-Source: AMsMyM6UwFdDAXEcaxuQqwtp701//96NO2bvEUBg9jYqHqvCmJRamGq/9WU3ZvCLI0jfm/n5QlNlUEXbwMpeysC8vvk=
X-Received: by 2002:a1f:240f:0:b0:3a3:7b48:81cd with SMTP id
 k15-20020a1f240f000000b003a37b4881cdmr4060522vkk.19.1664540739015; Fri, 30
 Sep 2022 05:25:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220930080400.15619-1-shubhrajyoti.datta@amd.com> <20220930080400.15619-2-shubhrajyoti.datta@amd.com>
In-Reply-To: <20220930080400.15619-2-shubhrajyoti.datta@amd.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 30 Sep 2022 07:25:27 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLaqjZeZd3c-fd9f5m-4OCXgOZcOu+paik9FV_eno5sLg@mail.gmail.com>
Message-ID: <CAL_JsqLaqjZeZd3c-fd9f5m-4OCXgOZcOu+paik9FV_eno5sLg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: clk: Add binding for versal clocking wizard
To:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc:     linux-clk@vger.kernel.org, git@amd.com, devicetree@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, sboyd@kernel.org,
        mturquette@baylibre.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Sep 30, 2022 at 3:04 AM Shubhrajyoti Datta
<shubhrajyoti.datta@amd.com> wrote:
>
> The Clocking Wizard for Versal adaptive compute acceleration platforms
> generates multiple configurable number of clock outputs.
> Add device tree binding for Versal clocking wizard support.

Really v1? I'm sure I heard of this wizard before.

What about this?:

drivers/staging/clocking-wizard/dt-binding.txt

That needs to be moved out of staging rather than adding a 2nd one.

>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
>
>  .../bindings/clock/xlnx,clk-wizard.yaml       | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/xlnx,clk-wizard.yaml
>
> diff --git a/Documentation/devicetree/bindings/clock/xlnx,clk-wizard.yaml b/Documentation/devicetree/bindings/clock/xlnx,clk-wizard.yaml
> new file mode 100644
> index 000000000000..41a6f4bcaccd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/xlnx,clk-wizard.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/xlnx,clk-wizard.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Xilinx Versal clocking wizard
> +
> +maintainers:
> +  - Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> +
> +description:
> +  The clocking wizard is a soft ip clocking block of Xilinx versal. The IP
> +  uses the input clock frequencies and generates the requested
> +  clock output.
> +
> +properties:
> +  compatible:
> +    const: xlnx,clk-wizard-1.0

Where does 1.0 come from? A 1.0 always feels made up. This should be
based on some IP versioning that's documented somewhere.


> +
> +  reg:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  clocks:
> +    description: List of clock specifiers which are external input
> +      clocks to the given clock controller.
> +    items:
> +      - description: functional clock input
> +      - description: axi clock or the interface clock
> +
> +  clock-names:
> +    items:
> +      - const: clk_in1
> +      - const: s_axi_aclk
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
> +        compatible = "xlnx,clk-wizard-1.0";
> +        reg = <0x40040000 0x1000>;
> +        #clock-cells = <1>;
> +        clocks = <&clkc 15>, <&clkc 15>;
> +        clock-names = "clk_in1", "s_axi_aclk";
> +        xlnx,nr-outputs = <6>;
> +    };
> +...
> --
> 2.17.1
>
