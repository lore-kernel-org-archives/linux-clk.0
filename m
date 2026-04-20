Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBE11FB1;
	Mon, 20 Apr 2026 16:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776701653; cv=none; b=HHCjM+GHyUVWjVvQKe1Qot0I3Com+QiOivsv5rHSGZ84Cdm2SQpxOrbjjDChgzRPJRSYBaQ9kblghOs75/FgxX5hchaKQ12i5kxb1ZNq3TQBt/epSYpd2f8csOHOAKcStMgeRRcbEUobPN+xRC9AG4y6BRap3B0S2v08jEzolvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776701653; c=relaxed/simple;
	bh=5wfl9+P9EJ6L0BbEH5DhT3kSeK2UsySO5+x/zJBvc+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LTeTobPeZPIplqpXeaPycEaX7tvaWiY403Z+WSmodvMDNVS3Bk7RoXeIVsd6h2mjItlPM1Wiq3IOY5fvBAWSq+h+A0YCdzaVtcLgLogvKOFwPaqNNfx4+GfYW2AfKR6ik62ELGVyv/CV6RWYyQ8trMFYVlh1IVX0ffAtco6iCow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=swOkxva2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="swOkxva2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D788C19425;
	Mon, 20 Apr 2026 16:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776701653;
	bh=5wfl9+P9EJ6L0BbEH5DhT3kSeK2UsySO5+x/zJBvc+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=swOkxva2RIo1eoZaDhBcbzpgkwLo3Y6w3y+3BEAuNP/G/4cYN3sjthlv7M0JiSDPq
	 3f51l9c9/2HNi0g+tHzmD7M50v9ac36kLpPMMTPQ3eG9O3+sjDuI/ZGnSPEehso8Pi
	 bWSzUgzd5XZHfRL6A3LMfoU8qpyDke7K/buk6ddVJ2jAU5iyP9fntLEofv9sCLFYsp
	 BFz6hln7W9811aSPPtN/cHMG12Ud9pMxeCJ5Zc0/f1Tjxki8ODw43nqyql0Hu/pr+D
	 iXYebW52hocm1enFmsN7eIYciYBxudO4kZQm8DaFObB4crqxWVdO5pW1XiCLNiYQyh
	 8UUxsn560/9Fw==
Date: Mon, 20 Apr 2026 17:14:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
	Stephen Boyd <sboyd@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 4/7] dt-bindings: soc: renesas: Document Renesas R-Car
 R8A779MD Geist
Message-ID: <20260420-bronze-umpire-e09056798343@spud>
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org>
 <20260419193718.133174-5-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="buxOxV0Fkdmogddv"
Content-Disposition: inline
In-Reply-To: <20260419193718.133174-5-marek.vasut+renesas@mailbox.org>


--buxOxV0Fkdmogddv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 19, 2026 at 09:35:35PM +0200, Marek Vasut wrote:
> Document the compatible value for the Renesas R-Car M3Le (R8A779MD)
> SoC and the Renesas Geist development board. The Renesas M3Le SoC is
> a register-compatible variant of the R8A77965 (M3-N) with reduced set
> of peripherals. The Geist board is derived from Renesas Salvator-X/XS
> boards, with adjustment for the R8A779MD SoC.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--buxOxV0Fkdmogddv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeZQzgAKCRB4tDGHoIJi
0rHoAPwLbvnyrdiC+rmymK7fgljBrq9sHh6mZ0MGsGQxDoTIBgEAy9mnn4y7PJQJ
qPi87tC0puxDtHTscafpE95WrhTf6gM=
=6Nad
-----END PGP SIGNATURE-----

--buxOxV0Fkdmogddv--
