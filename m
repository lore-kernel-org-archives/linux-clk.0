Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5645C179A5;
	Fri, 24 Nov 2023 10:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TWNnJzOR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F995C433C7;
	Fri, 24 Nov 2023 10:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700823168;
	bh=eEX4tBGuafbo1X94/+okj0mvehs96kjdE/PmoG3Gt40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TWNnJzORCs/6+M4b46F3hx+3/IWccwtPeWfYeltqWKFXDpcpipaQX9WAyRPio/iW6
	 dT7asdlQ3YGaL9ZhZNAVMAD9vf/Fm2tpYAc2Dw81kZZhSy6eh8qdMsHWVpJKS8rKW8
	 LrHBjfrRHBcy1epv3XqKr/bPIt+6Kh6H9aCeWD2WuVvvOGe3++GJYZyUXzes3/oYgV
	 hwwvDOXJ01mgZjRMHRXdl9+iiry6ZbL+Hg3hwJTmi8BAYefWUqLBrz/qGPQILpO3Wi
	 ss2kaIOsVnHMNP3NwswRovinHhmhs/biEjG9PYb2zfXRKnAy6DclYLFrxrPz0SqG4e
	 COia8kKbBFP2A==
Date: Fri, 24 Nov 2023 11:52:46 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Jagan Teki <jagan@amarulasolutions.com>, 
	Nicolas Belin <nbelin@baylibre.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Remi Pommarel <repk@triplefau.lt>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v9 11/12] DONOTMERGE: arm64: meson: khadas-vim3l: add DSI
 panel
Message-ID: <bn5tpzvohmgac4m46fruxbi6quja624tm2fefyj7f3ngo3enno@2ueiodd6qxbd>
References: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
 <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-11-95256ed139e6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4j755csbj5bgclkr"
Content-Disposition: inline
In-Reply-To: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-11-95256ed139e6@linaro.org>


--4j755csbj5bgclkr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 24, 2023 at 09:41:22AM +0100, Neil Armstrong wrote:
> This add nodes to support the Khadas TS050 panel on the
> Khadas VIM3 & VIM3L boards.
>=20
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi   |  2 +-
>  arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi | 74 ++++++++++++++++=
++++++
>  .../boot/dts/amlogic/meson-sm1-khadas-vim3l.dts    |  2 +-
>  3 files changed, 76 insertions(+), 2 deletions(-)

Generally, those kind of patches still have value. Now that we are
accepting overlays, could this be converted to one and merged maybe?

Maxime

--4j755csbj5bgclkr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZWCAfgAKCRDj7w1vZxhR
xS+jAQDMt1rk04cC2Xg84EGUExSHFlcX9BTotBbFO5Zv9W4P/AD+PP2oNqHk906G
kwuJWtCVvyW0H04jWPVuknzUNcmmiQs=
=YClS
-----END PGP SIGNATURE-----

--4j755csbj5bgclkr--
