Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F7C202F6C;
	Wed,  6 Nov 2024 16:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730910330; cv=none; b=NDOYtOo99Ocj3MWkc+YnQx0SMs7ujFxiBXT6Iyl9uKtI0neSSPg/cyiqdJcYK+4oxlWq52+UFLcg2I1joWYdOyFa8jiOfw9ipEl7sUjL48GKhhsDIxr4UXn3vP6aY+yht5hzFBXzCdxeZ4cZLxncH2zh6UzqJPciqcVxtIiP6jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730910330; c=relaxed/simple;
	bh=l7lI9uf8YtLy8s8JVEpDW1Pvr02x/Yi6IFy9QOC60b0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B2uLEJcVkyMmSmbOpZHEKI46dgL2+k1PD/YM6INEVB5VYe6eOUMO1IzT8EghE0XLVvI7qG9kFAiSQs34qg2ruAX9OrFMN5AcUydNn7juq/ZsX1qIkq/Uuu/Y7yWwRdb2E6iPicYNKzWLk3LIMBBgaMtswteX4ZQWO1m4HQzJTbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GzvwjgR7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GzvwjgR7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E6B0C4CEC6;
	Wed,  6 Nov 2024 16:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730910330;
	bh=l7lI9uf8YtLy8s8JVEpDW1Pvr02x/Yi6IFy9QOC60b0=;
	h=Date:From:To:Cc:Subject:From;
	b=GzvwjgR7LLP3+VmH/1iSxImKaqcJy/MmB8iLj1zrbbScaXtOt58J/2lp0JDGTCSpE
	 LqThJ0J0UmgNfDZIG0uQybjWkIkrWHieZe58KYPDpVOXHjRs0Li4F3MRxhR6/nXkkI
	 3MJnEJ4Uuc0OXgUBu1pk8gxTZdWHMq8tNm95Bn/L4u3PbwgLvkz82u9x18IjetQvF8
	 ABSjYsbB/01KQE29kJtaLsE/Q82tJThjpiDNJ2FdG5312FC9S896WIvKDQLVLDSAjB
	 t3atv+jxTeh65l5Bvg+bwuUOwjZyIxqrDlrlBRzKzHnuDnUkxUPQx+Denpbz9x4siJ
	 R3EDKt/YlFWRA==
Received: by wens.tw (Postfix, from userid 1000)
	id 95C0B5F836; Thu,  7 Nov 2024 00:25:27 +0800 (CST)
Date: Thu, 7 Nov 2024 00:25:27 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-clk@vger.kernel.org
Subject: [GIT PULL] Allwinner clock changes for 6.13
Message-ID: <ZyuYd50i-oPSDXZ4@wens.tw>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HysiOhwiQ3DGnZwG"
Content-Disposition: inline


--HysiOhwiQ3DGnZwG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-clk-for-6.13

for you to fetch changes up to 1054861bc258fb5798b7132453593cc3eb0639ba:

  clk: sunxi-ng: Use of_property_present() for non-boolean properties (2024-11-05 23:40:49 +0800)

----------------------------------------------------------------
Allwinner clock changes for 6.13

- Added sigma-delta modulation settings for audio PLL on the H616 SoC,
  crucial for accurate audio reproduction
- Constified |struct ccu_reset_map| throughout the sunxi-ng clk drivers
- Fixed the audio PLL divider preset on the D1 SoC
- Switched to of_property_present() for checking DT property presence

----------------------------------------------------------------
Andre Przywara (1):
      clk: sunxi-ng: d1: Fix PLL_AUDIO0 preset

Christophe JAILLET (1):
      clk: sunxi-ng: Constify struct ccu_reset_map

Rob Herring (Arm) (1):
      clk: sunxi-ng: Use of_property_present() for non-boolean properties

Ryan Walklin (1):
      clk: sunxi-ng: h616: Add sigma-delta modulation settings for audio PLL

 drivers/clk/sunxi-ng/ccu-sun20i-d1-r.c   |  2 +-
 drivers/clk/sunxi-ng/ccu-sun20i-d1.c     |  4 +--
 drivers/clk/sunxi-ng/ccu-sun4i-a10.c     |  2 +-
 drivers/clk/sunxi-ng/ccu-sun50i-a100-r.c |  2 +-
 drivers/clk/sunxi-ng/ccu-sun50i-a100.c   |  2 +-
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c    |  2 +-
 drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c   |  4 +--
 drivers/clk/sunxi-ng/ccu-sun50i-h6.c     |  2 +-
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c   | 46 +++++++++++++++++++++-----------
 drivers/clk/sunxi-ng/ccu-sun5i.c         |  2 +-
 drivers/clk/sunxi-ng/ccu-sun6i-a31.c     |  2 +-
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c     |  2 +-
 drivers/clk/sunxi-ng/ccu-sun8i-a23.c     |  2 +-
 drivers/clk/sunxi-ng/ccu-sun8i-a33.c     |  2 +-
 drivers/clk/sunxi-ng/ccu-sun8i-a83t.c    |  2 +-
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c     |  8 +++---
 drivers/clk/sunxi-ng/ccu-sun8i-h3.c      |  4 +--
 drivers/clk/sunxi-ng/ccu-sun8i-r.c       |  6 ++---
 drivers/clk/sunxi-ng/ccu-sun8i-r40.c     |  2 +-
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c     |  4 +--
 drivers/clk/sunxi-ng/ccu-sun9i-a80-de.c  |  2 +-
 drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c |  2 +-
 drivers/clk/sunxi-ng/ccu-sun9i-a80.c     |  2 +-
 drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c |  2 +-
 drivers/clk/sunxi-ng/ccu_common.h        |  2 +-
 drivers/clk/sunxi-ng/ccu_reset.h         |  2 +-
 26 files changed, 64 insertions(+), 50 deletions(-)

--HysiOhwiQ3DGnZwG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmcrmHUACgkQOJpUIZwP
JDAjERAA6cgwmJ7lSce7cybeGxt9SNITp6x0jv2NfP2J2VkG1kUmtSBh9Go2O1PI
ZidM1DxNvTeiWKulje08/PGI9j4sZ6OJIQiloU6Wn0Kk+e0opWrnDDwOwP3ydXCs
wZVRSCxRbYNUzlkhKssasCbDHW2Dr+Tksmmf7wennK3rYBR9C38HE1kNBonLT2EG
Q5AI8/KUmFUcSFOBB6JeD8XXbruw2Bvx2YzB2S6cGLwOxkaPcotgD570JzV1tEKE
YvvGJgn7lNsYzojPguiQpExVm8YptVAanQfuYqhgrr8ozDV05wBBMYxsUq8OclHS
B5IN0b3NgBEBhQr1cKRtBbcnJYntBTlMtOT+aWtTp965RauK6iJEauBBDwuatGDz
5/+kY9LrbRiw7S4piTJc+ISdIYZuxfzvvzx3hA3JP6UsM+k8r0T/RlQHY8yGod8A
iDqdPp8aeHgI+4TvpOAYg93otlUtqmScEQfUzbVH3f0L2xsJ3kutDA5O+vCsgTNB
SNvJdJ6oRSbeb4RTrlz6XM2CPQPoAJJqgM4DhyBbV9r+muOXv68Jr06aUV/P9Gek
h4V+P9qt7uEOdAEuuVcUcswH9T6a0dXGIFwYtFH5b5Yf0DEHZcuxxuYRxHM6D5gx
sUNkuHGWaUdFQUlA/wudMCoVcFD/wK5CbA1zoQ3YDk9T9wy6UHQ=
=phcN
-----END PGP SIGNATURE-----

--HysiOhwiQ3DGnZwG--
