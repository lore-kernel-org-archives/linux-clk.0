Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD9639A063;
	Wed,  3 Jun 2026 15:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780501961; cv=none; b=kmAEeB/SFqJslNXj0fsnvr1ewsky6KqUaVPMDjJRiXJp708WQSwoGdY/Tr4UB3ejaLCNsCOG+DQBofDwDmUamWUTbG5tsyP2gjjvsOSqhedah9noKX6xf9K/150GbQnPGPg8+3u6eTWLie0ohE/kKJNhrV3UTnXfwm8Ze+DrF44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780501961; c=relaxed/simple;
	bh=fG3MUMFCV92OWWB77GGml+hp8tZmw/pgA+W3l3I1k20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EinZ+nl+ftsIt3aDLWMUgmlFxX+KtXqEsd24VVlqV7QtQLgqZu4Fz7fyqR9+jU/yRfMA+1ipuPAjOv1EXbh/r7JAy1WHRCGPgYKccXZ/6E78ebj3Ilk6xpw4tCaXfAgkNY7X8eZA3Ui9tM6lzkNNIifkelDHu41vVMbphM0QFfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jO5Vh1Z2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jO5Vh1Z2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FC521F00893;
	Wed,  3 Jun 2026 15:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780501960;
	bh=fG3MUMFCV92OWWB77GGml+hp8tZmw/pgA+W3l3I1k20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jO5Vh1Z2cCH53eKrog4JC9WgTp6qjuIxSww1UqENset/sIpIhNuxmzZqwF972/eqM
	 sgLPIBkT0nLpPNTrQvYH/PL13eY0XdNwPtA9FuXlucIZQxZzfc27eZBSYbp1bRn4Id
	 YRz1RhdLDJUdi4/uBcUiu6lmt6IG5lU9xlerGYflKg8EXAqSgkEOgmhBa0eza4cqT4
	 j/oHfkClM0tUxVklQ2F8AXGzSrOx/5jmIo5jOZ5Ji9Fud+O3ryZ2VTv4KN4iWq9iIf
	 CNjVs+Rt/xpSNxhgGhZ3wv1usGh/QTiXNGigpw0eQPg0hlL7dPOpzHXZfyT1n6iz0Z
	 hRQDpK9llKWzQ==
Date: Wed, 3 Jun 2026 16:52:35 +0100
From: Conor Dooley <conor@kernel.org>
To: jian.hu@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: Add Amlogic A9 peripherals
 clock controller
Message-ID: <20260603-banshee-reshape-7183ef9cde25@spud>
References: <20260603-a9_peripherals-v2-0-ee1b8c0a1e6c@amlogic.com>
 <20260603-a9_peripherals-v2-1-ee1b8c0a1e6c@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DCCmq9+7sUVqL8ML"
Content-Disposition: inline
In-Reply-To: <20260603-a9_peripherals-v2-1-ee1b8c0a1e6c@amlogic.com>


--DCCmq9+7sUVqL8ML
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--DCCmq9+7sUVqL8ML
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiBNwwAKCRB4tDGHoIJi
0sghAQDd2PkqviQwhNqJEYhIzE3HGz8asHPFKg41uBAnYMt5TgD/RAOvvy7LgVTT
XtUTQPnCXjUUQTlu5zvj2P6MgNPjEgA=
=L+fy
-----END PGP SIGNATURE-----

--DCCmq9+7sUVqL8ML--
