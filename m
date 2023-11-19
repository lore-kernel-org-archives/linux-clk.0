Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD38229B0;
	Sun, 19 Nov 2023 13:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UEyBk9xH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E07EFC433C8;
	Sun, 19 Nov 2023 13:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700400309;
	bh=XxhddzwNIgG+bk+3II44/LNd5CBnAQSGnu4afaRF7wc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UEyBk9xHjQgzNe3JUfRMRpC8nhwfSpFiGj7o1bqgDr3/201wAk4mJNJ+NI1jiPF4B
	 sTEgj9wSfJBDjfOiVuQERo63Nu7u9qgegsXriMdy6uh5++oHykdn1Y0M15OpMauJ+o
	 rEsGnzT1Zh8c6zgHc066j5/E/hxgFXvOm88vRD/xOkCCR9llw1AaJ1WQ1zE54oT5QR
	 0bABp9htnT1BfNnaapquepVc0CwKx9S4CRiVAxF/bd6QvNCQ3b3JvVVBaUM4+5rrQR
	 cG2zlMZwPZZoTlAYidA6RidFgcwWlN8htCWsH+4f164o0pb6yl9drfODminYieHr5k
	 ODVeVFGUHwfEQ==
Date: Sun, 19 Nov 2023 13:25:04 +0000
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
Message-ID: <20231119-zestfully-riveting-fe9793281903@spud>
References: <20231117053934.10571-1-yu-chang.lee@mediatek.com>
 <20231117053934.10571-2-yu-chang.lee@mediatek.com>
 <20231119-gem-plus-3217ffee6278@spud>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="52bn6chajiCX+Q3f"
Content-Disposition: inline
In-Reply-To: <20231119-gem-plus-3217ffee6278@spud>


--52bn6chajiCX+Q3f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 19, 2023 at 01:13:47PM +0000, Conor Dooley wrote:
> On Fri, Nov 17, 2023 at 01:39:33PM +0800, yu-chang.lee wrote:
> > MT8188 VPPSYS 0/1 should be probed from mtk-mmsys driver to
> > populate device by platform_device_register_data then start
> > its own clock driver.
>=20
> How does one operating system's driver probing model render these
> compatibles invalid?

I see there are 2 patches in the series. Merging them into one would
likely make it easier to explain the hardware-related reason for this
change.

--52bn6chajiCX+Q3f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVoMsAAKCRB4tDGHoIJi
0ihkAQDJXXL1MR0xmgwkXWBGLU44bL7kUV19Z5GlMv86zlEa/gEA2ghoULkl2Soy
4Yog79X3xremp0NR4VN2JldFYg58TgA=
=gEqL
-----END PGP SIGNATURE-----

--52bn6chajiCX+Q3f--
