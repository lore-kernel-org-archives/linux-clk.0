Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F08C7C0015E
	for <linux-clk@archiver.kernel.org>; Fri, 28 Jul 2023 16:19:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbjG1QT5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 Jul 2023 12:19:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbjG1QT4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 28 Jul 2023 12:19:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84CA02723;
        Fri, 28 Jul 2023 09:19:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1EDAC6219C;
        Fri, 28 Jul 2023 16:19:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73419C433C7;
        Fri, 28 Jul 2023 16:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690561194;
        bh=ZEyYE1u5GaUGWLv7GIWmVdWOHLi4AWnIGLoPCMbcyWs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SXvwWF/H/WXjANy55EfnUDwZ4IEQc3U2MSQe9bh/ru7PkKZcc/9zPKrFpafs5FhGj
         1GM+76p/yaE3iQ9vwQITdRcgZ0vt3Gqncgkr71cARq7R8QVjVD8LzXrwi4pJ0pA6mi
         lFgRSeF+ONKJtewpyRKXjWWFaPPXDrXjuWrGB/rlBgMSebkWXoW0Jo+bRvOXB20NVS
         q9JFVEqTdNOPi/pJRLfOsWQSkpMccVEz54byuDzMInKFwt+U8LfuztNvJKRe83rP7o
         qZh+iz6ZglNrsmfF6xhLYe9WHLO6BvrcjYEoPo1QeLzJyrZQhFu0qifOvQEXRx48ah
         UeMm061CyeBoQ==
Date:   Fri, 28 Jul 2023 17:19:50 +0100
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
Message-ID: <20230728-slit-constrain-641d33f9f99b@spud>
References: <20230724111843.18706-1-shubhrajyoti.datta@amd.com>
 <20230724-direness-syrup-14c0b50c8018@spud>
 <BY5PR12MB4902A95CD14D934BCF3B7C658103A@BY5PR12MB4902.namprd12.prod.outlook.com>
 <20230725-untaxed-footman-0c764cc9792f@spud>
 <BY5PR12MB49023F377CB6A3A1D7C78B7D8106A@BY5PR12MB4902.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hnLPno9QFk2YGiBo"
Content-Disposition: inline
In-Reply-To: <BY5PR12MB49023F377CB6A3A1D7C78B7D8106A@BY5PR12MB4902.namprd12.prod.outlook.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--hnLPno9QFk2YGiBo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 28, 2023 at 06:41:50AM +0000, Datta, Shubhrajyoti wrote:
> [AMD Official Use Only - General]
>=20
> > -----Original Message-----
> > From: Conor Dooley <conor@kernel.org>
> > Sent: Wednesday, July 26, 2023 12:57 AM
> > To: Datta, Shubhrajyoti <shubhrajyoti.datta@amd.com>
> > Cc: devicetree@vger.kernel.org; git (AMD-Xilinx) <git@amd.com>; linux-
> > clk@vger.kernel.org; Simek, Michal <michal.simek@amd.com>;
> > conor+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
> > robh+dt@kernel.org; sboyd@kernel.org; mturquette@baylibre.com
> > Subject: Re: [PATCH v3] dt-bindings: clock: versal: Convert the xlnx,zy=
nqmp-
> > clk.txt to yaml
> >
> > On Tue, Jul 25, 2023 at 05:28:07AM +0000, Datta, Shubhrajyoti wrote:
> > > [AMD Official Use Only - General]
> > >
>=20
> <snip>
> > > > >    clocks:
> > > > >      description: List of clock specifiers which are external inp=
ut
> > > > >        clocks to the given clock controller.
> > > > > -    items:
> > > > > -      - description: reference clock
> > > > > -      - description: alternate reference clock
> > > > > -      - description: alternate reference clock for programmable =
logic
> > > > > +    minItems: 3
> > > > > +    maxItems: 7
> > > >
> > > > This doesn't seem right to me. The original binding requires 5 clock
> > > > inputs, but this will relax it such that only three are needed, no?
> > > > You'll need to set constraints on a per compatible basis.
> > > >
> > > Does below look good.
> >
> > I don't think that you tested it with < 5 clocks (hint, if you remove o=
ne of the
> > clocks from your example below, dt_binding_check should fail).
> > All the constraints need to move into the `if` bits AFAIU.
>=20
>=20
> https://lore.kernel.org/all/20230720113110.25047-1-shubhrajyoti.datta@amd=
=2Ecom/
> Here I had it in the if .
> Then what I understood from below is that
>=20
> https://lore.kernel.org/all/745fccb0-e49d-7da7-9556-eb28aee4a32b@linaro.o=
rg/
> it should be dropped from the if and added to the above.
>=20
> Maybe I am missing something.

(Background I got this mail once off-list and tried to make the
binding's validation work)

With the current conditions, validation is completely broken. You can
put in just 1 clock and 1 clock-name and dt-binding-check will pass. The
only way I could satisfy it, while keeping 7 as the maximum number of
clocks, was moving the constraints into the if/else. My guess was that 7
being fewer than the number of clocks in the items: list is part of the
problem.

Thanks,
Conor.

--hnLPno9QFk2YGiBo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMPqpgAKCRB4tDGHoIJi
0mM6AQC3rRZLLCXrEMlU6pb1pLlglbMywQATgqUkkipdz39O3AEAwjQ1EpYF8H8p
sNYT3nE5Te7+5O9nHVPuxyHmx5/EUws=
=YZn2
-----END PGP SIGNATURE-----

--hnLPno9QFk2YGiBo--
