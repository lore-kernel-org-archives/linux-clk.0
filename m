Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B823D5C05;
	Tue, 12 May 2026 17:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778605327; cv=none; b=Q27HMTeaxozshoGqUm/iOxJ6MbZXiCJ4/4BAQDC8znt5wYqzW1etm76w9XfJ884+bbqP7J/xkSnIR1GJJ3xMJY9kvGZKRZGT1HhfJnX2P2W1ohEu2I2ut3Sfq4+/VP9TubugckaQaEWCvzE81r1DCOSdzcAA/kzkmlkyuEThtc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778605327; c=relaxed/simple;
	bh=t7X3VU5Fnvb2pw09HJTrXmQN1bStwyMFOJNQ9PHYPPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OQNBFlAvW0uZNj5el+5XyrXddIy8qKP4m11SevnKM0nJz6HCIMWO6y3FoeRUnhOxLbU7EqH3KD9Lf83X5Vw3WbWfeY4OnX0slgiwRN4NXg/hqw/KEGti+fsl99qfV0qhBDNAgNEqzsX+WVTamsWrbijchRco2JuuilXlb8AAPRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tj/Mzrub; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tj/Mzrub"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 223A7C2BCB0;
	Tue, 12 May 2026 17:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778605327;
	bh=t7X3VU5Fnvb2pw09HJTrXmQN1bStwyMFOJNQ9PHYPPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tj/MzrubFmazjOzfMDlG+hsCo4L1k0j/prfntOVYe1FbH37Hc64KCifj8B3Dy3kJ9
	 A4bt+/czHFtKjdWTYKqingjkUCIiLMi0ywHO9H13myTtxkOLUxkFEMRxyJp3324OFl
	 gQ67lYmO6SyrysPM3PXBZ3pr0lZBxbx/E3UlUoaBBij8K+zgiNRW4S55/6bDj46GY6
	 QFXboCTDoBhP+4Em7mHO2UiAjM03ItlsaShcf/l5hstMWGoml9SvCmnrkpRJLUfH98
	 kpA9ltCfE54vRxMqN1TkMx1rSPp2Gfjo4BeO8SBPotMPu1SPNP3zM+KhAwG0ljTiDe
	 gtCCSRV82n3mw==
Date: Tue, 12 May 2026 18:02:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v2 1/4] dt-bindings: clk: zte: Add zx297520v3 clock
 and reset bindings.
Message-ID: <20260512-musket-gaffe-376f0450a610@spud>
References: <20260511-zx29clk-v2-0-29f0edc300f5@gmail.com>
 <20260511-zx29clk-v2-1-29f0edc300f5@gmail.com>
 <20260511-backstage-crewman-e44947ab6cfc@spud>
 <DD71E384-1777-47B8-93C8-D6EFDA4BA74C@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M3uGp2e5R9ndKlm4"
Content-Disposition: inline
In-Reply-To: <DD71E384-1777-47B8-93C8-D6EFDA4BA74C@gmail.com>


--M3uGp2e5R9ndKlm4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 12:33:42AM +0300, Stefan D=F6singer wrote:
> Hi Conor,
>=20
> Thanks for your reply!
>=20
> > Am 11.05.2026 um 19:07 schrieb Conor Dooley <conor@kernel.org>:
> >=20
> > How come the "matrixclk" has no constraints on clock properties?
>=20
> Because I am not sure what the correct/preferred way to express the inter=
face between top and matrix is - see the first question raised in my cover =
letter.
>=20
> In short, matrix potentially consumes all clocks available on the top con=
troller. There is no obvious interface between them, like there is between =
matrix and LSP. So I see two ways to handle this in the bindings:
>=20
> 1) List the top clk inputs, top clk PLL outputs and PLL fractionals as ma=
trix input
> 2) Be quiet about it

Unless you want to model top + matrix as a single node with two register
regions, then list it all. Hiding the relationships is ill-advised IMO.

>=20
> It'd be about 20 clocks or so that I know are consumed. The bigger issue =
than the number of clocks is that my knowledge of the board is from reverse=
 engineering, not proper datasheets, so I might find out that a clock is mi=
ssing or wrong.
>=20
> > Although, these two devices seem too different to be in the same
> > dt-binding. Do they have anyhting in common other than the SoC they are
> > part of?
>=20
> No, they don't have anything in common, other than that their concerns ar=
e poorly separated in hardware.
>=20
> I take it from your question that the preferred way is to have separate b=
indings for them in this case - I guess separate headers as well as separat=
e yaml files. Is this correct?

Separate headers if you like, separate bindings since the hardware and
binding are completely different between devices.

> The third clock controller - LSP - is nicely separated from the other two=
=2E I would not be surprised to see this subsystem of the board show up on =
a different ZTE board. If top and matrix should have different bindings, LS=
P certainly should as well.

The "two" I was referring to were the two with constraints, so top and
lsp, so that should answer that!


--M3uGp2e5R9ndKlm4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagNdCgAKCRB4tDGHoIJi
0rCoAQCbIMHm+OHvyUfYu6hMCFpvypMIFKu/WsZo5gklt3xhlwD9FAiVUGWc9Rj/
kCGsAImdqX5V2RKYeMsXRZ5JGRzBNAo=
=/N43
-----END PGP SIGNATURE-----

--M3uGp2e5R9ndKlm4--
