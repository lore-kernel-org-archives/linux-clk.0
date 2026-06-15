Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938AD23A564;
	Mon, 15 Jun 2026 16:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781541876; cv=none; b=nYL9o+c8xj5EKSdhZHhFxLyGtl8mYV5Tc44NZJopWE5/eMsPAWCeeRid7qulfo5myo4IOw6PRCAGyWccit/3PcCBMmJEtm7osE3AzSVZljjrlq4ndSdsddriIj4mLf8N49JtxJ4rZKFRZ59GK1rGc03gs4A3HsRmBh1MqpsTDNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781541876; c=relaxed/simple;
	bh=Ok1q3lFMwwTbCAb1WRuYAS9/p6RNhi6/nVYDTBXnXCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LcJFAwOjpuNcGfKTq00s9NTptPIHXl1OqKh0wFSKGkhlVepcdYwsRYJYX6E3wsU7fEQHPZ0Pmr/vZfF9gSThG+Hd/k0XRYeX5a21LLiSxnFcqIccdTNI0cw1yt6UBm52qdV5AcUpAcfnafLiMGQ+335rdZUvanNbsAsbvqkxYaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HV6TW2qW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HV6TW2qW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E68831F000E9;
	Mon, 15 Jun 2026 16:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781541875;
	bh=Ok1q3lFMwwTbCAb1WRuYAS9/p6RNhi6/nVYDTBXnXCY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HV6TW2qW8IGdyr7DenKo0WGSxFAzE8eUNEZ0dRdwZNmGCwm3YPBd77WL4cmcDC/PB
	 0qjmq2Uqxym+zOwiRGwfPTb8KBG1E9+xwx0Xp6XBhHHkHNKGrhsdBS4/Gtd7fynwmE
	 rv8VdsPdbZsL4ODZ51VHYVuxnVbTO3R6OZz/gP13aRpwarKGFzzULXakJEVIaXZhlu
	 etexJE/297wkj6ffg4ruM5jm53gkLdBkZyt3snR78BstSBRlh4Yc0OzZA5iNwar9Xq
	 lfwg9GTsMyaIJHdXfTWGxpr4SW+TlJQXnl6OOh1fwUPn9ZvgjRVlvy4Hmee1OuGmFr
	 hSfAEghPhn5tQ==
Date: Mon, 15 Jun 2026 17:44:30 +0100
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
Message-ID: <20260615-sulk-overlord-e88e845d3c9b@spud>
References: <20260615034845.3320286-1-shubhrajyoti.datta@amd.com>
 <20260615034845.3320286-4-shubhrajyoti.datta@amd.com>
 <20260615-squid-showy-435c9cf780a0@spud>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1dHKHMjeI1EHdzp8"
Content-Disposition: inline
In-Reply-To: <20260615-squid-showy-435c9cf780a0@spud>


--1dHKHMjeI1EHdzp8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 05:42:17PM +0100, Conor Dooley wrote:
>=20
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: not-applicable

Actually, I take this back. Patch 1 seems to be what's adding the static
configurations in the first place and then patches 2 and 3 complete that
effort. Instead, please add this static config support as one patch.

Thanks,
Conor.

--1dHKHMjeI1EHdzp8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajAr7gAKCRB4tDGHoIJi
0meuAP9ju+Zb1v9LLsSoRqV7m4BjKuGydV3Y0cFa6eISj1QPxAD8CziXD32X+dcp
wy7z+4Ob+hRdQxuTF+M54ub3tKFUxAY=
=92Sd
-----END PGP SIGNATURE-----

--1dHKHMjeI1EHdzp8--
