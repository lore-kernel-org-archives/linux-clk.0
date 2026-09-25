Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31BDB4F055B;
	Fri, 25 Sep 2026 22:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790376968; cv=none; b=aTp8jlevFNDcQ1uR7FJYDBViWdo1T5IprZDhcv6wwVCum7EqgbrEAOeOhEenJJdT3fObvW+/So8OdEtJl1IeUNJz5anlVkAlzgg2bfMB1/5ExEVIhKZA/X5cH5W3FDLZTOm8xRld9hLUll3qVhPfacbNkWQaCdnrrir/fvzNLjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790376968; c=relaxed/simple;
	bh=sCbdqOYDE+J/MhWw6Yok3HLazdmH5YreU68DshgauHU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A9WLrpTNnu6d9Ta1rHiXhzjerEl1LItg9/xI7Ml8fJKx2PKQikm+sL3mCtwbtV6e/MOM7h9wHlQe+dB0+snKbITOHRvafcRQGsJsjIwSahN1LBmLy6WEhc7kXZgujqsMoWQ1/Jimho2EXzV4d1ewzk+wZNr5Y3iPfdzq0X3dugc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=jEMlTWxx; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="jEMlTWxx"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 872B9169C;
	Fri, 25 Sep 2026 15:56:00 -0700 (PDT)
Received: from ryzen.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 52C2F3F632;
	Fri, 25 Sep 2026 15:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790376964; bh=sCbdqOYDE+J/MhWw6Yok3HLazdmH5YreU68DshgauHU=;
	h=From:To:Cc:Subject:Date:From;
	b=jEMlTWxxoJMnI1UhQcnj5XtED9OG6mSOLSkwQq4h4DUEzuv3tdb0Wtm7jarX6GQhx
	 J2T7clL381kZy90zEmj/BcPDNVCex6Rd/4n+SNPsCrDAZqA83H9DQ4P530KdJTUtZh
	 /ZPC6Q5iziHQ8OXEux7tbwx+MXVizGtoMENRvLys=
From: Andre Przywara <andre.przywara@arm.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 0/4] arm64: allwinner: a523: Enable CPU clocks
Date: Sat, 26 Sep 2026 00:51:08 +0200
Message-ID: <20260925225112.14081-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

an update for the A523 CPU clock series, aiming at eventually lifting
all A523 boards out of their current 768MHz misery ;-)
This addresses the comments on the list and from Sashiko, though I took
the freedom to ignore impossible scenarios (we cannot really remove this
clock module), and pathological corner cases (race condition between
registering the CCU and registering the clock notifiers).
Changes to mention are the usage of a new clock macro based on a divider
clock for the PLL dividers, and the rework of the PLL start routine. 
For a more complete changelog see below. Based on v7.3-rc1.

==============================
This series adds support for the CPU clock controller in the Allwinner
A523/A527/T527 family of SoCs.

In contrast to all earlier Allwinner SoCs, this chip features a separate
CCU for the CPU clocks (one for each of the two clusters) and the DSU
clock.

Patch 1 adds some slight enhancement to the sunxi-ng clock driver
framework, to generalise the update bit.
Patch 2 adds the binding document for the new CCU.
Patch 3 adds the actual clock driver, and patch 4 makes use of that by
adding the clock description to the SoC .dtsi.

Please have a look and test!

Cheers,
Andre

Changes in v3:
- forbid #reset-cells in DT binding
- adjust top level comment to include DSU divider bits
- drop patch 2 in favour of using a div clock and a new macro
- describe PLL divider clocks using new divider clock macro
- rename 600MHz input clock name to match binding (lower case "m")
- add MUX notifier for DSU clock as well
- add new function to start CPU PLLs in a safer way
- add MODULE_DEVICE_TABLE
- drop unneeded (and now forbidden) #reset-cells from .dtsi
- only build driver for CONFIG_ARCH_SUNXI

Changes in v2:
- rebase on v7.3-rc1
- cover CCU_FEATURE_KEY_FIELD in update bits generalisation
- explicitly include binding header in clock driver
- order clocks property before enable-method in DT nodes


Andre Przywara (4):
  clk: sunxi-ng: generalise update bit
  dt-bindings: clock: sun55i-a523-ccu: Add A523 CPU CCU clock controller
  clk: sunxi-ng: add support for the A523/T527 CPU CCU
  arm64: dts: allwinner: a523: add CPU clocks

 .../clock/allwinner,sun55i-a523-ccu.yaml      |  38 +-
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi |  21 +
 drivers/clk/sunxi-ng/Kconfig                  |   5 +
 drivers/clk/sunxi-ng/Makefile                 |   2 +
 drivers/clk/sunxi-ng/ccu-sun55i-a523-cpu.c    | 378 ++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun55i-a523-cpu.h    |  24 ++
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c        |  12 +-
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c          |   4 +-
 drivers/clk/sunxi-ng/ccu_common.h             |   8 +-
 drivers/clk/sunxi-ng/ccu_div.c                |   3 +-
 drivers/clk/sunxi-ng/ccu_div.h                |   5 +
 drivers/clk/sunxi-ng/ccu_gate.c               |   6 +-
 drivers/clk/sunxi-ng/ccu_mp.h                 |   8 +-
 drivers/clk/sunxi-ng/ccu_mux.c                |   8 +-
 drivers/clk/sunxi-ng/ccu_nm.c                 |   1 +
 .../dt-bindings/clock/sun55i-a523-cpu-ccu.h   |  13 +
 16 files changed, 506 insertions(+), 30 deletions(-)
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun55i-a523-cpu.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun55i-a523-cpu.h
 create mode 100644 include/dt-bindings/clock/sun55i-a523-cpu-ccu.h


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.46.4

