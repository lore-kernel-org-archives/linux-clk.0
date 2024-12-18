Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81B41F541A;
	Wed, 18 Dec 2024 16:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734540252; cv=none; b=rYvF3ZNKr6qCGB+XeDydfSA8rt4hg7iD1Z6fdGAlPRmjD8dQB8MjJJS0+S1PmhDQWKo2L2fJck8FI6qk1MD92OphTiYJ4nUy6C9zikrv9aRiKYx6HN8xbqrkkBSIq59+DOS460V/Zxpz3dkeTDCyYzXKRWuR47aW9BLWmmhJn4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734540252; c=relaxed/simple;
	bh=pB0kgdn2bOfLkrxZ9uo+wGEPrm/eb16hrnNYiA6bbiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KhQYxHZSamP5rNqD4oDAVoBlgrkWyEL0CN4pKJdfO5DrI27uRCj8rBM5mxlYSGzs10REZCtLl9jk1tptkhMDKyvv/miHtvGHa/KhoOWzNHcK9jzWemSfwEI5sEEPea0lJzv/llFole0X/MWDid9KOwaILxR3ctsXHkoht13aTgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QRQ1EkPT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QRQ1EkPT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8813EC4CECD;
	Wed, 18 Dec 2024 16:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734540251;
	bh=pB0kgdn2bOfLkrxZ9uo+wGEPrm/eb16hrnNYiA6bbiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QRQ1EkPT3omHuxktYvRSWPyTjMxF1HLVF0DMDwMO4sfWc25d1v0amUkufVVNME9rp
	 ohWR6o97Bsye7LrwHlAHbiLbvlXrmeWX8fHvgX91MpyD3BI2OgeEJc8bPAHWaOUgXG
	 m9W4yeW6Nm89519yX8Q16C6V5T3LxRe6WNyzbX7gqHt3ldY5II4z25bf2YO07dhL8a
	 J/2OHP1B/eWUnzN7xfrQ2VeyC129sKxSoPUll6CAYOtC+U6jbx3CG3ZZjlJe21AWR5
	 2v7kI/E0I8O2Kjd6feIWaHomxKZUEY6BjARFV5lbUQdSC8sIC2u5LGCHA0ylZyWcCO
	 uW37sCv9s5pmA==
Date: Wed, 18 Dec 2024 16:44:06 +0000
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sboyd@kernel.org, mturquette@baylibre.com, matthias.bgg@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	geert+renesas@glider.be, u.kleine-koenig@baylibre.com,
	amergnat@baylibre.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	kernel@collabora.com, macpaul.lin@mediatek.com
Subject: Re: [PATCH v1 1/2] dt-bindings: clock: mediatek,mt8188: Add
 VDO1_DPI1_HDMI clock
Message-ID: <20241218-twelve-requisite-c63827edfbad@spud>
References: <20241218105415.39206-1-angelogioacchino.delregno@collabora.com>
 <20241218105415.39206-2-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Qo/gdjEA9Ojw6e4h"
Content-Disposition: inline
In-Reply-To: <20241218105415.39206-2-angelogioacchino.delregno@collabora.com>


--Qo/gdjEA9Ojw6e4h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 11:54:14AM +0100, AngeloGioacchino Del Regno wrote:
> Add binding for the HDMI TX clock found in the VDO1 controller
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  include/dt-bindings/clock/mediatek,mt8188-clk.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/dt-bindings/clock/mediatek,mt8188-clk.h b/include/dt=
-bindings/clock/mediatek,mt8188-clk.h
> index bd5cd100b796..8af44560a74c 100644
> --- a/include/dt-bindings/clock/mediatek,mt8188-clk.h
> +++ b/include/dt-bindings/clock/mediatek,mt8188-clk.h
> @@ -721,6 +721,7 @@
>  #define CLK_VDO1_DPINTF				58
>  #define CLK_VDO1_DISP_MONITOR_DPINTF		59
>  #define CLK_VDO1_26M_SLOW			60
> +#define CLK_VDO1_DPI1_HDMI			61

> -#define CLK_VDO1_NR_CLK				61
> +#define CLK_VDO1_NR_CLK				62

If you can change this, you can delete it ;)
Please do.

--Qo/gdjEA9Ojw6e4h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2L71gAKCRB4tDGHoIJi
0j/KAQDmCSeccCtIXH3YnVuThBDWjOequnU2D37KNlgCO7NVwAEA+NUFAAulVwrn
akvszzqa/q8wOU9JjKM7NDq0fHbFhAY=
=5V+2
-----END PGP SIGNATURE-----

--Qo/gdjEA9Ojw6e4h--
