Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4796A13A245;
	Thu, 27 Jun 2024 09:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719482289; cv=none; b=kn7lWKZpIum/mAYjh466CXECyTEBx921bC6kYbrxTHJz7M5vVAWU+VoLpJQoOmucU+3LMQWYOw9ctzEu5bqfeBHIcMS4PLrWIkdRXGAqUXXEP5Ftifi19nsfeJJsA05xomuyGcVCMJE/1jZFMK894d4cSHIIsMqFJ4JvkusvB/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719482289; c=relaxed/simple;
	bh=/vd3XG40y+3D+nrQ6Ws/UOz8gxZ/84gh2P/6OOJKCIk=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W/PLegAEYVM2C0158sIdmQlIKOLNmixgb/f1/cYMtfJlbL9XZFRwuHboGcgW9mX0TX7OBFQ4PLvki0pZVzLDvEUA4Lc19fqoUk5IRTnSdTQ0Gi9blOkSZmgSZgpXcVDedtBCoJ+b/qaPdrJIWGCq37W4nKg8ZQv/OKaHKyeguw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=Ye+JX7s6; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Ye+JX7s6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1719482287; x=1751018287;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/vd3XG40y+3D+nrQ6Ws/UOz8gxZ/84gh2P/6OOJKCIk=;
  b=Ye+JX7s6/9tgvIQTk8xo0eJriqUx6b3tMBPH/A2G4Cot+qV/AUpsYm52
   uhgKJT9CF6LKxzSYk9tPMP0vBrjttSy0MXL3qCRaVYyKeqkTS6LlIF4PJ
   0En8xfCeE73OP/gtOU0p2CMODBz66ol6g6x5X04C4RW6Qe4tfoEPdiFa+
   E9xTQ/4NOeA936mL38IBfSI+j6MknoXbS+SAwx8DnO1ldqONw9R7X9GZ4
   3aOUvV6TsXf9zkziqQu9XAS4CsZGEHxuNmbY+vp7wyB79xYRQ38Pt564I
   RJxH+7lMFW0xrG2YPr9eQhQst+FUQTsZftHgUcaH9IfS+sKCVhnTS30SF
   w==;
X-CSE-ConnectionGUID: EknzzAuNRqe944fDC+OLkQ==
X-CSE-MsgGUID: Vh6Cpy12ShK6HQXAa/XEbw==
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="asc'?scan'208";a="28542765"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Jun 2024 02:58:05 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 27 Jun 2024 02:57:47 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 27 Jun 2024 02:57:44 -0700
Date: Thu, 27 Jun 2024 10:57:28 +0100
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
Message-ID: <20240627-undying-overcoat-192e5aa20c55@wendy>
References: <cover.1718282056.git.lorenzo@kernel.org>
 <ac557b6f4029cb3428d4c0ed1582d0c602481fb6.1718282056.git.lorenzo@kernel.org>
 <d1021a8d-6e7f-4839-845e-88e2c8673c34@collabora.com>
 <20240627-vending-lisp-4e1cf45e552c@wendy>
 <b5bb67e8-ebd6-43db-b9d6-2aae38f2a08d@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BOxG0eYiqnj1tfTc"
Content-Disposition: inline
In-Reply-To: <b5bb67e8-ebd6-43db-b9d6-2aae38f2a08d@collabora.com>

--BOxG0eYiqnj1tfTc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2024 at 11:53:00AM +0200, AngeloGioacchino Del Regno wrote:
> Il 27/06/24 11:47, Conor Dooley ha scritto:
> > On Thu, Jun 27, 2024 at 11:33:47AM +0200, AngeloGioacchino Del Regno wr=
ote:
> > > Il 13/06/24 14:47, Lorenzo Bianconi ha scritto:
> > > > Introduce reset capability to EN7581 device-tree clock binding
> > > > documentation.
> > > >=20
> > > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > > > ---
> > > >    .../bindings/clock/airoha,en7523-scu.yaml     | 25 ++++++-
> > > >    .../dt-bindings/reset/airoha,en7581-reset.h   | 66 +++++++++++++=
++++++
> > > >    2 files changed, 90 insertions(+), 1 deletion(-)
> > > >    create mode 100644 include/dt-bindings/reset/airoha,en7581-reset=
=2Eh
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-=
scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> > > > index 3f4266637733..84353fd09428 100644
> > > > --- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> > > > +++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> > > > @@ -35,7 +35,7 @@ properties:
> > > >      reg:
> > > >        minItems: 2
> > > > -    maxItems: 3
> > > > +    maxItems: 4
> > > >      "#clock-cells":
> > > >        description:
> > > > @@ -43,6 +43,10 @@ properties:
> > > >          clocks.
> > > >        const: 1
> > > > +  '#reset-cells':
> > > > +    description: ID of the controller reset line
> > > > +    const: 1
> > > > +
> > > >    required:
> > > >      - compatible
> > > >      - reg
> > > > @@ -60,6 +64,8 @@ allOf:
> > > >                - description: scu base address
> > > >                - description: misc scu base address
> > > > +        '#reset-cells': false
> > > > +
> > > >      - if:
> > > >          properties:
> > > >            compatible:
> > > > @@ -70,6 +76,7 @@ allOf:
> > > >              items:
> > > >                - description: scu base address
> > > >                - description: misc scu base address
> > > > +            - description: reset base address
> > >=20
> > > Are you sure that the indentation is correct? :-)
> > >=20
> > > After fixing the indentation,
> > >=20
> > > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
> > >=20
> > > >                - description: pb scu base address
> >=20
> > The indentation actually looks okay when I apply this locally, but how =
is
> > it backwards compatible to add this register in the middle of the list??
>=20
> It's not, and this is actually something done on purpose - there is no DT=
 using
> this binding yet (here, nor uboot), and Lorenzo acknowledged the mistake =
before
> it was too late...
>=20
> At least this time, it wasn't a misattention :-P

The rationale for this being okay really should be in the commit
message...

> Btw, as far as I know, the reset base address is in between misc scu and =
pb scu,
> that's why it was put there in the middle.

=2E..but I don't really see why this needs to be done incompatibly at all
in the first place. Just put it at the end of the list, there's no rule
that the order of reg properties needs to match the MMIO addresses.


--BOxG0eYiqnj1tfTc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZn03iAAKCRB4tDGHoIJi
0kheAP0YP5jOg+N09ULXONejYGeXQVrKSBAlPvGsbtj0U3yHMAD6AgpdvZ2qLb2c
bqZPZekWUgQDbXvJG4plKE9MrMb6Sw8=
=VlR1
-----END PGP SIGNATURE-----

--BOxG0eYiqnj1tfTc--
