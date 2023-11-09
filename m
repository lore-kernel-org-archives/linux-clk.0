Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3ABE32C78;
	Thu,  9 Nov 2023 18:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GVkWWZLA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9222C433C8;
	Thu,  9 Nov 2023 18:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699553080;
	bh=Z9CrFEFmEnOL/3Q5XW+qZ/CdeY8ktvSVkXjM1v0v9Bk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GVkWWZLA7o6syfN/8ixVI8y7Kdr61lfB5UBV5DieWn5k8XcuuWkgPoxb3EdxBWnDP
	 DfI6QayvLB5LE3pbUCN79+3wROAQQ3mEo3tjiBMDAgoWvrKzNTnNXATQM1SKhGLdYd
	 UfsTP3tfcL9x7DB4q2zaAHlAcAx0pLoeelZd7uFt0XTtiU/Y5mWg8NdbEb++epj1XT
	 9u/1OVbyyPtXYFlftLsmDkuGEf0poTDvOU4QmBe+4k4d/g40Ejn6n2kflZkWzK1LCI
	 cIGkoTTZr7D7XB6WsRiR+5of7ldK4F6ZdYNsclZyoN9QxOM9qcexPEYaJtIlL8Gk2K
	 eE/N+uPZoigng==
Date: Thu, 9 Nov 2023 18:04:34 +0000
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
Subject: Re: [PATCH v8 04/12] dt-bindings: phy:
 amlogic,g12a-mipi-dphy-analog: drop unneeded reg property and example
Message-ID: <20231109-sterility-unsoiled-e43771c61894@spud>
References: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
 <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-4-81e4aeeda193@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tjSRnZL12xJ4z8LE"
Content-Disposition: inline
In-Reply-To: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-4-81e4aeeda193@linaro.org>


--tjSRnZL12xJ4z8LE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 09, 2023 at 10:00:05AM +0100, Neil Armstrong wrote:
> Now this bindings is referred from amlogic,meson-gx-hhi-sysctrl.yaml and =
is
> documented as a subnode of a simple-mfd, drop the invalid reg property.

I'd expect a note here tbh about how removing reg & relying on being a
subnode of the simple-mfd is safe to do. It looks like your driver
was added at the same time as this binding & it was always documented as
being a child of the simple-mfd system controller, so I'd kinda expect
to see a Fixes tag on this patch..

Am I missing something?

>=20
> Also drop the unnecessary example, the top level bindings example should
> be enough.
>=20
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml          | 12 ------=
------
>  1 file changed, 12 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy=
-analog.yaml b/Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy=
-analog.yaml
> index c8c83acfb871..81c2654b7e57 100644
> --- a/Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog=
=2Eyaml
> +++ b/Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog=
=2Eyaml
> @@ -16,20 +16,8 @@ properties:
>    "#phy-cells":
>      const: 0
> =20
> -  reg:
> -    maxItems: 1
> -
>  required:
>    - compatible
> -  - reg
>    - "#phy-cells"
> =20
>  additionalProperties: false
> -
> -examples:
> -  - |
> -    phy@0 {
> -          compatible =3D "amlogic,g12a-mipi-dphy-analog";
> -          reg =3D <0x0 0xc>;
> -          #phy-cells =3D <0>;
> -    };
>=20
> --=20
> 2.34.1
>=20

--tjSRnZL12xJ4z8LE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZU0fMgAKCRB4tDGHoIJi
0iggAQCV2/5BcIW31u6mySyU3aLEob1O1ciipaTd/rc/GvNlSAEAoFfFfmam/hxu
pqXvBa9dJuXqDDyhraCQHOmyFKSHugs=
=tBb3
-----END PGP SIGNATURE-----

--tjSRnZL12xJ4z8LE--
