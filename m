Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E378137750
	for <linux-clk@vger.kernel.org>; Thu,  4 Jul 2024 19:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720120687; cv=none; b=GV8/UmfiZZvbdPka+8isTE8uOdP6Cl8oDD1ZpKPy/85slOVm2UyFtEX9PxAVw1H/hWIxqy+aNrQL2UzkpvM8AZ7MOdfKjnePGFOX0FapT1rOuI4pUXYlCGa8L+1SPf58DEpICTb3Xxvwx5IeAJEHnQ6rhHp3aEvGYGX+9ral8KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720120687; c=relaxed/simple;
	bh=ysOnm9Z6PAwjEtUNHDlwkKavgX7uzfbKMWBDQGQFxLU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tgSfi3PLh+IoP8obUTVe4en8PCZyAzR4qJtJbXNuu/HH/s/dz4d4P7bXMbDm0JgWz5x/EFhHpSn2o//LjqWtPiYRMiqtIfnM8VLcLHtkrv37ORQDfXYGt4xbc+pD6dZCKo8S1pq9FVg4YEHWHhLG0Y6XUl3glgV2MOWNeBK1O9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875ac2.versanet.de ([83.135.90.194] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sPRxv-00062i-LP; Thu, 04 Jul 2024 21:17:59 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock changes for 6.11 #1
Date: Thu, 04 Jul 2024 21:17:58 +0200
Message-ID: <8961259.VV5PYv0bhD@diego>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Mike, Stephen,

please find below a pull-request with some Rockchip clock changes for 6.11

Nothing really stands out, it's just some small changes.

Please pull.

Thanks
Heiko


The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.11-rockchip-clk1

for you to fetch changes up to d89e8096957e35742c9922d3f6628f24de0d6163:

  dt-bindings: clock: rk3188-cru-common: remove CLK_NR_CLKS (2024-07-04 19:48:31 +0200)

----------------------------------------------------------------
More exported clocks for rk3128 peripherals, conversion to kmemduo_array
for clock controllers and both rk3128 and rk3188 drop the CLK_NR_CLKS
from their dt-binding header, where it does not belong.

----------------------------------------------------------------
Alex Bee (7):
      dt-bindings: clock: rk3128: Add PCLK_MIPIPHY
      clk: rockchip: rk3128: Export PCLK_MIPIPHY
      clk: rockchip: rk3128: Add hclk_vio_h2p to critical clocks
      clk: rockchip: rk3128: Drop CLK_NR_CLKS usage
      dt-bindings: clock: rk3128: Drop CLK_NR_CLKS
      dt-bindings: clock: rk3128: Add HCLK_SFC
      clk: rockchip: rk3128: Add HCLK_SFC

Andy Shevchenko (1):
      clk: rockchip: Switch to use kmemdup_array()

Heiko Stuebner (1):
      Merge branch 'v6.11-shared/clkids' into v6.11-clk/next

Johan Jonker (2):
      clk: rockchip: rk3188: Drop CLK_NR_CLKS usage
      dt-bindings: clock: rk3188-cru-common: remove CLK_NR_CLKS

 drivers/clk/rockchip/clk-cpu.c                |  5 ++---
 drivers/clk/rockchip/clk-pll.c                |  8 ++++----
 drivers/clk/rockchip/clk-rk3128.c             | 24 +++++++++++++++++++-----
 drivers/clk/rockchip/clk-rk3188.c             | 18 ++++++++++++++----
 include/dt-bindings/clock/rk3128-cru.h        |  4 ++--
 include/dt-bindings/clock/rk3188-cru-common.h |  2 --
 6 files changed, 41 insertions(+), 20 deletions(-)



