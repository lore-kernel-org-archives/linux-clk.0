Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4DA30B52B;
	Wed,  3 Dec 2025 19:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764789689; cv=none; b=tvvQ1i4ebOPCqkMgF9r9UcsNJS69b947bm4Maol/jPeXkxFUjh7MnNcaUQadrdwKEnuhXVfKF6quPHUEltfHmnWxMbevhdXguVsF5OCI2GMvvfKRXKo/chqCICxtAxZCwjnU6iHFPCMmq7S7JQat+3AFeclv0u7fO0ADMDKJkoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764789689; c=relaxed/simple;
	bh=V63zii9WAHiLseuO6ZjsrzUYXvgY/8V805sW2LY+4BE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bC8lPEyrX13a6ZgYOCGzPfcyJRokRJ5lugSPNj4AlyHq2GQKNpW6a/3CWpPjemWHff9IX9lM9IkBr7i4I1FfTIaebUN5kVZ588lmIEcwpW7JkHjWnKcGthK4U21X5On3uEaI4HRBg/JfpA2D8Uymtnqk5/TzSsaMQazkCwUfLhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gCknPf8k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gCknPf8k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2348C4CEF5;
	Wed,  3 Dec 2025 19:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764789689;
	bh=V63zii9WAHiLseuO6ZjsrzUYXvgY/8V805sW2LY+4BE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gCknPf8kDTeiQpZhfNkOAFDK3isFPN5CL7tAwvlj1M/4btYWuS1uvjmx53O6/nYP0
	 eZZ2BSGPQN9XdXmWe+8Nr+697uixuR5f2ktMFVCaLOiXV1ssNnDD+KVJLJZ2TmWGKP
	 twai0DFalMA3+VGGZ/nQ4yUjUqIkjTe8qpaceM5yNm4+4jL8bmQ1IOciSE+mwWVhkZ
	 LXDwEBl+Xd83xlX7vjXFkAti2XBF5ZU4NeQLg8WpSiy/DyI+pVCURJQSL3cy2emuWA
	 kIiFMo9X0TJoHx3iAkLKLF5QY7XEP09ND/Gg8HSas8al4Ne983RrNKePR0SlzAs92o
	 0GdAFyiTm50jQ==
Date: Wed, 3 Dec 2025 19:21:23 +0000
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
Message-ID: <20251203-splendor-cubbyhole-eda2d6982b46@spud>
References: <20251203122313.1287950-1-robert.marko@sartura.hr>
 <20251203122313.1287950-4-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0ET9xrF7s1A7RN+E"
Content-Disposition: inline
In-Reply-To: <20251203122313.1287950-4-robert.marko@sartura.hr>


--0ET9xrF7s1A7RN+E
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

The majority of devices in this file are missing soc-specific
compatibles.

--0ET9xrF7s1A7RN+E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaTCNswAKCRB4tDGHoIJi
0rA0AP4or35grwt+rLpraGPWhvfXrPsVtnxoUd0lVRk+9k6VRQEAz4etwr/EV9dg
u76bUeDR+ziZjCqiYosXS2s4u4UzDQ0=
=QLRu
-----END PGP SIGNATURE-----

--0ET9xrF7s1A7RN+E--
