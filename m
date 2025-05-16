Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3596123AD;
	Fri, 16 May 2025 02:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747361465; cv=none; b=BTCpPFG71I/I1466Hqej8v324KSRUsLwtrb5x/VbYPtoSxOwqg4S2M4/dac9PWoBJfQM56BY8m0nHPz28L/oLNhulJ/5jdjB21RDBV6zKdx2KO8YhQJr/giWsITaq3d72hll1B6auFHajGSX/t3qEKfN4Gn5/J3RK4oYIYL0Q3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747361465; c=relaxed/simple;
	bh=it64++/TBIcO04ua6YzkJRzrmlhEFYRLff/zIz8IRLY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hd3Nuu2F5WwdgsfOw0knBtcU2Ssk2tdJV/uJRDd1Man4VWfJri2fIC0gzDaQMJrRSMF7nYJF+cY7y0vhgqsSQAmu0Rrkg+AD80NkswGW4Jrk7swdWAP7eEXjb2zJeaQlYJxRykIG6dvBqA8dRKlSh8Aim/VqlkiZs9Wfvg9vp1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fra0/69R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fra0/69R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3FE4C4CEE7;
	Fri, 16 May 2025 02:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747361465;
	bh=it64++/TBIcO04ua6YzkJRzrmlhEFYRLff/zIz8IRLY=;
	h=Date:From:To:Cc:Subject:From;
	b=Fra0/69RxRrtTmaMG2zPJTnWfeO9BCcGEgJSIDbPhunyx4rGhIdc+36OPpr5zsBRC
	 noX8xQEw67KdcJMVoQizLEcE3nTf8tEmUvsdmArh/TN0XVTBYBTIveZirhjfTO2kRb
	 xidLsezRYuK14NicNK4WjaYUWZrJD1mbJqEr8R4LB9kJQe+2xPUbFB8GQ31KjZTR7Q
	 dDMk8JXo39ju6TFmWMG77FJsYmRhcA9Co36lLoS2EOmzP4ecrx9GaOJTlTaHTW4jlC
	 VrhUZ9mm4CcIS/OrvNHVjN1AQPXEt1YCzg2ogtFOdvY4nmFUmGtsl+Epj/xXGg9GTN
	 PT7UILHTgH11Q==
Received: by wens.tw (Postfix, from userid 1000)
	id 39CCD5FEC5; Fri, 16 May 2025 10:11:03 +0800 (CST)
Date: Fri, 16 May 2025 10:11:03 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-clk@vger.kernel.org
Subject: [GIT PULL] Allwinner clock changes for 6.16
Message-ID: <aCaetzKYzCpzRYzd@wens.tw>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Gw1K57SsA+7Aw7T4"
Content-Disposition: inline


--Gw1K57SsA+7Aw7T4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-clk-for-6.16

for you to fetch changes up to be0e9a3727872783bad0752dc82e0857f4776049:

  clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support (2025-05-12 23:55:06 +0800)

----------------------------------------------------------------
Allwinner clk changes for 6.16

- Add support for DE (display engine) 3.3 clocks on H616
- Add missing LVDS reset control on H616
- Do not enable by default during compile testing

----------------------------------------------------------------
Chris Morgan (2):
      dt-bindings: clock: sun50i-h616-ccu: Add LVDS reset
      clk: sunxi-ng: h616: Add LVDS reset for LCD TCON

Krzysztof Kozlowski (2):
      clk: sunxi-ng: Do not enable by default during compile testing
      clk: sunxi: Do not enable by default during compile testing

Ryan Walklin (2):
      dt-bindings: allwinner: add H616 DE33 clock binding
      clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support

 .../clock/allwinner,sun8i-a83t-de2-clk.yaml        |  1 +
 drivers/clk/sunxi-ng/Kconfig                       | 48 +++++++++++-----------
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c             |  1 +
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c               | 25 +++++++++++
 drivers/clk/sunxi/Kconfig                          | 10 ++---
 include/dt-bindings/reset/sun50i-h616-ccu.h        |  1 +
 6 files changed, 57 insertions(+), 29 deletions(-)

--Gw1K57SsA+7Aw7T4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmgmnrYACgkQOJpUIZwP
JDBCuA/+L7SwNTYn44v9qFFL76D+T2bGKbgIIVqqMZgJbDPs5jSTN97C7DXNJySg
2O3SFJgDJ3uOdK4WX6xOZi1MXtSeOSWuM23zrddO4gfQU8KtLOUANixuq+F362j4
E3o8SlPzdqEFJgCtcDlozumY6uM8yuhyEBv68QpPNkYfS/aNQd4whJwH9wosBTOp
xQWDCYqp6NoFZvgh3oHYLLBqGkMFdgAlYmtUukrxIRykVWVHuqf4QO1WhiC4HPK6
e4RTVtAWKpK0fqy3/RcsolDDTpMrOOhChm53XuMn4qYgp7uRspVuHhLVPxfjvFR6
phl/3Lig01sMK7iaBFp1XCmPwGFQ0GyUYPKT0oTPylgsZwAZqpV+eQibTOXRz9/v
1n9TJxSlsHatZXDQdhAt/4/uTULnJzs0aynOEEZWSpD4wRyRsSX5dijLSXofyxVe
GlfUBo2RDDbqzmQ9evpp2kcBfi0WK07MUoVvyT4ONvolc1zBaBoq4NZDLnj5IXqT
X9kkzQhBw3PT7dm30FmNsKNqg2F07hzv1/nUqMZlyw0HkqRCyPWQdKv6yoPUbCKi
8zKVWc+PX4FJLwlZ1GzUGfTdmDlVpbLCMtj6J2/8tLMN1B37YQCH0TZ4rvDnLJMw
Z3KHAJRSiubZOPTWLijvGPa0jQSDA7CVWc0/lcBHk/n5Zhsj2JQ=
=HbLa
-----END PGP SIGNATURE-----

--Gw1K57SsA+7Aw7T4--
