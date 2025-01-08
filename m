Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF641E0DDC;
	Wed,  8 Jan 2025 11:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736337349; cv=none; b=R5cwiWPBtpFbfQsTPywRJ1mBysmND1v0n0EQr6QYV3Kt7U8g2D4WHNer88ZrwELZY9YnKOCBhdXwgEb1cBetAm+za3kJKWmgvZGS14Px5TliTyXOun25q+xbIIAPGrShusPbst3+Mphz1zRNvFl9a+54gPcE4VuAzrJbtZdCnwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736337349; c=relaxed/simple;
	bh=d8i3e95o3rWAn73rKvyELQujij+rsxIOx8XWtH3VseA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YiY6bq6IKLi30JQuAJWPg1Sz6If7TGXKs9yqHN/SnhrHFOpUcwrCxc9K72D0/aPw0Kar697J4LsUBmRnm70trSWsrUvzA7/6E10L2Gg2wsH00d8K5Xtt3UT2d28FxhnItrOsW3voEf2GJDeZmTy9NlrGHLP0HysiHiMgIOqo4WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=TznitHww; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="TznitHww"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 17E3325BA2;
	Wed,  8 Jan 2025 12:46:57 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 62j2bRBfL7xo; Wed,  8 Jan 2025 12:46:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1736336810; bh=d8i3e95o3rWAn73rKvyELQujij+rsxIOx8XWtH3VseA=;
	h=From:To:Cc:Subject:Date;
	b=TznitHwwVV+ARyAEY8k4gEocPC/w5PG9WCk6+gvqlcmtb0SmbADj4bdPaiggilc1o
	 mR2DjlwJ1fJq9M4TsnRTMTjSCXWl8IlL4V5lbwuMrkVzIb5lmRPgNW9SeVkp9XreDz
	 nqkNSj6cbwuoTb32flBVk2mz9yJB5sGDdGO3GGI1N7leEFdkNi0bodmcRvjzSvfRqo
	 XlxR5saFyx0h+dX0U2LCQJuHGkk4FBmnajM8WcVoffxnyEDwCgMbB+Mq9+gL8uXw+/
	 PRKJWkNV994o+clr4DUgDoXiRBIEDKfEDNALCWPkIQvOSTawFDt/x1zWEx8m7Z2oWr
	 OoSQa0NTftC2g==
From: Yao Zi <ziyao@disroot.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH v2 0/5] Support clock and reset unit of Rockchip RK3528
Date: Wed,  8 Jan 2025 11:46:01 +0000
Message-ID: <20250108114605.1960-2-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Similar to previous Rockchip SoCs, reset controller on RK3528 shares
MMIO region with clock controller, combined as CRU. They're represented
as a single node in dt.

For the reset controller, only bindings are included in this series
because it's hard to test the reset controller without support for some
peripherals (e.g. pinctrl). I'd like to first make dt and basic
peripherals available, then submit the driver.

This is tested on Radxa E20C board. With some out-of-tree drivers, I've
successfully brouhgt up UART, pinctrl/gpio and I2C. A clock dump could
be obtained from [1].

[1]: https://gist.github.com/ziyao233/032961d1eebeecb9a41fea2d690e8351

Yao Zi (5):
  dt-bindings: clock: Document clock and reset unit of RK3528
  clk: rockchip: Add PLL flag ROCKCHIP_PLL_FIXED_MODE
  clk: rockchip: Add clock controller driver for RK3528 SoC
  arm64: dts: rockchip: Add clock generators for RK3528 SoC
  arm64: dts: rockchip: Add UART clocks for RK3528 SoC

 .../bindings/clock/rockchip,rk3528-cru.yaml   |   67 +
 arch/arm64/boot/dts/rockchip/rk3528.dtsi      |   68 +-
 drivers/clk/rockchip/Kconfig                  |    7 +
 drivers/clk/rockchip/Makefile                 |    1 +
 drivers/clk/rockchip/clk-pll.c                |   10 +-
 drivers/clk/rockchip/clk-rk3528.c             | 1114 +++++++++++++++++
 drivers/clk/rockchip/clk.h                    |   22 +
 .../dt-bindings/clock/rockchip,rk3528-cru.h   |  453 +++++++
 .../dt-bindings/reset/rockchip,rk3528-cru.h   |  241 ++++
 9 files changed, 1978 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3528-cru.yaml
 create mode 100644 drivers/clk/rockchip/clk-rk3528.c
 create mode 100644 include/dt-bindings/clock/rockchip,rk3528-cru.h
 create mode 100644 include/dt-bindings/reset/rockchip,rk3528-cru.h

-- 
2.47.1

