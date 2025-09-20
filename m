Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACEA1D86D6
	for <linux-clk@vger.kernel.org>; Sat, 20 Sep 2025 04:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758342369; cv=none; b=NVPz4z4SIyUJHS2QaoeAsEZYIARPg0v1Ug6tQs892tBMbncvwAN38DK9ZjIziwVAqeWQrEpBUZxSDb9fy8H+ZI0PLKudkD/kkLGX14CHoBdvQlvw6MR0HPlfkuMKTBL8uB5G96eNhwjfZwhcw10qHV/ow5XLgoXounpkm4YYefY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758342369; c=relaxed/simple;
	bh=n1pNTMIqKRIESOMixjRP3Eb90Zf9mfLaMQ7sjwOSjME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rhXLEOEJOYPy03QX/p9RosfM0CongUBTQnxQkWJEGKbm4VCMPA/jvO7yS2RIFnBRpN7Vf+TM0/RBri/G+MZ26F1EGxBlWTyYx9EUxHRo4jW6CA0H0C9hCCjjWWstKbWUAgDSNglDxqup0Wj1ymyqUQNnYPHJCTnUFoTP2NSL0cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=B17jvZXl; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="B17jvZXl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=n1pN
	TMIqKRIESOMixjRP3Eb90Zf9mfLaMQ7sjwOSjME=; b=B17jvZXlPq6SW+epKV/g
	m2SgeAhHYFCcL0NBfeknXRoRjfspwLm9TsAC8wevdgIXlVUpgE1gaJO7KKsb7YRH
	JDYVdIAlez5MLi6t8WZDZlRUQXfXEwq6FAKP/tiR9Vrt+chX7G4wEo5bTftP/nVl
	HagC0cHAqbfzmSIfa+oGx/4A/yaBui06eGKoPjv3VNX/M5sQ6wp+/6KCqxz0NEBx
	7RD8318W1CacHhmFX99OfSXfbRZf33o5Bftde8oPJTWxXSgY+qkJ93ON8HqKX5V+
	YDd8jiVub/4RWTuNBl5cf3LnLEVV/g5MUMphQgi1QuXmpIn2EvW8SEamwbr8aSK7
	Sg==
Received: (qmail 4143060 invoked from network); 20 Sep 2025 06:26:02 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Sep 2025 06:26:02 +0200
X-UD-Smtp-Session: l3s3148p1@FWTl+zM/Dowujnub
Date: Sat, 20 Sep 2025 06:26:01 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-clk@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] clk: renesas: cpg-mssr: Read back reset registers to
 assure values latched
Message-ID: <aM4s2bKCOrmAiTze@shikoro>
References: <20250918134526.18929-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mJc2pi4607S/6DX3"
Content-Disposition: inline
In-Reply-To: <20250918134526.18929-1-marek.vasut+renesas@mailbox.org>


--mJc2pi4607S/6DX3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 03:44:41PM +0200, Marek Vasut wrote:
> On R-Car V4H, the PCIEC controller DBI read would generate an SError
> in case the controller reset is released by writing SRSTCLR register
> first, and immediately afterward reading some PCIEC controller DBI
> register. The issue triggers in rcar_gen4_pcie_additional_common_init()
> on dw_pcie_readl_dbi(dw, PCIE_PORT_LANE_SKEW), which on V4H is the first
> read after reset_control_deassert(dw->core_rsts[DW_PCIE_PWR_RST].rstc).
>=20
> The reset controller which contains the SRSTCLR register and the PCIEC
> controller which contains the DBI register share the same root access
> bus, but the bus then splits into separate segments before reaching
> each IP. Even if the SRSTCLR write access was posted on the bus before
> the DBI read access, it seems the DBI read access may reach the PCIEC
> controller before the SRSTCLR write completed, and trigger the SError.
>=20
> Mitigate the issue by adding a dummy SRSTCLR read, which assures the
> SRSTCLR write completes fully and is latched into the reset controller,
> before the PCIEC DBI read access can occur.
>=20
> Fixes: 0ab55cf18341 ("clk: renesas: cpg-mssr: Add support for R-Car V4H")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--mJc2pi4607S/6DX3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjOLNUACgkQFA3kzBSg
KbZceQ//TVcg38zE/EHHVJ//i1ZvWL6pgv8yxCRVeDcNjV4IrtijT7pEYXECDMF0
42KIOUUuWpGyWbabuiItLV3CgZsp7KpBUzq9YJEsqLL0Rnr58hCEoWdkcoV6VEha
tVyWOjvXDI2jrdp/GCH0rmgMkyzpx9P76gji0Sw0mfBNPd4L4bLBw/ekBWCgoirx
32RCL5kMD5q6naHC+dLxA6tlsklW8gJoPRb0XEY0Uq8BrWl3tEKj1uCplAHzSJa7
8DNflNqHo+dlvDV+d9RXpGcA27pNNkOdqnAYLCF6DCCwkTc1HtQL5OJpI5XUPwVl
CUpBe7PHWeYTKp26l6HUEeW5hcdvhjO172EtVWX+tODr+o2IstlCbKeXZGEhO1n4
72qSIqNWSxVGcavmxSjdDrQIPhkrIphg3k8IsdCmMao2RhSXXraHQNwGvgYKYAcG
jBq/Ouo0Uce9MWhUkHhZBIDxJLvFE+IeteyT3KHVAMyz2jdAie4WYQ/Sxf7PnXiT
bUIKlKlZtviNILbVjJ7xsxZovXULHIZj4zWUtNb8o6pVGnze8qEpKivdYnFrc9/t
CrJB7WktxYWK4/X8/O8UchFHO5dkjwa9kKHlqWJDvMWXiblNS7d15eExlD2cGs/c
OCirYLtbV7Wno+9MGT2J7lFKHaFnPgFU63NbvqUSBeKi0Uw+JWY=
=Fyls
-----END PGP SIGNATURE-----

--mJc2pi4607S/6DX3--
