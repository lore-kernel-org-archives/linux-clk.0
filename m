Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB283D523B
	for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 13:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774878127; cv=none; b=h5+F1SmtE1KHhJEelpKVcQ5+RlREhbFpe+15tMDBHNbLjENyHHZNGBUImOS2yWEX2pY+gBNWZ7cO5EdiHSzH4oRzh6fwDszX4SxfvBzXHfjofdAZG3oNGVVPjlWfWmQJErneTAPUzAIxi7J/26DMqx6kCh2HQbwyHnfKBCJv0j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774878127; c=relaxed/simple;
	bh=UW22q86JoOQwd1oXgzuWgAY6pyjjvMXdBK7JyklhVF8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Qt2o1INn1sw8F355CuVTt+UiA9KyAX0cpT42IKnvG3CCwfbdLsJlR4RXS/Mt9x0y84/VEDiddS+nohTyolcbqrOcX3Lu0s6dQPNQcuOVhxUTrRcx603v0RZKGBkKvolp7Yag14uOLQwVHXDgi2sA+FoLefm0orLksnW64CXhz44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=OeAHswtY; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="OeAHswtY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=yK76Q+G4cMjhrvebg2OGZ4pK6jgJ3OiAWlzfTPAmIpA=; b=OeAHswtYEbfo+YcnsnweDZ6w8F
	dQQ3a52ADziTFqa4keV6CR1P9XJAPfqu2gwrI5ENSApcD8+diHQE1vIcFtMR9MWhFO+mJwjn40dQq
	ViUBE6FdgqAl88LmaSiTp/1yr0heNIBJSFJTB+Jbu8Bi02/u5IQRD0+YA2gqP8CmWWyteTQwoasnZ
	u43/Y6oZMMoqpA6vXtnawl3p8KteD3nmJ1CovROgZTkX8dUh3o0XL+wAc9CkGQiKgMi1SaSYXCU7s
	ldnBNS0Lc4nHd1ldKv24Lz14/2Oli7g/a2c83rTayZV4tVJ/e4phs772hNith0Z6nYIHlA+Suwc1Z
	lB/zTLaw==;
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock changes for 7.1 #1
Date: Mon, 30 Mar 2026 15:42:00 +0200
Message-ID: <3746710.R56niFO833@phil>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi Mike, Stephen,

please find below a pull-request with a Rockchip clock change for 7.1
One new clock driver and sone newly accessible existing clocks.

Please pull.

Thanks
Heiko


The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.1-rockchip-clk1

for you to fetch changes up to 41b1a6760959017c4fa1dbc7c3cc318406ab1455:

  clk: rockchip: rk3568: Add PCIe pipe clock gates (2026-03-10 09:34:27 +0100)

----------------------------------------------------------------
New clock driver for the RV1103B. For whatever reason that SoC only got
a B addition to the name, but major changes internally - likely it is
pin compatible with the non-b-variant. Other change is actually
exporting PCIe pipe-clocks that were already in the binding.

----------------------------------------------------------------
Fabio Estevam (2):
      dt-bindings: clock: rockchip: Add RV1103B CRU support
      clk: rockchip: Add clock controller for the RV1103B

Shawn Lin (1):
      clk: rockchip: rk3568: Add PCIe pipe clock gates

 .../bindings/clock/rockchip,rv1126b-cru.yaml       |   1 +
 drivers/clk/rockchip/Kconfig                       |   7 +
 drivers/clk/rockchip/Makefile                      |   1 +
 drivers/clk/rockchip/clk-rk3568.c                  |   6 +
 drivers/clk/rockchip/clk-rv1103b.c                 | 658 +++++++++++++++++++++
 drivers/clk/rockchip/clk.h                         |  49 ++
 include/dt-bindings/clock/rockchip,rv1103b-cru.h   | 220 +++++++
 7 files changed, 942 insertions(+)
 create mode 100644 drivers/clk/rockchip/clk-rv1103b.c
 create mode 100644 include/dt-bindings/clock/rockchip,rv1103b-cru.h



