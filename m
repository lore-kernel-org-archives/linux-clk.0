Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB15372EC6
	for <linux-clk@vger.kernel.org>; Wed,  1 Apr 2026 12:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775045119; cv=none; b=GbiriMXMdGARw3x0N5V0ongP3FqRrGYb7ous7u9YA9n2V03KxpNpquj+cKsMmJ+DmqlGVyb+yaCIwV/NMgmYT1JoZBeASp9uzdL+GXBz34mdwFMEO1M8+TqGo+y+7cao0ovKBYzyxRTKXKgOMnmUGFgm5uuLD+O6pQaj6RyDAr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775045119; c=relaxed/simple;
	bh=zM7ZrwTVbM7A7sXITDmdl3zT3STRdCja3psCVwQBvOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wgkp25UcgylqeeNDFlkBNlbtvQSuIkBGu6Gktvfm2NEJ9Ak8+CYyGeKIsVo1VaH9I4ZRG9emnV+2f+RXytdn9D3qEKKupqunq8hLb5Adxb8vCPgPkNUYs4JQmolui/CTm9uDxcUjCKVVzP19g2nt0QJWWBWO+mBTZ/Ng8/6VqK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r6GeRp8o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r6GeRp8o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B35BC4CEF7;
	Wed,  1 Apr 2026 12:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775045118;
	bh=zM7ZrwTVbM7A7sXITDmdl3zT3STRdCja3psCVwQBvOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r6GeRp8oY1/srl2at4CKdF3oOt/gYlbzGS1q3sjInPALeebzj2sItiX7irtiqnuj0
	 5sP/1v8qqnCn+iRdf67KhDOjPqjN+aRJWaNANT9WIUzCYAypL9llFawc6ZsrKoV5Us
	 9fK9cwpxVWer0FXiyBlE4hOXitPZriZ9bhuoXRywOPs12EkVjiK5mcyeNpzL/7vu5y
	 eewCEzbQXhgbMF8Zamc0LCvc/0qJlq50XvjX1BKd2o/IdeG7r0FVOcl+IVI/trlzVK
	 U+N6jok/FHGfmdxYl9xkWkrJc9WTP7BM7hLLGa2NAMi9dHgh1+p37v1kYOUxPO6TZa
	 mJNBvOeHdx/Rw==
Date: Wed, 1 Apr 2026 13:05:13 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Maxime Ripard <mripard@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>, Dom Cobley <popcornmix@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, kernel-dev@igalia.com
Subject: Re: [PATCH] clk: bcm: rpi: Mark VEC clock as CLK_IGNORE_UNUSED
Message-ID: <2d0f6816-9d9e-43ed-aef7-bde8bc1872c7@sirena.org.uk>
References: <20260401111416.562279-2-mcanal@igalia.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e6b9dxVBnakBny6W"
Content-Disposition: inline
In-Reply-To: <20260401111416.562279-2-mcanal@igalia.com>
X-Cookie: "Yo baby yo baby yo."


--e6b9dxVBnakBny6W
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 01, 2026 at 08:13:57AM -0300, Ma=EDra Canal wrote:
> On Raspberry Pi 3B, the VEC clock is used by the VideoCore firmware
> display driver, which remains active until the vc4 driver loads and
> sends NOTIFY_DISPLAY_DONE. If this clock is disabled during boot, a bus
> lockup happens and the firmware becomes unresponsive, causing a complete
> system lockup.
>=20
> Mark the VEC clock with CLK_IGNORE_UNUSED so it survives the unused
> clock disablement and remains available until the vc4 driver takes over
> display management.

Tested-by: Mark Brown <broonie@kernel.org>

--e6b9dxVBnakBny6W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnNCfgACgkQJNaLcl1U
h9CGVQf8DyFbImg+H8bmRjt4+lXKBNm6HuSMV4HQgvSsGwXKzGKiHS8EJrNSBjxT
f5jsPfx2fXnB++M9AMVko66vCfw8oh6phtIxMQyFpI+eeYe2NxEM/sP6eoBxDm0b
bdlwmqYiCxetqVGXzVNDNtP+3b+VYGoe14xPOTvL9znUIq/PKqxNmY/fAsQl1eq+
mD7W9hlCF8yxh77RoZ4tMwtKjy4Qlcx5/eItUwKK4+FhWIU/XBeEPyJ0rYEDh3cc
Wb3kyEgpPaRdpaKvN0Kbk/nsvpL5kBgpUkqtjfR6/CTla7zmfZ8p7+ewLoGhQZmE
SUAHnzj0mknHS45KFK+XGyOQTZAJdg==
=LSrV
-----END PGP SIGNATURE-----

--e6b9dxVBnakBny6W--
