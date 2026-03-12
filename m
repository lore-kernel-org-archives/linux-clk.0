Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795AE33B974;
	Thu, 12 Mar 2026 17:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773337833; cv=none; b=ReG6Lb/39gLbq9YtzVtaBBeAfrkaoYUj3I2BbJ1x5x9e9YUDwQh9yFCaenHypNlPImSX5KquDuqVxro4p7SxLYS7IN26UDO1kKKo8h7g1cvh+aRiFjp8/8AOEhz36H3DGUNs/yPtjE2DdYqfHJcOFoda5ucvtt5IDeIkojkIgcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773337833; c=relaxed/simple;
	bh=KenJYZKQMESmdjBYhz51YSRSfZ9967IRk4t3Gg1r3Gs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n2ks8J8emU294HOuxl5cdFrVYGx7Pyc+gHY7nirG78RnAG58WiR4Rq9XeiuVce3mN3aKV1yJVJ0DD01YVj7Z4OmZtoBExa8KVJs8OJ8nQr0EfTeBCEWjEaxZGdS8o5Xf1kooxFoNakK/KBmE5uPrTH+mfIDBhgPAnRfFo1qrAcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hDEHrdjv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hDEHrdjv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99C49C4CEF7;
	Thu, 12 Mar 2026 17:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773337833;
	bh=KenJYZKQMESmdjBYhz51YSRSfZ9967IRk4t3Gg1r3Gs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hDEHrdjvqz/MSMlfNSDxSUfMgfLBa5NbMksNsP12fREdHuaLP0aNobY8SPGe44x3T
	 hLv0YEeaFGOrYxVTn4fZmMAj5LdLofgqsCD6sXyjwqUVhD4POx+Sodo3eqL3rHkjVn
	 A3ADHv2uwlBzxfwGoc3jbUCnGOVPlAfRiPD2wfAiVdmAzn6ZM0eiyWUnDFRWpZhktw
	 3/eOBtODVr0SsX43YuGFNLPHN9xAtoxkntlPKMx7pGJ33CYtLjbCD3DHQRrhtMv9Dn
	 qMtLbzqi6odHsTwMjvFOqo2ueCJvy07NDJWl5PX/88/JAVuBu4iEw+KT79Ch/Mc9oI
	 rCM0jv2N3Htbg==
Date: Thu, 12 Mar 2026 17:50:26 +0000
From: Conor Dooley <conor@kernel.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev,
	linux@armlinux.org.uk, mturquette@baylibre.com, sboyd@kernel.org,
	ardb@kernel.org, ebiggers@google.com, martin.petersen@oracle.com,
	tytso@mit.edu, cristian.birsan@microchip.com,
	adrian.hunter@intel.com, jarkko.nikula@linux.intel.com,
	kees@kernel.org, npitre@baylibre.com, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: i3c: mipi-i3c-hci: add Microchip
 SAMA7D65 compatible
Message-ID: <20260312-ardently-untoasted-4f4b79be27c4@spud>
References: <20260312042056.309237-1-manikandan.m@microchip.com>
 <20260312042056.309237-2-manikandan.m@microchip.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MqJz2bOHOp/6kCsJ"
Content-Disposition: inline
In-Reply-To: <20260312042056.309237-2-manikandan.m@microchip.com>


--MqJz2bOHOp/6kCsJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026 at 09:50:52AM +0530, Manikandan Muralidharan wrote:
> Add the microchip,sama7d65-i3c-hci compatible string to the MIPI I3C
> HCI binding. The Microchip SAMA7D65 I3C controller is based on the
> MIPI HCI specification but requires two clocks, so add a conditional
> constraint when this compatible is present.
>=20
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  .../devicetree/bindings/i3c/mipi-i3c-hci.yaml | 22 +++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml b/Do=
cumentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
> index 39bb1a1784c9..db659388a27d 100644
> --- a/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
> +++ b/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
> @@ -9,9 +9,6 @@ title: MIPI I3C HCI
>  maintainers:
>    - Nicolas Pitre <npitre@baylibre.com>
> =20
> -allOf:
> -  - $ref: /schemas/i3c/i3c.yaml#
> -
>  description: |
>    MIPI I3C Host Controller Interface
> =20
> @@ -28,7 +25,9 @@ description: |
> =20
>  properties:
>    compatible:
> -    const: mipi-i3c-hci
> +    enum:
> +      - mipi-i3c-hci
> +      - microchip,sama7d65-i3c-hci
>    reg:
>      maxItems: 1
>    interrupts:
> @@ -39,6 +38,21 @@ required:
>    - reg
>    - interrupts
> =20
> +allOf:
> +  - $ref: /schemas/i3c/i3c.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: microchip,sama7d65-i3c-hci
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2
> +      required:
> +        - clocks

Properties should be defined at the top level, and only restricted in
conditional schemas. Please add them at the top level, and provide some
information as to what each clock is via a description.

pw-bot: changes-requested

Thanks,
Conor.

> +
>  unevaluatedProperties: false
> =20
>  examples:
> --=20
> 2.25.1
>=20

--MqJz2bOHOp/6kCsJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabL84gAKCRB4tDGHoIJi
0hwzAQDHnz6O+/P97VuIJwNyaCiCSQPZ7MZTZ7H2o3gahOSGrwEAwavDxaOoHF7y
GpcyvuVbOusizFUCT/bZu8hFfGO9NAg=
=L5KA
-----END PGP SIGNATURE-----

--MqJz2bOHOp/6kCsJ--
