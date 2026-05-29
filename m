Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DED23F167C;
	Fri, 29 May 2026 16:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780073290; cv=none; b=sX/dVwBEa7x5P69vwCPyubHJMKBQPSyjWky95+l1cbkIryVHx1hsiPehQXGA5TIAoMcmHqBVfihmYTtuXJ1RnRA7sljGbtVeQ0HXdrepRKEyB+up2726HrZ8VT92mbqQVSKeZLfLz0je6m2Stw3FcfaMwaVF0lOY1Radz2LABF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780073290; c=relaxed/simple;
	bh=/zgA3yp6fJMT8M18vhaI6lNB3yCq4N81P0fXuvffUIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PVinE3TjodUy5X6JjVZyfqPM8bA37EgvyXq8KMEs4MhkS6N1t/BMKdmjGzHaEikJjpD0914zToorRFBdSCpMRutNCuKNNqSLs63NqjzkYD4fwuA05wO46p8odLLkMjp6iLVX25+/dJ1yyjbIp4d2+vuBGOL+jWwffhH9NhtEwvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WOeAnlTL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WOeAnlTL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 560031F00893;
	Fri, 29 May 2026 16:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780073288;
	bh=bs6a6rB5aI/Hka37QMJwNctCWzcOa52N3mCrHuWGm3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WOeAnlTLPLmawbXgDWlqkTuNi4tHXPBPP079Ithuy/3FhicMNSyMfuEV4+esoa2fn
	 oavNEvUChfbGTHyNm/251QopxKJjRsKleYv2+4D1bsvNBEnCZXUEW0yM5402UWiJ3G
	 bb0oGngwTcapoB0eQIZLRT7SiPNC1Fy//BCnsnSDfOOb5ccEIIbTvQ7lNY7neX2Qkl
	 RhNZV6CtUDYuY32UXetXudyA4nMXj6M09Xh7uOFTxnJVnWa8/4zhFnkAivnLgJ08aW
	 q6Vg0ST7sXxmr90ueD7ipBZrF2vjYX/ZJt+JayCaSQ5bBboYdAnp/BA9irZGnh03jP
	 nCTsJDB7wayOA==
Date: Fri, 29 May 2026 17:48:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v3 1/5] dt-bindings: clk: zte: Add zx297520v3 top
 clock and reset bindings.
Message-ID: <20260529-multiply-engraved-aab583ea4519@spud>
References: <20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com>
 <20260529-zx29clk-v3-1-c7fe54ea388f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YBxRIz2Jfcjr4jMm"
Content-Disposition: inline
In-Reply-To: <20260529-zx29clk-v3-1-c7fe54ea388f@gmail.com>


--YBxRIz2Jfcjr4jMm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 12:52:58AM +0300, Stefan D=F6singer wrote:
> +examples:
> +  - |
> +    #include <dt-bindings/clock/zte,zx297520v3-clk.h>
> +
> +    osc26m: osc26m {
> +      compatible =3D "fixed-clock";
> +      clock-frequency =3D <26000000>;
> +      #clock-cells =3D <0>;
> +    };
> +
> +    osc32k: osc32k {
> +      compatible =3D "fixed-clock";
> +      clock-frequency =3D <32768>;
> +      #clock-cells =3D <0>;
> +    };

Drop these two nodes, the tooling will "fake" them when validating the
example.

> +
> +    topclk: clk@13b000 {

And drop the unused "topclk" label here.

> +        compatible =3D "zte,zx297520v3-topclk";
> +        reg =3D <0x0013b000 0x400>,
> +              <0x01306000 0x400>;
> +        reg-names =3D "top", "matrix";
> +        #clock-cells =3D <1>;
> +        #reset-cells =3D <1>;
> +        clocks =3D <&osc26m>, <&osc32k>;
> +        clock-names =3D "osc26m", "osc32k";
> +    };

> +#define ZX297520V3_TOPCLK_END			79

> +#define ZX297520V3_TOPRST_END			29

These are not permitted in bindings, please remove them.
Half the time they end up changing because people find other clocks, and
they never actually get used in a dts. If you need the definitions, add
them to the driver.

pw-bot: changes-requested

Cheers,
Conor.

--YBxRIz2Jfcjr4jMm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahnDRAAKCRB4tDGHoIJi
0hbiAPwNGAaPIyaReYqC+GSpDiH3tTgNnUmNDAzwD74p1ZTdLwEA7vQjl++6fHjP
3lt3ClNJwXDOdqTyumqbVJvnZTC8jQY=
=KNnD
-----END PGP SIGNATURE-----

--YBxRIz2Jfcjr4jMm--
