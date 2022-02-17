Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A785C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 17 Feb 2022 23:47:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbiBQXsA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Feb 2022 18:48:00 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:59632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbiBQXr7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Feb 2022 18:47:59 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03EE137A429;
        Thu, 17 Feb 2022 15:47:38 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 20319618F5;
        Thu, 17 Feb 2022 23:39:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C8ABC340E8;
        Thu, 17 Feb 2022 23:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645141194;
        bh=i+sxzCX0Bfe/BG5rfiKh5UAxg+Z4BhJECi8C+Ih352U=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=YJArVd3/AdKHXuZDc4JDhag1w5xv5ioFy/DQtRHA6RogfkGOoiUhKI+K3DcqbFQ0Y
         R2RtPcRRC5uicsJMNimBQzyEECBOtyjR02ast5uYNvhVMzfboOXJMyJogd598PCTe1
         6eZnWPtRB7iBMQH1v3dYZxeukakEu1o+ayxEvoURQffZHiaya6ZZBQDZFEO5tIwds7
         TO86VJ5Zk8B+9yTuCLZkGkZZFN4dEKO1fQjcs9hXEAXBKzd+9D4HCOUMJLIcupTwwN
         GB3tVb8CupGvuLGn9Knx6ZXKLrpp2pu67/qySc5hmqJcMelSbSrW/lYMyux6b7q2Zy
         9q1Os6UnpVyCg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220213173310.152230-1-marex@denx.de>
References: <20220213173310.152230-1-marex@denx.de>
Subject: Re: [PATCH 1/2] dt-bindings: clk: rs9: Add Renesas 9-series I2C PCIe clock generator
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, Marek Vasut <marex@denx.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
To:     Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org
Date:   Thu, 17 Feb 2022 15:39:51 -0800
User-Agent: alot/0.10
Message-Id: <20220217233954.6C8ABC340E8@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marek Vasut (2022-02-13 09:33:09)
> diff --git a/Documentation/devicetree/bindings/clock/renesas,9series.yaml=
 b/Documentation/devicetree/bindings/clock/renesas,9series.yaml
> new file mode 100644
> index 0000000000000..774053748d9f0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/renesas,9series.yaml
> @@ -0,0 +1,102 @@
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
> +
> +  renesas,out-spread-spectrum:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 100000, 99750, 99500 ]
> +    description: Output clock down spread in pcm
> +
> +patternProperties:
> +  "^DIF[0-19]$":
> +    type: object
> +    description:
> +      Description of one of the outputs (DIF0..DIF19).
> +    properties:
> +      renesas,slew-rate:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [ 2000000, 3000000 ]
> +        description: Output clock slew rate select in V/ns
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'

Can it operate without an input xtal?

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    /* 25MHz reference crystal */
> +    ref25: ref25m {
> +        compatible =3D "fixed-clock";
> +        #clock-cells =3D <0>;
> +        clock-frequency =3D <25000000>;
> +    };
> +
> +    i2c@0 {
> +        reg =3D <0x0 0x100>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        rs9: clock-generator@6a {
> +            compatible =3D "renesas,9fgv0241";
> +            reg =3D <0x6a>;
> +            #clock-cells =3D <1>;
> +
> +            clocks =3D <&ref25m>;
> +
> +            DIF0 {
> +                renesas,slew-rate =3D <3000000>;
> +            };
> +        };
> +    };
> +
> +    /* Consumer referencing the 9FGV0241 pin DIF0 */

Consumers are typically left out of clk bindings.

> +    consumer {
> +        /* ... */
> +        clocks =3D <&rs9 0>;
> +        /* ... */
> +    };
> +
> +...
> --=20
> 2.34.1
>
