Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71ACDEB64DD
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jul 2023 19:27:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229991AbjGYT1B (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jul 2023 15:27:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229780AbjGYT1A (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Jul 2023 15:27:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBBA61FF0;
        Tue, 25 Jul 2023 12:26:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6030D61883;
        Tue, 25 Jul 2023 19:26:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7D35C433C8;
        Tue, 25 Jul 2023 19:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690313218;
        bh=egpjd4QmTKmOJukTapc0wUCPZLvmUueNxDyTwwon6vk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ByEyAsmLk6Lkgrs0+NsmKvuPj4ockBLvnGr7l32c4kIaIX628vmvWe8eb4cUEJ2Od
         UsnwWFX14VO3+sFo8XBMk0/Vn0Qf61r/VV4NA3ADAD1WgWkJI4Ewm5fJPKvPSgoE6a
         M66P0f52J2N/GtWujlOtOq1hGa+HFCqkfhjArlHd7KUbcF4nhtXfkmJqj/3jRgb6ho
         InN8ukLT/QeTu589s45Lsw2jrINLoxO1DWXMH30AuSwN4bIFgHjquwkFRw0stgwzL/
         dQVOfvvezXNo0a1+5DW9pbQ7ZNqbQplOq1J+CpY4J3w3IwWc2gRnFRsxLt8I8G0UZF
         cP4M0XR4UJICA==
Date:   Tue, 25 Jul 2023 20:26:54 +0100
From:   Conor Dooley <conor@kernel.org>
To:     "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "git (AMD-Xilinx)" <git@amd.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "Simek, Michal" <michal.simek@amd.com>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>
Subject: Re: [PATCH v3] dt-bindings: clock: versal: Convert the
 xlnx,zynqmp-clk.txt to yaml
Message-ID: <20230725-untaxed-footman-0c764cc9792f@spud>
References: <20230724111843.18706-1-shubhrajyoti.datta@amd.com>
 <20230724-direness-syrup-14c0b50c8018@spud>
 <BY5PR12MB4902A95CD14D934BCF3B7C658103A@BY5PR12MB4902.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="HOnTUMKPZRsFjyWC"
Content-Disposition: inline
In-Reply-To: <BY5PR12MB4902A95CD14D934BCF3B7C658103A@BY5PR12MB4902.namprd12.prod.outlook.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--HOnTUMKPZRsFjyWC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 25, 2023 at 05:28:07AM +0000, Datta, Shubhrajyoti wrote:
> [AMD Official Use Only - General]
>=20
> > -----Original Message-----
> > From: Conor Dooley <conor@kernel.org>
> > Sent: Tuesday, July 25, 2023 12:18 AM
> > To: Datta, Shubhrajyoti <shubhrajyoti.datta@amd.com>
> > Cc: devicetree@vger.kernel.org; git (AMD-Xilinx) <git@amd.com>; linux-
> > clk@vger.kernel.org; Simek, Michal <michal.simek@amd.com>;
> > conor+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
> > robh+dt@kernel.org; sboyd@kernel.org; mturquette@baylibre.com
> > Subject: Re: [PATCH v3] dt-bindings: clock: versal: Convert the xlnx,zy=
nqmp-
> > clk.txt to yaml
> >
> > On Mon, Jul 24, 2023 at 04:48:43PM +0530, Shubhrajyoti Datta wrote:
> > > Convert the xlnx,zynqmp-clk.txt to yaml.
> > > versal-clk.yaml already exists that's why ZynqMP is converted and
> > > merged.
> > >
> > > Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> > >
> > > ---
> > >
> > > Changes in v3:
> > > Update the min and maxitems
> > >
> > > Changes in v2:
> > > add enum in compatible
> > > fix the description
> > > add constraints for clocks
> > > name the clock-controller1 to clock-controller
> > >
> > >  .../bindings/clock/xlnx,versal-clk.yaml       | 78 ++++++++++++++++-=
--
> > >  .../bindings/clock/xlnx,zynqmp-clk.txt        | 63 ---------------
> > >  2 files changed, 69 insertions(+), 72 deletions(-)  delete mode
> > > 100644 Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.txt
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> > > b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> > > index e9cf747bf89b..deebbfd084e8 100644
> > > --- a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> > > +++ b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> > > @@ -19,7 +19,9 @@ select: false
> > >  properties:
> > >    compatible:
> > >      oneOf:
> > > -      - const: xlnx,versal-clk
> > > +      - enum:
> > > +          - xlnx,versal-clk
> > > +          - xlnx,zynqmp-clk
> > >        - items:
> > >            - enum:
> > >                - xlnx,versal-net-clk
> > > @@ -31,16 +33,12 @@ properties:
> > >    clocks:
> > >      description: List of clock specifiers which are external input
> > >        clocks to the given clock controller.
> > > -    items:
> > > -      - description: reference clock
> > > -      - description: alternate reference clock
> > > -      - description: alternate reference clock for programmable logic
> > > +    minItems: 3
> > > +    maxItems: 7
> >
> > This doesn't seem right to me. The original binding requires 5 clock in=
puts,
> > but this will relax it such that only three are needed, no?
> > You'll need to set constraints on a per compatible basis.
> >
> Does below look good.

I don't think that you tested it with < 5 clocks (hint, if you remove
one of the clocks from your example below, dt_binding_check should fail).
All the constraints need to move into the `if` bits AFAIU.

Thanks,
Conor.

--HOnTUMKPZRsFjyWC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMAh/gAKCRB4tDGHoIJi
0sfRAP9+zZlf+w1vLP924z0dUd4jDa+PN8IU1eJIqz2E94LSCQEApuH4mzlF9b4o
wNb95wDho/PqLG5yLvh1gd0IuzyAUwE=
=1K0v
-----END PGP SIGNATURE-----

--HOnTUMKPZRsFjyWC--
