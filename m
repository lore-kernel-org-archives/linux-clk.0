Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0C538C412
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 19:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783020428; cv=none; b=C5LcDU865V53hb6/b9ITRy5ZDmaiSQVGhR0cIsG4fXi4X0jAxLMld2q+EHiK16a8kzJEB9Yp7R48R1p6awbx4ZA5FvOdXNnVWThb/JBYb7yuP/gI520vVYGIYJHJVIFI7IxOF6Sh3mmSeBGf9j0K4EFXa9CU1XqDBuT2z48YuD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783020428; c=relaxed/simple;
	bh=wR1st3jTX6RTY7WDDJ1RrWd/15qri5Ffv6wmA971dXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z15P1z5x2LG0OR8/MjhvhdZfC3w9p9lLxJ9i/suiEPBovRpgCR8RlFPra4quWYeX2QHxKaLSANP0W26e8HnOFrL8Ckf7R7yC3xhy2OMXJq1u4eMMXmTaXKK8mkEtgnJmI7yUrNmt0yyYYDm313RxbE60ioRkvXI2eTYWPXBvAH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TPoBC7bF; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TPoBC7bF"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so7971925e9.1
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 12:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783020425; x=1783625225; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1JUyIG3DwbeOPJPxX3RcLVRRPcM09xsVDoLHi5o4rk=;
        b=TPoBC7bFS3CezUu88WEQT1acocu18NekcJ43zpRzZq4WR3MrC9wJNmZ7QJOwQ8LY7G
         8MDtzO2CchBgkjZ30A++bmpA6ljH/H2pGpbOtJXfF5XlmFYSMPSjxg9itAVvg9hVocfj
         3uzBZeaMysfGSEpm0xkcbdEkUlfVn3qsDsTc40PLqkm/dgqJjQgsyMNWacA5Pnh9HUIC
         PEx9KpjIUxFYjvX/divAr/rARCub1wYfjCpppZZoVk3CqGgh1j+Xoq2CiU4RPpOZH4Gy
         0F05YBVyRs0Anl32wHQpmczI4pkzQI2kpT+Jbbo47ux9nRD/iWn7bvD6L/2lAfY3TGkC
         CjOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783020425; x=1783625225;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z1JUyIG3DwbeOPJPxX3RcLVRRPcM09xsVDoLHi5o4rk=;
        b=Bdze/aS63gftYi1dUKGJY7McyOMGAsnVmnFPklHJB8vmzJln4g/ONyS4EATdmTtW5D
         ZWCEV0NuYOwYppJgye7UKg2tez9EG8rUb/5UC9a8O65fredYOcovaT9AA9KYyLA2oOGZ
         h/rGfwigj8pNFONL8CHN+0xZnuqMQ5lpQ3w121uogJk9hkUeFrFe0duf7flvFWGXZFqK
         5Fq+qnuaUGlVVfB6IohZWpI5+qxpN93473gqd4UeTrL5fxtiglABSPRtAg/LJsxm+Xnm
         O97sqeJQ37diqmY19csnI/llawhpB7XymzKEGZAfLvyPyW2E62B5m32cBdKXH724w5qo
         FQjg==
X-Forwarded-Encrypted: i=1; AFNElJ+n3EltLJoHoRaIKr+XZJPpJPDEksArc2kP1OzITlMXUdjdtzl+HGxjG8gO1QjjvzXpcwed6p1sgK4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwL8OT5oYdUTafbhRuAlDMPrhrKAT1KtXD1F3Ky1eG5dGAFfqlE
	dDa4kQMOXURSPE3xz7Z0Uu+IyhVmd51vCqf6XuDPHZRbvcwgOw5Zy/nWq0IT+ARCv9s=
X-Gm-Gg: AfdE7cm/VUTHIjutnGige6H97FSV9csB4OoVnj9OShOIqP5r4jLCD3MF7sfUo9ked5a
	+20YDpDspV2KclmAcPh8BXutt3D2kkHhORnDjVtihtC7bWRIft8pNtl4jZUshnGQlOKLygyYYBG
	ftwHp+I49tk0K+pb91EnSpbpOxIbtz7CqgXRD+9GbKkbgl0NfqsfZb1A/cXRNDr9Rw2IC6eDHg8
	GGelqMJ0CjGulUhA4lorqZVlXemhUiJZ4WTdwPIxUtkjDbgYybfgzTZCRPwf4IMLkNlRaNnWzAZ
	LdjJanc4YjHagRlir8HZzdSsjZdYxX33O3jd7ukuXoykLtvnDHUTneiLBb7I9ZMFU3RJq9zdbBT
	KcXhn578ytjXvJT2I/rfK9j9JtGQ6YvDt/+r6BvL41FW0LXW0NkQNcZ3K2ZSi3a3GQYhJHaXWE6
	USEkCY53AoBHKnfpti2veLWsma
