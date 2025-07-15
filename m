Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB79277008;
	Tue, 15 Jul 2025 16:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752598656; cv=none; b=DEFXgPpBtEDZ1re3t97/hll0Jem2XpdjCbXqMkeR1PYlmZLNvooTsa8cAiL4y9kZ0F58mcJhUG0OueO/RaxL0QgRsDDk5cL5BCJBWEoqauZHXyuTw41ITh6KAwsmwCdhmmtn3XJTvQe7gH37f/i7JbuHPiBXxEvmNDOYbxn8MHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752598656; c=relaxed/simple;
	bh=eSaflvx/Ru36kB5lR8MJqA0WGjqDoSQARC75v+IdOkI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QHG4BTND7OM1fclPuF6nJD8VIPJIHA8m8zcnvClEWriYTk+m4/O6GEtCBJv51wLSMNGVqr99J7Xas1m+hYYQYBcbsQZLoIg4lkJsAst8R2ATeE4OMwYFSSmhB+UKYypTogUJSJMuTIeZk+L6VWb8gJPMZbGiit4DvdfFgaeRJzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z9Hvm06x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z9Hvm06x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A645C4CEE3;
	Tue, 15 Jul 2025 16:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752598655;
	bh=eSaflvx/Ru36kB5lR8MJqA0WGjqDoSQARC75v+IdOkI=;
	h=Date:From:To:Cc:Subject:From;
	b=Z9Hvm06x3FG4GMrNM8ag4WQ3iZBk1wA9hggIfAi0EKdbTGTL4GIMZflDAtRTH6cjV
	 gJ51hf/6c9gdtfelVwtAGKr+/omAw3O1oI98HcOsJED/iKRtBRh9A6F6/dqCivwaT7
	 0g0xCLiGOi0bFTW3P71y/enKWbb4y8gvgXsjoIwmflcWjynzgl/GPO3FTLvsojcpAS
	 xCghRwiL/mLLBB8ocmqsld422byml5GlsVymFJ/pFy6nWRdA4Xg7zXtj7CauHY6Opi
	 dq88zUu41gHI9icvBxpPEoTq6O2pdhoY6NtMDQadv7OzJY0U+eJBBjBceGiVSo576q
	 DMgbMYlcqVLxQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 850ED5F7BF; Wed, 16 Jul 2025 00:57:32 +0800 (CST)
Date: Wed, 16 Jul 2025 00:57:32 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-clk@vger.kernel.org
Subject: [GIT PULL] Allwinner clock changes for 6.17
Message-ID: <aHaIfP2TJ_zkWv3G@wens.tw>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="08DruHqJJDxwac8g"
Content-Disposition: inline


--08DruHqJJDxwac8g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-clk-for-6.17

for you to fetch changes up to 80395c3b47577c12121d4e408e7b9478f7f88d02:

  clk: sunxi-ng: ccu_nm: convert from round_rate() to determine_rate() (2025-07-14 11:56:18 +0800)

----------------------------------------------------------------
Allwinner clock changes for 6.17

- Add A523's missing PPU0 reset (both DT binding and driver)
  The binding change is shared with the soc tree.
- Fix V3s DE clock mux field width
- Stop passing rate change requests to parent for V3s DE clock
- Force and lock V3s DE and TCON clocks to the same parent, the video PLL

----------------------------------------------------------------
Brian Masney (4):
      clk: sunxi-ng: ccu_gate: convert from round_rate() to determine_rate()
      clk: sunxi-ng: ccu_nk: convert from round_rate() to determine_rate()
      clk: sunxi-ng: ccu_nkmp: convert from round_rate() to determine_rate()
      clk: sunxi-ng: ccu_nm: convert from round_rate() to determine_rate()

Chen-Yu Tsai (2):
      dt-bindings: reset: sun55i-a523-r-ccu: Add missing PPU0 reset
      clk: sunxi-ng: sun55i-a523-r-ccu: Add missing PPU0 reset

Paul Kocialkowski (2):
      clk: sunxi-ng: v3s: Fix de clock definition
      clk: sunxi-ng: v3s: Assign the de and tcon clocks to the video pll

 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c      |  1 +
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c          | 22 ++++++++++++--
 drivers/clk/sunxi-ng/ccu_gate.c               | 14 +++++----
 drivers/clk/sunxi-ng/ccu_nk.c                 | 14 ++++-----
 drivers/clk/sunxi-ng/ccu_nkmp.c               | 23 +++++++-------
 drivers/clk/sunxi-ng/ccu_nm.c                 | 43 ++++++++++++++-------------
 include/dt-bindings/reset/sun55i-a523-r-ccu.h |  1 +
 7 files changed, 70 insertions(+), 48 deletions(-)

--08DruHqJJDxwac8g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmh2iHwACgkQOJpUIZwP
JDB/XQ//ZKx65ya4UrwyoxRLxb80Fhp6L4bt2DwWLSMdGafJXLYC7R6meAepmJJv
eGFXpd8dp7mpptfMr7ORzivePqB60PWsEMFdQQmPewDLnHBoRo2+uHSfZTub7nDI
4WxZX/QCfh8DvsmX1xyQRd1cCPudHdR2A8HGivRmwADg36+K9yOPhSZ9ZOraBN1+
SjY8uqfpm6kgtsTT7ROzOYDTroXt0JKQCJfUj0t3lQgqOJ6kQJwhWMA/UBA2UhxX
MuMi1tUkgw2czhdua2M/Um48EJIcHQr2JU0LIBYasRG1cVZPt+fU+WyaN46J5P65
fCWQ2QbO5SbHgHsYfcTCwiWUC2E73bKl/BcK+/p2rmL2N3dbTDUWxofMf8PnAayB
57/Rx/bkJgnhC/qadclCBkPS9w7YJQN4Lqy83SciNUuBiOV7JMAFwvbUXhodZK7O
55JVFW37CnrTaeIoF+sF+Q++cryzoaIItj0IqZPYp0Dve5D6QjiGXSj0gcg/pToO
OQh9LS9Nxef7EpJfaNnfVYgYqpxFQrTJIMsWBDLo1ACfxkMnu5TmuK3GLPAGfz+y
CFS2+NYH1vEEmo5hS9D7SEYOxb3e2dnfElh5otMWq+Rpo29S9ee1YndKrcOOwCuI
LxpgSepixKRbtlDIRhoMiLzxRGQi+VZ6PEZogRDm4jL3Cg5SGhw=
=QqUR
-----END PGP SIGNATURE-----

--08DruHqJJDxwac8g--
