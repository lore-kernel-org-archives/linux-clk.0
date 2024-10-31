Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DDA1C6B8;
	Thu, 31 Oct 2024 13:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730380164; cv=none; b=Ty+c1ZIQcQhcsnnxV3ynHaKKtj5feNA159BiNQliRpWLDBPa6oMB6NTvmj3mEe2RE5LYGdBe8TXt8sqM+6avP9A0PCRKftFrmpGzScgcyRoMBtdvcUPq3Gth41uWFv2Cd6S6zhR3qgt/2uzmnfsTP4vZQnaU6syuiKexmcYOd+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730380164; c=relaxed/simple;
	bh=3H47IOxYEfHkJ9A39j6LSPYQX1SkSS7HVKz3N9MajYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EAOaAU5uYWDhraQOjk5GM2xD8QS5NaMqfX1PQyI0vBWMMCYiuiI+qJpm8ad8jXwQbTBNTMq9v1NnMVEn/HnSfD1us6Zmj3i/MaZN5jVbOZfOSH/6X/ZRLDs7Ey3fDUrYX3XNA9iQ9puvfo3G+Ynz78nTDvXFY0Z3AQ0YxszDd08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MsnkWyiO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MsnkWyiO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C194C4CEFA;
	Thu, 31 Oct 2024 13:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730380163;
	bh=3H47IOxYEfHkJ9A39j6LSPYQX1SkSS7HVKz3N9MajYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MsnkWyiOvUAJZCtDX0tOCzSoSeDSSPG9W1sQpSucO/mdwUDT1q5j5KwIfxueS5BOx
	 oJUK19Tt1BA6dPBfPnqgqS4jQLVvoYyFsko9VPzH+vUp7uo+0swDTRASHY1SngOujo
	 /l7pTKFp7wjsKAyGuplSe5EH62JtZGNGUI3eJUoJtc4XTD4q2GYUAZMsicOv0S9kYl
	 Ua2mFpSDooMsuLfyyxR7Yp1VpDCoVwpen25s8lb5zD35nyTT4J9O8mhcf2dMsDA0Jt
	 IvbXKNERKa9IiQjA4v7fW7DpaZHEYCkO39DDS6LUZ5q7XhnFXZuYr1tlNsePn0xEQh
	 zGn/reHo/LJ0A==
Date: Thu, 31 Oct 2024 13:09:19 +0000
From: Conor Dooley <conor@kernel.org>
To: Nuno Sa <nuno.sa@analog.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: axi-clkgen: include AXI clk
Message-ID: <20241031-unawake-unruffled-c57907460df4@spud>
References: <20241029-axi-clkgen-fix-axiclk-v2-0-bc5e0733ad76@analog.com>
 <20241029-axi-clkgen-fix-axiclk-v2-1-bc5e0733ad76@analog.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="q7sPDN7IEuTtY0tg"
Content-Disposition: inline
In-Reply-To: <20241029-axi-clkgen-fix-axiclk-v2-1-bc5e0733ad76@analog.com>


--q7sPDN7IEuTtY0tg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 29, 2024 at 02:59:41PM +0100, Nuno Sa wrote:
> In order to access the registers of the HW, we need to make sure that
> the AXI bus clock is enabled. Hence let's increase the number of clocks
> by one and add clock-names to differentiate between parent clocks and
> the bus clock.
>=20
> Fixes: 0e646c52cf0e ("clk: Add axi-clkgen driver")
> Signed-off-by: Nuno Sa <nuno.sa@analog.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--q7sPDN7IEuTtY0tg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZyOBfwAKCRB4tDGHoIJi
0oMsAP4+g2rRuFgG9dGBMOL2puQrMEy6mZ00M3YECyd9y/o1lQEAjd7HxriNpDpD
Tpce4zZRk1gxMjWiHWUZRGBeKnanDgY=
=ro9B
-----END PGP SIGNATURE-----

--q7sPDN7IEuTtY0tg--