X-Received: by 2002:a05:600c:4eca:b0:493:c600:e1a6 with SMTP id 5b1f17b1804b1-493c9b5da18mr16908965e9.12.1783020424838;
        Thu, 02 Jul 2026 12:27:04 -0700 (PDT)
Received: from strix.localnet ([197.250.51.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm107245475e9.13.2026.07.02.12.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 12:27:03 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Brian Masney <bmasney@redhat.com>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v5 00/12] ZTE zx297520v3 clock bindings and driver
Date: Thu, 02 Jul 2026 22:26:54 +0300
Message-ID: <-YnKrFIxSsqt7IlbKzex9w@gmail.com>
In-Reply-To: <20260702-frequent-refreeze-9850982156cb@spud>
References:
 <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
 <ihPM7P2dSn-oiyaL8fageA@gmail.com>
 <20260702-frequent-refreeze-9850982156cb@spud>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartCXp0dzo7QVWFrQBb7b6M4w";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartCXp0dzo7QVWFrQBb7b6M4w
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH RFC v5 00/12] ZTE zx297520v3 clock bindings and driver
Date: Thu, 02 Jul 2026 22:26:54 +0300
Message-ID: <-YnKrFIxSsqt7IlbKzex9w@gmail.com>
In-Reply-To: <20260702-frequent-refreeze-9850982156cb@spud>
MIME-Version: 1.0

Am Donnerstag, 2. Juli 2026, 22:05:14 Ostafrikanische Zeit schrieben Sie:
> > I am not aware of any IO region to configure the PHY, although one may
> > exist. topcrm + 0x84 has two status bits reporting if USB and HSIC are
> > powered and out of reset. Nevertheless, the PHY feels distinct enough
> > from topcrm that it should have its own binding. The phy driver would
> > merely deassert the reset
> This is the sort of thing that should be a child node of the syscon,
> rather than integrated into the parent, given it consumes resources from
> another feature of the syscon.
Ok, I'll go that route then

I think I can add the phy child to the binding later without breaking the ABI 
if I make it an optional member of the binding.
--nextPartCXp0dzo7QVWFrQBb7b6M4w
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmpGu34bFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiPQMP/1oytiyuDough6TAKI1g
pyPuNyWA1l0TbqIZQujcStqcihL5JOYZo7eK/Z5amGdaD0EMEfB4eWYwsapRjRlj
hihS2WiWMGoowwNEvDsUAlxraWTwlDXpANEJtXNMPrVvOOPGin6OHFPquo3v+4vB
vgmM1r2MMacaCuuFEFn/m7NRHBuXA1QJzNXuyzCdHxwQEamNKV0SEVWp6mMnvypn
1wzXqXJjcyzbinxUBA42WiUaK8xfvna5CQAzqnqMVeS16C+Salhv41WhEDN3kMag
xjMXR6L4g04Su0MdhmssQGfE185ULucGWxSR+FZyqCvUuTOZnL1keHMtETLbQ2C0
Hafwvn0IUJiCzNhGjSzPgbzWIhe9xV7DLw9CxOjW07IVenrRoeZQr4G9/8f9ICYA
n7Zy8REW5Clmm2VfDSpsF2YLPuA39xv7TAopwUWmf+X4XqhxJvZIZVHL0B2lXQrH
CkKtc6AgRWV0Tb4wz66UK8QJCeJubNwYlHHkD7xbKt9NG+ZorwuIFxSoReT0+UVV
R77MUxXv618CXy2iN8UwCjFJ/hEl2Ffkw4c07QrqMG7HJNFkOtKBvYuvDGeseSTa
5GVk0b9cADBbSdwPkP1juTnjgYheY26U5Ru8lI5O+7zoAIrdzYik8OKkutQjbtus
ZycegPP8luJaanrjrM6flc+9
=zmEp
-----END PGP SIGNATURE-----

--nextPartCXp0dzo7QVWFrQBb7b6M4w--



