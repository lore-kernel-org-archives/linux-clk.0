Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84092F9C3E;
	Mon,  8 Dec 2025 17:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765214156; cv=none; b=Wan2EUbTF4nGWAAqVY9cMFpCPHXEpM3IJ6kkJhsaobJNenLnhblvgKZmvUqL84xPKbd04xy/r3g/E+X3OIElFUMCszu+ISN1PmNKcEbtKFmHaKgG3O85kCuffSjcWKv54ddIBWFtTr/Blk805uEAvyDspv5Yy3HOneQxNtpLKG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765214156; c=relaxed/simple;
	bh=fjQMhvzUh3wiORRTZ78WaQHW7FYwA9kge4oGJ9+Iwgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qvNySKD9OKfvHKV/svhSC5gfGPJMelz0QkjnXHySeSwnmvx10utdzHQo1jRZ4XDBvaX2Dd8aNOfeI1zkVyjhEXedm3k8gObtIqA/skCIDmXC/27FOb3l0OcIYEBfugLe86A8wWYyJHG/9FLkUtSh4b90NxbRCWjfwEG+wxg9xsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gPan7WRc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gPan7WRc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D61F5C4CEF1;
	Mon,  8 Dec 2025 17:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765214156;
	bh=fjQMhvzUh3wiORRTZ78WaQHW7FYwA9kge4oGJ9+Iwgs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gPan7WRcbKq5QNjWfxBcZSNm7sOLsHGvpqjhIefFBzbIpPBWq2MG59MSKVdLysyom
	 g7Op2nL3yMk4p7W7Aw7tan2hgvrUq9st7o4HGyBTaQOGuQ5eTWapjpnrYMj84gDdoR
	 ubSRoeC3PEiJS1wNnezrPpm6mNwabI7aaM2WJFO5kAZGRksta7HM/X3j30e8aStMhD
	 z/eF3KeJVhPVUmuEqn2UfrB/Qgd3SZgHl0Mtph2wHOp/GjUsN6qm9w+GZa/Re6FdIv
	 pLRi6+HM6R9rOfyeplhzAaS1yKLPbfeoAc9/oj+oWneYr2C+DVAho8yroE13pEgst2
	 JE+TOs/giNgMQ==
Date: Mon, 8 Dec 2025 17:15:50 +0000
From: Conor Dooley <conor@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	gregkh@linuxfoundation.org, nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev, mturquette@baylibre.com, sboyd@kernel.org,
	richardcochran@gmail.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
	luka.perkov@sartura.hr
Subject: Re: [PATCH 4/4] arm64: dts: microchip: add LAN969x support
Message-ID: <20251208-deprecate-privatize-c8ab771091b7@spud>
References: <20251203122313.1287950-1-robert.marko@sartura.hr>
 <20251203122313.1287950-4-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pDWahq4ruA5O+qrF"
Content-Disposition: inline
In-Reply-To: <20251203122313.1287950-4-robert.marko@sartura.hr>


--pDWahq4ruA5O+qrF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 03, 2025 at 01:21:32PM +0100, Robert Marko wrote:
> Add support for Microchip LAN969x switch SoC, including the EV23X71A
> EVB board.
>=20
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
>  arch/arm64/boot/dts/microchip/Makefile        |   2 +
>  .../boot/dts/microchip/lan9696-ev23x71a.dts   | 761 ++++++++++++++++++
>  arch/arm64/boot/dts/microchip/lan969x.dtsi    | 482 +++++++++++
>  3 files changed, 1245 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
>  create mode 100644 arch/arm64/boot/dts/microchip/lan969x.dtsi
>=20
> diff --git a/arch/arm64/boot/dts/microchip/Makefile b/arch/arm64/boot/dts=
/microchip/Makefile
> index c6e0313eea0f..d02ac50aae79 100644
> --- a/arch/arm64/boot/dts/microchip/Makefile
> +++ b/arch/arm64/boot/dts/microchip/Makefile
> @@ -2,3 +2,5 @@
>  dtb-$(CONFIG_ARCH_SPARX5) +=3D sparx5_pcb125.dtb
>  dtb-$(CONFIG_ARCH_SPARX5) +=3D sparx5_pcb134.dtb sparx5_pcb134_emmc.dtb
>  dtb-$(CONFIG_ARCH_SPARX5) +=3D sparx5_pcb135.dtb sparx5_pcb135_emmc.dtb
> +

> +dtb-$(CONFIG_ARCH_LAN969X) +=3D lan9696-ev23x71a.dtb

ngl, I wonder why this config even exists, it's not meaningfully different
to ARCH_SPARX5.

--pDWahq4ruA5O+qrF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaTcHxgAKCRB4tDGHoIJi
0s2+AQDx39SaQhm0zytJWpmEZPuSOS8u320LlEtdvmYmDAppmQEAmgIqA6PvxFG3
w4rrmnny5VuydcS+WrxJO79IWsqBJw0=
=IBLP
-----END PGP SIGNATURE-----

--pDWahq4ruA5O+qrF--
