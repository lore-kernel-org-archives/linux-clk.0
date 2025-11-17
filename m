Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4206523C8C7;
	Mon, 17 Nov 2025 17:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763401712; cv=none; b=iKTNDuNnozD6+21Qdb3CliLBIv35BL9Zp7pANEGqTzjTRtbBKtHd+CScu5FNrdC1kB3zOAi2YAddiVO5MAny2Nsx36AEYO2wg/2HGxQ4NAFDUT41/BTRKCGFAYa/xNoXX+u8S+9goF5WXRfj883KInhaVmgsZw7eOQtF8n1HOfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763401712; c=relaxed/simple;
	bh=qOLIQvSf0KW1L5d/BIjS9SrU30FqUG7gOG9CG6UKSJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fg5W2iNuMwYG44eSRwvJ1dTzfo/VC172SCT+jjRgPQld6x10ZzYvlK6+Z+vwbQ7+zPCBz/lIxiBidLLWQu0km+j+UnpRtUGDGSKIVKsTj4n7c7OEvBQp5ihzFG1q2zsrsksU0TPp05KOXQfz1jawmKr7le9c64UxBylOso0bCMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iJ0RXhN3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iJ0RXhN3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 011EBC2BCAF;
	Mon, 17 Nov 2025 17:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763401711;
	bh=qOLIQvSf0KW1L5d/BIjS9SrU30FqUG7gOG9CG6UKSJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iJ0RXhN3PP8KuFQ/dvOP+mWwywxNTIQwSQ5XsQqJiQB4ANmQ/xrDIR2dD5uU2aFNx
	 KyDSYqRtfg3OlTuJQwVie3zQ2ccxHLYNFuH0LLpP+0q62zK8fniI+vIaiOULCJmxIk
	 GiIHED6eZJlbekYvPQLXPn52J9YXfs+DsKApnvZ5QzIL0iqSjHA4yIb5FMkvKm6Yil
	 dYyp+LtUKVYWbvb3pKdAP/STf0RzIHlJQp2SGjHeNIADm74w27tWGvYR0EAVKSwWA8
	 vhQiH8UMWE0KU+75au+ajYkhHonQN8t6yRPmMLKdDiO+RIgiHRYyhknU6iOwfwzlhl
	 Wl7O8Pjgnn6VA==
Date: Mon, 17 Nov 2025 17:48:26 +0000
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Daire McNamara <daire.mcnamara@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] dt-bindings: clock: mpfs-clkcfg: Add pic64gx
 compatibility
Message-ID: <20251117-scrabble-making-17ae91d03a27@spud>
References: <20251117-shadow-police-56aba5d855a3@spud>
 <20251117-depth-sage-ee0829c71c25@spud>
 <176340135320.214025.1792944827677577860.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VHxIiW/r9SCVpufo"
Content-Disposition: inline
In-Reply-To: <176340135320.214025.1792944827677577860.robh@kernel.org>


--VHxIiW/r9SCVpufo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 11:42:33AM -0600, Rob Herring (Arm) wrote:
>=20
> On Mon, 17 Nov 2025 15:35:20 +0000, Conor Dooley wrote:
> > From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> >=20
> > pic64gx has a clock controller compatible with mpfs-clkcfg. Don't permit
> > the deprecated configuration that was never supported for this SoC.
> >=20
> > Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> > Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  .../bindings/clock/microchip,mpfs-clkcfg.yaml     | 15 ++++++++++++++-
> >  1 file changed, 14 insertions(+), 1 deletion(-)
> >=20
>=20
> My bot found errors running 'make dt_binding_check' on your patch:
>=20
> yamllint warnings/errors:
>=20
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/c=
lock/microchip,mpfs-clkcfg.yaml: then: 'anyOf' conditional failed, one must=
 be fixed:
> 	'reg' is not one of ['$ref', 'additionalItems', 'additionalProperties', =
'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependen=
tRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum'=
, 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minim=
um', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patte=
rnProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedPr=
operties', 'uniqueItems']
> 	'type' was expected
> 	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml

Huh. I think the bot is right here, it's this hunk:
@@ -69,6 +73,15 @@ required:
   - clocks
   - '#clock-cells'

+if:
+  properties:
+    compatible:
+      contains:
+        const: microchip,pic64gx-clkcfg
+then:
+  reg:
+    maxItems: 1
+
 additionalProperties: false

 examples:

But I need to go figure out why I did not see this.

--VHxIiW/r9SCVpufo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRtf6gAKCRB4tDGHoIJi
0pTEAQC3oXitlB1I7swxgbQi91gcja4Mrydyc5KJc11uQ0OdHwEA68dT8h3Ts6/i
nHJhuhcEAbukG/MZDlIU27YwEW9BlQY=
=TBXI
-----END PGP SIGNATURE-----

--VHxIiW/r9SCVpufo--
