Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01F11DFE0C;
	Wed, 18 Dec 2024 17:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734541448; cv=none; b=Mj+sGIXvGKreC07riFKRt7+0HUPfb7f8r63/zfNxwiL3QRX1hUQE1GkaXdjkgwYIotQLEyy/OZuwHJJUNdEI1cjoRZmnpVicpmL5z0fmKnhRolyU/Qdqr7p2PoucFha5N7gKtGi9sO6ujqCUFYov3JiSEDyAcGHdw3lrolr37O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734541448; c=relaxed/simple;
	bh=Lc1tAODvxq36WS8j+pXv/p9gobEgptYmL4r1Ojrww8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QCGNeaQctR856YQTh2z50wdy5Y7MfOBZ0PN9auT5vdY8pyBuoC0rYmUcyjq9OQz6Q0++CbqUaSLHOKxpMzi1NsHszpUVDMkep+Y0q1BL0015BKSsCPVksu0snaT0cBcRXiiQSY81V8BugiuGFJep/qUdhXz+p0J+1gmr+lLVrlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t3LpxXZj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t3LpxXZj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DF51C4CECD;
	Wed, 18 Dec 2024 17:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734541447;
	bh=Lc1tAODvxq36WS8j+pXv/p9gobEgptYmL4r1Ojrww8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t3LpxXZjRSXJOs/zCjxoI5w7/cxTCc1BLBf5TyahMCcKFXNVYoImcf5qA7DVDGITZ
	 o/xnHtwAElFplEv8xDyERhkxgwLA6WlbM0xNoay2YcTIozmcnvlPhm9YEdQD4PsVil
	 yAJJbN6zPHb2RShQ7r6d0zZGWC/sC2Mdd+LgvAk8FeladX8VUNA/evmP8J3DpizVqb
	 BI2eV6m0iiebEbWxZx0ar7Nto3cJ9j+oHxTjFcIevZVaIwAG74hzfIxvp9QJxzcqZj
	 6NofAHs2QMskx5bov/ylQGvWc44aLjhVVWs7zsUoe7p7y3VqRQ1BtdItcHQsAS5bOF
	 GOlwBf6HM5mgA==
Date: Wed, 18 Dec 2024 17:04:03 +0000
From: Conor Dooley <conor@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: add ID for eMMC for EN7581
Message-ID: <20241218-shimmer-defog-97f86d6ebe98@spud>
References: <20241218091153.30088-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cF88JIsNcI5m6I31"
Content-Disposition: inline
In-Reply-To: <20241218091153.30088-1-ansuelsmth@gmail.com>


--cF88JIsNcI5m6I31
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 10:11:33AM +0100, Christian Marangi wrote:
> Add ID for eMMC for EN7581. This is to control clock selection of eMMC
> between 200MHz and 150MHz.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
> Changes v2:
> - Drop additional define for EN7581_NUM_CLOCKS
>=20
>  include/dt-bindings/clock/en7523-clk.h | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/include/dt-bindings/clock/en7523-clk.h b/include/dt-bindings=
/clock/en7523-clk.h
> index 717d23a5e5ae..c4f8a161b981 100644
> --- a/include/dt-bindings/clock/en7523-clk.h
> +++ b/include/dt-bindings/clock/en7523-clk.h
> @@ -12,6 +12,8 @@
>  #define EN7523_CLK_CRYPTO	6
>  #define EN7523_CLK_PCIE		7
> =20

Why the gap?

> +#define EN7581_CLK_EMMC		8
> +
>  #define EN7523_NUM_CLOCKS	8

Can you delete this please? Your changelog appears to suggest you did,
but I see it still.

--cF88JIsNcI5m6I31
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2MAggAKCRB4tDGHoIJi
0hu1AQDuqlosSFY+xllHUvu0oi2pVOj+WRmQiUd1UqbLOPorlQEA9+UEqTiMOMxv
5scWj05uDzOtgd0TshzJrzRbTaEpAQ0=
=zSjG
-----END PGP SIGNATURE-----

--cF88JIsNcI5m6I31--
