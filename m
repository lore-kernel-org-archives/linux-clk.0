Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1303A28F;
	Fri, 10 Nov 2023 18:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W8WYCXUe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D368C433B6;
	Fri, 10 Nov 2023 18:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699640817;
	bh=//+1dDG48RxoB34op9WnKpQOYu+pia2AtdgY57qSGLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W8WYCXUex+ppIwdfM0LjitjhzijK6TZXEcSwIebEgQ3GOAO7UnVlxsupaq2VoYLC4
	 Yh4W3b4VHx4k/zUGzSAZjnA12cuftE6C1Q8t6t7obYTYbI++iZG772pN/nRQm4D3IL
	 5EZcp501bBGcNE3RIEsVmkN/Xt9POxz2bhJlDh7JuGUZAblW+XJv5k+K0Cs7BTrpY3
	 GOKcUWNvNzlDkGRLbDrJ+7MtbejwoY2RLY+OQkgp8oq3Evh+5V1EUSQ1F51ukSc+xw
	 qm3FEyYaBPHHWZ7N3Av1SWXOZrHgnLGmOfT2lh+uV/MRKQtqeY4jLvZwlXlLoiqNk9
	 PfCie3iJEbl/g==
Date: Fri, 10 Nov 2023 18:26:47 +0000
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
Subject: Re: [PATCH v8 02/12] dt-bindings: soc: amlogic,meson-gx-hhi-sysctrl:
 add example covering meson-axg-hhi-sysctrl
Message-ID: <20231110-mascot-dollhouse-83f691dfa1ce@roley>
References: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
 <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-2-81e4aeeda193@linaro.org>
 <20231109-dictator-hedging-94b0dec505b5@spud>
 <046062f4-e415-4c3f-a05d-81bef9857649@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5w/g2E24/WOxYVxa"
Content-Disposition: inline
In-Reply-To: <046062f4-e415-4c3f-a05d-81bef9857649@linaro.org>


--5w/g2E24/WOxYVxa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 10, 2023 at 08:50:58AM +0100, Neil Armstrong wrote:
> On 09/11/2023 18:34, Conor Dooley wrote:
> > On Thu, Nov 09, 2023 at 10:00:03AM +0100, Neil Armstrong wrote:
> > > Add a thirst example covering the meson-axg-hhi-sysctrl variant and m=
ore
> >=20
> > What on earth is a thirst example? Some sort of "hysterical raisins"
> > type of thing?
> >=20
> > My confusion about that word aside,
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Indeed, I'll fix this bad typo :-)

TBH, I thought it was intentional!

--5w/g2E24/WOxYVxa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZU514wAKCRB4tDGHoIJi
0sAoAQD6Sj0Me4v2FpLbfFQZfZK67SGa5V4LFec/ta5m+t6KBQEA6elLz7R9xNnC
0qtqNVWQEY1i0Kf4yBRSUOGQOB6qJAA=
=LCNw
-----END PGP SIGNATURE-----

--5w/g2E24/WOxYVxa--
