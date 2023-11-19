Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF0FF4F5;
	Sun, 19 Nov 2023 13:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oX/nHFCE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0829EC433C9;
	Sun, 19 Nov 2023 13:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700399633;
	bh=V5DrQvF6t0U/HsWpd5WvEPfjpOcCReCCCj86sAPbP3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oX/nHFCEfPImk+7retm6wyFAS/q9qe6NpBwcZE5N5hmznsGxkW1sQsABX0CyEQDOt
	 +GxjPJ6h7EipvTIFNKpJc5uD5ktNSiQqtJD7iERW8I7kFIbjJjUxh8pvOQfZIYBgut
	 MjYIQFCOvwloPORwGduT3zMIu4AGqeHTLHSWvPmhbo/wqv9IsHwZP0e4UDPjk8FijL
	 bUw4QEbakMWS8viI2MKACCA6flPp6NiaAThN8RYHO8P7cex6xD1GY8v/1YN+DRG71y
	 oKmfnEm7FFRjrJcExqD9MDcRfqKeosHccc8jriv2Xdn02e31rZuaioKOhWD/pr3gra
	 hQPB4NpiBnstQ==
Date: Sun, 19 Nov 2023 13:13:47 +0000
From: Conor Dooley <conor@kernel.org>
To: "yu-chang.lee" <yu-chang.lee@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Garmin Chang <garmin.chang@mediatek.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: mediatek: Remove compatible
 for MT8188 VPPSYS
Message-ID: <20231119-gem-plus-3217ffee6278@spud>
References: <20231117053934.10571-1-yu-chang.lee@mediatek.com>
 <20231117053934.10571-2-yu-chang.lee@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/qVEodwOwNmr9weC"
Content-Disposition: inline
In-Reply-To: <20231117053934.10571-2-yu-chang.lee@mediatek.com>


--/qVEodwOwNmr9weC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 17, 2023 at 01:39:33PM +0800, yu-chang.lee wrote:
> MT8188 VPPSYS 0/1 should be probed from mtk-mmsys driver to
> populate device by platform_device_register_data then start
> its own clock driver.

How does one operating system's driver probing model render these
compatibles invalid?

Cheers,
Conor.

>=20
> Signed-off-by: yu-chang.lee <yu-chang.lee@mediatek.com>
> ---
>  .../devicetree/bindings/clock/mediatek,mt8188-clock.yaml        | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8188-cloc=
k.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
> index d7214d97b2ba..860570320545 100644
> --- a/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
> @@ -43,8 +43,6 @@ properties:
>        - mediatek,mt8188-vdecsys
>        - mediatek,mt8188-vdecsys-soc
>        - mediatek,mt8188-vencsys
> -      - mediatek,mt8188-vppsys0
> -      - mediatek,mt8188-vppsys1
>        - mediatek,mt8188-wpesys
>        - mediatek,mt8188-wpesys-vpp0
> =20
> --=20
> 2.18.0
>=20
>=20

--/qVEodwOwNmr9weC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVoKCwAKCRB4tDGHoIJi
0mmwAP4xlBMe7KzcRqab0tzLkrFxcEcp+1zazJckesSqDZjnDgEA1RUf5bBcEP+x
B3LIvAw1RBNkkHCQMJDouIVhi3zTvQM=
=RCYq
-----END PGP SIGNATURE-----

--/qVEodwOwNmr9weC--
