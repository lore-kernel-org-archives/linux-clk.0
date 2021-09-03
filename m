Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F19C6C433F5
	for <linux-clk@archiver.kernel.org>; Fri,  3 Sep 2021 18:29:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE1B661057
	for <linux-clk@archiver.kernel.org>; Fri,  3 Sep 2021 18:29:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243505AbhICSak (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 3 Sep 2021 14:30:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:57822 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236537AbhICSak (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 3 Sep 2021 14:30:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1DA7860FC0;
        Fri,  3 Sep 2021 18:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630693780;
        bh=RZs1LCsVX7eUH8y+LjseU+tbxhETWIXNAdn/DZXgVKA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=IFCRTTfnanz4SKqA+gxr97DdD0ByGi5QTf2bXT1v79UDL/wtW8Y7iUlmoBtyi/EnF
         plrZy3BCv/MojgxiIHAu9arWJmmHP50Sq1LMFBl5rpaNJif3Yr8KkD5TK8c2ZpOthV
         YWiOJPTqephjxW2DXUArNPV1C/E05PzZpliD2yqdjNiFfdyvUkmERyEkao4XzeSYdb
         HSyROAs43Kvx+yggj5+HNOx5DdxKoMl1vq4c6KUiKtGzZZ3PAf/Tw6W+Mt1YlpsNWZ
         pa2SOmq0VdbC4NwDYGE11DeguY+m1nx0hEMz4KNO6t6YRdlDTF3v/JQpPvt+pcrBvq
         bQPeYPmCcZxCQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210903173107.950-1-kabel@kernel.org>
References: <20210903173107.950-1-kabel@kernel.org>
Subject: Re: [PATCH RFC] dt-bindings: clk: fixed-mmio-clock: Document mapping MMIO values to clock rates
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Jan Kotas <jank@cadence.com>, robh+dt@kernel.org,
        devicetree@vger.kernel.org, pali@kernel.org,
        Marek Behun <kabel@kernel.org>
To:     Marek Behun <kabel@kernel.org>, linux-clk@vger.kernel.org
Date:   Fri, 03 Sep 2021 11:29:38 -0700
Message-ID: <163069377886.405991.177735942780420525@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marek Behun (2021-09-03 10:31:07)
> The 'fixed-mmio-clock' binding currently only allows for the fixed-rate
> clock frequency to be read directly from the MMIO register.
>=20
> There are, however, systems for which the value of a register uniquely
> determines the frequency, but it is not encoded as a number in the
> register. Rather the register may contain the latched values of the
> strapping pins during system reset, and the clock rate can be determined
> from the value of one strapping pin.
>=20
> For example on Armada 37xx, the GPIO1[9] pin must be brough low or high

s/brough/brought/

> during system reset depending on whether the reference clock rate is
> 25 MHz or 40 MHz.
>=20
> Extend this binding by adding two more properties:
> - clock-rate-table-mask - if present, the register value will be masked
>                           with the value of this property before mapping
> - clock-rate-table - table mapping possible clock rates to register
>                      values
>=20
[..]
> This patch applies only after fixed-mmio-clock is converted to YAML by
>   dt-bindings: clk: fixed-mmio-clock: Convert to YAML
>=20
> This is a RFC and does not contain actual driver change. I would like
> to hear your opinions.

When it comes to masks and shifts in DT it's a NAK from me. I believe we
don't have a good way to understand what endianess the mask is. Is it
device order, or CPU order, or always big endian?

It's also trending toward the one node per clk style of binding that we
don't accept. I think this came up when the fixed-mmio binding was
proposed. I hoped that nobody would use it outside of FPGAs.

>=20
> The reason why I wrote this is that there are several clk drivers
> reading one bit of a register and then registering fixed-rate clock
> with frequency depending on that one bit. Most of them are drivers
> also registering other clocks, but there is at least one,
> armada-37xx-xtal, which only does this.
>=20
> I think that systems where the reference clock can have different rates
> and the rate is encoded into value of a strapping pin during reset
> should describe these reference clocks in device tree with a table
> mapping these possible rates to values of strapping pins.
> ---
>  .../bindings/clock/fixed-mmio-clock.yaml      | 60 +++++++++++++++++--
>  1 file changed, 55 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/fixed-mmio-clock.yam=
l b/Documentation/devicetree/bindings/clock/fixed-mmio-clock.yaml
> index 1453ac849a65..67fef63cdd8c 100644
> --- a/Documentation/devicetree/bindings/clock/fixed-mmio-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/fixed-mmio-clock.yaml
> @@ -4,16 +4,15 @@
>  $id: http://devicetree.org/schemas/clock/fixed-mmio-clock.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
> -title: Binding for simple memory mapped IO fixed-rate clock sources
> +title: Binding for memory mapped IO fixed-rate clock sources
> =20
>  description:
>    This binding describes a fixed-rate clock for which the frequency can
> -  be read from a single 32-bit memory mapped I/O register.
> -
> -  It was designed for test systems, like FPGA, not for complete,
> -  finished SoCs.
> +  be determined from value read from a single 32-bit memory mapped I/O
> +  register.
> =20
>  maintainers:
> +  - Marek Behun <kabel@kernel.org>
>    - Jan Kotas <jank@cadence.com>
> =20
>  properties:
> @@ -29,11 +28,50 @@ properties:
>    clock-output-names:
>      maxItems: 1
> =20
> +  clock-rate-table:
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +    description: |
> +      If this property is present, it means that the MMIO register does
> +      not contain the clock rate itself, but rather that different
> +      values of this register (possibly masked, see the
> +      'clock-rate-table-mask' property) correspond to different clock
> +      rates, and this property maps each possible clock rate to
> +      corresponding register value.
> +
> +      Some SOCs, for example, allow for multiple possible frequencies of
> +      reference clocks, and the system can determine clock rate by the
> +      values of strapping pins during reset, which are latched into some
> +      MMIO registers.
> +
> +  clock-rate-table-mask:
> +    description:
> +      Mask to be applied to the MMIO value before mapping the value to
> +      corresponding clock rate via 'clock-rate-table'.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +    items:
> +      minItems: 2
> +      maxItems: 2
> +      items:
> +        - description:
> +            Clock rate in Hertz.
> +        - description:
> +            MMIO value (masked with value of the 'clock-rate-table-mask'
> +            property, if that property is present) corresponding to this
> +            clock rate.
> +
>  required:
>    - compatible
>    - reg
>    - "#clock-cells"
> =20
> +if:
> +  required:
> +    - clock-rate-table-mask
> +then:
> +  required:
> +    - clock-rate-table
> +
>  additionalProperties: false
> =20
>  examples:
> @@ -44,4 +82,16 @@ examples:
>        reg =3D <0xfd020004 0x4>;
>        clock-output-names =3D "sysclk";
>      };
> +
> +  - |
> +    xtalclk: xtal-clk {

This needs a unit address.

> +      compatible =3D "marvell,armada-3700-xtal-clock", "fixed-mmio-clock=
";
> +      #clock-cells =3D <0>;
> +      reg =3D <0x8 0x4>;

Because it has a reg property. Of course, a reg property that isn't
aligned to a 4k page or so would imply that the clk is actually part of
a larger hardware block that should have a binding for the whole device
instead of picking the clk part out of the hardware and setting a node
to be exactly the one register in there that is of interest.

> +      clock-rate-table-mask =3D <0x200>;
> +      clock-rate-table =3D <25000000 0x000>,
> +                         <40000000 0x200>;
> +      clock-output-names =3D "xtal";
> +    };
