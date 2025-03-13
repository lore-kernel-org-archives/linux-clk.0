Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69EF268FDA;
	Thu, 13 Mar 2025 15:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741881546; cv=none; b=XQIXaZ6pUbVst5J5FyxkuebyXJ8GnU2brKFw9y/Lbdri+8GCKRS5NuzidIALbVXlpmpE/3z4b7TZlIv8g4YEI3M5khm7GyX0Kkk6KMiGBEBocmiSnZCYX40h1/U5UaLPGITeFj7HkBBZoDf3c0nQpJzgiiodwZXronYMeYehUsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741881546; c=relaxed/simple;
	bh=YdJP8+QDoYdAq2M2+D8RCJ3BFb0YTP9XgW1vPZERICE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CIbZCUqINNHmuMCRXao6W7GpfC6jJpMGmLWBjctPU5xg9qkjQsgg7+zWMZ4N+HzeB0sYUntNhyY+1clDvW+7ubhoAf57gvYClJ+j9ZTgfQmJKXa0lNCQ4dIgB4lS9aYSZTiUHzEKqViKYRr0h+rhD5javrtzgB8VP4hoptNlS3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uwwLNNyS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uwwLNNyS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16EFFC4CEDD;
	Thu, 13 Mar 2025 15:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741881546;
	bh=YdJP8+QDoYdAq2M2+D8RCJ3BFb0YTP9XgW1vPZERICE=;
	h=Date:From:To:Cc:Subject:From;
	b=uwwLNNySG0cOE7KXx8jV6AJwtHR5rJCwZhfaUXUGudTfy8QAbWbD1H4oK32oJOIHp
	 ykIzi5ExxwdzaEUg2B9rYApBopTRzwB5qsaXGeTQram6bfJVrzwMof1YmhItftH58j
	 cVY1ssQ9pPeWGHb0cFJVVqPkPKSkTE0r4rWnzimm9hO8b4KEcfJ49ykQUdWY+jZynQ
	 6ehL3FOPHguWw9b54IrySiAnisZXqOxwDEvr7brLvKPKiDUG3zf6ndu+wR+j9ah6Wd
	 rLjzEnyt1piHAI3K+z9zNV39ZLAiLX1HL2eUyRTzecleAkUivIoZykrELdqhc6jTaE
	 XRRUjWTJuMIng==
Received: by wens.tw (Postfix, from userid 1000)
	id 490985F99C; Thu, 13 Mar 2025 21:25:03 +0800 (CST)
Date: Thu, 13 Mar 2025 21:25:03 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-clk@vger.kernel.org
Subject: [GIT PULL] Allwinner clock changes for 6.15
Message-ID: <Z9Lcr8FyJLWdbp-J@wens.tw>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QOVA6zihwAqP3/dp"
Content-Disposition: inline


--QOVA6zihwAqP3/dp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi-clk-for-6.15

for you to fetch changes up to 8cea339cfb81eb3354b0f27ceb27e2bb107efa6d:

  clk: sunxi-ng: add support for the A523/T527 PRCM CCU (2025-03-12 11:58:11 +0800)

----------------------------------------------------------------
Allwinner clock changes for 6.15

- Extend H616 clock driver to cover TCON clock and reset
- Enable H616 GPU clock reparenting during rate change
- Add new clock driver for A523/T527

----------------------------------------------------------------
Andre Przywara (14):
      clk: sunxi-ng: mp: introduce dual-divider clock
      clk: sunxi-ng: mp: provide wrappers for setting feature flags
      clk: sunxi-ng: Add support for update bit
      dt-bindings: clk: sunxi-ng: document two Allwinner A523 CCUs
      clk: sunxi-ng: Add support for the A523/T527 CCU PLLs
      clk: sunxi-ng: a523: Add support for bus clocks
      clk: sunxi-ng: a523: add video mod clocks
      clk: sunxi-ng: a523: add system mod clocks
      clk: sunxi-ng: a523: add interface mod clocks
      clk: sunxi-ng: a523: add USB mod clocks
      clk: sunxi-ng: a523: remaining mod clocks
      clk: sunxi-ng: a523: add bus clock gates
      clk: sunxi-ng: a523: add reset lines
      clk: sunxi-ng: add support for the A523/T527 PRCM CCU

