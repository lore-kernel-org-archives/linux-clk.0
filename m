Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147E1407576;
	Mon, 15 Jun 2026 16:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781541742; cv=none; b=qIdMN2S3bPIkQK4uhTlQYkrxeeMyc9WW/4rxMvBZzgYM0XAr3VGKj3fxzSiuiItm+w6YDZGnAcytmGrvjZBUxKgYjhNTSRxHmpqOazWb3TyKJ5HfF7KRDhOpmfdUl5nOjfQOcVC9YXgG6n1KOQPTiLDWh3JrxBOlX7WvapFEGII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781541742; c=relaxed/simple;
	bh=VJsguvxNi5fQr9YCT2BoG4xKCVnOtut1mmKgRM8TWRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=raXrsz2JyjZisAihyZCy7ZCQEwJDLLqm0mHlbPFWQxHI/AAAlf741oNbGXZ7li+c6z6hBjaqlYq8rJgeX5p7kmpFy+dvBYkeIt76NML4e7Sj9dc1mp/2msYSEF0ihLClTxUD7SPw+IXAhltI09Ie/brXXtNOMW01FvV2Cw/HKsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aj5viKEJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aj5viKEJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87D8B1F000E9;
	Mon, 15 Jun 2026 16:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781541741;
	bh=VJsguvxNi5fQr9YCT2BoG4xKCVnOtut1mmKgRM8TWRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Aj5viKEJWFiPMoF/bF+oFQVm5EAqw6YLo3AZo3FCULsVcp4sMvAatlXFYBvciIuT8
	 4/k0f12BsEUGiCJnmswWCKGFa3v3aYAce60l6P+cejRkjE+EW7nhdrIQROpJnKZ+e0
	 rrPQ1X0xDFaszZWfYlExTwOmuRBWS8G7AwwdANbrFLz1YDPNlJ85uVUyVaBy68n8Te
	 THONvNaS6x7RMnpwRAktXbhENphosFJNcm+Un9H810s/KkhYp6zKMT1C0T99DWLmt+
	 ugByPYW/V8DyqxzOtNjHGrODQ3DUcYiyuoBNy9UHuWQma3iY4sf9IcYhzU6AnjBHyi
	 dqSFsl/sTnAkg==
Date: Mon, 15 Jun 2026 17:42:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, git@amd.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/8] dt-bindings: clock: clocking-wizard: Make s_axi_aclk
 optional for static-config
Message-ID: <20260615-squid-showy-435c9cf780a0@spud>
References: <20260615034845.3320286-1-shubhrajyoti.datta@amd.com>
 <20260615034845.3320286-4-shubhrajyoti.datta@amd.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eTLpNP9HuW1rO1hW"
Content-Disposition: inline
In-Reply-To: <20260615034845.3320286-4-shubhrajyoti.datta@amd.com>


--eTLpNP9HuW1rO1hW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline



Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--eTLpNP9HuW1rO1hW
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajAraQAKCRB4tDGHoIJi
0nEOAP9wX1ySQ59Bw3YpTYQp7fbRjsjjztw9F71sBS4cWb/xsQD9HnOFFh9aDO9u
mIngdQmFlwsmGnd6D/IaxOrzKdaquwU=
=gIdg
-----END PGP SIGNATURE-----

--eTLpNP9HuW1rO1hW--
