Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530C232D0E1;
	Thu, 16 Oct 2025 16:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760632304; cv=none; b=ppOExmXrhWc8K7kfT308TbB4X8ABZ/ZG4oZHhsavzpT/dDx/clgtqvweh1JXoMEtUk1t3uqsIOnRmf8MuDGJoImH4tiIiVeEWdkGbvVXbG3gMzfoB9DbwdQ7NonYbU5SHP8XDN2bnVpaLwaXMTicEoFoS0E32NIpYjTJLDWptHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760632304; c=relaxed/simple;
	bh=29W5nbATLg28IhUhpNbWJzH8SNHYX5AYEkj889sc9+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JfQFixmiVmNKaMqfpg2U4mB3mJ9YZEROWv2lICShK/z70MkCTJSlO6+4vFLoyR0Y68Lx6aq1v/mNZUCcxuaEgu6spQDlmwN5jIA+knu8CPyvxlMufbzse4BoUSTUDFEP3/oXfI3h2m/D50fAJhTvMluqVZj93uBxFFrGj6qwjUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pFtCA44i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pFtCA44i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FB2FC4CEF1;
	Thu, 16 Oct 2025 16:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760632303;
	bh=29W5nbATLg28IhUhpNbWJzH8SNHYX5AYEkj889sc9+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pFtCA44i6uxF+9s4JNBqT9WeY/G9YYlQMIH20RphumNcs3qYiz9OzadSzPhPCqgdW
	 rvjp16iCsQgrS3D33mowTrTFqqgs5UbnhZDZiqbn3KxMheWP4Cpv2J26+iiPlzko6F
	 lcaAeaZ/+m2cniCZ3zj+2wu0RhyYouFsbwOVTykcxFWsr3HY0AH/Ayxv1wd+TrR4WM
	 lB1a0Evjy4vWqH7iAs9bYte2IH7iXz5EzcQT74rQK9qDVdz6tcRX4LPEAYokTowTc+
	 +J2afBV6FMYZL2CgcBwLmnw6pCD3p4rjk8MdyS5KIJK88afhucf56TPuJ6/lbJL7nF
	 ff2X8UaZJCJUw==
Date: Thu, 16 Oct 2025 17:31:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Frank Li <Frank.Li@nxp.com>,
	Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: interrupt-controller: fsl,irqsteer: Add
 i.MX95 support
Message-ID: <20251016-anger-pretzel-87c1f84b8673@spud>
References: <20251014215801.51331-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T89yuDH1YCgqWT9Y"
Content-Disposition: inline
In-Reply-To: <20251014215801.51331-1-marek.vasut@mailbox.org>


--T89yuDH1YCgqWT9Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 11:57:15PM +0200, Marek Vasut wrote:
> Add compatible string "fsl,imx95-irqsteer" for the i.MX95 chip, which is
> backward compatible with "fsl,imx-irqsteer".
>=20
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--T89yuDH1YCgqWT9Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPEd6gAKCRB4tDGHoIJi
0vgtAQCsWApIMcAo4VKXn6RTQPNgNRFXtSQGMXFxXZFAmCE4WQEAnpcjtLoHMOEm
RAckTJ0NvNnAdqmW9zbbJNm50vefMAU=
=16D2
-----END PGP SIGNATURE-----

--T89yuDH1YCgqWT9Y--
