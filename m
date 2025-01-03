Received: from bayard.4d2.org (bayard.4d2.org [5.78.89.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE431BEF6D;
	Fri,  3 Jan 2025 22:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.78.89.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735942778; cv=none; b=g8u6yjcj0EnPNIitYRir0MCGETuDsH1bjbSGEwXbusRCYn4CtIYphkv+lr+79jSagMhd+DfkmcJEJPzBAHvnsQjekLwm8xYgeeEB470n8iptUh15RXX00SnrK4Q7wu1Ul+4sBRaZvP6vzvAbjBQP50bq0gXTcrOU5UrM8yDVeT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735942778; c=relaxed/simple;
	bh=VI2R59Sogl5+RPBrs2vo5GuhhrWrivwEF9ZnmBtZwrM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BhkjbP8U+bTR99NFjMsemDMJkXL+g6yIMHDyM2zkE2XgYbKA7h3JzTRyrkovEk0Lrt5SMIpxlsJFbRqXaNXd6Ak/uLqlKA4PwW7PhEisotaEKDCl0B9uMGOQpmTI29vl/1ZYKzkEcKe039GRbBjx9oWw4swX0BJkHdM0w8Ddk8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org; spf=pass smtp.mailfrom=4d2.org; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=tUN3prY+; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=ie7qq+jq; arc=none smtp.client-ip=5.78.89.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=4d2.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="tUN3prY+";
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="ie7qq+jq"
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id BAF8B122FE2A;
	Fri, 03 Jan 2025 13:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1735941520; bh=VI2R59Sogl5+RPBrs2vo5GuhhrWrivwEF9ZnmBtZwrM=;
	h=From:To:Cc:Subject:Date:From;
	b=tUN3prY+LacI+gXTqsFzBDimVsWg/32gWC2OPQMmr1rLjFjmyrAco6K1IDMbltog7
	 vIPTfX5pDW2k7Q/MX8BYOqSLZJaw8d3ntIbn+KJxmxouKzly104ZJWLrLhrRxQa0xB
	 v0FJxdtU1riSFXJSr3qtK5Kc1UFiJLia39pe8HPArLZdQlZnUyOSFCDB+uSvl2/GfN
	 zgBQ/whGXNNUn57nZLOkYvQA0pofM+HtHBfiODWGUxZtd0Gyd0YjDyj27c2q8T1FVj
	 t+oI0rFny6LQHcIqz/lNJTFVWg0moTAUoWWcr20p4DpmkfhRCy/YQggen8USVVQOtE
	 gEAeA/JwABs8w==
X-Virus-Scanned: amavisd-new at 4d2.org
Authentication-Results: bayard.4d2.org (amavisd-new); dkim=pass (2048-bit key)
 header.d=4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 57_Q6Vnd7hxo; Fri,  3 Jan 2025 13:58:34 -0800 (PST)
Received: from localhost.localdomain (unknown [183.217.81.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 6EA3E122FE1A;
	Fri, 03 Jan 2025 13:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1735941514; bh=VI2R59Sogl5+RPBrs2vo5GuhhrWrivwEF9ZnmBtZwrM=;
	h=From:To:Cc:Subject:Date:From;
	b=ie7qq+jqZ1cFinmaH2kMndTfkxzNrhnp3HKrxJ1BaL/lsWrAGCigq3F6iQ4k8tlR+
	 D5ooPW+JJ59xM8GRw+UCTl+ygYgXzca8kKAT5yjnb1WU8ZY1RxiKa+i4OixvtC4MtH
	 +Fn1fc1A1hfCcHZ7nJxn43Ox9buIHJ/aTsMWtNCqNk9XQt3ZkR1Lmg6SB3uTvTDfrS
	 zF/hCz+872n/MpxljbhADpTxYIHHutcKGfZROb/mbl0FPiUPC2T2wEfaNqox8hftSC
	 d8B3PY93ziMCaJn6eGDYmsesxASqu9SkYT6RlOQ6pM72OxeLYlF9/6hJzmymDZbFv6
	 dtP4JiFT8m2SA==
From: Haylen Chu <heylenay@4d2.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Haylen Chu <heylenay@4d2.org>
Subject: [PATCH v4 0/4] Add clock controller support for SpacemiT K1
Date: Fri,  3 Jan 2025 21:56:33 +0000
Message-ID: <20250103215636.19967-2-heylenay@4d2.org>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clock tree of SpacemiT K1 is managed by several independent
controllers in different SoC parts. In this series, all clock hardwares
in APBS, MPMU, APBC and APMU are implemented. Clocks in other SoC parts
could be implemented later.

This driver has been tested on BananaPi-F3 board. With some out-of-tree
drivers, I've successfully brought up I2C, RTC, MMC and ethernet
controllers, proving it works. A clock tree dump could be obtained
here[1].

[1]: https://gist.github.com/heylenayy/fda51ac6736ac97a2c53d8caa3302378

Link: https://developer.spacemit.com/documentation?token=LCrKwWDasiJuROkVNusc2pWTnEb

Changed from v3
- spacemit,k1-ccu binding
  - allow spacemit,mpmu property only for controllers requiring it
    (spacemit,k1-ccu-apbs)
- spacemit,k1-syscon binding
  - drop unnecessary *-cells properties
  - drop unrelated nodes in the example
- driver
  - remove unnecessary divisions during rate calucalation in ccu_ddn.c
  - use independent clk_ops for different ddn/mix variants, drop
    reg_type field in struct ccu_common
  - make the register containing frequency change bit a sperate field in
    ccu_common
  - unify DIV_MFC_MUX_GATE and DIV_FC_MUX_GATE
  - implement a correct determine_rate() for mix type
  - avoid reparenting in set_rate() for mix type
  - fix build failure when SPACEMIT_CCU and SPACEMIT_CCU_K1 are
    configured differently
- use "osc" instead of "osc_32k" in clock input names
- misc style fixes
- Link to v3: https://lore.kernel.org/all/20241126143125.9980-2-heylenay@4d2.org/

Changed from v2
- dt-binding fixes
  - drop clocks marked as deprecated by the vendor (CLK_JPF_4KAFBC and
    CLK_JPF_2KAFBC)
  - add binding of missing bus clocks
  - change input clocks to use frequency-aware and more precise names
  - mark input clocks and their names as required
  - move the example to the (parent) syscon node and complete it
  - misc style fixes
- misc improvements in code
- drop unnecessary spinlock in the driver
- implement missing bus clocks
- Link to v2: https://lore.kernel.org/all/SEYPR01MB4221829A2CD4D4C1704BABD7D7602@SEYPR01MB4221.apcprd01.prod.exchangelabs.com/

Changed from v1
- add SoC prefix (k1)
- relicense dt-binding header
- misc fixes and style improvements for dt-binding
- document spacemit,k1-syscon
- implement all APBS, MPMU, APBC and APMU clocks
- code cleanup
- Link to v1: https://lore.kernel.org/all/SEYPR01MB4221B3178F5233EAB5149E41D7902@SEYPR01MB4221.apcprd01.prod.exchangelabs.com/

Haylen Chu (4):
  dt-bindings: clock: spacemit: Add clock controllers of Spacemit K1 SoC
  dt-bindings: soc: spacemit: Add spacemit,k1-syscon
  clk: spacemit: Add clock support for Spacemit K1 SoC
  riscv: dts: spacemit: Add clock controller for K1

 .../bindings/clock/spacemit,k1-ccu.yaml       |   60 +
 .../soc/spacemit/spacemit,k1-syscon.yaml      |   52 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          |   97 +
 drivers/clk/Kconfig                           |    1 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/spacemit/Kconfig                  |   20 +
 drivers/clk/spacemit/Makefile                 |    5 +
 drivers/clk/spacemit/ccu-k1.c                 | 1747 +++++++++++++++++
 drivers/clk/spacemit/ccu_common.h             |   51 +
 drivers/clk/spacemit/ccu_ddn.c                |  140 ++
 drivers/clk/spacemit/ccu_ddn.h                |   84 +
 drivers/clk/spacemit/ccu_mix.c                |  304 +++
 drivers/clk/spacemit/ccu_mix.h                |  309 +++
 drivers/clk/spacemit/ccu_pll.c                |  189 ++
 drivers/clk/spacemit/ccu_pll.h                |   80 +
 include/dt-bindings/clock/spacemit,k1-ccu.h   |  246 +++
 16 files changed, 3386 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/spacemit,k1-ccu.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
 create mode 100644 drivers/clk/spacemit/Kconfig
 create mode 100644 drivers/clk/spacemit/Makefile
 create mode 100644 drivers/clk/spacemit/ccu-k1.c
 create mode 100644 drivers/clk/spacemit/ccu_common.h
 create mode 100644 drivers/clk/spacemit/ccu_ddn.c
 create mode 100644 drivers/clk/spacemit/ccu_ddn.h
 create mode 100644 drivers/clk/spacemit/ccu_mix.c
 create mode 100644 drivers/clk/spacemit/ccu_mix.h
 create mode 100644 drivers/clk/spacemit/ccu_pll.c
 create mode 100644 drivers/clk/spacemit/ccu_pll.h
 create mode 100644 include/dt-bindings/clock/spacemit,k1-ccu.h


base-commit: 2d5404caa8c7bb5c4e0435f94b28834ae5456623
prerequisite-patch-id: 47dcf6861f7d434d25855b379e6d7ef4ce369c9c
prerequisite-patch-id: 77787fe82911923aff15ccf565e8fa451538c3a6
prerequisite-patch-id: b0bdb1742d96c5738f05262c3b0059102761390b
prerequisite-patch-id: 3927d39d8d77e35d5bfe53d9950da574ff8f2054
prerequisite-patch-id: a98039136a4796252a6029e474f03906f2541643
prerequisite-patch-id: c95f6dc0547a2a63a76e3cba0cf5c623b212b4e6
prerequisite-patch-id: 66e750e438ee959ddc2a6f0650814a2d8c989139
prerequisite-patch-id: 29a0fd8c36c1a4340f0d0b68a4c34d2b8abfb1ab
prerequisite-patch-id: 0bdfff661c33c380d1cf00a6c68688e05f88c0b3
prerequisite-patch-id: 99f15718e0bfbb7ed1a96dfa19f35841b004dae9
-- 
2.47.1

