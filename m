Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254BF32D0CA;
	Thu, 16 Oct 2025 16:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760632270; cv=none; b=ctLWtCyNTadxbO8gTW+BO7FcwBzV32TwSUb32gJIR91OEz9UxrHyzUW/cK17ScPqfZ2Gag4WZxdG7xvS6paIoDaStqQulE2+8kiSndvXti7xQK+Vse06yb2NN2Gh5GNXFUxEp39CQwnj0dhLsUV+VkrIDXWr7Ehr24iIR3gVj+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760632270; c=relaxed/simple;
	bh=ahPb3ckcAEmY7IUjAsjAfGMRqpiOArY+yxe2UGPnHks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a9jM/NFTJV9bCPMGB4oQoRiQkDjbLnaj5ReaUI6r26xuSDlZHQ6LyLIvXx/G07EAt37KJ7ecP+oWmKXuB8c6UBsJyqX/R2w6dW0nd5RBAWb/Qr9Op4kZZHYc6V7QjKg5ZukHx2rRYgvp0eq+IbyGJO+KmX6FjgdBiFFU66PznOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n85zR175; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n85zR175"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 044BBC4CEF1;
	Thu, 16 Oct 2025 16:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760632269;
	bh=ahPb3ckcAEmY7IUjAsjAfGMRqpiOArY+yxe2UGPnHks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n85zR175PL3QxtPzLsrosubJ6NGVtRhI0YV8h3dFSZmBK96i+Eycpo6oBlyuwkMDE
	 +qqF8G3j8e5KvlC4bIbJIXR0dcTNQZVCYYjYHY/AUjHyI5jVozRGG4CgFTSVxDG1nA
	 29GzXfzzY91HhmBf0c+L3HwBuJ5dPTZpyrNLkAMYNJEtZCwhV3zBDB9g4Qe9nmKTP/
	 8BHiYqIsG8LCtodRMk+HGrZcRnI9DK6DNTH5dDKg8Cv+1nSprVYvXKPhhs2sm/fzTh
	 esCgVyxVsDJ7OiuSfBtt9OZ/VrgA8BDrWCEvMoidOExmSVV3FIYRpfU3pfBHwIhkPN
	 Tu1vNKZPC2xuw==
Date: Thu, 16 Oct 2025 17:31:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-clk@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: clk: si522xx: Clock driver for
 Skyworks Si522xx I2C PCIe clock generators
Message-ID: <20251016-speculate-helpful-6d594e751d6a@spud>
References: <20251014220206.52470-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kduzTybAveeDVB7M"
Content-Disposition: inline
In-Reply-To: <20251014220206.52470-1-marek.vasut@mailbox.org>


--kduzTybAveeDVB7M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 12:01:43AM +0200, Marek Vasut wrote:
> Document the Skyworks Si522xx PCIe clock generators. Supported models are
> Si52202/Si52204/Si52208/Si52212. While chip is similar to Si521xx, it also
> contains many subtle differences to justify separate driver.
>=20
> The Si522xx has different register and bit layout, supports spread spectr=
um
> clocking and slew rate settings, and no longer contains the old BC Byte C=
ount
> configuration register. Instead, the I2C protocol is yet again very sligh=
tly
> different, but this time at least compatible with regmap.
>=20
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> ---
> V2: - Fix the DIF pattern match and description, update example to valida=
te this
>     - Rename the YAML file to skyworks,si52212.yaml

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--kduzTybAveeDVB7M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPEdyQAKCRB4tDGHoIJi
0rlcAP9AU6ai+pExiIXO1fW2/JkS0m4TSjSMjlI1UttXMZFKOgD/fGC5Zyz94Djr
P2DaT5hQk0QPsm188WzLu9DnpgcfdwI=
=Hh55
-----END PGP SIGNATURE-----

--kduzTybAveeDVB7M--
