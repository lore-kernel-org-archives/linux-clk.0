Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F9F3F39F2;
	Fri, 29 May 2026 16:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780073373; cv=none; b=OmIfUyHMzFLIAlnf+/pDsJUMYbdgLokz1eR383BqwSUAoeUfLps6J4SCxOma9LjYBBTB4xGDmc5ulD5lULbovECQO3/Z/OA+esvjvAgy8SY8TBmFPTAUK7FwM5jX7eqT1n5vzlOmFP2NgMDQsD/1CBKEhBTCNJbMS+a8uOXQLoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780073373; c=relaxed/simple;
	bh=oUpgO5p3xosTXWARfE9/EBDzZAa/N3R5rhN8enXVEjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dl182J7SPNvMZn/aDBK+DqMYKTTZIiuyBI8tOD3u7QrP/VTdYYSPq6CxO9pw56sFKqdy01HYeQcvsCuNi2nt4LHnk2tNKGXJ1RZBo0F+59bG1fpSuoetTvk2x+xxg6xe5HfhnvX7lRNdwiipTx3i+4vlbBNMccaxnAa2zq/GcC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HYvhkWub; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HYvhkWub"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F4551F00893;
	Fri, 29 May 2026 16:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780073371;
	bh=lwfdphpnNxuajP1SfK7U6y2PR8IZ0jJwzcVdnBMd6nA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HYvhkWubGms+xcSqFGgV+A4XLqcgjZT85EHj4REmJI1M0I2vpo7geJNfgbRBHsgZp
	 whEMQVzUe0sflshBaReOWx8me6PbiLYCAzUz64zRIKjtze6K7Ugb4TEKlBuPG5grM0
	 004X6A+CdTQA2JJFGTdBCSpVSvJYkZdngo1ZdHC6grPPL3iQ5CpQkkdndBBfTfFFmE
	 XmTXmu3ah/6uGIXgrplvlL/KiP+YDKmgoo880MplkZT0JZjhLRIPmPWgcIqsW2+ZAr
	 X+9WYwmpLpWTpPuVHIzOi6WGa01c/ffbVZadih2j80+jqo+1eaAVKt/q20HRb39Vye
	 RVjkIeET8xq3w==
Date: Fri, 29 May 2026 17:49:27 +0100
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
Subject: Re: [PATCH RFC v3 2/5] dt-bindings: clk: zte: Add zx297520v3 LSP
 clock and reset bindings.
Message-ID: <20260529-hypocrisy-clump-abf596df704d@spud>
References: <20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com>
 <20260529-zx29clk-v3-2-c7fe54ea388f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Itt2pNgWFbhrwYID"
Content-Disposition: inline
In-Reply-To: <20260529-zx29clk-v3-2-c7fe54ea388f@gmail.com>


--Itt2pNgWFbhrwYID
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 12:52:59AM +0300, Stefan D=F6singer wrote:
> +properties:
> +  compatible:
> +    const: zte,zx297520v3-lspclk
> +
> +  clocks:
> +    items:
> +      - description: Main PLL divided by 5 output from topclk (124.8 MHz)
> +      - description: Main PLL divided by 4 output from topclk (156 MHz)
> +      - description: Main PLL divided by 6 output from topclk (104 MHz)
> +      - description: Main PLL divided by 8 output from topclk (78 MHz)
> +      - description: Main PLL divided by 12 output from topclk (52 MHz)
> +      - description: Main oscillator output from topclk (26 MHz)
> +      - description: Timer oscillator output from topclk (32 KHz)
> +      - description: LSP pclk output from topclk (26 MHz)
> +      - description: TDM wclk mux output from topclk
> +      - description: DPLL divided by 4 output from topclk (122.88 MHz)
> +
> +  clock-names:
> +    items:
> +      - const: mpll_d5
> +      - const: mpll_d4
> +      - const: mpll_d6
> +      - const: mpll_d8
> +      - const: mpll_d12
> +      - const: osc26m
> +      - const: osc32k
> +      - const: pclk
> +      - const: tdm_wclk
> +      - const: dpll_d4
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  "#reset-cells":
> +    const: 1
> +
> +  reg:
> +    items:
> +      - description: IO memory region of the LSP controller

Just make this "maxItems: 1".

Also, sort reg after compatible please.

Same comments apply here about the example and using _END defines.

pw-bot: changes-requested

Cheers,
Conor.

--Itt2pNgWFbhrwYID
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahnDlgAKCRB4tDGHoIJi
0isBAP992+dVrtcpmiLKLuTlJrY2DJkqogyJJVFoNxdYD6jcXgD/b15qvDe703x3
bPfmU+yYyoX/O3iQkIUsVeePrR0mtwc=
=axFd
-----END PGP SIGNATURE-----

--Itt2pNgWFbhrwYID--
