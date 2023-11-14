Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B49B2C19E;
	Tue, 14 Nov 2023 17:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZVNPcPm9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CAAAC433CA;
	Tue, 14 Nov 2023 17:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699984058;
	bh=D9KzSEK2MNUlw54aT4akCNMjbWc04nlocOCzra8qnEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZVNPcPm9Kvz2KPrx2w7zth7Hu6Ge58GrV2+G/LwiEnMdI6P+da59r2GZoYtlJfeiY
	 mki4tmtRxIRX7AvZ7KBfDEFi7Ewxyw2d6AwEmJe9WRhvL+lzD0L7cGThdr2tUI3t/l
	 RGl86ZwmnWSkG6WDi5avj/bP6gLQk3Tim7eh7hwHLW/LT058UQo5ngvoyH4nt29Cbo
	 ozUtdZU1OIYMSD2R6iDEbmA0dh3twWaCg44U7vwfWa2PH6S7mNjqdCSZEY051w9LOj
	 itJK1ErevAMpwf7xCFoej/TtvpDeAZKoYW700O4x+3GkQVQGZnPn1F0iD24wsbxYjY
	 Bd3FOvB/Q5LCw==
Date: Tue, 14 Nov 2023 17:47:34 +0000
From: Conor Dooley <conor@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: g12a-clkc: add MIPI ISP & CSI
 PHY clock ids
Message-ID: <20231114-lash-singer-ddf33f11bc4c@squawk>
References: <20231114-topic-amlogic-upstream-isp-clocks-v1-0-223958791501@linaro.org>
 <20231114-topic-amlogic-upstream-isp-clocks-v1-1-223958791501@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Mg1UK2b3qj7ouDpz"
Content-Disposition: inline
In-Reply-To: <20231114-topic-amlogic-upstream-isp-clocks-v1-1-223958791501@linaro.org>


--Mg1UK2b3qj7ouDpz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 14, 2023 at 11:14:43AM +0100, Neil Armstrong wrote:
> Add MIPI ISP & CSI PHY clock ids to G12A clock bindings header
>=20
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor,

> ---
>  include/dt-bindings/clock/g12a-clkc.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/=
clock/g12a-clkc.h
> index 636d713f95ff..fd09819da2ec 100644
> --- a/include/dt-bindings/clock/g12a-clkc.h
> +++ b/include/dt-bindings/clock/g12a-clkc.h
> @@ -281,5 +281,11 @@
>  #define CLKID_MIPI_DSI_PXCLK			270
>  #define CLKID_CTS_ENCL				271
>  #define CLKID_CTS_ENCL_SEL			272
> +#define CLKID_MIPI_ISP_DIV			273
> +#define CLKID_MIPI_ISP_SEL			274
> +#define CLKID_MIPI_ISP				275
> +#define CLKID_MIPI_ISP_GATE			276
> +#define CLKID_MIPI_ISP_CSI_PHY0			277
> +#define CLKID_MIPI_ISP_CSI_PHY1			278
> =20
>  #endif /* __G12A_CLKC_H */
>=20
> --=20
> 2.34.1
>=20

--Mg1UK2b3qj7ouDpz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVOysgAKCRB4tDGHoIJi
0hqQAP4hX+8A/W3JLgzC4C6VHY0eRmE1mwCTvgaeXnGFdMFyggEA0jDMrTecaNnW
13R4LiJbI3EwIg6VMuKZ9z0Plz5r2g4=
=wOqs
-----END PGP SIGNATURE-----

--Mg1UK2b3qj7ouDpz--
