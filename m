Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAB213AA31;
	Thu, 27 Jun 2024 10:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719483637; cv=none; b=unitLc3LXVFHYVZqSKjjPaMt1KVUCgEjAbnBsLBfDhKQ+cymVWeS/zzA6eFSnjDu9DMBDIYtzqRiIcIsutqhU22mwGZWa3OJL/AEkzcsakeuf91JUATk+ESUR1YrRAQs6apKGmpoIgOQoZmijt25jCaizmOgS16P+KkbMDcjHNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719483637; c=relaxed/simple;
	bh=x0pTPriGYq8/Oq6T3iZrhaAwgdpV3HDNcy08tazRkqg=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YR9aMr0VCU9gRBHIDiQkrZ4iiJkaVmDlB+j7pYq+xKdJK9Su2w+i+ZuLqMsUHDHaGISLRJxRhknaJEGZJl5EMECN+0bOZomrwGDasj9nryanlCjCyY4wVcHq9j69CXkhzva9THT6yKMhe3VD9krfyjTRzh+v/KpddyvadrqjYJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=tNvJw67x; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="tNvJw67x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1719483634; x=1751019634;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x0pTPriGYq8/Oq6T3iZrhaAwgdpV3HDNcy08tazRkqg=;
  b=tNvJw67xA37lyYPoSInI3MWHcAfn8Z72tOJhR5SP8pY1K8qTOtoyaw1K
   z8ne6S92So2jR7NZAbkqjYRJas/OjSZFMdKEdn9d4GIbL/lczyfy6fNgV
   dk5W0sWF4RLwMzaXu2fhypHo5q8VScGOOWpwxmzPRX1//JF0jnz3MOP2C
   TXaQcN4/BJ0xUeIeF0m2ZO56q9D26FJP+URx/aZ3TWtAcjYNJgNNKODu1
   NTkAgLd/Be+mrnwzb5NkOKi7i4nY+Ik4RnUv80mSfVI3rmOivja8WVub6
   EExy3GPtr3GobKu5pYKB0N5Ue1o8C31unAivdmeMGy1yXq/NFAPLWKeLb
   w==;
X-CSE-ConnectionGUID: BdnfriUqTeKbI2LFOCpaDw==
X-CSE-MsgGUID: qPqGnLYKTdG3f0rB3lHn5g==
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="asc'?scan'208";a="28543575"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Jun 2024 03:20:33 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 27 Jun 2024 03:20:09 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 27 Jun 2024 03:20:06 -0700
Date: Thu, 27 Jun 2024 11:19:50 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Lorenzo Bianconi <lorenzo@kernel.org>, <linux-clk@vger.kernel.org>,
	<p.zabel@pengutronix.de>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<lorenzo.bianconi83@gmail.com>, <conor@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <nbd@nbd.name>, <john@phrozen.org>,
	<dd@embedd.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<upstream@airoha.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: airoha: Add reset support to
 EN7581 clock binding
Message-ID: <20240627-woven-devourer-1869276e043f@wendy>
References: <cover.1718282056.git.lorenzo@kernel.org>
 <ac557b6f4029cb3428d4c0ed1582d0c602481fb6.1718282056.git.lorenzo@kernel.org>
 <d1021a8d-6e7f-4839-845e-88e2c8673c34@collabora.com>
 <20240627-vending-lisp-4e1cf45e552c@wendy>
 <b5bb67e8-ebd6-43db-b9d6-2aae38f2a08d@collabora.com>
 <20240627-undying-overcoat-192e5aa20c55@wendy>
 <0ae5ff1c-1abe-4b45-a1dd-4599a867f8c8@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bbQwYd7tdTi6asDw"
Content-Disposition: inline
In-Reply-To: <0ae5ff1c-1abe-4b45-a1dd-4599a867f8c8@collabora.com>

