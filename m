Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A32A225D7;
	Thu,  9 Nov 2023 17:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ToCXT+f0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A0B4C433C7;
	Thu,  9 Nov 2023 17:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699552257;
	bh=GB1syrHkrGKsmiS0BjcotABnBGuB2ElN3V85GZw/kAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ToCXT+f0/7z3BZkle4LwTFuKxK3lAXNYtMhvN8zhbG2gkF7h4SBB/igmwG0P+Zvo2
	 NmuS/Eg86zaZ6ucHSUi94mNjOVQMxv6vRV7mSbR5Nu2xBvVt+kOOadEY1MeJi2R5eX
	 gm/vUCHta0V+Aw72M3C1IBCFGONx0v4m5jQ9enBcpbJJu7jdsg0lKCj1pkr1bIN56H
	 XlOOpDuFV4fAm1/T95n+hJTQNX4BnHUyad1pDELC+KMD+BzhteYuURCIzoLPGIax5q
	 24ToC2MuXIi88cVPWmXu7EuLB2aftW1hVxXBE5zrsHGWQoYmx0ds30NK2pSkEsnp1Z
	 O5bKwljiIwPLw==
Date: Thu, 9 Nov 2023 17:50:51 +0000
From: Conor Dooley <conor@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Nicolas Belin <nbelin@baylibre.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v8 03/12] dt-bindings: phy:
 amlogic,meson-axg-mipi-pcie-analog: drop text about parent syscon and drop
 example
Message-ID: <20231109-unsalted-daredevil-4052fa57fd2c@spud>
References: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
 <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-3-81e4aeeda193@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="E5Nn4IFoyvxjicc1"
Content-Disposition: inline
In-Reply-To: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-3-81e4aeeda193@linaro.org>


--E5Nn4IFoyvxjicc1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 09, 2023 at 10:00:04AM +0100, Neil Armstrong wrote:
> Since this bindings is referred from amlogic,meson-gx-hhi-sysctrl.yaml, d=
rop the now
> useless description about the parent node and also drop the unnecessary e=
xample.
>=20
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
COnor.

> ---
>  .../phy/amlogic,meson-axg-mipi-pcie-analog.yaml         | 17 -----------=
------
>  1 file changed, 17 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi=
-pcie-analog.yaml b/Documentation/devicetree/bindings/phy/amlogic,meson-axg=
-mipi-pcie-analog.yaml
> index 009a39808318..70def36e5688 100644
> --- a/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-a=
nalog.yaml
> +++ b/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-a=
nalog.yaml
> @@ -9,16 +9,6 @@ title: Amlogic AXG shared MIPI/PCIE analog PHY
>  maintainers:
>    - Remi Pommarel <repk@triplefau.lt>
> =20
> -description: |+
> -  The Everything-Else Power Domains node should be the child of a syscon
> -  node with the required property:
> -
> -  - compatible: Should be the following:
> -                "amlogic,meson-gx-hhi-sysctrl", "simple-mfd", "syscon"
> -
> -  Refer to the bindings described in
> -  Documentation/devicetree/bindings/mfd/syscon.yaml
> -
>  properties:
>    compatible:
>      const: amlogic,axg-mipi-pcie-analog-phy
> @@ -31,10 +21,3 @@ required:
>    - "#phy-cells"
> =20
>  additionalProperties: false
> -
> -examples:
> -  - |
> -    mpphy: phy {
> -          compatible =3D "amlogic,axg-mipi-pcie-analog-phy";
> -          #phy-cells =3D <0>;
> -    };
>=20
> --=20
> 2.34.1
>=20

--E5Nn4IFoyvxjicc1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZU0b+wAKCRB4tDGHoIJi
0llMAQDSiyi01Tk6EfsjuzI7TW2RZ9q3lS642vkuNdyv7Vl74QEAi50xLev+LeZV
0XXHkOzNdlCx7iH9hujdrheVevi6VwY=
=NFGG
-----END PGP SIGNATURE-----

--E5Nn4IFoyvxjicc1--
