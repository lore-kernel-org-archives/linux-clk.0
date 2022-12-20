Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC5B6C4332F
	for <linux-clk@archiver.kernel.org>; Tue, 20 Dec 2022 14:20:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233895AbiLTOUP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 20 Dec 2022 09:20:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233929AbiLTOTR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 20 Dec 2022 09:19:17 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFA911C412;
        Tue, 20 Dec 2022 06:19:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A322AB811A0;
        Tue, 20 Dec 2022 14:19:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4C51C433EF;
        Tue, 20 Dec 2022 14:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671545939;
        bh=ZmYhdJ0NiW7EgZkM2EweGEW6KjCP+AMI/uCG55uUssM=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=eU8BPN0PRRWn9a82TyBa0dPJVZC0sYs0y+G4R57qOgVz4FoRMys6McYz1ClQ3AAbP
         y/y7hxaZwinXVxnObhFB/ckqKO0ndUEx4LRgHXOdl9ZDdqVgACFgubKCCzPcegtAfl
         1n1/rnxWAYHq6nJdVF04svoQ6chU446ToA7DyxplC+5psMg+V4LTng+bHLZ8Y7p1a/
         V2zcpS78dUPYsQpzFKT6GbvIl3O4wDiT8nsIgfrYdIxdjljrsUyUjuiX2TCIQfTna5
         kmd6sWfOROKk0C5eT92N6ey1YUkSALO/yKjpAhgXKwsdGUxK8G3jiHbPuOXWI4eUpP
         wHmdYtSKGhi0Q==
Message-ID: <9b09cb33-2e47-7597-72b0-fdceb30985f0@kernel.org>
Date:   Tue, 20 Dec 2022 15:18:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/2] dt-bindings: clk: si521xx: Add Skyworks Si521xx I2C
 PCIe clock generators
Content-Language: en-US
To:     Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org
References: <20221216212158.600220-1-marex@denx.de>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20221216212158.600220-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16/12/2022 22:21, Marek Vasut wrote:
> Add binding for Skyworks Si521xx PCIe clock generators. This binding
> is designed to support Si52144/Si52146/Si52147 series I2C PCIe clock
> generators, tested model is Si52144. It should be possible to add
> Si5213x series as well.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: devicetree@vger.kernel.org

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

> ---
>  .../bindings/clock/skyworks,si521xx.yaml      | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/skyworks,si521xx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/skyworks,si521xx.yaml b/Documentation/devicetree/bindings/clock/skyworks,si521xx.yaml
> new file mode 100644
> index 0000000000000..c30114e3a7631
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/skyworks,si521xx.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/skyworks,si521xx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Binding for Skyworks Si521xx I2C PCIe clock generators

Drop "Binding for"


> +
> +description: |
> +  The Skyworks Si521xx are I2C PCIe clock generators providing
> +  from 4 to 9 output clocks.
> +
> +maintainers:
> +  - Marek Vasut <marex@denx.de>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - skyworks,si52144
> +      - skyworks,si52146
> +      - skyworks,si52147
> +
> +  reg:
> +    description: I2C device address

Drop description. It seems you copied some old binding. Better to start
from something recent or example-schema.

> +    const: 0x6b
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  clocks:
> +    items:
> +      - description: XTal input clock
> +
> +  skyworks,out-amplitude-microvolt:
> +    enum: [ 300000, 400000, 500000, 600000, 700000, 800000, 900000, 1000000 ]
> +    description: Output clock signal amplitude
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

Drop this part, it's obvious. Example should show how to use this
device, not fixed clocks. It is a common pattern appearing in many DTSes.

> +
> +    i2c@0 {
> +        reg = <0x0 0x100>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        clock-generator@6b {
> +            compatible = "skyworks,si52144";
> +            reg = <0x6b>;
> +            #clock-cells = <1>;
> +
> +            clocks = <&ref25m>;
> +        };
> +    };
> +
> +...

Best regards,
Krzysztof

