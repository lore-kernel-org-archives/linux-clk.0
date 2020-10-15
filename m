Return-Path: <SRS0=IVDQ=DW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DEE3C43457
	for <linux-clk@archiver.kernel.org>; Thu, 15 Oct 2020 12:40:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1686622254
	for <linux-clk@archiver.kernel.org>; Thu, 15 Oct 2020 12:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602765627;
	bh=0rJQ6cGd0uRDdyR3/9XE4jn43MHOzVMce/xxRmONslg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=VqCBwh8HZOUtdTK5yzawgBJVk3aRGv2pCr0QUDZiTtDgyhCrSKnV9jJVoqd1zHW8y
	 5ttkpyAHEFt7H8BldtWTIS/WqILd3DxMj9YwpUJLKQYu6bwJcZUjP8IVl13aN64p6Q
	 HUxVlPxFAh9AG/BToBlQqL2ZgUivSaerSTQ+Di9c=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbgJOMk0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 15 Oct 2020 08:40:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:50214 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726103AbgJOMk0 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 15 Oct 2020 08:40:26 -0400
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C937F2225A;
        Thu, 15 Oct 2020 12:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602765625;
        bh=0rJQ6cGd0uRDdyR3/9XE4jn43MHOzVMce/xxRmONslg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=dxT35Qqckuw6U0DlIVaPxGcZd5AZYKK2wW1SUy5Dz/AzdD37YdFJbDaYTfeHfNMFi
         bGo21/+1uJYPuAiBjGcuoh4dLJHhhUWIinP10g3MBf7FHSPZLx7K4o6+2Pt3UkhujS
         KP94aPRazVwwZxDIr8cRxbSzXSftzZ97x37abbeA=
Received: by mail-ed1-f47.google.com with SMTP id l16so2962500eds.3;
        Thu, 15 Oct 2020 05:40:24 -0700 (PDT)
X-Gm-Message-State: AOAM533hUR8DvEH/MEqVeiBMYDTBstNpl2rfSL856J8+ih5Cgz3A07zo
        s6aQnAdG9M1cj86Bo15b5QhsKRPZz1a/qcJesCI=
X-Google-Smtp-Source: ABdhPJz3e1poHHwl5ccD63YPoQhRpIlopw6+wDA3f6llyTQ2vBmQ1XlX/7a26PVCRZf9CKzb/kStXU+lcik9GQ0Drdo=
X-Received: by 2002:a05:6402:22b7:: with SMTP id cx23mr4294418edb.246.1602765623219;
 Thu, 15 Oct 2020 05:40:23 -0700 (PDT)
MIME-Version: 1.0
References: <20201015114725.23137-1-daire.mcnamara@microchip.com> <20201015114725.23137-2-daire.mcnamara@microchip.com>
In-Reply-To: <20201015114725.23137-2-daire.mcnamara@microchip.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Thu, 15 Oct 2020 14:40:10 +0200
X-Gmail-Original-Message-ID: <CAJKOXPf28WZQfnwgtwXkvhsqfbsAsrawH1kk-bDX1fAsRzDAOA@mail.gmail.com>
Message-ID: <CAJKOXPf28WZQfnwgtwXkvhsqfbsAsrawH1kk-bDX1fAsRzDAOA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: CLK: microchip: Add Microchip
 PolarFire host binding
To:     daire.mcnamara@microchip.com
Cc:     mturquette@baylibre.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, padmarao.begari@microchip.com,
        david.abdurachmanov@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 15 Oct 2020 at 14:25, <daire.mcnamara@microchip.com> wrote:
>
> From: Daire McNamara <daire.mcnamara@microchip.com>
>
>     Add device tree bindings for the Microchip PolarFire system
>     clock controller
>
>     Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>

Hi,

You have here a weird indentation. Commit msg should not be indented.

Subject: the subsystem prefix is "clk", not CLK. This applies to all patche=
s.

> ---
>  .../bindings/clock/microchip,pfsoc.yaml       | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/microchip,pfs=
oc.yaml
>
> diff --git a/Documentation/devicetree/bindings/clock/microchip,pfsoc.yaml=
 b/Documentation/devicetree/bindings/clock/microchip,pfsoc.yaml
> new file mode 100644
> index 000000000000..c833e7b6a7cd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/microchip,pfsoc.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/microchip,pfsoc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip PolarFire Clock Control Module Binding
> +
> +maintainers:
> +  - Daire McNamara <daire.mcnamara@microchip.com>
> +
> +description: |
> +  Microchip PolarFire clock control is an integrated clock controller, w=
hich
> +  generates clocks and supplies to all peripherals.
> +
> +properties:
> +  compatible:
> +    const: microchip,pfsoc-clkcfg
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: reference clock input
> +
> +  clock-names:
> +    items:
> +      - const: ref_clk

I am not sure if it makes sense to add "clk" suffix to the clock
names. It seems it appears in existing bindings but it is actually a
duplication of information. How about just "ref"?

> +
> +  '#clock-cells':
> +    const: 1
> +    description: |
> +      The clock consumer should specify the desired clock by having the =
clock
> +      ID in its "clocks" phandle cell. See include/dt-bindings/clock/mic=
rochip,pfsoc-clock.h
> +      for the full list of PolarFire clock IDs.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'

additionalProperties: false

... and most likely you miss some properties (judging by example).

> +
> +examples:
> +  # Clock Config node:
> +  - |
> +    soc {

I think you can skip the soc in example - it does not help.

> +            #address-cells =3D <2>;
> +            #size-cells =3D <2>;
> +            clkcfg: clock-controller@20002000 {
> +                compatible =3D "microchip,pfsoc-clkcfg";
> +                reg =3D <0x0 0x20002000 0x0 0x1000>;
> +                reg-names =3D "mss_sysreg";
> +                clocks =3D <&ref_clk 0>;
> +                clock-names =3D "ref_clk";
> +                #clock-cells =3D <1>;
> +                clock-output-names =3D "cpu", "axi", "ahb", "envm", "mac=
0", "mac1", "mmc", "timer", "mmuart0", "mmuart1", "mmuart2", "mmuart3", "mm=
uart4", "spi0", "spi1", "i2c0", "i2c1", "can0", "can1", "usb", "rtc", "qspi=
", "gpio0", "gpio1", "gpio2", "ddrc", "fic0", "fic1", "fic2", "fic3", "athe=
na", "cfm";
> +        };
> +    };
> +
> +  # Required external clocks for Clock Control Module node:
> +  - |
> +    refclk: refclk {

Skip it, not relevant and not even correct phandle for example #1.

Best regards,
Krzysztof
