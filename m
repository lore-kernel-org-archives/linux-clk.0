Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179892FF141;
	Tue, 23 Sep 2025 18:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758653993; cv=none; b=q2JsNL1TjE3WkeMv61nc/YkthTm8GdHW+FOogVqvOrwYcTl9sXgMsZm8Qzn+z3Bpcs1H/5c8xfErEQ25Lpq5VuK+X6ZikTOULiOIA/Xd99d2jjAjWEj9V7Q5I87V6av0jGkmY1gY+WfRemROygA7KbcEYdqM9RzSVirFWZQF7W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758653993; c=relaxed/simple;
	bh=ZlafH3D/OWcnUnXcIKOeUApQ5ngYKaZP2Sdo+LhlMfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tc+B1IoMmMK9Mc+jji2Zh88icEvg+ldkzSN97ns+I5l78nFBN0mp/gbx1kQc/sF5HDMJ2zkRk6/OVXCo8jEpkZr8CoEPK7zir/4g2a9ERrRSyRrpQ95fofvlLuToA8CXtMnqYSHBnSfy2+xF6t9sgKOk1AsSNPH5rHFJ32qlmRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ly/j3MwG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ly/j3MwG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15EDAC4CEF5;
	Tue, 23 Sep 2025 18:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758653992;
	bh=ZlafH3D/OWcnUnXcIKOeUApQ5ngYKaZP2Sdo+LhlMfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ly/j3MwGc0utwHxq7MvS8uS3kmV/vtsfB6emTJaVfOc6ruCFegPr3YMnBlYvqF5Rr
	 0XT3Ho9wQZ52sN/NicdwCc4BDR+yqoSJNKzvoSF6wXuxTx2zxkDKGf9FLj+i4iYoEl
	 4mW1sIZ9BCEJndkNZzhIC899N/rd+FPKNkhnMxgQ94AChSTt4wLY9uTHszcQ27WK+s
	 7T9yx3YUBW8E1k9MakoG6pXiAtU0UNywgUMOoWVHotYQ2040rRBRv953+ZqUSMMNaK
	 XjRbmaWg7txh7fh6Q9rdVJFSCs/WVv9pbHUVMBOhABs+oCMaeW4QzL3kTivN1ah08m
	 zuVZrVty0puLg==
Date: Tue, 23 Sep 2025 19:59:47 +0100
From: Conor Dooley <conor@kernel.org>
To: dongxuyang@eswincomputing.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	huangyifeng@eswincomputing.com, pinkesh.vaghela@einfochips.com
Subject: Re: [PATCH v5 1/2] dt-bindings: clock: eswin: Documentation for
 eic7700 SoC
Message-ID: <20250923-popper-choice-397ce2df6966@spud>
References: <20250923084637.1223-1-dongxuyang@eswincomputing.com>
 <20250923084739.1281-1-dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CpyDDkLlgcplHj/B"
Content-Disposition: inline
In-Reply-To: <20250923084739.1281-1-dongxuyang@eswincomputing.com>


--CpyDDkLlgcplHj/B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2025 at 04:47:39PM +0800, dongxuyang@eswincomputing.com wro=
te:
> From: Xuyang Dong <dongxuyang@eswincomputing.com>
>=20
> Add device tree binding documentation for the ESWIN eic7700
> clock controller module.
>=20
> Signed-off-by: Yifeng Huang <huangyifeng@eswincomputing.com>
> Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>
> ---
>  .../bindings/clock/eswin,eic7700-clock.yaml   |  40 ++
>  .../dt-bindings/clock/eswin,eic7700-clock.h   | 379 ++++++++++++++++++
>  2 files changed, 419 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/eswin,eic7700=
-clock.yaml
>  create mode 100644 include/dt-bindings/clock/eswin,eic7700-clock.h
>=20
> diff --git a/Documentation/devicetree/bindings/clock/eswin,eic7700-clock.=
yaml b/Documentation/devicetree/bindings/clock/eswin,eic7700-clock.yaml
> new file mode 100644
> index 000000000000..49053543ecfe
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/eswin,eic7700-clock.yaml
> @@ -0,0 +1,40 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/eswin,eic7700-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Eswin EIC7700 SoC clock controller
> +
> +maintainers:
> +  - Yifeng Huang <huangyifeng@eswincomputing.com>
> +  - Xuyang Dong <dongxuyang@eswincomputing.com>
> +
> +description:
> +  The clock controller generates and supplies clock to all the modules
> +  for eic7700 SoC.
> +
> +properties:
> +  compatible:
> +    const: eswin,eic7700-clock
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@51828000 {
> +        compatible =3D "eswin,eic7700-clock";
> +        reg =3D <0x51828000 0x200>;
> +        #clock-cells =3D <1>;
> +    };

No clock input to this block? Surprised there's not some off-chip
oscillator that provides a quality reference for the internal PLLs etc.

--CpyDDkLlgcplHj/B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNLuIwAKCRB4tDGHoIJi
0hNqAQDDPtiNC5pVKHqBpAW23GxY1NMDZDiTUN0geJuP9z0D/gD/RxjeEn695k1h
3NxyEJEq+nLNVxgIiucjkldZDlXcqgU=
=Kb0X
-----END PGP SIGNATURE-----

--CpyDDkLlgcplHj/B--
