Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8114C1E8330
	for <linux-clk@vger.kernel.org>; Sat,  8 Mar 2025 18:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741458224; cv=none; b=HkcHjhPYPuAbFOQQVcB/k+x4aBSsancP9cTxIT0rdoky6GS/nAqLMyHsPGDyTf2uoPSs6Tq6YF9VUslpe2KMCXUaWN8Geh4C0gdJVOa5OF/DOhAheObxPqq493+/cLjh/rvsb1q6qm2YmyureWoq2YJ4KBu7+arViRLr2toMzw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741458224; c=relaxed/simple;
	bh=H/WKQgJ+kLaa4/CiEitO1yjO3/yyYGED6nGd8vrULt8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=M9DP9wGI/kb8opFDEMqptKLlG7Uy/JE6THByenofly88TvvTNB8JrkYjkNgJLv3eK+0Nwq3RQt5Z7gPvPbofElC13ckgKc1+7pvQE4Sgif1Rqe2yDjdMJs7y2Fvmh+mZj2rL6Omr3O9/FtjIORVY94pssbKyLo1z0ngeWlLiE0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=JcTwmEei; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="JcTwmEei"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bffqJxsHgD5Q6ObgguFkSFEjGlZd2Z4fAZkvTm3FWsw=; b=JcTwmEeihsHITc3llMZlrp5Jza
	YbRf3kt/SokDrCwKIb9xd5kItQoNIXkZxgLTm2KhgCb4Ny2RBTQ9up/20EDSt085g82E6jWPm5fKx
	fxZ4mohL9BILibzV2d+Z7Ghpubd194qTGeHQSffGveBWkqODjIHXcvCFy4wyedd3ou4TmdwKFlONS
	yknP+j6oHnvUVhWUUSus7xa5r+f18A8sZFiMlXiAf3g6B9rXWpc+GlO8ghwckDLtqtMuwtSoC6wMg
	X7/WLrSUoy0rmLpy8rtupn4nPrUevscj7R/FhrCi0d8+uQ1CJPKuyer1zO9h35a7QfwNrxZx5rYBV
	TgnUKqLg==;
Received: from [194.95.143.137] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tqypn-00051v-R8; Sat, 08 Mar 2025 19:23:39 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock changes for 6.15 #1
Date: Sat, 08 Mar 2025 19:23:39 +0100
Message-ID: <8574162.T7Z3S40VBb@phil>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi Mike, Stephen,

please find below a pull-request with Rockchip clock change for 6.15
The new year started with a flurry of activity it seems :-) .


Please pull.

Thanks
Heiko


The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.15-rockchip-clk1

for you to fetch changes up to f863d4cc79a7e2f8c734d1fac84dc275805f41c7:

  clk: rockchip: Add clock controller for the RK3562 (2025-03-02 17:51:51 +0100)

----------------------------------------------------------------
New clock controllers for rk3528 and rk3562 as well as a parent-fix one
additional clock and two newly exported camera clocks on the old rk3188.

----------------------------------------------------------------
Finley Xiao (1):
      clk: rockchip: Add clock controller for the RK3562

Heiko Stuebner (2):
      Merge branch 'v6.15-shared/clkids' into v6.15-clk/next
      Merge branch 'v6.15-shared/clkids' into v6.15-clk/next

Jonas Karlman (1):
      clk: rockchip: rk3528: Add reset lookup table

Kever Yang (1):
      dt-bindings: clock: Add RK3562 cru

Michael Riesch (1):
      clk: rockchip: rk3568: mark hclk_vi as critical

Peter Geis (1):
      clk: rockchip: rk3328: fix wrong clk_ref_usb3otg parent

Val Packett (2):
      dt-bindings: clock: rk3188-common: add PCLK_CIF0/PCLK_CIF1
      clk: rockchip: rk3188: use PCLK_CIF0/1 clock IDs on RK3066

Yao Zi (3):
      dt-bindings: clock: Document clock and reset unit of RK3528
      clk: rockchip: Add PLL flag ROCKCHIP_PLL_FIXED_MODE
      clk: rockchip: Add clock controller driver for RK3528 SoC

 .../bindings/clock/rockchip,rk3528-cru.yaml        |   64 ++
 .../bindings/clock/rockchip,rk3562-cru.yaml        |   55 +
 drivers/clk/rockchip/Kconfig                       |   14 +
 drivers/clk/rockchip/Makefile                      |    2 +
 drivers/clk/rockchip/clk-pll.c                     |   10 +-
 drivers/clk/rockchip/clk-rk3188.c                  |    4 +-
 drivers/clk/rockchip/clk-rk3328.c                  |    2 +-
 drivers/clk/rockchip/clk-rk3528.c                  | 1116 ++++++++++++++++++++
 drivers/clk/rockchip/clk-rk3562.c                  | 1101 +++++++++++++++++++
 drivers/clk/rockchip/clk-rk3568.c                  |    1 +
 drivers/clk/rockchip/clk.h                         |   63 ++
 drivers/clk/rockchip/rst-rk3528.c                  |  306 ++++++
 drivers/clk/rockchip/rst-rk3562.c                  |  429 ++++++++
 include/dt-bindings/clock/rk3188-cru-common.h      |    2 +
 include/dt-bindings/clock/rockchip,rk3528-cru.h    |  453 ++++++++
 include/dt-bindings/clock/rockchip,rk3562-cru.h    |  379 +++++++
 include/dt-bindings/reset/rockchip,rk3528-cru.h    |  241 +++++
 include/dt-bindings/reset/rockchip,rk3562-cru.h    |  358 +++++++
 18 files changed, 4593 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3528-cru.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3562-cru.yaml
 create mode 100644 drivers/clk/rockchip/clk-rk3528.c
 create mode 100644 drivers/clk/rockchip/clk-rk3562.c
 create mode 100644 drivers/clk/rockchip/rst-rk3528.c
 create mode 100644 drivers/clk/rockchip/rst-rk3562.c
 create mode 100644 include/dt-bindings/clock/rockchip,rk3528-cru.h
 create mode 100644 include/dt-bindings/clock/rockchip,rk3562-cru.h
 create mode 100644 include/dt-bindings/reset/rockchip,rk3528-cru.h
 create mode 100644 include/dt-bindings/reset/rockchip,rk3562-cru.h



