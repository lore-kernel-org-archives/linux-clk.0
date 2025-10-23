Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B4F285041
	for <linux-clk@vger.kernel.org>; Thu, 23 Oct 2025 06:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761201876; cv=none; b=GSrRVhSF2cljn74hRjOvUm3s4UFUAK1xMLZFhKpG9aJTHaooSOHN32RRYfT5kVQhE/SGY/GiFF7eNpHQglrc4NyfhGIVcGa5bHtgmfHgiZCKB9QY+J5hD/YxShfrWO+4U5cnsG+B/lU+NgKDEANuC8/HIhiQT9An2iYK/CukNZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761201876; c=relaxed/simple;
	bh=oL2iZqpyH6j7QLHwC86/xxOEoRv8ss91FPYc7QzxfJM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=CJqb8C0nHwu/KZpvE3jhEkBtLc6iSEP2Y7uaOHsLsb60dLS4st+ewKXgeKbCWCJ5tp0eabPnaEs4UsYl7WJZvyY2oxXenee5FVHAJO1Hr3LM67cNsFftrJIJqIyMx8Ayb6Sbt9D1GzTnREa+N3/aWZA7QSwLeyCq4Z5zDDVVAU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bCtvz7yZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bCtvz7yZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9CCBC4CEE7;
	Thu, 23 Oct 2025 06:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761201876;
	bh=oL2iZqpyH6j7QLHwC86/xxOEoRv8ss91FPYc7QzxfJM=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=bCtvz7yZcs74oDDCfKwaeTvRZcOcVQB/IwMo+JHePWO7ARFcTxOgzA8YrDC0Zh1Sz
	 QiibwVY36LJLIs/YGmq5zEbWVwxmowrdcUAUM6PYmCGKY3lOrGH3eMVFQH5zrbNhyv
	 dn+jVCZneg+znbPQUIfnbPEkB7yw1ger5hX2OhusyX9sy6bIEZ3QAK4md4udTwkgA/
	 rb44vYzr8xRTrOHViu6qgJC5BzXby06IR3JHiGCcjzZjAWnKlrPJDpcSLBbPVo19gQ
	 5AuR7eSDotQaoTPG8SzSeGIpJWNzW7PEdINkZ5rIAhbHyrQfQBiMOtA6QTajBdKVXa
	 IUjNuX/SVMVGQ==
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=e389e5be0cab519933da52a89f6094dec5d0dea461bd88a22147ec8b814a;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Thu, 23 Oct 2025 08:44:31 +0200
Message-Id: <DDPHYI9AXIB6.K9K435CR9WWY@kernel.org>
Subject: Re: [PATCH] clk: do not trust cached rates for disabled clocks
Cc: <linux-clk@vger.kernel.org>, "Maxime Ripard" <mripard@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Randolph Sapp" <rs@ti.com>, <mturquette@baylibre.com>,
 <sboyd@kernel.org>
X-Mailer: aerc 0.20.0
References: <20251003222917.706646-2-rs@ti.com>
 <DDJPIJGC8W1L.1BCHJEG3FO574@kernel.org> <DDKSRCG9J0MB.3NKE0JJWUWDTD@ti.com>
 <DDOCJEZSBJ1V.WPWWUAR7M1H9@ti.com> <DDOMVXFQ82CN.FJ0FMPGMTFPN@kernel.org>
 <DDP8GWMXBBTK.317J8GMC6JDH@ti.com>
In-Reply-To: <DDP8GWMXBBTK.317J8GMC6JDH@ti.com>

--e389e5be0cab519933da52a89f6094dec5d0dea461bd88a22147ec8b814a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Oct 23, 2025 at 1:18 AM CEST, Randolph Sapp wrote:
> On Wed Oct 22, 2025 at 1:23 AM CDT, Michael Walle wrote:
>> Hi,
>>
>>>> Am I correct in my assumption about running clk_get_rate on unprepared=
 clocks
>>>> though? (That it shouldn't be allowed or, if it is, that the result sh=
ouldn't be
>>>> cached.)
>>>>
>>> Any follow up to this Michael? I wanted to be sure this was something t=
he
>>> subsystem should allow before I look into further workarounds.
>>
>> I don't know. I'm not that familar with the ccs. My first reaction
>> was that it's asymmetrical that a .set is allowed (and works for
>> tisci) and that .get is not allowed. That way you can't read the
>> hardware clock (or think of a fixed clock, where you want to get the
>> frequency) before enabling it. I could imagine some devices which
>> needs to be configured first, before you might turn the clock on.
>>
>> OTOH Maxime pointed out the comment in the kdoc of clk_get_rate()
>> which clearly states that it's only valid if the clock is on.
>>
>> -michael
>
> Yeah, I still don't like the way we handle clock in firmware but I've alr=
eady
> been shut down on that front.

TBC, I was talking about the CCS set/get API in general.

-michael

> Regardless, there are quite a few drivers right now that use clk_get_rate=
 prior
> to preparing the clock. If the kdoc reports clk_get_rate is only valid if=
 the
> clock is enabled, should we report a proper warning when this occurs?
>
> - Randolph


--e389e5be0cab519933da52a89f6094dec5d0dea461bd88a22147ec8b814a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaPnO0BIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gNzwF/bEkBJrUlDa4quhwTMYFzW6B2Hv7e2bq+
HNesD4Xw0mgBMPjQb1pmNaFOJnV2E75mAX438gzpfyqsT/Ct+1bHfEfPammFsxPF
EvjfAxykhIc4H4WDfotP4Y2OQIHhW90PaSM=
=BN76
-----END PGP SIGNATURE-----

--e389e5be0cab519933da52a89f6094dec5d0dea461bd88a22147ec8b814a--
