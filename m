Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1880C3DFC7F;
	Fri,  2 Oct 2026 07:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790925514; cv=none; b=PJjMwDYGbxzTEMwuqX4qIypo9GIsrshLrof19Hj0dkzMcyTm92FF3VXyoXUQkNBP8foq+M+4RTPPX9EzTe118BP5u31Cyl2IIkuwvngBI+EyB/He8pjJauqXSy8fQEXmgrg+ExhQTv5Q4cDXSFsj9btTdQhERSXExu6XmZ8pb7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790925514; c=relaxed/simple;
	bh=LKOqFUF1VrzMql9xOqWfSWBZnOUurH7PVS5p9gJjW7g=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cx/K70n4o387F0OM/bljIyOifR6PDi5wqHVQpMHPqmlcunHikbH4kmChXO6SrIQO+iLbzmbl3ilyjv4+1PpxLIY70tfWqRrPLL+KzeV0vmxHsgf7m2cJzGyke1gbXteAz9uw3ZKfQhIoFyrh8zO+K0Rqi0jlfLEYfslmDIK7cpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=vG+L6g9p; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="vG+L6g9p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1790925512; x=1822461512;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LKOqFUF1VrzMql9xOqWfSWBZnOUurH7PVS5p9gJjW7g=;
  b=vG+L6g9pA60ZZnr+CNJtxzH19ACVLbvbB2xExqGS3697VmI/189VLahH
   2W3Jg8Ix4K/JCDKlUpOoA+5SiVHsxaxrUuwHADudLfxWBhHWViqHGJ4lD
   wxsZakxudFdJsKsz+mD3bJjc+ZBxKHx7yTCeBe49sEjEk77yiQTgUIaC+
   mtKyqfwdhvR244f5CRXC7iu+ocW4RRck9C3KayicxdVHPz1otb7eJAnuU
   SLRuVjl0TesSOBydUpi/iSgw/ucGdd/q8EGBuZjbdHAdeaFtSCkqJnJJR
   g+2CoeFV/x85u0/8HfBszFuI4985aUYlC4A7Vpt+W6ui0zJgvPCJ1/j8B
   Q==;
X-CSE-ConnectionGUID: i0tJqMb/Q1+GnaUojbBUhw==
X-CSE-MsgGUID: sPwnByjRQP6kDmAvWCH9rw==
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="asc'?scan'208";a="231582500"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 00:18:23 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.49; Fri, 2 Oct 2026 00:18:23 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Fri, 2 Oct 2026 00:18:20 -0700
Date: Fri, 2 Oct 2026 08:17:00 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
CC: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Brian Masney <bmasney@redhat.com>, Yixun Lan
	<dlan@kernel.org>, <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 1/2] dt-bindings: clock: anlogic,dr1v90-cru: make
 external clocks optional
Message-ID: <20261002-oozy-reversal-e65157724bc3@wendy>
References: <20261002-dr1v90-cru-dt-fix-v1-0-c3e0b5d4c30d@pigmoral.tech>
 <20261002-dr1v90-cru-dt-fix-v1-1-c3e0b5d4c30d@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nko9mlGfTiTZzztm"
Content-Disposition: inline
In-Reply-To: <20261002-dr1v90-cru-dt-fix-v1-1-c3e0b5d4c30d@pigmoral.tech>

--nko9mlGfTiTZzztm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 02, 2026 at 02:07:00PM +0800, Junhui Liu wrote:
> The external CAN and WDT clocks are optional inputs routed from the
> board; the main oscillator is the only required clock. The binding
> currently requires all three clocks, which forces device trees to add
> stub fixed-clock nodes without a clock-frequency to satisfy it.
>=20
> Allow the clocks and clock-names properties to contain just "osc",
> optionally followed by either or both of "can_ext" and "wdt_ext".
>=20
> Fixes: 155d900e4c7d ("dt-bindings: clock: add Anlogic DR1V90 CRU")
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  .../bindings/clock/anlogic,dr1v90-cru.yaml         | 24 +++++++++++++++-=
------
>  1 file changed, 17 insertions(+), 7 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/anlogic,dr1v90-cru.y=
aml b/Documentation/devicetree/bindings/clock/anlogic,dr1v90-cru.yaml
> index 11a92588e494..8bd7b78a58d8 100644
> --- a/Documentation/devicetree/bindings/clock/anlogic,dr1v90-cru.yaml
> +++ b/Documentation/devicetree/bindings/clock/anlogic,dr1v90-cru.yaml
> @@ -17,16 +17,26 @@ properties:
>      maxItems: 1
> =20
>    clocks:
> -    items:
> -      - description: Main oscillator
> -      - description: External CAN clock
> -      - description: External WDT clock
> +    minItems: 1
> +    maxItems: 3
> +    description:
> +      The main oscillator is always required. An external CAN clock and =
an
> +      external WDT clock may additionally be provided if the board route=
s these
> +      clocks to the SoC.
> =20
>    clock-names:
> -    items:
> +    oneOf:
>        - const: osc
> -      - const: can_ext
> -      - const: wdt_ext
> +      - items:
> +          - const: osc
> +          - const: can_ext
> +      - items:
> +          - const: osc
> +          - const: wdt_ext
> +      - items:
> +          - const: osc
> +          - const: can_ext
> +          - const: wdt_ext

This need not be so complicated. The following should do the trick:

clock-names:
  minItems: 1
  items:
    - const: osc
    - enum: [can_ext, wdt_ext]
    - const: wdt_ext

pwbot: changes-requested

> =20
>    "#clock-cells":
>      const: 1
>=20
> --=20
> 2.55.0
>=20

--nko9mlGfTiTZzztm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCar9abAAKCRB4tDGHoIJi
0hyqAQDEZIKCULEAwrQndVIAevHaJ2R9EhY5vu6x/fmrOPTwXwEAxqtkubDhkZ+1
W0A0l0vK31l0ajK/8nN+ibndkBjaCgQ=
=lnEC
-----END PGP SIGNATURE-----

--nko9mlGfTiTZzztm--
