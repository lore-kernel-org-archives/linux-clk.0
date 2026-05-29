Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EBE33DEE5;
	Fri, 29 May 2026 16:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780072716; cv=none; b=auxjNKq2F3zBB6Z2ANTG92Z69gpUiIcQa06mbB4FQSumpDQlf3y3BKGk3lMTFeK3WPc2KXLTmC/i0Lw1nt67cxm68hJUfrpwT7LxamHUPoYTRZTerp2XYE4GSHSefaGsqs64aaoIINkw1ef1R4kn5RTjjWjPTHpeIxy1Z2Edekw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780072716; c=relaxed/simple;
	bh=ZuGYoimv2AWMa7fL0YVVwM+74fpstl4A7epYJTl53z0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=We7xYUYCAx2PYJOUzmJ+jICOxvy8EV4J/f6hlFfp6+gzCvTMlzqbakr2mB7Tn8Bjxssm0sCRkROVvIJamVcepl48fIpcBq84rnmV6n+M3NV6AWiViP5cRLdUqAhhnPDOXmD9cqqOP87iZRO/KXQggRAvKpynQTwKXN8pLhJfAJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S1tWrG3o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S1tWrG3o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B12731F00893;
	Fri, 29 May 2026 16:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780072714;
	bh=ZuGYoimv2AWMa7fL0YVVwM+74fpstl4A7epYJTl53z0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S1tWrG3oL7vCN1k6jXyEt9jDBScEebec00FHZJ6JQ7u1sdnhiQC4OvXZgl20djrQ7
	 FN31Qs6z8pcHEVI6vBzB3bNOCwBIVZ4rCEt5L/yiAsE4Yqnj7HkA3efCt7hoCSVHjL
	 rNk+CjJuowYeDUlSiePRSSO1RvVkD/zgFsGYKaDT0lyG8lKaNmvTXxEzKPyj3GW/jI
	 xmp5fziphGSC8srKXiN6PMLW+vMkhscO/A2HF/3gAdWootZNkNjrL+UH4d2hCr3U6G
	 uZ/TYPo+Y/UxgYKG+Uzw1x95aRcX/4KuIc/HCB4aA8+Qw4icDeR13mR9+SjOwe0WCr
	 0wio7BTqIsR3w==
Date: Fri, 29 May 2026 17:38:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: versal-clk: Fix Versal NET
 clock validation
Message-ID: <20260529-trance-reversing-fef2cb06f044@spud>
References: <cover.1780063921.git.michal.simek@amd.com>
 <0b450e97e83b7ea662dbfae54b97d894534407e1.1780063921.git.michal.simek@amd.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/W9jKy9jc8coBvyc"
Content-Disposition: inline
In-Reply-To: <0b450e97e83b7ea662dbfae54b97d894534407e1.1780063921.git.michal.simek@amd.com>


--/W9jKy9jc8coBvyc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--/W9jKy9jc8coBvyc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahnBBgAKCRB4tDGHoIJi
0j/FAQDxgjIzDw/vq6dwwHC2nztRVtJM+L/bjkbtir6LnYLgSwD8DDJfND/Ml21g
eSe73E4qYqXsK/SrmVyXNUM/aHgitwM=
=kNmW
-----END PGP SIGNATURE-----

--/W9jKy9jc8coBvyc--
