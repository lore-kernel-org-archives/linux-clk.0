Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45730499F2C;
	Thu, 17 Sep 2026 22:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789684769; cv=none; b=pQeuISHwLuPifesD1IzjlFVa8cxqR0MR85aFxm1EQwYVPNE8BG2siG05MAxKpGnmdRjhbQfkbjGBAB0/a2hrkTJPeYPkNI9Cgz4xPgojRN4fAHOMknvXa8eC5/du51XPeTT3thMiNjjD4zSN5SZMHbvhuy8+kZLK2J9o3qOw3j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789684769; c=relaxed/simple;
	bh=zSr8ucmt3atALw0jtcqHgXRhkY4eSjq6WuvhwB16jkI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IaVkYSWlXEPXTsgwOhlnK+wveWFkrjFpMi2FUKzJ+HVQWc5NK0doEttgHtVW1pNscQ5sn4PVQfSt+cvkY8hALx5o0F5YD2Cw5M+GRCqBYe+ta5+f9UuB/SkHkNcudM4/OadKmCaG/62t7eEX3Oc0vRFVt9Z11pNQDWhLPRGmYr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=q+OIDnTe; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="q+OIDnTe"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ECF8E1476;
	Thu, 17 Sep 2026 15:39:21 -0700 (PDT)
Received: from e142021.. (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 123933F86F;
	Thu, 17 Sep 2026 15:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789684765; bh=zSr8ucmt3atALw0jtcqHgXRhkY4eSjq6WuvhwB16jkI=;
	h=From:To:Cc:Subject:Date:From;
	b=q+OIDnTe72k1qtLdZwBjc+pT9GJ0hOyYW/n74h9zlWlFJg80CSBewedTn42BRsOgX
	 IEchLZjZHllmaMdaLn7bVQdyvfbPXnrB+QavRKytYAydIch75lCMy/69LSMRadAyYF
	 20VE9ZABdqWJeAuDySAaVxoEdXYq+FHER8M2XkDc=
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
Subject: [PATCH v2 0/5] arm64: allwinner: a523: Enable CPU clocks
Date: Fri, 18 Sep 2026 00:39:08 +0200
Message-ID: <20260917223913.1855301-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

after a year (again?) an update to the A523 CPU clock series. I heeded
Chen-Yu's advice and generalised the update bit to cover both the "key"
use case and the now no longer fixed update bit (patch 1). I also
followed one of Krzysztof's suggestions around the binding headers.
For a changelog see below. Based on v7.3-rc1.
This clashes slightly with the already queued clock fixes from Junhui,
please let me know how I should play this.

==============================
This series adds support for the CPU clock controller in the Allwinner
A523/A527/T527 family of SoCs.

In contrast to all earlier Allwinner SoCs, this chip features a separate
CCU for the CPU clocks (one for each of the two clusters) and the DSU
clock.

Patches 1 and 2 add some slight enhancements to the sunxi-ng clock driver
framework, to generalise the update bit and allow clocks with just a
power-of-2 divider.
Patch 3 adds the binding document for the new CCU.
Patch 4 adds the actual clock driver, and patch 5 makes use of that by
adding the clock description to the SoC .dtsi.

Please have a look and test!

Cheers,
Andre

Changes in v2:
- rebase on v7.3-rc1
- cover CCU_FEATURE_KEY_FIELD in update bits generalisation
- explicitly include binding header in clock driver
- order clocks property before enable-method in DT nodes


Andre Przywara (5):
  clk: sunxi-ng: generalise update bit
  clk: sunxi-ng: mp: support clocks with just a shift register
  dt-bindings: clock: sun55i-a523-ccu: Add A523 CPU CCU clock controller
  clk: sunxi-ng: add support for the A523/T527 CPU CCU
  arm64: dts: allwinner: a523: add CPU clocks

 .../clock/allwinner,sun55i-a523-ccu.yaml      |  25 ++
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi |  22 ++
 drivers/clk/sunxi-ng/Kconfig                  |   5 +
 drivers/clk/sunxi-ng/Makefile                 |   2 +
 drivers/clk/sunxi-ng/ccu-sun55i-a523-cpu.c    | 340 ++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun55i-a523-cpu.h    |  24 ++
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c        |  12 +-
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c          |   4 +-
 drivers/clk/sunxi-ng/ccu_common.h             |   8 +-
 drivers/clk/sunxi-ng/ccu_div.c                |   3 +-
 drivers/clk/sunxi-ng/ccu_gate.c               |   6 +-
 drivers/clk/sunxi-ng/ccu_mp.c                 |   6 +-
 drivers/clk/sunxi-ng/ccu_mp.h                 |   8 +-
 drivers/clk/sunxi-ng/ccu_mux.c                |   8 +-
 drivers/clk/sunxi-ng/ccu_nm.c                 |   1 +
 .../dt-bindings/clock/sun55i-a523-cpu-ccu.h   |  13 +
 16 files changed, 456 insertions(+), 31 deletions(-)
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun55i-a523-cpu.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun55i-a523-cpu.h
 create mode 100644 include/dt-bindings/clock/sun55i-a523-cpu-ccu.h


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.43.0

