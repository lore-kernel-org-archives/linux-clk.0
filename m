Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7050D1865FA
	for <linux-clk@vger.kernel.org>; Wed,  9 Jul 2025 01:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752023735; cv=none; b=cb/aumfbryk4b8A63MFW4Mr6thHhMHQXw5gh3UK9h/02+EUALPiHGJ58W1pp4GrxHUJI0ccu2DUol7I9BPTBcVqnfvaeyvvD+BMUvGxsv+Q3W5W2lMFBVW3hYZXflaokxxPQjraVtMmghzsP9ISXHsfVgbBWy7CvPH0mek4JpGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752023735; c=relaxed/simple;
	bh=JLK441DJrNVNQDrKnZfclHoqzJ7mXRWy4zaT6CrhpkE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ubRFHOQMZHccNduVIj0qiAdPmtPEJYpC8byilbas5zQIXSZOITwiJ1y0lAo1OUCTAb7m/6KPpBDfARPb2pT8QmrrMiEoPTnu4rk3ko8G+hqGPyJme4/Vd0IFV9BPLYJzjHogmTlYOUR1ZahojWTbZsG4YvJ0Gw4wpxSkVSPter4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.48.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 639E1342044;
	Wed, 09 Jul 2025 01:15:32 +0000 (UTC)
Date: Wed, 9 Jul 2025 01:15:28 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Alex Elder <elder@riscstar.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Haylen Chu <heylenay@4d2.org>, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: [GIT PULL] clk: spacemit: add changes for v6.17
Message-ID: <20250709011528-GYA487904@gentoo>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephen,

 Here is clock changes for v6.17, please pull.

 Basically, what we've added here are two changes:

  1) Mark pll1_d8 clock as critical to prevent it from being shut down
     in the resource withdrawal path once the probe phase fails

  2) Extend K1 clock framework to support reset auxiliary devices, and
     also route the reset driver via clock tree to avoid shared tags,
     please see discussion here[1] with reset maintainer for more
     details if needed.

  Thank you!


Link: https://lore.kernel.org/r/3732050b6b756868543012c1a1cebbe7cce74d61.camel@pengutronix.de [1]

Yixun Lan

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://github.com/spacemit-com/linux tags/spacemit-clk-for-6.17-1

for you to fetch changes up to c79550f69f0f21be069385c20cd6490b862ba2a5:

  Merge tag 'spacemit-reset-for-6.17-1' of https://github.com/spacemit-com/linux (2025-07-07 22:07:15 +0800)

----------------------------------------------------------------
RISC-V SpacemiT clock changes for 6.17

- Mark clock of pll1_d8 as critical
- Add reset support for K1 SoC

----------------------------------------------------------------
Alex Elder (6):
      dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
      soc: spacemit: create a header for clock/reset registers
      clk: spacemit: set up reset auxiliary devices
      clk: spacemit: define three reset-only CCUs
      clk: spacemit: mark K1 pll1_d8 as critical
      reset: spacemit: add support for SpacemiT CCU resets

Yixun Lan (1):
      Merge tag 'spacemit-reset-for-6.17-1' of https://github.com/spacemit-com/linux

 .../bindings/soc/spacemit/spacemit,k1-syscon.yaml  |  27 +-
 drivers/clk/spacemit/Kconfig                       |   1 +
 drivers/clk/spacemit/ccu-k1.c                      | 242 ++++++++--------
 drivers/clk/spacemit/ccu_mix.h                     |  11 +-
 drivers/reset/Kconfig                              |   9 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-spacemit.c                     | 304 +++++++++++++++++++++
 include/dt-bindings/clock/spacemit,k1-syscon.h     | 141 ++++++++++
 include/soc/spacemit/k1-syscon.h                   | 160 +++++++++++
 9 files changed, 766 insertions(+), 130 deletions(-)
 create mode 100644 drivers/reset/reset-spacemit.c
 create mode 100644 include/soc/spacemit/k1-syscon.h
