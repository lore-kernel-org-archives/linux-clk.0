Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABA90C77B7F
	for <linux-clk@archiver.kernel.org>; Fri, 19 May 2023 10:45:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231324AbjESKpD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 May 2023 06:45:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231824AbjESKpA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 May 2023 06:45:00 -0400
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC5D8EC;
        Fri, 19 May 2023 03:44:57 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34JAigHW043525;
        Fri, 19 May 2023 05:44:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1684493082;
        bh=pz9X5RVPYmUqGvU6zl4HiycPuT79cB7Xrh/xPmkS/Mk=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=jv7DC0GpQk2ezyDOeRSRiD/+eB4Da++TCy9fJ7+L7jNFAh9cpNto12J9Fr3DF4Akm
         XpgQ1ISCnduwNT7uuYCWjByFni0+2lWTeRtmh5yObQubjUbjjx0QdhxnbauUYBqi/d
         AMfMMD5UsqmKlj8s76yi1p7C4fTBRdB2i27OL+BY=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34JAiggE021339
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 19 May 2023 05:44:42 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 19
 May 2023 05:44:42 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 19 May 2023 05:44:42 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34JAiffV030900;
        Fri, 19 May 2023 05:44:41 -0500
Date:   Fri, 19 May 2023 16:14:42 +0530
From:   Jai Luthra <j-luthra@ti.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC:     Conor Dooley <conor@kernel.org>, Andrew Davis <afd@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/2] dt-bindings: clock: Add binding documentation for TI
 Audio REFCLK
Message-ID: <e3gfl2hqb5ac3lyj3ji7ncvdjdhkkrefwr2xqrjixavdhxcyil@avdo5ovc4bqv>
References: <20230515-refclk-v1-0-5e89f01d6733@ti.com>
 <20230515-refclk-v1-1-5e89f01d6733@ti.com>
 <20230517-reprise-unroll-e2223cab3846@spud>
 <cd38d95f-95bd-056e-e3d0-d6c95e3fd80e@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uyc5revnwgqxyrfw"
Content-Disposition: inline
In-Reply-To: <cd38d95f-95bd-056e-e3d0-d6c95e3fd80e@linaro.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

--uyc5revnwgqxyrfw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Thanks for the review,

On May 18, 2023 at 16:09:01 +0200, Krzysztof Kozlowski wrote:
> On 17/05/2023 19:15, Conor Dooley wrote:
> > On Wed, May 17, 2023 at 01:04:05PM +0530, Jai Luthra wrote:
> >> Add DT bindings for TI's audio reference clocks (REFCLK) present on AM=
62
> >> SoC.
> >=20
> > This seems fine to me. Perhaps Krzysztof will differ...
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> >=20
> >>
> >> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> >> ---
> >>  .../bindings/clock/ti,am62-audio-refclk.yaml       | 44 +++++++++++++=
+++++++++
> >>  1 file changed, 44 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/clock/ti,am62-audio-ref=
clk.yaml b/Documentation/devicetree/bindings/clock/ti,am62-audio-refclk.yaml
> >> new file mode 100644
> >> index 000000000000..7c4cf7abe007
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/clock/ti,am62-audio-refclk.yaml
> >> @@ -0,0 +1,44 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/clock/ti,am62-audio-refclk.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: TI Audio Reference Clock
> >> +
> >> +maintainers:
> >> +  - Jai Luthra <j-luthra@ti.com>
> >> +
> >> +properties:
> >> +  compatible:
> >> +    items:
> >> +      - const: ti,am62-audio-refclk
> >> +      - const: syscon
>=20
> I just don't get why this is syscon? There are no references to it, no
> DTS change and nothing in the driver suggesting it has to be syscon
> (creating regmap for internal use does not count).

Sorry you're right, I missed Andrew's series removing syscon:
https://lore.kernel.org/linux-clk/20230516184626.154892-1-afd@ti.com/

Will re-base my patches on top of it and send v2.

>=20
> Andrew,
> Is this the pattern we discussed and wanted to remove?
>=20
> Best regards,
> Krzysztof
>=20

Thanks,
Jai

--uyc5revnwgqxyrfw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmRnUxYACgkQQ96R+SSa
cUWHeg//S9Bd9zlNj0Q8CIjTyzpLh1dChtqtqpJAPnt2JDm4O8/6CyaBF1up7G/2
kHUhBukHhaoOvsX/e24axalKjMbLkPwgZnjSDNPoAyWUyAx4FNYP2QIbuuHCEcBl
YUJ6D7RTnptcdbBek8zQ0TGC5nQFKBkjxQafi9aAlQ66zOuDGT9S0h4S1sVgp5u0
2XcwyKppOgEN9m7nmSfjno5QwhwacH+7GKMwlD/NcBdmsOMVvZd/Fj8ay16akb7A
cRJ0Vgsh+PYWzCFp5KvqIHilxHhDOPH8BiwHJ/YT8YCoTutIh1AZ3PCKvjnuGr+q
UoA0cXwsCF31yKRUiGRigpXzNXHYDobovNiyA3A6CKyNXZC4TPOV82SBQ9TSZ/Bi
4HnG5cM4X5BUu8uSZCNne79c7Vh2BQWrT93kBAw6+bkcPq/OjmVF23SVdsWdbWD9
rmWxz7Bmyk5Cie13OvUpbz7Zn3VKxoSPpKU0NKGGkQYde28BJMMAf+9qIUK/8s54
3set9qv3xXVl5EilLIwABF2qX36huiOdpxfEkHw9GrpqMTSn4lb2fvv44bILqptR
xtF5xK5/BIT2yE6IQyasuv9Zc4NVARvmCMCQ6IOr4WJjqsyaEqJ4NuErRnsEoil1
QnJytx6LCIwwLJ/UQpdMDRYw+Ap47OgaZMu5j/HFX2c++IAmiCQ=
=B83k
-----END PGP SIGNATURE-----

--uyc5revnwgqxyrfw--
