Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C292319F464;
	Tue, 15 Jul 2025 16:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752598510; cv=none; b=IdW8vFe1Fqf7dLQjROs72FkcUCFjP0U7SVyRVvVASFDC8aGiUM7lnGZ3bpJYolbkoozCVA0cwq4wPLdhFUjFft98htpdqGuAqmPQ2uCx1ybhfIMEvnKDzQ6c6HuIIkYMkrOFG9cE5J16rVKhBpNkhGPR4SOnpNEB5JYMYeGBpIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752598510; c=relaxed/simple;
	bh=YBpupqx/DiqruEnwsGUgKedesGXi2T6CcG+cClChgcc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DotC+dPr36VsIg5KOmqVQfa51Mq5O3y7WnIRYA+oaZrkT6wzDM0x6/n65RdjFuZICs/oGJG3LE6pw4qK24hrBFgJtM6uBij/P5sNIQ+iemdgK4OaSIMRAd2s8bq2gTF8eKVrJlhCwA81E3BU6nE1nrYTCaNhmbnxUrq86GnsMAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ou2iU8v4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ou2iU8v4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EC3EC4CEF4;
	Tue, 15 Jul 2025 16:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752598509;
	bh=YBpupqx/DiqruEnwsGUgKedesGXi2T6CcG+cClChgcc=;
	h=Date:From:To:Cc:Subject:From;
	b=Ou2iU8v4de+o9jrtV7YqgqdvPxvpmiEdxE2uivxQB2EPCmxp9oiNylMYNiM2e7ayT
	 v14zTMMDVgL00M8mpDjOdDsrviNxBlVXfqyLSu2bvSd6Lm7WhzmSP9q67fOz58UT5X
	 6cPM46Civ4XiF5TvoPtKiW48NGdyfHGMByxneId9/wbV2Fd+MOetDy3zQWDpymKdwT
	 +AfjxsNcez6LtSoubWjOxUrZQ13f6zh6kFb/aw1ty4OPka0T1SEMidilWmKsh7AyKj
	 M4t6sIpnMp0p9I8d5FId7WCV8MhPazzlVrWEHCp/FSbYhJHtu6KbdZwS+k+KOV6xqR
	 3rqMTWU/mpxCA==
Received: by wens.tw (Postfix, from userid 1000)
	id E00D95FEDE; Wed, 16 Jul 2025 00:55:06 +0800 (CST)
Date: Wed, 16 Jul 2025 00:55:06 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-clk@vger.kernel.org
Subject: [GIT PULL] Allwinner clock fixes for 6.16
Message-ID: <aHaH6omQWoTUxfuV@wens.tw>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kWxp3Wid3rMs2BRb"
Content-Disposition: inline


--kWxp3Wid3rMs2BRb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-clk-fixes-for-6.16

for you to fetch changes up to 01fdcbc7e5a56c9cba521e0f237cb5c3fd162432:

  clk: sunxi-ng: v3s: Fix TCON clock parents (2025-07-03 23:31:05 +0800)

----------------------------------------------------------------
Allwinner clock fixes for 6.16

- Mark A523 MBUS clock as critical
- Fix names of CSI related clocks on V3s
  This includes changes to the driver, DT bindings and DT files.
- Fix parents of TCON clock on V3s

----------------------------------------------------------------
Chen-Yu Tsai (1):
      clk: sunxi-ng: a523: Mark MBUS clock as critical

Paul Kocialkowski (3):
      clk: sunxi-ng: v3s: Fix CSI SCLK clock name
      clk: sunxi-ng: v3s: Fix CSI1 MCLK clock name
      clk: sunxi-ng: v3s: Fix TCON clock parents

 .../devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml |  2 +-
 .../devicetree/bindings/media/allwinner,sun6i-a31-isp.yaml |  2 +-
 .../bindings/media/allwinner,sun6i-a31-mipi-csi2.yaml      |  2 +-
 arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi                 |  2 +-
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c                     |  3 ++-
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c                       | 14 +++++++-------
 include/dt-bindings/clock/sun8i-v3s-ccu.h                  |  2 +-
 7 files changed, 14 insertions(+), 13 deletions(-)

--kWxp3Wid3rMs2BRb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmh2h+oACgkQOJpUIZwP
JDCfghAAmzIMedXgyrAF0wUdsN4ZEpJiplCb3WrfIygCym1miiyCtthBYMkLJfTv
BKxM/NavkNmyV25pzGKY3z4w9Bvcd+R4Gb10Xh9v/KqgGLNoC5eBtD3UFRYt8d2G
DeN2vyha0pyt+JFqpmu09NM/R7MK7Qt76r3jhXw/dlik5Z5NlZPp2oTAQ42wIYJJ
b6NOsFFZwyVj9+ZUnxLJs6OhKFZDhGpIU5u1G1cyKfAcL98Xhef5QUW0r4R1pBsv
lOMCKgxlfuFfmz2MIlx3Ck9e3h8jKZRvHE4opxqs40oWtBK77rIJ30FsxmA+duah
gGzaOA+NDf0G2PtOUHaQa6QKG0M2rJ1VbtODtcZ9xaYh89d0KdjKFrt7U3d4QzOc
1ANmhwiBRnvIrM+slBwN9XKlYUhJZTHCFVFffQa2I5Z/jiJuKagQ7+J5JRAjK+AU
8/4B8piqNL+s18gkUCNBAvLP1jIM6iF7UH3RgeaRLoNnaGgQp19uNe0OSUNjEpJn
x2UeAUAB8uYVqRrWIeWNyLN5jszozmdI4EB5NcXNN2NkKqoSdCjzyAEpTuBvRzub
nP/QDq4jKhzHkaNFCocMdrH/NAax6aWl6aiacDQ6sfigW5qgzZ6M1ll9rm5OIpRx
+9MsPETZRt9DHffJZo7X63I0Oqe/KBwm2npiD39ieifDA14jOWw=
=A587
-----END PGP SIGNATURE-----

--kWxp3Wid3rMs2BRb--
