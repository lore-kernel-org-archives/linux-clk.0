Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD9B1DA23;
	Wed,  1 Jul 2026 08:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782894662; cv=none; b=S1n8s86TvfySPSUGYGMTTbH0Tnj+o+TrbAMJIC/9S3v1aKSvy6Vu008bHBOY/p3xDFCl7aVcLt89JmSCaELkwwxPZ2/+lmYewFdeaabnUKvtOe8a4JT8gTZDVGFItBXRzf590JvJ2sY7L7vMw2RqOP5MrZ5HTeJyxL9kd22JMpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782894662; c=relaxed/simple;
	bh=EN7+luIk8ttxgrcIn29NeS7w5DT1mqmUEpqgU8cOU4w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fSXHfql2s+UF50TeL91RG8eB8pJ/+r4VE4q55blAvz0qsU6Z799PxvqlvOqKeoDvufecGouDqyYMDZDVRpfiWjEnPK5jG9LkTHXREXwUDEmLb5eJdr13uKkdTwfWP4pvgm+xfqADPPNGfYDvrjp5SM9w+O8eX2IPxIkzz8dXf7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pUx3yXnP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pUx3yXnP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29B44C2BCC6;
	Wed,  1 Jul 2026 08:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782894662;
	bh=EN7+luIk8ttxgrcIn29NeS7w5DT1mqmUEpqgU8cOU4w=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=pUx3yXnPdCTJahJfhmnLb3VfU0fdV9Lv6TH2zYUtBzk8RaG603wE1TjhCn1XY/rLC
	 30Pv1ubIR4ct97j6IjuWW2r3F+xt8W0+R5BFj51nErTPyUPZ2bVJo5ANHP8LuXiMwa
	 2DN+WyQzs/XVcX/PulIJvQufVlxtNRyrSksPlei8w5jFDR4kJqrebod5DcAH5yBwLK
	 UTaBDW2nluW8kPsEKP0X/le1eDAewAnd7F2lGDoFQAV28gCDhA5Ps1L/OfiaIMIuGC
	 ZnJl2H/pDr64FrUY+ZTZuFz10Gg/bAi7F/J3Ax2hRYFaKb4YUy8h7Ou3djyPpZdloy
	 kKkUS5S43ieEg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13070C43458;
	Wed,  1 Jul 2026 08:31:02 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Subject: [PATCH v6 0/2] clk: amlogic: Add A9 peripherals clock controller
Date: Wed, 01 Jul 2026 16:30:01 +0800
Message-Id: <20260701-a9_peripherals-v6-0-9630f39879e5@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAArQRGoC/3XPTQrCMBAF4KuUrI1M/prWlfcQkTSd2oDakkhRp
 Hd32lUluHwD7+PNhyWMARM7FB8WcQopDA8K5a5gvnePK/LQUmYSZAklKO7qy0iVscfobolrKTT
 a2oJpPaPSGLELrxU8nSn3IT2H+F79SS7Xv9QkOXBE0VQenMDSH939NlyD3/vhzhZsUhtAQAYoA
 lqwzlZQmc6KHNBboMoATUCHQkKLmt6yOWA2gMoXGAIar0HUVoEy+heY5/kLkFdWxXEBAAA=
X-Change-ID: 20260603-a9_peripherals-4214e79705dc
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Jian Hu <jian.hu@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782894659; l=2893;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=EN7+luIk8ttxgrcIn29NeS7w5DT1mqmUEpqgU8cOU4w=;
 b=Xw9K4k9bePFl7wxYw4cyAoSwBxvdJXE98gki1lSauw51LcjhFKhZWqVL/NqbLD0zCnuv8t4gU
 /2+dtstXbAUAPadINiWCjQvsbYrlV3ZYbvw9AQhr0OftCJBiJrSuBtU
X-Developer-Key: i=jian.hu@amlogic.com; a=ed25519;
 pk=zHUE+rNtH9z+Sb8au1/elWknjFQmy5QDVkBoxleuOIA=
X-Endpoint-Received: by B4 Relay for jian.hu@amlogic.com/20260415 with
 auth_id=735
X-Original-From: Jian Hu <jian.hu@amlogic.com>
Reply-To: jian.hu@amlogic.com

This series adds Amlogic A9 peripherals clock support,
including dt-binding and peripherals clock driver.

Note that this driver depends on the A9 PLL driver, which is not yet
upstream. The Meson PLL framework is currently undergoing refactoring,
and the A9 PLL driver will be submitted as a follow-up series after
that work has been completed.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
Changes in v6:
- Rebase onto the latest clk-meson-next.
- Update Kconfig and Makefile context to apply cleanly.
- No functional changes.
- Link to v5: https://lore.kernel.org/r/20260630-a9_peripherals-v5-0-bc4019730354@amlogic.com

Changes in v5:
- Include <linux/module.h>.
- Add missing '0' suffixes to some clocks.
- Fix typo: "encorder1" -> "encoder1".
- Fix the parent clock for a9_hdmitx1_pixel.
- Link to v4: https://lore.kernel.org/r/20260618-a9_peripherals-v4-0-fe120de44e77@amlogic.com

Changes in v4:
- Expose channel 3 for gen_clk.
- Add missing '0' suffixes to somes.
- Use helper macro for vclk clocks definitions.
- Drop forward declaration.
- Drop CLK_HW_INIT* and revert to explicit clock declarations.
- Fix can clock channel number comment.
- Rename enc clocks to encoder0/encoder1.
- Link to v3: https://lore.kernel.org/r/20260610-a9_peripherals-v3-0-d07a78085f71@amlogic.com

Changes in v3:
- Add "depend on A9 pll" instructions in the cover-letter.
- Move COMPILE_TEST after 'depends on ARM64' reported by sashiko-bot.
- Fix usb_48m_pre_sel's parent reported by sashiko-bot.
- Fix gen_div width reported by sashiko-bot.
- Fix hdmitx1_pixel's parent reported by sashiko-bot.
- Link to v2: https://lore.kernel.org/r/20260603-a9_peripherals-v2-0-ee1b8c0a1e6c@amlogic.com

Changes in v2:
- Split the A9 clock driver and send the peripherals clock separately.
- Add COMPILE_TEST in Kconfig.
- Drop the 'optional'.
- Rename apb4 to soc.
- Sort the header file.
- Rename hifi to hifi0.
- Use CLK_HW_INIT_PARENTS_DATA to describe clk_init_data.
- Use CLK_HW_INIT_HW to describe clk_init_data.
- Use CLK_HW_INIT_PARENTS_HW to describe clk_init_data.
- Link to v1: https://lore.kernel.org/all/20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com/

---
Jian Hu (2):
      dt-bindings: clock: Add Amlogic A9 peripherals clock controller
      clk: amlogic: Add A9 peripherals clock controller driver

 .../clock/amlogic,a9-peripherals-clkc.yaml         |  164 ++
 drivers/clk/meson/Kconfig                          |   15 +
 drivers/clk/meson/Makefile                         |    1 +
 drivers/clk/meson/a9-peripherals.c                 | 2089 ++++++++++++++++++++
 .../clock/amlogic,a9-peripherals-clkc.h            |  351 ++++
 5 files changed, 2620 insertions(+)
---
base-commit: a1b4c3a63a7e56b98b2eccc3a82b9f31d51c2e35
change-id: 20260603-a9_peripherals-4214e79705dc

Best regards,
-- 
Jian Hu <jian.hu@amlogic.com>


