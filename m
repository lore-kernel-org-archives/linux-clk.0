Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3651B2D978C;
	Mon, 20 Apr 2026 16:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776701621; cv=none; b=Bda84MuGxX4gROutEATG5H9gjW4jSK6tpsEHCeU67OFC8JvcE+qrLZAIq/sPRESJC30R6UMlWccyPOAVcucbKzOaXpgC0M1fU/z4y28FshX7HOv1tTBqMTcC5ZNZK0PTO6FxqwpqxllCDp73CXxOyRGFA2DmCIkxqQ7NIFsunN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776701621; c=relaxed/simple;
	bh=qpZ7ncDNJr9ziiS+LAieulgSFEo8xxAIbpPMQA4F9mU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MTYXMVfb5PRfyn9dpCVYGYJKtS9+cy5Dm15TDmMS0bJdPHEAC+xrZRctxGelcvKZGxXgoVERdqanRpBVJbUo68ZtNx0efQPYg3bXUg66ssZdfqBFwZ1IptTsk7nLDSPpLz+UfNhR+ZxMMKiwcfCRgscCQpTC2c5rWPOyVGuq0AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GCyZafo9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GCyZafo9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D94BC19425;
	Mon, 20 Apr 2026 16:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776701621;
	bh=qpZ7ncDNJr9ziiS+LAieulgSFEo8xxAIbpPMQA4F9mU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GCyZafo9Fh/dEQP8jQ4T8sWyAUyJHulyQiSm09OXDMB/R4IbmiYf6xsJvHLRdqwo1
	 0jfy6MwgMWpQVX01lpDvwflFlluEV1a2RTdTLbUaCefLKt7HNClZyW8M/vx5y8TQdn
	 +UMQu6xbNY4JPECRT/P/iqcSdZNYYlObDQ5wYl9MTcBlQqQ4HRZn9NUYdjQzZuMRXh
	 TbGzQLN6MiE+5kTHeCPWNMnq7cOK4qR4tGUTV6wkuP6VU6smyd5dmJjO1N5Kw3qIww
	 mlJjrsBan6puI5myoUQ05311quXsvxO9AQTXdMSbKqVVmqbjpM1pptOBNtJTVNMh7c
	 kwUjFcKP5wk+w==
Date: Mon, 20 Apr 2026 17:13:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
	Stephen Boyd <sboyd@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/7] dt-bindings: clock: cs2000-cp: document CS2500
Message-ID: <20260420-silk-reshuffle-5cebd4e9b3eb@spud>
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org>
 <20260419193718.133174-4-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pUBdod/Tj2QGPXtO"
Content-Disposition: inline
In-Reply-To: <20260419193718.133174-4-marek.vasut+renesas@mailbox.org>


--pUBdod/Tj2QGPXtO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 19, 2026 at 09:35:34PM +0200, Marek Vasut wrote:
> Document backward compatibility support for CS2500 chip, which
> is a drop-in replacement for CS2000 chip.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--pUBdod/Tj2QGPXtO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeZQrgAKCRB4tDGHoIJi
0pjsAQCA49Pk0dsLboQWtCSvqUAqlzI1AA+W9v49L7Jrjx+s9wD+PH5THnhWjMV3
tKapKVmvGgUb9hPLap9b+GLi4MSdzQs=
=SY59
-----END PGP SIGNATURE-----

--pUBdod/Tj2QGPXtO--
