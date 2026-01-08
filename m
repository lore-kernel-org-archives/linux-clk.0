Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33532302779;
	Thu,  8 Jan 2026 06:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767852506; cv=none; b=m6IFhIwOBD/MGNluU4OHbEc++ER4Cd46AOQ7Kj/SYtFUNpqMzRsrrzcJmDYccG5BJURSJVtm4NqGvrTNOFRkbMEOXemvDQjZ0Fr4XmP6S5Ql4SIldIhv7mApzGAwGpoq6uIf24yy1LbOli79K0HX4DkWkiF/eF9QWhvGNkmDX+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767852506; c=relaxed/simple;
	bh=RYHvBenPbSd/Yi3PszJcY9ayngdFIumRsmnQpcNICxs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QJ0gCuzJ2zGgrZFmJR8xwTz5DG8tgk0hdA6eBa2cuErK33LL7iZESdRh8DfCQakg8pNQAZND+DEjTFTvs2NHR4Bucyp029hJFIwZSYTJSjJZQdKfJA121vF83Ma2suYZV7cUCqH4+ZvuJeEeWf81wPI+p2kEVWclJ9eGFMIY/aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EgcrzXvR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EgcrzXvR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BD732C116C6;
	Thu,  8 Jan 2026 06:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767852505;
	bh=RYHvBenPbSd/Yi3PszJcY9ayngdFIumRsmnQpcNICxs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=EgcrzXvR+e6GdnT9wqdYucJ55Yn8fILi9I1o//ol91/F9HPZ+3GGneZBNE15oFUvI
	 vyMLAeQ8z1rRnChp2BxJM0Kv5azww5PW8W+naQ37vD7xu4hFAzZhErkmv9JGfQa7L9
	 pzLj255i7aPaLsBSutm/wAHaIzuwEeGqMKqmfnRNJixA3AQ7IipgcXWASLXkhsqLnX
	 LGH4luQ3mGr15NCUStnxkt/5h8jEE6W3ZA7yv2ZcXZmaW7aH65+Euf3mQnWF3ZnThx
	 /gntxcmzBXf4b7JKtoQdGXWL0lWeWZFQ+Wc++a0YILgfqtQESDNzbT+3BzeuLcN4mo
	 4x520nP8p4czQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB7C2D1489F;
	Thu,  8 Jan 2026 06:08:25 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Subject: [PATCH v5 0/8] clk: amlogic: Add A5 SoC PLLs and Peripheral clock
Date: Thu, 08 Jan 2026 14:08:14 +0800
Message-Id: <20260108-a5-clk-v5-0-9a69fc1ef00a@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAM5JX2kC/2XMTQqDMBCG4atI1k3JjIloV71H6SKOo4b6U0wJL
 eLdGwWF0uU3zPPOwvPk2ItLMouJg/NuHOIwp0RQa4eGpaviFqhQqwJAWiOpe8jUkC4slalmEPH
 5OXHt3lvodo+7df41Tp+tG2C97gm9JwJIJQ0zkq6hVDldbd+NjaMzjb1YIwEPCIDqgBhh3HmGw
 EUG1T/UOzSgMD+gjpAzJKusZdTpL1yW5QsTZL2sEAEAAA==
To: Chuan Liu <chuan.liu@amlogic.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767852503; l=3239;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=RYHvBenPbSd/Yi3PszJcY9ayngdFIumRsmnQpcNICxs=;
 b=bNmkHioG5afqUsiyHyWBmdJF5FymiZB8FvlwfnAAkHB9zBkDq58F6ck1JB+W3dKVC1+97bR+2
 Zk8BKItr/F+AHr7k7GgC+5esELm5Wny+ymECuG/t+DPCW3Rp3PBtvmD
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
Reply-To: chuan.liu@amlogic.com

The patchset adds support for the peripheral and PLL clock controller
on the Amlogic A5 SoC family, such as A113X2.

Co-developed-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>

---
Changes in v5:
- Add “Co-developed-by” tag for Xianwei.
- Change rtc_clk flags to CLK_SET_RATE_NO_REPARENT.
- Optimize the macro definitions for clock configuration.
- Unified naming of clock parent related variables.
- Link to v4: https://lore.kernel.org/r/20251028-a5-clk-v4-0-e62ca0aae243@amlogic.com

Changes in v4:
- dt-binding for peripheral clocks (kept Rob’s 'Reviewed-by' here):
  - Added optional clock source rtc pll.
  - Renamed rtc_clk’s clkid to better reflect its function.
- PLL/Clock driver:
  - Adapted to Jerome’s refactored driver interface, naming
conventions, and macros.
  - Updated related CONFIG entries in Kconfig.
- Added dts patch of PLL/Clock.
- Link to v3: https://lore.kernel.org/r/20250103-a5-clk-v3-0-a207ce83b9e9@amlogic.com

Changes in v3:
- Rename xtal_24m to xtal, and modify some description of Kconfig.
- Drop some comment of PLL source code.
- Move definition of A5_CLK_GATE_FW frome common code into A5 peripheral source code.
- Use hw instead of name to describe parent_data.
- Making SCMI binding the first to submit.
- Link to v2: https://lore.kernel.org/r/20241120-a5-clk-v2-0-1208621e961d@amlogic.com

Changes in v2:
- Move some sys clock and axi clock from peripheral to scmi impletement.
- Remove  ARM_SCMI_PROTOCOL in Kconfig and correct name A5 but not A4.
- Add two optional clock inputs for the peripheral(ddr pll and clk-measure)
- Make some changes and adjustments according to suggestions.
- Link to v1: https://lore.kernel.org/r/20240914-a5-clk-v1-0-5ee2c4f1b08c@amlogic.com

---
Chuan Liu (8):
      dt-bindings: clock: Add Amlogic A5 SCMI clock controller support
      dt-bindings: clock: Add Amlogic A5 PLL clock controller
      dt-bindings: clock: Add Amlogic A5 peripherals clock controller
      clk: amlogic: Add A5 PLL clock controller driver
      clk: amlogic: Add A5 clock peripherals controller driver
      arm64: dts: amlogic: A5: Add scmi-clk node
      arm64: dts: amlogic: A5: Add PLL controller node
      arm64: dts: amlogic: A5: Add peripheral clock controller node

 .../clock/amlogic,a5-peripherals-clkc.yaml         | 134 ++++
 .../bindings/clock/amlogic,a5-pll-clkc.yaml        |  63 ++
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        |  86 +++
 drivers/clk/meson/Kconfig                          |  27 +
 drivers/clk/meson/Makefile                         |   2 +
 drivers/clk/meson/a5-peripherals.c                 | 796 +++++++++++++++++++++
 drivers/clk/meson/a5-pll.c                         | 478 +++++++++++++
 .../clock/amlogic,a5-peripherals-clkc.h            | 132 ++++
 include/dt-bindings/clock/amlogic,a5-pll-clkc.h    |  24 +
 include/dt-bindings/clock/amlogic,a5-scmi-clkc.h   |  44 ++
 10 files changed, 1786 insertions(+)
---
base-commit: f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1
change-id: 20240911-a5-clk-35c49acb34e1

Best regards,
-- 
Chuan Liu <chuan.liu@amlogic.com>