--bbQwYd7tdTi6asDw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2024 at 12:03:38PM +0200, AngeloGioacchino Del Regno wrote:
> Il 27/06/24 11:57, Conor Dooley ha scritto:
> > On Thu, Jun 27, 2024 at 11:53:00AM +0200, AngeloGioacchino Del Regno wr=
ote:
> > > Il 27/06/24 11:47, Conor Dooley ha scritto:
> > > > On Thu, Jun 27, 2024 at 11:33:47AM +0200, AngeloGioacchino Del Regn=
o wrote:
> > > > > Il 13/06/24 14:47, Lorenzo Bianconi ha scritto:
> > > > > > Introduce reset capability to EN7581 device-tree clock binding
> > > > > > documentation.
> > > > > >=20
> > > > > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > > > > > ---
> > > > > >     .../bindings/clock/airoha,en7523-scu.yaml     | 25 ++++++-
> > > > > >     .../dt-bindings/reset/airoha,en7581-reset.h   | 66 ++++++++=
+++++++++++
> > > > > >     2 files changed, 90 insertions(+), 1 deletion(-)
> > > > > >     create mode 100644 include/dt-bindings/reset/airoha,en7581-=
reset.h
> > > > > >=20
> > > > > > diff --git a/Documentation/devicetree/bindings/clock/airoha,en7=
523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.ya=
ml
> > > > > > index 3f4266637733..84353fd09428 100644
> > > > > > --- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu=
=2Eyaml
> > > > > > +++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu=
=2Eyaml
> > > > > > @@ -35,7 +35,7 @@ properties:
> > > > > >       reg:
> > > > > >         minItems: 2
> > > > > > -    maxItems: 3
> > > > > > +    maxItems: 4
> > > > > >       "#clock-cells":
> > > > > >         description:
> > > > > > @@ -43,6 +43,10 @@ properties:
> > > > > >           clocks.
> > > > > >         const: 1
> > > > > > +  '#reset-cells':
> > > > > > +    description: ID of the controller reset line
> > > > > > +    const: 1
> > > > > > +
> > > > > >     required:
> > > > > >       - compatible
> > > > > >       - reg
> > > > > > @@ -60,6 +64,8 @@ allOf:
> > > > > >                 - description: scu base address
> > > > > >                 - description: misc scu base address
> > > > > > +        '#reset-cells': false
> > > > > > +
> > > > > >       - if:
> > > > > >           properties:
> > > > > >             compatible:
> > > > > > @@ -70,6 +76,7 @@ allOf:
> > > > > >               items:
> > > > > >                 - description: scu base address
> > > > > >                 - description: misc scu base address
> > > > > > +            - description: reset base address
> > > > >=20
> > > > > Are you sure that the indentation is correct? :-)
> > > > >=20
> > > > > After fixing the indentation,
> > > > >=20
> > > > > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregn=
o@collabora.com>
> > > > >=20
> > > > > >                 - description: pb scu base address
> > > >=20
> > > > The indentation actually looks okay when I apply this locally, but =
how is
> > > > it backwards compatible to add this register in the middle of the l=
ist??
> > >=20
> > > It's not, and this is actually something done on purpose - there is n=
o DT using
> > > this binding yet (here, nor uboot), and Lorenzo acknowledged the mist=
ake before
> > > it was too late...
> > >=20
> > > At least this time, it wasn't a misattention :-P
> >=20
> > The rationale for this being okay really should be in the commit
> > message...
> >=20
> > > Btw, as far as I know, the reset base address is in between misc scu =
and pb scu,
> > > that's why it was put there in the middle.
> >=20
> > ...but I don't really see why this needs to be done incompatibly at all
> > in the first place. Just put it at the end of the list, there's no rule
> > that the order of reg properties needs to match the MMIO addresses.
> >=20
>=20
> It's just a perfection thing... but whatever, if that's unacceptable for =
you,
> putting it at the end of the list isn't a huge deal anyway.
>=20
> Your call - it's okay for me either way.

It has not been in a release yet, so it's not a hard block for me,
however, I would want to see a commit message update and a Fixes: tag.
The patch should also appear in 6.10, rather than being 6.11 material.

--bbQwYd7tdTi6asDw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZn08xgAKCRB4tDGHoIJi
0kMGAQCMDsHLn9lDeNcWejLJHGUjpjdw3jCMv8jKUsVET3B8bwEAv/K1l1tGtfU/
L8yqEyVZi0CQbtZ4ui3uZwx4h3nV9wA=
=l0nE
-----END PGP SIGNATURE-----

--bbQwYd7tdTi6asDw--
