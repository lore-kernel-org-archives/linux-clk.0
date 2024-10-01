Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DD4199953;
	Tue,  1 Oct 2024 08:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727771462; cv=none; b=LPW4xY0lKIqGhS8BN1Nu+YdtdRLbHDX0A/fqGbNkTTFMVfd0TDp5AonPS15jdECJIYhoohoN2c4iTSvL9y+lcJMX0cmyo5STv6/QWEYvS1pz3Wz0RZdb4yGljKcutqke3VxRGG0g9C2yBBXodGMZXQj93wkRMBTeBJGMhdpPw0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727771462; c=relaxed/simple;
	bh=f0h7Jx2hweEXtflBpFhTStGCtlRkjiqw8I06XPsdHKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kKRaMYvN2/TX+A83o+H/SoQZ0hKBgI95molQtceo8FJqoH8uAm3laCo6Tz07cu3nv/pCWvelOPSoK01uQ96Neb7sgNO2h8qsS4+hPMDPVx9r11xFeiSXlNDcQzC4qpULG1Urnoc1zoT2hH2hdM+zb86/cNKSgL6VrFizEkjuLuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CtMgGcIU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CtMgGcIU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA233C4CEC6;
	Tue,  1 Oct 2024 08:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727771462;
	bh=f0h7Jx2hweEXtflBpFhTStGCtlRkjiqw8I06XPsdHKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CtMgGcIUYy4reC/foYGFZxrzXQN5ppS9LJ6nNEDyEUe+X1BmBNFqOfpPyiCBoBslF
	 uYpje2EzEXdZMbSe4wlyiwo6vhcd0s4Ns4ckd0QMSEDiNN9dOtVx1xAQIX6n/9njvK
	 j2VMkI8uwbQuBir/ovWdcWixkOpKAwUhYvN26NQqTkhRfUemmRNpFxAmJ22ZzLqFxE
	 +utjIwmb822dgJaT5HisF4EIeuGOdHJlYP7AzfpU+Sq31rRJJdnJUsL0DRnWkFzfMM
	 FWzDCYTA33kmGb5QX3sba6rmd6DwHB1bvrCZTNGhke2p6sZZUe0lExajhBzNamKPXl
	 74L2KX9Jeuuwg==
Date: Tue, 1 Oct 2024 10:30:59 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	upstream@airoha.com, angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org, lorenzo.bianconi83@gmail.com,
	ansuelsmth@gmail.com
Subject: Re: [PATCH v2 0/7] clk: en7523: Update register mapping for EN7581
Message-ID: <ZvuzQxjuN2zRrAMG@lore-desk>
References: <20240903-clk-en7581-syscon-v2-0-86fbe2fc15c3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UkCTyigatkMAuJc7"
Content-Disposition: inline
In-Reply-To: <20240903-clk-en7581-syscon-v2-0-86fbe2fc15c3@kernel.org>


--UkCTyigatkMAuJc7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sep 03, Lorenzo Bianconi wrote:
> Map all clock-controller memory region in a single block for EN7581 SoC.
> Introduce chip_scu regmap pointer since EN7581 SoC will access chip-scu
> memory area through a syscon node.
> REG_PCIE*_MEM and REG_PCIE*_MEM_MASK registers (PBUS_CSR) are not
> part of the scu block on the EN7581 SoC and they are used to select the
> PCIE ports on the PBUS, so configure them via in the PCIE host driver.
> This series does not introduce any backward incompatibility since the
> dts for EN7581 SoC is not upstream yet.

Hi,

any update on this series? Are we supposed to do something?

Regards,
Lorenzo

>=20
> ---
> Changes in v2:
> - fix smatch warnings in en7581_register_clocks()
> - fix dt-bindings for EN7581 clock
> - move REG_PCIE*_MEM and REG_PCIE*_MEM_MASK register configuration in
>   the PCIE host driver
> - Link to v1: https://lore.kernel.org/r/20240831-clk-en7581-syscon-v1-0-5=
c2683541068@kernel.org
>=20
> ---
> Lorenzo Bianconi (7):
>       dt-bindings: clock: airoha: Update reg mapping for EN7581 SoC.
>       clk: en7523: remove REG_PCIE*_{MEM,MEM_MASK} configuration
>       clk: en7523: move clock_register in hw_init callback
>       clk: en7523: introduce chip_scu regmap
>       clk: en7523: fix estimation of fixed rate for EN7581
>       clk: en7523: move en7581_reset_register() in en7581_clk_hw_init()
>       clk: en7523: map io region in a single block
>=20
>  .../bindings/clock/airoha,en7523-scu.yaml          |  23 +-
>  drivers/clk/clk-en7523.c                           | 309 ++++++++++++++-=
------
>  2 files changed, 217 insertions(+), 115 deletions(-)
> ---
> base-commit: f0e992956eb617c8f16119944bfe101dea074147
> change-id: 20240823-clk-en7581-syscon-100c6ea60c50
> prerequisite-change-id: 20240705-for-6-11-bpf-a349efc08df8:v2
>=20
> Best regards,
> --=20
> Lorenzo Bianconi <lorenzo@kernel.org>
>=20

--UkCTyigatkMAuJc7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZvuzQwAKCRA6cBh0uS2t
rGrNAP9TeQLIxDes7MAEgydGoNkQ/vdCk3U1fQ9A2V1SP8PXTgEAkBJKOcGXqrh/
efFB5am1dPOMBVaHQKjydJy41iKtNQE=
=02H+
-----END PGP SIGNATURE-----

--UkCTyigatkMAuJc7--
