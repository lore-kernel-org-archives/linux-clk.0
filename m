Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6511FBCAE;
	Wed, 18 Dec 2024 17:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734543965; cv=none; b=nPI4l7ZoASQP8b3FN1cMl0Ygh24b7MaJHuo0pWkWBz8hc1tqv3bnzus7DmQhPx8EqhPK18jBwIO4tpxmoO0ei9U6HQR3XztlpWzHKqidlYrcRZSpWBxQI5lITuQqKTpQSJqbTwWwq7d/ZWaNH+CUWBbupfL8fcDQTuLv1B38Q/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734543965; c=relaxed/simple;
	bh=pudHmww6Cx7s8A7MfEpd2ws0OfeJewH4Q0LJ7v+Ror8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UMrVedwPgCWeNOR//orZDuc59T405jCOIaQERypWm0/bN7Vcaqtu7YQc5rEwYJfTsegaR9e35JJT7i9lSKf2mlO9x4OQUais7iq30Iw7AhZa+Wn6iOhPyjf5U3rJuKYz+ZrnTxm8Ug//QGLzkAtuO9ceHLaUxA+xq/V643DbJ/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IDJLrA6r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IDJLrA6r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAB40C4CECD;
	Wed, 18 Dec 2024 17:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734543964;
	bh=pudHmww6Cx7s8A7MfEpd2ws0OfeJewH4Q0LJ7v+Ror8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IDJLrA6rO+P7EzHvpB3O6NcRAOZKWEo0p7syOLXXxs5VmKAEod17VQNON7Ip97ydj
	 Slu96wu7UmadndsH17TiqbOiCvITu8i4cffLqmi1NfET6IjIFvXtTPbmOupqbyELkz
	 of93xqYJItcCBPqRR9gJbG4VrxhgWOnxyROQcsttdsLbfKs5yc/SNl/XV5EkSoZbBR
	 mqiJOT9fJHKnDFgmL1FP5bZ9lUadQZb8/RGrvkKPOrwPsgIFPVD61lWvaptaLKqmtA
	 zlg/37hKvdj/s7J87WpvhVbk5rArRdyNAg6/mBS1VFOnswRF8vudoOeoDcGgK5StpD
	 jyUe5HUNGjHgA==
Date: Wed, 18 Dec 2024 17:46:00 +0000
From: Conor Dooley <conor@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: add ID for eMMC for EN7581
Message-ID: <20241218-unlit-karaoke-ee4ad4425a5a@spud>
References: <20241218091153.30088-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TdYup3nKZLKxrcv2"
Content-Disposition: inline
In-Reply-To: <20241218091153.30088-1-ansuelsmth@gmail.com>


--TdYup3nKZLKxrcv2
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
> +#define EN7581_CLK_EMMC		8
> +
>  #define EN7523_NUM_CLOCKS	8
> =20
>  #endif /* _DT_BINDINGS_CLOCK_AIROHA_EN7523_H_ */

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--TdYup3nKZLKxrcv2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2MKWAAKCRB4tDGHoIJi
0nOoAP9oJz0/+EqHnRlVcL21Pt63jlI2AY23b2eXSXNX6Hmj7AD/UEPuUiTNKpB6
Fpr/avAW6RQ1uwNDwxSSukdAk0csxQc=
=i2Qx
-----END PGP SIGNATURE-----

--TdYup3nKZLKxrcv2--
