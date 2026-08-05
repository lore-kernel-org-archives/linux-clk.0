Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91633F0A92
	for <linux-clk@vger.kernel.org>; Wed,  5 Aug 2026 21:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785965053; cv=none; b=YBsqVuivy3lYLeCWCAMqUhvTyEnYbK3eWLxgEGwd273UXAShiXxfBk76ON2VaXdiNR9rpxMX8SRMr8gpNpAt9cjQWMdJMseDRLgpSyRQrKniJswyT03LjO3INb+xV5rlpeZvtOH8yyfSZiCeJow14d+FnUjVxQNFjskqLpgiZKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785965053; c=relaxed/simple;
	bh=kmwapn9FEq1pKiWxczk6KI5BIxKsaMTEfXaHVWgtGtE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rp6KwFMtZlX6qZ61XsZWs4tTRseWhMqVNdKM4bmJaSpWEdFvVnNZ6lMmvwMVgoK0U+ZYWidj3/b9MWpkisXlTuaZlDf6lPgJkzbbPyiOQ8GFGl0Ren4HWYoZJVaIcqG3hBeO/Pkwy4hhdnB/wqbJNbnbp3MKcoJ+hz1Ad7IddjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=q771X4Bh; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="q771X4Bh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=69ddStXH+uawY9wnGEcyOUmFbWFTQi65z7TwXp8WFio=; b=q771X4BhW9n9gnvFTSr3yHQf/E
	1HlF9lcOySuxLA9mZaddPnnKn62YXXu/ZoDyYIOZ77tabrody75Ic5cO47hYyOz48wiB3wOcB7g9T
	b/9aZ5pUrgHfXxq2JYrL3eCLGZqZ3Gnb/1wJ8iSqwyJDfUF3I150AmjoI3XDOliRI5uxXf37asB91
	yHFmisegqfQmS5ra8Etf0ociqYvdyvjTYiuAlB8OCTCgGftsZYIBakccvz4qoA8bSJxm+LRAm/pi6
	/om5KTXUjS54yoHf2wBuHR+KgEHefvAN0UoMoWMq98onS4ARHGxn2AJM7ZYYrAVHd6PvtugqNiuhn
	9PVN2rrg==;
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock changes for 7.3 #1
Date: Wed, 05 Aug 2026 23:23:57 +0200
Message-ID: <5218537.CQOukoFCf9@diego>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi Mike, Stephen,

please find below a pull-request with Rockchip clock changes for 7.3

Please pull.

Thanks
Heiko

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.3-rockchip-clk1

for you to fetch changes up to 586ff159ec02533c17dd928641529cb0b52e9c62:

  clk: rockchip: rk3576: fix source muxes for SPI0..SPI4 (2026-08-05 22:45:22 +0200)

----------------------------------------------------------------
Clock driver for RV1106, fix for rk3576 spi source mux, better representing
fractional PLL coefficients and a fix for the dclk of the 3rd video-port to
not affect other compoents when its rate gets changed.

----------------------------------------------------------------
Alexey Charkov (3):
      clk: rockchip: Fix the fractional part denominator on RK3588/RK3576 PLLs
      clk: rockchip: Fractional PLL coefficient on RK3588/RK3576 is two's complement
      clk: rockchip: rk3576: fix source muxes for SPI0..SPI4

Heiko Stuebner (2):
      clk: rockchip: rk3588: Don't change PLL rates when setting dclk_vop2_src
      clk: rockchip: rk3588: Allow VP2 the same sourcing options as other VPs

Simon Glass (2):
      dt-bindings: clock: rockchip: Add RV1106 CRU support
      clk: rockchip: Add clock controller for the RV1106

 .../bindings/clock/rockchip,rv1106-cru.yaml        |   60 ++
 drivers/clk/rockchip/Kconfig                       |    7 +
 drivers/clk/rockchip/Makefile                      |    1 +
 drivers/clk/rockchip/clk-pll.c                     |   16 +-
 drivers/clk/rockchip/clk-rk3576.c                  |   15 +-
 drivers/clk/rockchip/clk-rk3588.c                  |    6 +-
 drivers/clk/rockchip/clk-rv1106.c                  | 1099 ++++++++++++++++++++
 drivers/clk/rockchip/clk.h                         |    8 +-
 include/dt-bindings/clock/rockchip,rv1106-cru.h    |  306 ++++++
 9 files changed, 1500 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rv1106-cru.yaml
 create mode 100644 drivers/clk/rockchip/clk-rv1106.c
 create mode 100644 include/dt-bindings/clock/rockchip,rv1106-cru.h



