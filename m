Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7090627BF8D;
	Tue,  6 May 2025 16:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746548952; cv=none; b=HEI8xWBL2PSPFXaSrEOTKg7TA7Kjzmrg/VLl49H2wIIV8oAJn8Z1jmKLIJhz7yN4o/p9TN/OWx0oSNHJNRVHW57CBmOiUWoUhy8eXCzPUEaiy5lekgkrExp5LCAlxqRIhAzNI1bTyO3UwXPZOlEOuA+zEA4MRjOyZy7Fua2hvQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746548952; c=relaxed/simple;
	bh=kOucaCiTOjCuwEDYRf4xSI+oTb3XR4SieOgn6ttIfaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nYfH18gqO5t73yWOHmoTvxG1gbPp+Bc/nlsEbeiJwW1aAyk4EB0xD+d8souWmNdRS6tLer7p/fPolnyFyGHxDIZCYwvw1OCgYUaVZXxczVqOVskpFnjRJxqQruNCvV3sUyEdOJK10bcxKNGJY0Guf+wRSZ6SNObCC3mNtaJY68I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oq2LlI2P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oq2LlI2P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A813C4CEE4;
	Tue,  6 May 2025 16:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746548951;
	bh=kOucaCiTOjCuwEDYRf4xSI+oTb3XR4SieOgn6ttIfaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oq2LlI2P1lJQ/oyTKrRnxPw7EO9BiOf+OVuYZ3G451tnU26eZ0c+4XvvzNaTI8TVP
	 iAUD+c5GLRTD/oj9Y53Pxyf0lnqRNijMMDncNs/iu8KopcJamreqtaD9YZN5ju/6rd
	 Q8OVymac1ixkcsZNpLy3CWfEtTx+6U2omV+Q9jU18T3sYgDp78jfj2MAf/8kLDCyYO
	 6ETStIDRBR00iFJ/Brt5WAEw3IyB2Hc4GJ/HTZpJ2+wZzXsuguw/eDaKguJpZWzpqp
	 re/s0R/shqflOfoKJmYzXV5xCjBjuoXReIXPf/L3/YpSDf/aewjwAeKHpVcnef1B5Q
	 V60LKme8+mWaw==
Date: Tue, 6 May 2025 17:29:07 +0100
From: Conor Dooley <conor@kernel.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com, kernel-list@raspberrypi.com,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clock: convert bcm2835-aux-clock to yaml
Message-ID: <20250506-recycler-sugar-2b0f34d60361@spud>
References: <20250503080949.3945-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BYm1tPIPDcX1NmBu"
Content-Disposition: inline
In-Reply-To: <20250503080949.3945-1-wahrenst@gmx.net>


--BYm1tPIPDcX1NmBu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 03, 2025 at 10:09:49AM +0200, Stefan Wahren wrote:

> +    aux: clock@7e215000 {

Drop the "aux" label if you respin for some reason.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

--BYm1tPIPDcX1NmBu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBo40wAKCRB4tDGHoIJi
0szWAQCpZXN5ujtc5qNCr1gNAxdHwpTCCoxoCXi85BN1ByM1GgEA/fkQNS08jLp2
XxAoeX9oIf4UJM+aYeyiZPqBk73MwAs=
=9nwV
-----END PGP SIGNATURE-----

--BYm1tPIPDcX1NmBu--
