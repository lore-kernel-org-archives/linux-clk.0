Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C8E4D5BD;
	Thu, 27 Jun 2024 09:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719481727; cv=none; b=QzJ2XbI/Jjo4ECWyeM7FwtkODgur+JTfbGlajV8x7+uIUBoO9Es+6HTeUclGUcfNA6+fObw17ez4Y2Vly409LNkRjOlUniQAs1ThW7xOaXaUs5HLsdmVt/Z/QAdSLgfP9Nrui+V1cwpW+Vn13tOQsAAvep7/dL8Tl/vSWYdvBsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719481727; c=relaxed/simple;
	bh=pN6Re2YMPpgDHIrU8wMqUUX+Nho2aAX2ZPo1klf9HU8=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oTLwld+SfXLpchnKraV2Dk/yVnuS+iNIWHinorg95JJ0Aisjr/MW0OMuNVXV52dRf3DCsqjHVwrNLrJGK+qJyUEtoHmQKaDGjmvKmZ4qlBQ1zBd8iXHvispKeLFhZYmcy0XV++EM7lnZ6kCm4YfRSwR/4Wdnz95prK4aELGF8yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=fBGiEh9E; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="fBGiEh9E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1719481724; x=1751017724;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pN6Re2YMPpgDHIrU8wMqUUX+Nho2aAX2ZPo1klf9HU8=;
  b=fBGiEh9Em59jN+zpa9+xl582dhp3szI2T34/UKvmJJaC7SLc6PzUuDzA
   VOT9COn1ivunHkzzUeqlJhwUBtuCP0c4g62I+Tsn235puhuDs2AnwSS0x
   GDBZ91bVTUS1OwQyaWlBYEckp3uCG3UmHsFZJ7wrJnkhGqLAz2vMbMQbI
   Tn+sDotOTIqUdVyWT77djQ/WhqsKeaDN906I34cBk8EJx9PgFfmd85qoT
   IjUm6bxrQ5unAwLwsP4D/a11ACpQDInsQ1VzPXcpUz4bi4NKbXK2XVnY0
   bQLtSIxLsJ6MXt6E0dQPUWZhGa67wKfvUS65/Rwj4gqzEojUxLfCSQlV0
   g==;
X-CSE-ConnectionGUID: NBd6lt7fQhy2ONg/2E6sVw==
X-CSE-MsgGUID: Bv/NKQg2Rf+WO9W5JVD94w==
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="asc'?scan'208";a="28542469"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Jun 2024 02:48:39 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 27 Jun 2024 02:47:56 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 27 Jun 2024 02:47:53 -0700
Date: Thu, 27 Jun 2024 10:47:36 +0100
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
Message-ID: <20240627-vending-lisp-4e1cf45e552c@wendy>
References: <cover.1718282056.git.lorenzo@kernel.org>
 <ac557b6f4029cb3428d4c0ed1582d0c602481fb6.1718282056.git.lorenzo@kernel.org>
 <d1021a8d-6e7f-4839-845e-88e2c8673c34@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="viUMoJ5rJMO/GO7n"
Content-Disposition: inline
In-Reply-To: <d1021a8d-6e7f-4839-845e-88e2c8673c34@collabora.com>

--viUMoJ5rJMO/GO7n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2024 at 11:33:47AM +0200, AngeloGioacchino Del Regno wrote:
> Il 13/06/24 14:47, Lorenzo Bianconi ha scritto:
> > Introduce reset capability to EN7581 device-tree clock binding
> > documentation.
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >   .../bindings/clock/airoha,en7523-scu.yaml     | 25 ++++++-
> >   .../dt-bindings/reset/airoha,en7581-reset.h   | 66 +++++++++++++++++++
> >   2 files changed, 90 insertions(+), 1 deletion(-)
> >   create mode 100644 include/dt-bindings/reset/airoha,en7581-reset.h
> >=20
> > diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.=
yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> > index 3f4266637733..84353fd09428 100644
> > --- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> > +++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> > @@ -35,7 +35,7 @@ properties:
> >     reg:
> >       minItems: 2
> > -    maxItems: 3
> > +    maxItems: 4
> >     "#clock-cells":
> >       description:
> > @@ -43,6 +43,10 @@ properties:
> >         clocks.
> >       const: 1
> > +  '#reset-cells':
> > +    description: ID of the controller reset line
> > +    const: 1
> > +
> >   required:
> >     - compatible
> >     - reg
> > @@ -60,6 +64,8 @@ allOf:
> >               - description: scu base address
> >               - description: misc scu base address
> > +        '#reset-cells': false
> > +
> >     - if:
> >         properties:
> >           compatible:
> > @@ -70,6 +76,7 @@ allOf:
> >             items:
> >               - description: scu base address
> >               - description: misc scu base address
> > +            - description: reset base address
>=20
> Are you sure that the indentation is correct? :-)
>=20
> After fixing the indentation,
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
>=20
> >               - description: pb scu base address

The indentation actually looks okay when I apply this locally, but how is
it backwards compatible to add this register in the middle of the list??

--viUMoJ5rJMO/GO7n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZn01OAAKCRB4tDGHoIJi
0vcdAQCBipoQf2eE2rN/hzS8JbT/6QvauBj5IJM9wOfgfJSwMgD/TJA3+UBXnUsQ
veYPLRUTwCkZ/3p+b+nwKpEjKhEFrQw=
=M+Wq
-----END PGP SIGNATURE-----

--viUMoJ5rJMO/GO7n--
