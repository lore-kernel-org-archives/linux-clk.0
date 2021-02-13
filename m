Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A39C433E6
	for <linux-clk@archiver.kernel.org>; Sat, 13 Feb 2021 00:12:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E98E64D9F
	for <linux-clk@archiver.kernel.org>; Sat, 13 Feb 2021 00:12:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231883AbhBMAM2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Feb 2021 19:12:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:53920 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231359AbhBMAMY (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 12 Feb 2021 19:12:24 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D7CC164D9F;
        Sat, 13 Feb 2021 00:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613175102;
        bh=W5mqhJw/vD571Lp52G+EOS8mpoi2heiRVEQNv5Eq7hA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=dLvoGBnwI2zJydNtYVepNfX49aKGUnzvPVEVTkD72FnWmfJuk7lelOB1JN3JQYyc/
         vTEmQIMJnnq6P7wYrq+wpTWHNXRyJxZSFkeOrYQ3cFSXTu9WTJwKtXwaPS40tO8Lpl
         mOQsNovPeaCc3KouJEC/aQ3JEMwrx4dzdhkhm9mbFCx+vp61O27Fz+exFgMwrrc/nw
         p4JSoGZBNXSD9b7rDc4N94PvDijMH4YATIFOr21Ozj1m1vm7uaLnBps4Bxdf89M/8C
         iY1ANmOMhLdRo/31nTZzkJWkp5f6+b7YbulELK7YMC34g9oPEAQnmebRC1zwJ2poko
         /RWMMCfqPR5TQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210212111649.3251306-2-daniel@0x0f.com>
References: <20210212111649.3251306-1-daniel@0x0f.com> <20210212111649.3251306-2-daniel@0x0f.com>
Subject: Re: [RFC PATCH 1/1] dt-bindings: clk: Mstar msc313 clkgen mux
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Daniel Palmer <daniel@0x0f.com>
To:     Daniel Palmer <daniel@0x0f.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Date:   Fri, 12 Feb 2021 16:11:41 -0800
Message-ID: <161317510165.1254594.14810451393733659018@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Daniel Palmer (2021-02-12 03:16:49)
> Add a devicetree binding yaml for the clkgen muxes used
> in various places in MStar/SigmaStar SoCs.
>=20
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> ---

Don't need a cover letter for a single patch.

>  .../clock/mstar,msc313-clkgen-mux.yaml        | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/mstar,msc313-=
clkgen-mux.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/clock/mstar,msc313-clkgen-=
mux.yaml b/Documentation/devicetree/bindings/clock/mstar,msc313-clkgen-mux.=
yaml
> new file mode 100644
> index 000000000000..7f2ff72a601f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/mstar,msc313-clkgen-mux.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/mstar,msc313-clkgen-mux.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MStar/Sigmastar MSC313 CLKGEN mux
> +
> +maintainers:
> +  - Daniel Palmer <daniel@thingy.jp>
> +
> +description: |
> +  The MStar/SigmaStar MSC313 and later ARMv7 chips has a number of
> +  "CLKGEN"s. Some in the pm area, some in the standard peripheral area
> +  and some in the "scaler" area. Inside of these CLKGENs there are
> +  muxes that either connect the output to an always on clock
> +  (deglitch) or one of a number of clocks that are selectable via
> +  a mux. Each of these muxes also includes a gate for the output.
> +  Most of these are in a nice block with multiple muxes in a single
> +  register. Some of them are embedded within blocks of unrelated
> +  registers like in the pm area. Some seem to be embedded in registers
> +  with unrelated bits. For this reason a syscon is used to access the
> +  registers.
> +
> +properties:
> +  compatible:
> +    const: mstar,msc313-clkgen-mux
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  clocks:
> +    description: |
> +      List of clock sources for this mux. If the mux has a deglitch
> +      bit the last entry should be the source of the deglitch clock.
> +
> +  offset:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Offset in the register map for the mux register (in byt=
es).
> +
> +  regmap:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      Phandle to the register map node.
> +
> +  mstar,gate:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Bit position for the gate bit.
> +
> +  mstar,deglitch:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Bit position of the deglitch bit for muxes that have on=
e.
> +
> +  mstar,mux-shift:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Left shift value for the mux bits.
> +
> +  mstar,mux-width:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: The width of the mux bits.
> +
> +required:
> +  - compatible
> +  - "#clock-cells"
> +  - clocks
> +  - offset
> +  - regmap
> +  - mstar,gate
> +  - mstar,mux-shift
> +  - mstar,mux-width
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clkgen_mux_mspi0: clkgen_mux_mspi0 {
> +      compatible =3D "mstar,msc313-clkgen-mux";
> +      regmap =3D <&clkgen>;
> +      offset =3D <0xcc>;
> +      #clock-cells =3D <1>;
> +      mstar,gate =3D <0>;
> +      mstar,mux-shift =3D <2>;
> +      mstar,mux-width =3D <2>;

It looks like a node-per clk sort of binding which has been rejected
multiple times in the past. If the clks are spread across various
devices then it sounds like the mediatek design where they have many
syscon nodes that also register clks inside those register spaces. In
this case, I would expect the clkgen node to be registering clks. Given
that there isn't a reg property and there's these mstar specific
properties like shift/width it looks really wrong. Please don't do this.

> +      clocks =3D <&clk_mpll_div2_div2>,
> +               <&clk_mpll_div2_div4>,
> +               <&xtal12>;
> +    };
> --
