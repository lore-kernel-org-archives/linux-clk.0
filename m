Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D77C001E0
	for <linux-clk@archiver.kernel.org>; Fri, 28 Jul 2023 16:50:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234949AbjG1Qt7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 Jul 2023 12:49:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234730AbjG1Qts (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 28 Jul 2023 12:49:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41C564EDB;
        Fri, 28 Jul 2023 09:48:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 43855621A4;
        Fri, 28 Jul 2023 16:47:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62D8FC433C7;
        Fri, 28 Jul 2023 16:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690562839;
        bh=E+BBnk3RDEGiisZTgnk5OrVLcmfDGwyEhlMJ/f0gh0g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DP5EthyxgcrHbJKE7M0ukykkhOu3fmPyHc9Yjbewo6NFKbOmLq23O6nreTLIRmV+A
         YJOHMB1Jc+DxrBkQOfeSg9NFpFiob5EUJ1PRG6hvG/XCGbfo8uM2QGimjsUjYi+Q8n
         NR5Ncnowh2P3uMgFFggto+0scodbtvALQjY7eR6/FSpOuQORBdgUovaZcyjsHJiLSm
         q66YovxwnqYCGytwggWikHmwoSTIbmiivdL+bYTksjBfCpJr90DfYHZpw9vrsT3ezy
         s3PHkOKNSarSPoAWX60w+MD50+SMEGXWf0Svn69f2PsF9981twKbOVZeBr2zoXBCa3
         aIil/a5B/t+oQ==
Date:   Fri, 28 Jul 2023 17:47:15 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>,
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
Message-ID: <20230728-heave-ripening-2046c2d1a890@spud>
References: <20230724111843.18706-1-shubhrajyoti.datta@amd.com>
 <20230724-direness-syrup-14c0b50c8018@spud>
 <BY5PR12MB4902A95CD14D934BCF3B7C658103A@BY5PR12MB4902.namprd12.prod.outlook.com>
 <20230725-untaxed-footman-0c764cc9792f@spud>
 <BY5PR12MB49023F377CB6A3A1D7C78B7D8106A@BY5PR12MB4902.namprd12.prod.outlook.com>
 <20230728-slit-constrain-641d33f9f99b@spud>
 <010713ed-1fe7-788c-868d-26149c21d7a7@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ApbpXvBYf9oF6f71"
Content-Disposition: inline
In-Reply-To: <010713ed-1fe7-788c-868d-26149c21d7a7@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--ApbpXvBYf9oF6f71
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 28, 2023 at 06:39:23PM +0200, Krzysztof Kozlowski wrote:
> On 28/07/2023 18:19, Conor Dooley wrote:
> > On Fri, Jul 28, 2023 at 06:41:50AM +0000, Datta, Shubhrajyoti wrote:
> >> [AMD Official Use Only - General]
> >>
> >>> -----Original Message-----
> >>> From: Conor Dooley <conor@kernel.org>
> >>> Sent: Wednesday, July 26, 2023 12:57 AM
> >>> To: Datta, Shubhrajyoti <shubhrajyoti.datta@amd.com>
> >>> Cc: devicetree@vger.kernel.org; git (AMD-Xilinx) <git@amd.com>; linux-
> >>> clk@vger.kernel.org; Simek, Michal <michal.simek@amd.com>;
> >>> conor+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
> >>> robh+dt@kernel.org; sboyd@kernel.org; mturquette@baylibre.com
> >>> Subject: Re: [PATCH v3] dt-bindings: clock: versal: Convert the xlnx,=
zynqmp-
> >>> clk.txt to yaml
> >>>
> >>> On Tue, Jul 25, 2023 at 05:28:07AM +0000, Datta, Shubhrajyoti wrote:
> >>>> [AMD Official Use Only - General]
> >>>>
> >>
> >> <snip>
> >>>>>>    clocks:
> >>>>>>      description: List of clock specifiers which are external input
> >>>>>>        clocks to the given clock controller.
> >>>>>> -    items:
> >>>>>> -      - description: reference clock
> >>>>>> -      - description: alternate reference clock
> >>>>>> -      - description: alternate reference clock for programmable l=
ogic
> >>>>>> +    minItems: 3
> >>>>>> +    maxItems: 7
> >>>>>
> >>>>> This doesn't seem right to me. The original binding requires 5 clock
> >>>>> inputs, but this will relax it such that only three are needed, no?
> >>>>> You'll need to set constraints on a per compatible basis.
> >>>>>
> >>>> Does below look good.
> >>>
> >>> I don't think that you tested it with < 5 clocks (hint, if you remove=
 one of the
> >>> clocks from your example below, dt_binding_check should fail).
> >>> All the constraints need to move into the `if` bits AFAIU.
> >>
> >>
> >> https://lore.kernel.org/all/20230720113110.25047-1-shubhrajyoti.datta@=
amd.com/
> >> Here I had it in the if .
> >> Then what I understood from below is that
> >>
> >> https://lore.kernel.org/all/745fccb0-e49d-7da7-9556-eb28aee4a32b@linar=
o.org/
> >> it should be dropped from the if and added to the above.
> >>
> >> Maybe I am missing something.
> >=20
> > (Background I got this mail once off-list and tried to make the
> > binding's validation work)
> >=20
> > With the current conditions, validation is completely broken. You can
> > put in just 1 clock and 1 clock-name and dt-binding-check will pass. The
> > only way I could satisfy it,=20
>=20
> I don't understand why you think 1 clock would work. The binding has
> clear min/max constraints in top level and strict constraints per each
> variant (through listing items). In my opinion this is correct, except
> what I wrote - mismatched number of clocks for zynqmp (8 against 7).

I didn't expect it would work - I tried 4 w/ the zynqmp compatible,
which passed, although it should not have. And then I took it to the
extreme (1) which also passed. There's something wrong with either the
binding or the example that I can't spot.

> > while keeping 7 as the maximum number of
> > clocks, was moving the constraints into the if/else. My guess was that 7
> > being fewer than the number of clocks in the items: list is part of the
> > problem.
>=20
> Best regards,
> Krzysztof
>=20

--ApbpXvBYf9oF6f71
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMPxEgAKCRB4tDGHoIJi
0p5DAQC79oJdmZBG81C3bVhks+fdmXC4vQojwIPuWf/1+4cilwD+LmadFgBPYGZo
9t7mqffOV1ezUbp7dV9uJNwPUTATWAA=
=5ewH
-----END PGP SIGNATURE-----

--ApbpXvBYf9oF6f71--
