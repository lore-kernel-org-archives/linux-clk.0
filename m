Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1A0BC001DF
	for <linux-clk@archiver.kernel.org>; Tue,  1 Aug 2023 15:40:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234945AbjHAPkV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 1 Aug 2023 11:40:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234895AbjHAPkU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Aug 2023 11:40:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82B44268C;
        Tue,  1 Aug 2023 08:40:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0C14E6160B;
        Tue,  1 Aug 2023 15:40:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D72CC433C7;
        Tue,  1 Aug 2023 15:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690904405;
        bh=klmMPEz2Sc5ebK9RxVataknn1VmV0r0n29W0Xjb+SIQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ei77t9mG/nwd0RL5hlLXxxr/Xgb9x/wpiJKztP0f4ZqwQbEafzbf2Rmybyj/MLbOw
         M9Q1ygcojiSHdSSGhxfKh5tGFEV9PNY5k3NJC5tDihaaWI/3gK+xev+4kTMKUFJBjF
         k8asJbv3XMr0V7RobdhKHYvzKuifAm7aPR+qlnfjLqK6zipplNyHOqHKmj2dh4Urb2
         Ag1OG2S9X5pFPSsmtn6ZQXUoHHCP8Lscd3xWIMiBW13BPfsvdAafGf2WDlniU4PNcr
         rBZKouXX838EMKlc95osOFJeBkykbXfMDIJMhHVCNNALU2UBJRzjnmG0LDsVOFibGn
         kjINjwGwo2IjA==
Date:   Tue, 1 Aug 2023 16:40:00 +0100
From:   Conor Dooley <conor@kernel.org>
To:     "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
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
Message-ID: <20230801-overlook-underarm-eb9f85126f2b@spud>
References: <20230724111843.18706-1-shubhrajyoti.datta@amd.com>
 <c735bf62-9d06-c46f-fe80-d9fc88ab847f@linaro.org>
 <BY5PR12MB490240C12A3CB180A0EE97C7810AA@BY5PR12MB4902.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vYisucghWkDCvANw"
Content-Disposition: inline
In-Reply-To: <BY5PR12MB490240C12A3CB180A0EE97C7810AA@BY5PR12MB4902.namprd12.prod.outlook.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--vYisucghWkDCvANw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 01, 2023 at 07:17:20AM +0000, Datta, Shubhrajyoti wrote:
> [AMD Official Use Only - General]
>=20
> > -----Original Message-----
> > From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Sent: Friday, July 28, 2023 12:26 PM
> > To: Datta, Shubhrajyoti <shubhrajyoti.datta@amd.com>;
> > devicetree@vger.kernel.org
> > Cc: git (AMD-Xilinx) <git@amd.com>; linux-clk@vger.kernel.org; Simek,
> > Michal <michal.simek@amd.com>; conor+dt@kernel.org;
> > krzysztof.kozlowski+dt@linaro.org; robh+dt@kernel.org; sboyd@kernel.org;
> > mturquette@baylibre.com
> > Subject: Re: [PATCH v3] dt-bindings: clock: versal: Convert the xlnx,zy=
nqmp-
> > clk.txt to yaml
> >
> > Caution: This message originated from an External Source. Use proper
> > caution when opening attachments, clicking links, or responding.
> >
> >
> > On 24/07/2023 13:18, Shubhrajyoti Datta wrote:
> > > Convert the xlnx,zynqmp-clk.txt to yaml.
> > > versal-clk.yaml already exists that's why ZynqMP is converted and
> > > merged.
> > >
> > > Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> >
> >
> > > +
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - xlnx,zynqmp-clk
> > > +
> > > +    then:
> > > +      properties:
> > > +        clocks:
> > > +          items:
> > > +            - description: PS reference clock
> > > +            - description: reference clock for video system
> > > +            - description: alternative PS reference clock
> > > +            - description: auxiliary reference clock
> > > +            - description: transceiver reference clock
> > > +            - description: (E)MIO clock source  (Optional clock)
> > > +            - description: GEM emio clock  (Optional clock)
> > > +            - description: Watchdog external clock (Optional clock)
> >
> > This is 8 items, not 7 as your top-level property says.
> >
> Fixed it below

Can you send that as a real v4 please?

--vYisucghWkDCvANw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMknUAAKCRB4tDGHoIJi
0k//AP9TMX38cZrgrWN3V5dlTomMpJh6nuq+gG0RuiNTASwMAwEArDDUtwMCJBpv
k3eN5/Y6pcG2KjKurjAUwzhFr1ZYmwU=
=1N/A
-----END PGP SIGNATURE-----

--vYisucghWkDCvANw--
