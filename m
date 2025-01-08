Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C092594BC;
	Wed,  8 Jan 2025 16:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736352282; cv=none; b=eGZ2meOTXVYTocgrbwhN/hGAilhlrUVWO1s2Y7SMub9omf1i+U0nVQspDRx46tHAfVbl6h2UxEVlo6KX46NgbhcNAmB6H4yHuP6Mfiyt4zWKnpB0R5/5N5xAcJgjNceiIPX22hT/iF+RXd3mJcgdRsUV21dbO4XE8yja9m+vWR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736352282; c=relaxed/simple;
	bh=I+0g50j78Ag+SYS2y30iiwXAE4swuHjkhUv13Oy/21A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K6vVG6cpegpFs/avM/heNsKwiEXCE8icx7zILA/aIjh5+mnVIY/5W+KNG3eBdhHJkNhcpJgK4pffaMO9Sg4NPi3nGzVQ6EXu1bDgT8fubktGZWTxD7OZQGwUyRZemw/rHG2Pk2PKEZlk41WDBHf+J69D3yQ2Sj+ynElIXK1v7Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JN7PU5re; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JN7PU5re"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A496C4CED3;
	Wed,  8 Jan 2025 16:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736352282;
	bh=I+0g50j78Ag+SYS2y30iiwXAE4swuHjkhUv13Oy/21A=;
	h=Date:From:To:Cc:Subject:From;
	b=JN7PU5reuikWYQEyvXekRHpGL8okOLJPJlcxUTp5Kz1KDEWqmHL7Lt/s4F/PF6Z/7
	 b653wI8LEFTPhFQsaY6f0m6WDXtBtnu44txdFFSuU2f0b+Z5LIGDrDjkq+De5rWBzC
	 UOZXdxfuiNz5Le7mzO+PZAsVWQELse0H2y10M0PaFkVtUVe6FAD+GOO2MKT1q5HtGc
	 F859TebuRL1zQzSEvGbolkcK9xj1sWNZn9XOvWTTlH77USNuxmyH/T86g/xyuVvE9O
	 oquU4pjuUPJrn+MbvBLiyTA92HvLm+9m1eivIBlNN3nt6F+CSQWNYdMjJrt+wMVkaz
	 /lKSFQYtRtcsQ==
Received: by wens.tw (Postfix, from userid 1000)
	id C18B15FF91; Thu,  9 Jan 2025 00:04:39 +0800 (CST)
Date: Thu, 9 Jan 2025 00:04:39 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-clk@vger.kernel.org
Subject: [GIT PULL] Allwinner clock fixes for 6.13
Message-ID: <Z36iFxlCUHhLcdP-@wens.tw>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EnEgtDh9vN0/ffdh"
Content-Disposition: inline


--EnEgtDh9vN0/ffdh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-clk-fixes-for-6.13

for you to fetch changes up to 16414720045de30945b8d14b7907e0cbf81a4b49:

  clk: sunxi-ng: a100: enable MMC clock reparenting (2024-12-27 22:43:29 +0800)

----------------------------------------------------------------
Allwinner Clk fixes for 6.13

Only one patch, accidentally left out of the 6.13 pull request.
The patch enables automatic clk reparenting for MMC clocks on A100,
thereby fixing MMC support.

----------------------------------------------------------------
Cody Eksal (1):
      clk: sunxi-ng: a100: enable MMC clock reparenting

 drivers/clk/sunxi-ng/ccu-sun50i-a100.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--EnEgtDh9vN0/ffdh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmd+ohcACgkQOJpUIZwP
JDDCAhAA6c0TjkaXWo3woS16j0OiYSCMsOnP9P6swFBVEpLYynxG+gLhEs7K3vuA
juEVWQ9nYPKjVZa9f/WRK5QlIaVE3lasHEzmj2Q2wtX91K7ayQt2O+hBmZgcks+J
e8XE9KwUx//1dq/UQ22oUmSuzA196u1vgY22c3CE5u/VWnzIz4wfNUyklvZDLLhf
G3opE6PtBahPlbaKXvoYtCltUFRAwSD3KX9J1BS4E9C9O6X0RUq+noRWg3hdJ3XF
JFfd49N5dYG9SvOmjDplgl3TRQReaED85sM7LZ62RMJVqzLQ3CdI3hbhlrQSeL/o
eE26NZ0Ob3QSriix80IpPiS60cdyj2jgVupABNHv+OvqWrPGPvznBOx8u50aVIJu
IM2DmfAFjd9TjNnaXP/T9S1SfR+SSjt5P2375yPFXKdHuP2Mukpx6m0fcUeqGMCs
d13qyL0x0CX31ZYF1Fy2eUBmQzBdL+qcNzn19UkW4a9qbGjV84PXoJZKiIsoC/hy
2OiXMXKmj9qHzkZrd3s28tBRezuJNJNO6Xnu7lRwF52amiaLbEHnn9glhab9vPt2
iW+ukF3b9uS2qzfZ3BrEfvCOJ4nkLwQwO02XTo3HxBgFKpGDALwwW2Xf2E6HlY+5
6dDvxTakGx4sTCEOorUnSbF3BtrvuLylvVCDR180Iw9gpr7Y5as=
=K2pe
-----END PGP SIGNATURE-----

--EnEgtDh9vN0/ffdh--
