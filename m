Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99A95C04A6A
	for <linux-clk@archiver.kernel.org>; Tue,  1 Aug 2023 21:03:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229974AbjHAVDf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 1 Aug 2023 17:03:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbjHAVDe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Aug 2023 17:03:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFCE7129;
        Tue,  1 Aug 2023 14:03:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8380E61703;
        Tue,  1 Aug 2023 21:03:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAA65C433C7;
        Tue,  1 Aug 2023 21:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690923811;
        bh=bRaGNrdA6mbdebRWZ2SiPpqLmfPgqs4lfhQeF0BLc0U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=imAVNwWen4mh/Ge3YFUWnaKno6Mcx5CIXBKgLyHteuv1ghPJU6NbOqmn6H4BD85aM
         twdhdhlWvE2ZYvLnRd2kaYVKewzwlC6XLohkYndvG5DPep3h8JNSHhwk5pWL2tZ8FC
         7uO97ngHFzlW3mNpYtaynGUwAF5DOZ6LGIZf3SPaDAtx91ZUQ4HQo4QDcv9z+qmfB9
         8EdYr7TRSZckoXMJtOm8NRpmt2Qs6G0euV5THS5KM0MKlUSTl6E/VuzJg+3/xQDU8q
         P6jEB9Amn5jmVuZHjV8DRrD0dcz8wzvEl88S3RxJH//AOLKBMCZhazNHMU54jptEtC
         /Y7LpXGTwtGtA==
Date:   Tue, 1 Aug 2023 22:03:27 +0100
From:   Conor Dooley <conor@kernel.org>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] dt-bindings: mfd/clock: YAML for Broadcom PMU with ILP
 clock
Message-ID: <20230801-jinx-uncheck-b51220682e75@spud>
References: <20230731203309.30278-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="srXFNgO/DHLJcu1C"
Content-Disposition: inline
In-Reply-To: <20230731203309.30278-1-zajec5@gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--srXFNgO/DHLJcu1C
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 31, 2023 at 10:33:09PM +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> BCM53573 SoC has ILP clock that is part of the PMU block. So far PMU
> itself didn't have a proper binding and ILP wasn't converted to
> json-schema. Fix it up.
>=20
> Add custom binding for Broadcom's BCM53573 PMU and include ILP's
> properties there (it's trivial and non-reusable binding).
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> ---
>  .../bindings/clock/brcm,bcm53573-ilp.txt      | 36 ----------
>  .../bindings/mfd/brcm,bcm53573-pmu.yaml       | 67 +++++++++++++++++++
>  2 files changed, 67 insertions(+), 36 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm53573=
-ilp.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/brcm,bcm53573-p=
mu.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/clock/brcm,bcm53573-ilp.tx=
t b/Documentation/devicetree/bindings/clock/brcm,bcm53573-ilp.txt
> deleted file mode 100644
> index 2ebb107331dd..000000000000
> --- a/Documentation/devicetree/bindings/clock/brcm,bcm53573-ilp.txt
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -Broadcom BCM53573 ILP clock
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
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
> -	compatible =3D "simple-mfd", "syscon";
> -	reg =3D <0x18012000 0x00001000>;
> -
> -	ilp {
> -		compatible =3D "brcm,bcm53573-ilp";
> -		clocks =3D <&alp>;
> -		#clock-cells =3D <0>;
> -		clock-output-names =3D "ilp";
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/mfd/brcm,bcm53573-pmu.yaml=
 b/Documentation/devicetree/bindings/mfd/brcm,bcm53573-pmu.yaml
> new file mode 100644
> index 000000000000..5b0a12bf4fe4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/brcm,bcm53573-pmu.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/brcm,bcm53573-pmu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom PMU
> +
> +maintainers:
> +  - Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> +
> +description: |
> +  Broadcom PMU ("Power Management Unit"?) is a hardware block grouping s=
maller

Why the ? ? The text binding doesn't have one.

> +  blocks. It contains few clocks and some shared registers (used to power
> +  control more than 1 block).
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: brcm,bcm53573-pmu
> +      - const: simple-mfd
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  clock-controller-ilp:

The old text binding didn't have this "-ilp". Why not name the node in a
standard manner & use "clock-controller" alone?

> +    description: ILP clock (sometimes referred as "slow clock")
> +    type: object
> +    allOf:
> +      - $ref: /schemas/clock/clock.yaml
> +      - properties:
> +          compatible:
> +            const: brcm,bcm53573-ilp
> +          clocks:
> +            description: ALP clock
> +            maxItems: 1

Is this description actually helpful, if it only has one clock?

Thanks,
Conor.

> +          clock-output-names:
> +            const: ilp
> +          "#clock-cells":
> +            const: 0
> +        required:
> +          - compatible
> +          - clocks
> +          - clock-output-names
> +          - "#clock-cells"
> +    unevaluatedProperties: false
> +
> +additionalProperties: false
> +
> +required:
> +  - reg
> +  - clock-controller-ilp
> +
> +examples:
> +  - |
> +    pmu@18012000 {
> +        compatible =3D "brcm,bcm53573-pmu", "simple-mfd", "syscon";
> +        reg =3D <0x18012000 0x00001000>;
> +
> +        clock-controller-ilp {
> +            compatible =3D "brcm,bcm53573-ilp";
> +            clocks =3D <&alp>;
> +            clock-output-names =3D "ilp";
> +            #clock-cells =3D <0>;
> +        };
> +    };
> --=20
> 2.35.3
>=20

--srXFNgO/DHLJcu1C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMlzHwAKCRB4tDGHoIJi
0joRAP4ur2Th01jv0W4HdWxgSoQD2yRF068Ch/1N/rMsrMZ4XgD/ezvzy0ukquz+
6wI5D2o+BbR0neFQOuxqBKhTHXHxPQA=
=li1M
-----END PGP SIGNATURE-----

--srXFNgO/DHLJcu1C--
