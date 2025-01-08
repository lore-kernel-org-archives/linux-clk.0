Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF8015B99E;
	Wed,  8 Jan 2025 16:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736352310; cv=none; b=A5HJiX1BsS/hadbfb+h9LHU6P91Bb+6dY4sxAD3ubWMSQq+MoHdE/fh6PIWp+dof+XGqCsJRqzqY+/Azo4FHbh6N4AlGLPcC5xQ7mRi73V5KM9SjsZKsZbOH7bw2BRP19qe3DQBW2wsZ0oNHvO/BM+aJw7CIhxLCFb+t312chxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736352310; c=relaxed/simple;
	bh=gHgoMezWWEQnrS9eHnt0DTE9GO2iJI9dp44zUW0rKWI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z9v4StRUhwIBCmUH0R6GJV6D1sa6UsrdKszGOrGxdpKc1r1s9sZ4MWg2tQwYQ++zPCZOqnDNE1ABmz7+rOcg1YgE425iwUXHxspweCtudJ+TWnxFuaBhv+RMUFKAZUxwI8pvCKMGeff6mMAVOp9La6Dv0UmhLUC66Peb1LFBjYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SxtoBnsh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SxtoBnsh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 445E8C4CED3;
	Wed,  8 Jan 2025 16:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736352310;
	bh=gHgoMezWWEQnrS9eHnt0DTE9GO2iJI9dp44zUW0rKWI=;
	h=Date:From:To:Cc:Subject:From;
	b=SxtoBnshP5qY9/Lxs4i6q/ymwEDYJVDhdI/Q+Jn9RSW/YLBE4VUnsR+GgQ8MXNguj
	 2222VIaOG0veomBzrWtQIqTaZ0SIGqCW/i0rspksVvxVVzuWHVC9Q6GqfaJRIoJpWv
	 onFhrA4/1u6Ip6iUC2nFNH2Y8ksELTAhFDmJD5Ps7+UosDRBAcCEP72Pc+6acklR/y
	 B4TUhmi0ZklZSrpUq7dxB+cSfZGLtpSrMJ1Jg2IpMRGcS99Hb0Cf3tq3nQcYCX0NEm
	 BK8CFiziFunvUc15Xj8J2uywpRymoAVePA7+6t+7SJJUJTevrHKO4n1qU6lZcYeTlo
	 XwqGJGQUAAECw==
Received: by wens.tw (Postfix, from userid 1000)
	id D2B025FF91; Thu,  9 Jan 2025 00:05:07 +0800 (CST)
Date: Thu, 9 Jan 2025 00:05:07 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-clk@vger.kernel.org
Subject: [GIT PULL] Allwinner clock changes for 6.14
Message-ID: <Z36iMwdeyq6DdKOw@wens.tw>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2KlAD6IUWZSkYetC"
Content-Disposition: inline


--2KlAD6IUWZSkYetC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-clk-for-6.14

for you to fetch changes up to 383ca7bee8a93be9ff5a072936981c2710d2856b:

  clk: sunxi-ng: a64: stop force-selecting PLL-MIPI as TCON0 parent (2025-01-04 20:17:11 +0800)

----------------------------------------------------------------
Allwinner clk changes for 6.14

Instead of forcing a particular clock parent for TCON0 on the A64,
the decision is left to the device tree. Which clock parent gets
assigned depends on which display output is used. If the wrong
parent is assigned, the display doesn't work.

Patches include adding the clock parents to the DT binding (which
is shared with the DT tree), removing the now redundant macros from
the clock driver, and stop forcing a particular clock parent in the
driver.

----------------------------------------------------------------
Vasily Khoruzhick (3):
      dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and PLL_MIPI
      clk: sunxi-ng: a64: drop redundant CLK_PLL_VIDEO0_2X and CLK_PLL_MIPI
      clk: sunxi-ng: a64: stop force-selecting PLL-MIPI as TCON0 parent

 drivers/clk/sunxi-ng/ccu-sun50i-a64.c      | 13 ++++---------
 drivers/clk/sunxi-ng/ccu-sun50i-a64.h      |  2 --
 include/dt-bindings/clock/sun50i-a64-ccu.h |  2 ++
 3 files changed, 6 insertions(+), 11 deletions(-)

--2KlAD6IUWZSkYetC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmd+ojMACgkQOJpUIZwP
JDA0CBAA0JJ4mfgvB4C46a4GNtvGlk2DmLRORcwQPiowBD9FglI6RfjkwqRnlvcV
T5TFA5fm6h9Q7iUtMCO2oTm+xVYp4BxIFoJav/21BQxQAY/B+2vRqN0KUEUxOQy+
q18zG903aM+vcTJtmNcdXSga4sbmFcCkc/w09fA61apYW+U6iJfhznyQ4jz//yoe
t0L1Z0Yz9VlzRpahDkz3lNjXjQLQuX1x9soYzfBjHN7lkkTFZP6IafjaTh2FygFi
6i3BH39JX4mzKJk6NXp08/H7EKtFK9dKE4yljBUjStBr2W+P+rW3e5zVkS50sjNJ
2Liqe3PViNlFWidH1B6GBHEyK0i/dK0HSamxriafTzYFYbKrISgrVUOkYVoYPQSG
JeTGD04fmTsrluIrPLpy7oKtqBpQbUMNtMgJuTqCz1uTs+1Vn6jkG9uQd+QsppwN
BaKiP4mvZNO3P0fOOMDkk+ulx1zq2r4c2POxhF0G0b3/OYn69668WSRzoy94yqwK
Iiqui7amnbSnFvYtSl4gFX670kcw9x2ibe/BhoZlL04YYxROH8m+Qh5sBZyMSmtV
zdkg70gr7LZXdv3xRbJSNK3UeYuR+d5XySRTbxoIlJeue0/QTGJ+2e9wAYIc2w7h
TKebCyfRnIpebxf5xAfcVXS38Jrcq8CLopYk/VMCSykhWrnB9RQ=
=VzYI
-----END PGP SIGNATURE-----

--2KlAD6IUWZSkYetC--
