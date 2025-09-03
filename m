Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 997FC139D;
	Wed,  3 Sep 2025 00:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756858181; cv=none; b=VWWHQ7zF0Ocy9eIc2AluEBXITKYy9XzwqSf2shTJVFEXwB+MQrItFOeNVuv/GaqUl8jyk/xhdjC9ELfflVClaJ0qqvQg4p7FyJQ3aA/DBWR9RjkhqCmJ3TlsLopRYyAkU/NbmtL4g41d/nNFw1Gahqkhl52DJo2oW2byllc6Ltc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756858181; c=relaxed/simple;
	bh=OLtLNbqHA6QhfVuuKXBUpJxDyyJ6QpUEJDviMb0IS04=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uaI8aARo9vU4/PYjyZevYUDphoD43KWhDkDv3HpcL0xhDobRq3RICkiTFliXKZvPtePBkU7lV68c27GFVRpTrCsSmMOarQ90SLoV1FXv+GvENZgwNIZW1covQYCfs1l4Tis6YhhgzoOtTwLXnhKoCl4aIdiv7BfoWmomK2oQUZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 817521764;
	Tue,  2 Sep 2025 17:09:30 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 11EA83F63F;
	Tue,  2 Sep 2025 17:09:36 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Mikhail Kalashnikov <iuncuim@gmail.com>
Subject: [PATCH 0/5] arm64: allwinner: a523: Enable CPU clocks
Date: Wed,  3 Sep 2025 01:09:05 +0100
Message-ID: <20250903000910.4860-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

this series adds support for the CPU clock controller in the Allwinner
A523/A527/T527 family of SoCs.

In contrast to all earlier Allwinner SoCs, this chip features a separate
CCU for the CPU clocks (one for each of the two clusters) and the DSU
clock.

Patch 1/5 adds the binding document for the new CCU. This builds on top
of Chen-Yu's recent patch for the MCU PRCM, listed as a prerequisite
below.
Patch 2 and 3 add some slight enhancements to the sunxi-ng clock driver
framework, to generalise the update bit and allow clocks with just a
power-of-2 divider.
Patch 4 adds the actual clock driver, and patch 5 makes use of that by
adding the clock description to the SoC .dtsi.

Please have a look and test!

Cheers,
Andre

Andre Przywara (5):
  dt-bindings: clock: sun55i-a523-ccu: Add A523 CPU CCU clock controller
  clk: sunxi-ng: generalise update bit
  clk: sunxi-ng: mp: support clocks with just a shift register
  clk: sunxi-ng: add support for the A523/T527 CPU CCU
  arm64: dts: allwinner: a523: add CPU clocks

 .../clock/allwinner,sun55i-a523-ccu.yaml      |  25 ++
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi |  22 ++
 drivers/clk/sunxi-ng/Kconfig                  |   5 +
 drivers/clk/sunxi-ng/Makefile                 |   2 +
 drivers/clk/sunxi-ng/ccu-sun55i-a523-cpu.c    | 338 ++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun55i-a523-cpu.h    |  24 ++
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c        |  12 +-
 drivers/clk/sunxi-ng/ccu_common.h             |   5 +-
 drivers/clk/sunxi-ng/ccu_div.c                |   3 +-
 drivers/clk/sunxi-ng/ccu_gate.c               |   6 +-
 drivers/clk/sunxi-ng/ccu_mp.c                 |   6 +-
 drivers/clk/sunxi-ng/ccu_mp.h                 |   8 +-
 drivers/clk/sunxi-ng/ccu_mux.c                |   3 +-
 drivers/clk/sunxi-ng/ccu_nm.c                 |   1 +
 .../dt-bindings/clock/sun55i-a523-cpu-ccu.h   |  13 +
 15 files changed, 450 insertions(+), 23 deletions(-)
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun55i-a523-cpu.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun55i-a523-cpu.h
 create mode 100644 include/dt-bindings/clock/sun55i-a523-cpu-ccu.h


base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
prerequisite-patch-id: 874f647e4961983cbcfda05d2fd906256b008327
-- 
2.46.3