Chris Morgan (2):
      dt-bindings: clock: sun50i-h616-ccu: Add LCD TCON clk and reset
      clk: sunxi-ng: h616: Add clock/reset for LCD TCON

Philippe Simons (1):
      clk: sunxi-ng: h616: Reparent GPU clock during frequency changes

 .../bindings/clock/allwinner,sun55i-a523-ccu.yaml  |  103 ++
 drivers/clk/sunxi-ng/Kconfig                       |   10 +
 drivers/clk/sunxi-ng/Makefile                      |    4 +
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c             |   60 +-
 drivers/clk/sunxi-ng/ccu-sun50i-h616.h             |    2 +-
 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c           |  248 +++
 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.h           |   14 +
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c             | 1685 ++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun55i-a523.h             |   14 +
 drivers/clk/sunxi-ng/ccu_common.h                  |    5 +
 drivers/clk/sunxi-ng/ccu_div.c                     |    2 +
 drivers/clk/sunxi-ng/ccu_gate.c                    |    4 +
 drivers/clk/sunxi-ng/ccu_mp.c                      |   51 +-
 drivers/clk/sunxi-ng/ccu_mp.h                      |   58 +-
 drivers/clk/sunxi-ng/ccu_mux.c                     |    2 +
 include/dt-bindings/clock/sun50i-h616-ccu.h        |    4 +
 include/dt-bindings/clock/sun55i-a523-ccu.h        |  189 +++
 include/dt-bindings/clock/sun55i-a523-r-ccu.h      |   37 +
 include/dt-bindings/reset/sun50i-h616-ccu.h        |    2 +
 include/dt-bindings/reset/sun55i-a523-ccu.h        |   88 +
 include/dt-bindings/reset/sun55i-a523-r-ccu.h      |   25 +
 21 files changed, 2590 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.h
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun55i-a523.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun55i-a523.h
 create mode 100644 include/dt-bindings/clock/sun55i-a523-ccu.h
 create mode 100644 include/dt-bindings/clock/sun55i-a523-r-ccu.h
 create mode 100644 include/dt-bindings/reset/sun55i-a523-ccu.h
 create mode 100644 include/dt-bindings/reset/sun55i-a523-r-ccu.h

--QOVA6zihwAqP3/dp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmfS3K0ACgkQOJpUIZwP
JDCVlg/1Ed/twZroOZ4PTp8VoZqnQEijolGt+zZXwlRDCdPPVNzoJBK+PxEU7pUn
NFnMd/iBICscNSLKZTCOodgSGPiyp0McVTI25IghxUSYvFnB8Wi1ZTRKLrAFJRm6
x4uUQPFl5nmXvlv3eTsdEqQvbqsRcDqyQKI88/Be/WLMcJ/yOTW06oHK0wKDaWhJ
VhVcJnQEITwEHXGGRQJZmsCO24dAf2NiWXuZljd9JvO75+mpGyfsuKvRKXWY9wLE
rki/gzL82NuMUeu2TGzQ5I6bUowgGY1IXX9zemp6HCwlNQDDlPuVfd6Z+J2cyzMu
TwFpQin93txp6X63P8byhmXtw8t6AqsiZ8edtN+M9PhFAG5rM3ccOv32vptiblSW
G/KUSm/Jerah7SI8+uDRuEnVxYNN03cApKf8OvvNvU4gjX+xJvSSOsL2PdvX7ReZ
fJpLk7v8eoIVTHoicsttj72sX2iMiPBtA2jCLSCho/9aJlg/Xapbtqwl9FrmPDwo
WbxfMvZlFWElwc7c86ylGr50ZKuj7Q/cv6SwQEKUkXj9Ricm4fCJ/8Sna7mlhJKe
MFq/hMVpVERFn6rDFjO14DwowVvi2AzfbPdFZmivHY2Pp5U/GhB9fe7IyG1g0cyq
7mKzPlfZgbRjmlIkhulK4d+JwJ3+MFiDQDZwU6S20j5mmsSFNg==
=/9Mb
-----END PGP SIGNATURE-----

--QOVA6zihwAqP3/dp--
