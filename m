Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD861C01
	for <linux-clk@vger.kernel.org>; Sun,  8 Sep 2024 21:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725832186; cv=none; b=jo6+7YiG2RxU/43kfjpGJmKHbC6d2IqzVolSDWRvxBiXQiKTOqIrI5SZLyNAotRIhldRGQMHjSHj1pLprntBgAobk1XXYjjvqNGmsfsvKdLZ4RHtR8RdtcMdsd7HAR0FA6FaXrWAre1aGShBUDi8CHLXXIwZ7RtGNnu+IuqD/HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725832186; c=relaxed/simple;
	bh=1y0l20v6uSXWBIavuJ8p8SB0cltoYpM4KPGZF3u9yfI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Cb7Mqz3V0DiXg9W92RV2pINkcqPRI6jl2kBhTfIRASKnXbtAaz5IMi+FGoCPs8zAZxcMiY6j4Cxt1a7XcCMCY1Xc6eOBknKrxpJ/yBzwGgKDYviMnJm+K+vuelNYjYgdQpDRL6y5iWL+RQhw4GFScQTafKmK8X3VQvZsNVPsjmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=f/NJvp6l; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="f/NJvp6l"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=O+1lGf+egLrWXX0JMaceIaPCe6zCuqwFkQ/tynXfCvo=; b=f/NJvp6lU6SW7rzkFmZMXUCApn
	OHUZV3Umn2Jfq5Ek+MVIFX/XtAXcW/60v88c2ZyqNBgthqjPMeayfSChMj90tNA5DsEeNMab0JLRG
	/XC8IuZOqUto/EQWLfna1c2/4mx1uB81r1P3Tcd3ouqdj4gqtL9mWQwOgH3q46yreSEE6b0L4la4W
	XO3csrSLLwZfQH8C3q9cp70N74NPswzi1bUdJGhdoDK+LeDYb5OW5O+OnXR0ehbX8xRZ+SFwfSoh4
	XYBR4x9/qG1F8G/zk+/93tJ+JT91uqA7B0G1o7qQuqnS9xWZQiyWbS4ZessKLY0Y6EpcGStD3kYIh
	8HJRPu2w==;
Received: from i5e8616cc.versanet.de ([94.134.22.204] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1snPmv-0004Go-VE; Sun, 08 Sep 2024 23:49:42 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock changes for 6.12 #1
Date: Sun, 08 Sep 2024 23:51:56 +0200
Message-ID: <2436757.DCRlREXTYf@diego>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Mike, Stephen,

please find below a pull-request with some Rockchip clock changes for 6.12

Please pull.

Thanks
Heiko


The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.12-rockchip-clk1

for you to fetch changes up to 12fd64babaca4dc09d072f63eda76ba44119816a:

  clk: rockchip: fix error for unknown clocks (2024-08-30 16:59:24 +0200)

----------------------------------------------------------------
Getting rid of the rest of CLK_NR_CLKS defines that reported the
the max number of clocks, but should never have been part of the
devicetree binding header.
New clock controller driver for the rk3576.
And some fixes for rk3228 and rk3588.

----------------------------------------------------------------
Alexander Shiyan (1):
      clk: rockchip: rk3588: Fix 32k clock name for pmu_24m_32k_100m_src_p

Detlev Casanova (1):
      dt-bindings: clock, reset: Add support for rk3576

Elaine Zhang (2):
      clk: rockchip: Add new pll type pll_rk3588_ddr
      clk: rockchip: Add clock controller for the RK3576

Johan Jonker (9):
      clk: rockchip: px30: Drop CLK_NR_CLKS CLKPMU_NR_CLKS usage
      clk: rockchip: rk3036: Drop CLK_NR_CLKS usage
      clk: rockchip: rk3228: Drop CLK_NR_CLKS usage
      clk: rockchip: rk3288: Drop CLK_NR_CLKS usage
      clk: rockchip: rk3308: Drop CLK_NR_CLKS usage
      clk: rockchip: rk3328: Drop CLK_NR_CLKS usage
      clk: rockchip: rk3368: Drop CLK_NR_CLKS usage
      clk: rockchip: rk3399: Drop CLK_NR_CLKS CLKPMU_NR_CLKS usage
      dt-bindings: clock: rockchip: remove CLK_NR_CLKS and CLKPMU_NR_CLKS

Jonas Karlman (1):
      clk: rockchip: Set parent rate for DCLK_VOP clock on RK3228

Krzysztof Kozlowski (1):
      dt-bindings: clock: rockchip,rk3588-cru: drop unneeded assigned-clocks

Sebastian Reichel (2):
      clk: rockchip: rk3588: drop unused code
      clk: rockchip: fix error for unknown clocks

 .../bindings/clock/rockchip,rk3576-cru.yaml        |   56 +
 .../bindings/clock/rockchip,rk3588-cru.yaml        |    4 -
 drivers/clk/rockchip/Kconfig                       |    7 +
 drivers/clk/rockchip/Makefile                      |    1 +
 drivers/clk/rockchip/clk-pll.c                     |    6 +-
 drivers/clk/rockchip/clk-px30.c                    |   10 +-
 drivers/clk/rockchip/clk-rk3036.c                  |    5 +-
 drivers/clk/rockchip/clk-rk3228.c                  |    7 +-
 drivers/clk/rockchip/clk-rk3288.c                  |    5 +-
 drivers/clk/rockchip/clk-rk3308.c                  |    5 +-
 drivers/clk/rockchip/clk-rk3328.c                  |    5 +-
 drivers/clk/rockchip/clk-rk3368.c                  |    5 +-
 drivers/clk/rockchip/clk-rk3399.c                  |   10 +-
 drivers/clk/rockchip/clk-rk3576.c                  | 1820 ++++++++++++++++++++
 drivers/clk/rockchip/clk-rk3588.c                  |   42 +-
 drivers/clk/rockchip/clk.c                         |    3 +-
 drivers/clk/rockchip/clk.h                         |   54 +
 drivers/clk/rockchip/rst-rk3576.c                  |  651 +++++++
 include/dt-bindings/clock/px30-cru.h               |    4 -
 include/dt-bindings/clock/rk3036-cru.h             |    2 -
 include/dt-bindings/clock/rk3228-cru.h             |    2 -
 include/dt-bindings/clock/rk3288-cru.h             |    2 -
 include/dt-bindings/clock/rk3308-cru.h             |    2 -
 include/dt-bindings/clock/rk3328-cru.h             |    2 -
 include/dt-bindings/clock/rk3368-cru.h             |    2 -
 include/dt-bindings/clock/rk3399-cru.h             |    4 -
 include/dt-bindings/clock/rockchip,rk3576-cru.h    |  592 +++++++
 include/dt-bindings/reset/rockchip,rk3576-cru.h    |  564 ++++++
 28 files changed, 3794 insertions(+), 78 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3576-cru.yaml
 create mode 100644 drivers/clk/rockchip/clk-rk3576.c
 create mode 100644 drivers/clk/rockchip/rst-rk3576.c
 create mode 100644 include/dt-bindings/clock/rockchip,rk3576-cru.h
 create mode 100644 include/dt-bindings/reset/rockchip,rk3576-cru.h



