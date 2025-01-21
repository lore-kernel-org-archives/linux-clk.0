Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27711F63C4;
	Tue, 21 Jan 2025 17:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737480628; cv=none; b=LUg7ZcMxQ3mnmboqNKZsBcVsdu7xTXD33o9XCeNAbW5rinZQ6cSzKTdPzyGazK4jkcvmv0voX5IqFgEKJRa1BuduqZY06geXmiWJkqONMnaEdxEUhTsu6fWl3Yr71Qy6zNRD8JGo/ybRIrOcKrDNDicFpmxVOuM22O0kCO+7jKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737480628; c=relaxed/simple;
	bh=Govg89tiGbSn5yl9wzSlsxsIzUrVeToBKInXCkUD1UU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X6dg9X0c+46CByOMVSlgyW7zrkjMxQvDu7kAl+sVlVN6jcOKf5pvq8w7Zs2Ia3gaagCD0jRXsbNm8PZ0ZtQ54iGREpYxSu1LTLQTr05MmwWBLsrmmUr6e9IpwZbPnbroM+x66UlqujaaqRriORIu3W10oHV1tTi5zUeXGf5Pyqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qyfPVyKz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qyfPVyKz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56442C4CEDF;
	Tue, 21 Jan 2025 17:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737480628;
	bh=Govg89tiGbSn5yl9wzSlsxsIzUrVeToBKInXCkUD1UU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qyfPVyKzB1Cw46YjJnd5wRP11zBPA/rGHs4f7GcLunyOZEkHoGCizSoVGwm19rN30
	 Te4LA5dXTAHtqlEc29+BhrS+BTDWI7F7QBkGtDnRPK1n6UwE5t1tQ5odrHZR9Geke4
	 WlD+XGkjWaTF/zkbEczagQMu/y7x9DQ23ySs9r2TJRWe55wk9y4m2ajTP2HuUHcFMT
	 IWIv1JkTsmHzaZob77Z+FLHV1gEYE76BqlhOnGDVHEFR+zP5czc0LQrECjJH+wrFv2
	 6D3KB+btja9yJE2tQfIakNmxcdvMUsvdDfAy7VW6dUO1inwgY1aBJXC8Iy58GEEaw2
	 iT5o/kW0yS8bw==
Date: Tue, 21 Jan 2025 17:30:23 +0000
From: Conor Dooley <conor@kernel.org>
To: Friday Yang <friday.yang@mediatek.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Garmin Chang <garmin.chang@mediatek.com>,
	Yong Wu <yong.wu@mediatek.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: mediatek: Add SMI LARBs reset
 for MT8188
Message-ID: <20250121-violet-widely-df3567b085a4@spud>
References: <20250121065045.13514-1-friday.yang@mediatek.com>
 <20250121065045.13514-2-friday.yang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="234HpXv0PCqVfF3i"
Content-Disposition: inline
In-Reply-To: <20250121065045.13514-2-friday.yang@mediatek.com>


--234HpXv0PCqVfF3i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2025 at 02:50:40PM +0800, Friday Yang wrote:
> SMI LARBs require reset functions when applying clamp operations.
> Add '#reset-cells' for the clock controller located in image, camera
> and IPE subsystems.

A new required property is an abi break, please explain why this is
required. What are "SMI LARBs"? Why did things previously work without
acting as a reset controller?

>=20
> Signed-off-by: Friday Yang <friday.yang@mediatek.com>
> ---
>  .../bindings/clock/mediatek,mt8188-clock.yaml | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8188-cloc=
k.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
> index 860570320545..2985c8c717d7 100644
> --- a/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
> @@ -57,6 +57,27 @@ required:
>    - reg
>    - '#clock-cells'
>=20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8188-camsys-rawa
> +              - mediatek,mt8188-camsys-rawb
> +              - mediatek,mt8188-camsys-yuva
> +              - mediatek,mt8188-camsys-yuvb
> +              - mediatek,mt8188-imgsys-wpe1
> +              - mediatek,mt8188-imgsys-wpe2
> +              - mediatek,mt8188-imgsys-wpe3
> +              - mediatek,mt8188-imgsys1-dip-nr
> +              - mediatek,mt8188-imgsys1-dip-top
> +              - mediatek,mt8188-ipesys
> +
> +    then:
> +      required:
> +        - '#reset-cells'
> +
>  additionalProperties: false
>=20
>  examples:
> --
> 2.46.0
>=20

--234HpXv0PCqVfF3i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ4/ZrwAKCRB4tDGHoIJi
0pWsAPUdBV9ZoeWHEnWqUr1Shp9vd4lHhIWVWH6d7kO3PIJqAP4xDK4Kgf1eou4H
43tgZR/e7RChn/6kgYrsxa86J5XpAA==
=x+CA
-----END PGP SIGNATURE-----

--234HpXv0PCqVfF3i--
