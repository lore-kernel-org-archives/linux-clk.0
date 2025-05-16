Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8588523AD;
	Fri, 16 May 2025 02:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747361429; cv=none; b=bHLoB/1M/MUxtjMcGqBX1hCikWs5Dslk/Vk6Ce7bpTmUpkU7xat+r3TjGp/wYFjk1dtorDkly+G9zjDIjiO6o3roN8/g77XqcVwYnVAw4vWf/RkIKbgMfZYpJ4felxbhrxEm1waPMoMiI59Hc8pknbP1erHehQWYwZtTOut4D3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747361429; c=relaxed/simple;
	bh=7iLcsar64p3IlyqtV30lQDat0mne5qNyqF1RJ4Rf9Tw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uYPIim87zp5uA5auayz0VbxpHmE/yRQDaZgZwVC0whpHYxIu9xVMEuO8mZMNXbxMz6Wr64KabQnGvjgKBg7au8Hc7eB2l+ktnJ6QCGqNFM/NqcK8y8lJeprKTkNYAdqdQPqx9epy1wJzWTf58seudhn6sitW3YAIzA5h24Zgo9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UA4F2dGN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UA4F2dGN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 405DCC4CEE7;
	Fri, 16 May 2025 02:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747361429;
	bh=7iLcsar64p3IlyqtV30lQDat0mne5qNyqF1RJ4Rf9Tw=;
	h=Date:From:To:Cc:Subject:From;
	b=UA4F2dGNNX2tzM4+t2Ap6iaqj5W+zHbSuVKNh8o+UamoCIQ/ySj3yL9bwAWp/+i4W
	 o7ZmSJlASHGkLRnp3G7hpNLdYgQoYayzTcDmpkCPIP69XgfToTMEPaNd6UxyqgXV3y
	 lhMiziAODJ0MZb5GXgNtfrmNF/m8NmLxQBEzHtDaZy49gOnm3Yue5HJU+p0TWwds+c
	 RFl/Z//D0ixvXEd2hzUuQ3tsRivLGuWjHKe6RYGibL/RJoYL1bOOkECjMgeC3AVzIc
	 clu+mcnjeqOiqBo/YitL2/xBSb7aNliOS355psev2bCJQRVYp/jOB+k/KrJ1vMdXW5
	 D/83Tk5RRRtQQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 6599B5FEC5; Fri, 16 May 2025 10:10:27 +0800 (CST)
Date: Fri, 16 May 2025 10:10:27 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-clk@vger.kernel.org
Subject: [GIT PULL] Allwinner clock fixes for 6.15
Message-ID: <aCaek3S9Mf0g48Ze@wens.tw>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3HN7eCEJ5NWwlW1p"
Content-Disposition: inline


--3HN7eCEJ5NWwlW1p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-clk-fixes-for-6.15

for you to fetch changes up to 98e6da673cc6dd46ca9a599802bd2c8f83606710:

  clk: sunxi-ng: d1: Add missing divider for MMC mod clocks (2025-05-14 00:40:13 +0800)

----------------------------------------------------------------
Allwinner clk fixes for 6.15

Only two changes:

- Fix the order of arguments in clk macro for
  SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT that was recently introduced in
  v6.15-rc1

- Add missing post-divider for D1 MMC clocks to correct halved
  performance

----------------------------------------------------------------
Andre Przywara (2):
      clk: sunxi-ng: fix order of arguments in clock macro
      clk: sunxi-ng: d1: Add missing divider for MMC mod clocks

 drivers/clk/sunxi-ng/ccu-sun20i-d1.c | 44 ++++++++++++++++++++----------------
 drivers/clk/sunxi-ng/ccu_mp.h        | 25 ++++++++++++++++++--
 2 files changed, 48 insertions(+), 21 deletions(-)

--3HN7eCEJ5NWwlW1p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmgmnpMACgkQOJpUIZwP
JDB0Sw/8DJ664qpiMXnZkZluusH/6r40WFPYS1YflznspiTtCTb/9KKI5joY031X
Z1sD+/PM2guxvxV9KTrJmKS3wZPR0Z6iFD22ChQDDPTTOH48oMM/Gqbud5YrKvwB
fgF9aYW5jXHs03YaoxIheOBVVThJoe4RGzHjr5OEcpzrpkA9GTojz+lkJLIq5rlS
Mit7fHGWxwgC3WugxGLw2y+MIriFlO/uYwUhONTB3L+NVKuUdbvZzZ4Hgx12aGqZ
O+8ht03XGOSH4QNY4pJbNTnFoxJYmlZDjsQ19CLTfKw6JtAPFzVgTT43BIfZ1Ejf
WUtgMkwYtmZDxO5eFYTEBtZh2rC9upWhaWtz7mJk3bTk4AfGUARungjhM0AN3RRn
8WBq2uHzGilfZzGhF4xUmylLB5xtdjAAAPI9/mTMb0Id98ZIFWY5q2K8z11OQqhf
J4SsWPSIj5OZWySq9obE2QkTI5m+n4MB16IcSo06tvl4E2b64Og+ysZmGE7JBsJf
8mQ8rNNwNHvE+t1KLwezDW5eeg9khDc+tSoYxFZyIfJvm65dCFbnDuE+TbB/9QEw
4BvkSMN+o/U1vZYJd1d0cmnz6mXAsVMAW6a1qjRO9BVP5QWx7qLV5Rkj64y0eZVW
nerDz/Mt4501QibVGgGkeUlGrDyVyI0fubVZYUnjAIr5jo4dF8o=
=4I+H
-----END PGP SIGNATURE-----

--3HN7eCEJ5NWwlW1p--
