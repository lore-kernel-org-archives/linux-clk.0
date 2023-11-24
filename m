Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED69286A2;
	Fri, 24 Nov 2023 12:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e4tHQasD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62F25C433C9;
	Fri, 24 Nov 2023 12:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700829399;
	bh=iBs/ElE00ZyViC4c51swbIBIFHOSqvLccbbeT1AqVhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e4tHQasD1uiBgjppYsnvSsVLtBZ9TQ/izusSKXRVoWvDcvG0eAgkyQIZHqHQF94uo
	 2swUm2B5piBcScLzvcZCI+8HS2Bm42aYhatjDrfqVBjsJa+tqiElsoXd9kDJxd3WWe
	 8fZNN2/LuPaXYBjsN84OBryouoLRKQaQGQVNh7YMzz+6Ljkp2lWvgzq6TC+NcQScdc
	 1hZS1y1XM8RFpGnA+sRtd/5cN6Z8JkZ+b2veHsJ/ZRVYxJtRSZuWZTtyDzhmyEkZaM
	 a9a7gnwnC4HAuYKLPIg6jWciEdAgvft2rybjDAy/9WHSMa2J+R9P++vV4u0zy2Ypj/
	 u08VbCLPORCjg==
Date: Fri, 24 Nov 2023 12:36:32 +0000
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
	Nicolas Belin <nbelin@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Remi Pommarel <repk@triplefau.lt>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v9 04/12] dt-bindings: phy:
 amlogic,g12a-mipi-dphy-analog: drop unneeded reg property and example
Message-ID: <20231124-felt-tip-everybody-f2a6836e52af@spud>
References: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
 <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-4-95256ed139e6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rgdN8ghBXlvRBfQ2"
Content-Disposition: inline
In-Reply-To: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-4-95256ed139e6@linaro.org>


--rgdN8ghBXlvRBfQ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 24, 2023 at 09:41:15AM +0100, Neil Armstrong wrote:
> The amlogic,g12a-mipi-dphy-analog is a feature of the simple-mfd
> amlogic,meson-axg-hhi-sysctrl system control register zone which is an
> intermixed registers zone, thus it's very hard to define clear ranges for
> each SoC controlled features even if possible.
>=20
> The amlogic,g12a-mipi-dphy-analog was wrongly documented as an independent
> register range, which is not the reality, thus fix the bindings by droppi=
ng
> the reg property now it's referred from amlogic,meson-gx-hhi-sysctrl.yaml
> and documented as a subnode of amlogic,meson-axg-hhi-sysctrl.
>=20
> Also drop the unnecessary example, the top level bindings example should
> be enough.
>=20
> Fixes: 76ab79f9726c ("dt-bindings: phy: add Amlogic G12A Analog MIPI D-PH=
Y bindings")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

I feel like I left a tag on this one before, but I can't remember.
Perhaps I missed the conclusion to the discussion to the discussion with
Rob about whether having "reg" was desirable that lead to a tag being
dropped?

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

--rgdN8ghBXlvRBfQ2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWCYzwAKCRB4tDGHoIJi
0kCXAP9TU7U/tv4849X5YXYCr5KDY41jG8O0rTLgEd5q1geeoQD9GC0EX/4K+IRA
uJv3CY2TNiiph0000bxb3dqFwAVvRQM=
=UdAc
-----END PGP SIGNATURE-----

--rgdN8ghBXlvRBfQ2--
