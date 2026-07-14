Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E7235F191;
	Tue, 14 Jul 2026 01:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783992910; cv=none; b=IokVW6OrZvn7IyMrHfB4WzidhkmkQlMi/XT6k6te6F85HrZdBr1ZkZtv4v3jW6VVBbkqdt1HPZQY5l/nFsPsCLITe+pSeT3d5iW1XqRxVGb1S5z8ZxNp0O04mwIOetrN6XUPQl1G147UMU8TQZW/UW6puv/lm2b8ol4iNW9G9ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783992910; c=relaxed/simple;
	bh=1+0h5Czi3945BvDh1x4hHUXcjf/w1aukAvvcGRam85U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uOOteuUpsdkvppmWswkokCsjzSwAseWD0i4TDdfk+YfnSB3oev/8l4CpyMDpu9boRDPZ8Mrrzwk2erYM3gCv9oUymbtYaJyopx2S1zoZebzF7/IDkk919Rfsd0cVwyP5bDUyAAxW3RK/IhGLQsHOTboxLm8MBZRq0n2RKQi9wlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qJ+XIuvW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qJ+XIuvW"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B1002C2BCB8;
	Tue, 14 Jul 2026 01:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783992909;
	bh=1+0h5Czi3945BvDh1x4hHUXcjf/w1aukAvvcGRam85U=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=qJ+XIuvW6GtPLLL987Lo3J/PuDspwiAStV29o1FEsa1ShTAbjFrYVoQwcWm9CAYd7
	 c90/n437KbOtaE4tfog34dXig7s9sS4TZEzIjV+P8bCwOj+07AxHL72xhvwvpLTBes
	 baQmHuT/rs4nfoM3096ggSa7PbMPD+ger4Hj1MdL5vPXWHMtF3Dtf/LR5dhpXlk19l
	 +M76q/Tde8VskFe4BqY/bQNsa9Z/0ymC/+4ssFwI2BQ86p5Z5xWJQhVGWRXtEYj4wV
	 zH+sQsFthwmEMnIjp14siAyQTJ/IZBuSbMjJauUKnXGCxa4iW2wps6f/jN8+IKv3Yx
	 M0fmvHn1OYfjQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D8ADC43458;
	Tue, 14 Jul 2026 01:35:09 +0000 (UTC)
From: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>
Subject: [PATCH v3 0/3] clk: ultrarisc: add DP1000 clock support
Date: Tue, 14 Jul 2026 09:35:06 +0800
Message-Id: <20260714-ultrarisc-clock-v3-0-4b1ccaa26b37@ultrarisc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEuSVWoC/2XNyw6CMBQE0F8hXVvTh4C48j+Mi/ZykfqgpoVGQ
 /h3W0iMkeUkM2dG4tEZ9OSQjcRhMN7YLga5yQi0qrsgNXXMRDBRsFwIOtx7p5zxQOFu4UYV16V
 SedUUTJO4ejpszGsWT+cl+0FfEfrEpEZrfG/de74MPPUWveB8pQdOGRV1JVHrHQCXx29jC/ZB0
 kMQv0a5NkQ0KtC8YHuJPMd/Y5qmD8BwEIUIAQAA
X-Change-ID: 20260522-ultrarisc-clock-a1b7aa59f60b
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jia Wang <wangjia@ultrarisc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783992908; l=3315;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=1+0h5Czi3945BvDh1x4hHUXcjf/w1aukAvvcGRam85U=;
 b=41r9EoV30RQxk3tELxyntfYSeX23Mx7E4y3Ato3uUdnZdQVvO4oBbfwpGxokZ2qNZJnXHxuuD
 7FdDxEJ9kQvBIvyog5mbMH4DNI8NBMgDTG4UpfvY6Nwpm9SDPjZcB0c
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-Endpoint-Received: by B4 Relay for wangjia@ultrarisc.com/20260515 with
 auth_id=779
X-Original-From: Jia Wang <wangjia@ultrarisc.com>
Reply-To: wangjia@ultrarisc.com

This series exports a small common clock helper and adds the devicetree
binding and clock driver for the UltraRISC DP1000 SoC.

The clock tree is driven by a SYSPLL and provides fixed-factor clocks for
the subsystem and PCIe, divider-based root clocks for GMAC and the UART,
I2C, and SPI blocks, and per-instance gate clocks for UART0-3, I2C0-3,
and SPI0-1.

Testing:
- dt_binding_check and dtbs_check on ultrarisc,dp1000-clk
- Kernel build for RISC-V and boot-tested on DP1000
- Modules build test for CLK_ULTRARISC_DP1000

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
Changes in v3:
- Add a preparatory clk core patch exporting
  devm_clk_hw_register_composite_pdata().
- Use devm_clk_hw_register_composite_pdata() for DP1000 divider composite
  clock registration.
- Export ultrarisc_clk_probe() in the CLK_ULTRARISC namespace and import it
  from the DP1000 clock driver.
- Drop the local devres composite wrapper and use clk_parent_data for
  divider parents.
- Remove the optional no-gate divider path and model DP1000 dividers as
  divider+gate composites.
- Drop CLK_GET_RATE_NOCACHE from fixed-factor, gate, and divider composite
  registrations where it is not needed.
- Link to v2: https://patch.msgid.link/20260617-ultrarisc-clock-v2-0-9cb16083e15e@ultrarisc.com

Changes in v2:
- Drop the redundant clock-names property from the clock binding.
- Move DP1000_CLK_NUM from the dt-bindings header into the driver.
- Clarify the divider load-bit handling in the common clock core.
- Validate that all advertised clock IDs are populated before registering
  the onecell clock provider.
- Rework divider composite clock registration so the driver builds
  correctly as a module.
- Link to v1: https://patch.msgid.link/20260611-ultrarisc-clock-v1-0-2d93ebb4cc13@ultrarisc.com

To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney@redhat.com>
To: Jia Wang <wangjia@ultrarisc.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

---
Jia Wang (3):
      clk: composite: Export devm composite pdata helper
      dt-bindings: clock: ultrarisc: Add DP1000 Clock Controller
      clk: ultrarisc: Add DP1000 clock driver

 .../bindings/clock/ultrarisc,dp1000-clk.yaml       |  60 +++
 MAINTAINERS                                        |   8 +
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/clk-composite.c                        |   1 +
 drivers/clk/ultrarisc/Kconfig                      |  18 +
 drivers/clk/ultrarisc/Makefile                     |   4 +
 drivers/clk/ultrarisc/clk-dp1000.c                 | 154 ++++++++
 drivers/clk/ultrarisc/clk-ultrarisc.c              | 407 +++++++++++++++++++++
 drivers/clk/ultrarisc/clk-ultrarisc.h              |  71 ++++
 include/dt-bindings/clock/ultrarisc,dp1000-clk.h   |  27 ++
 11 files changed, 752 insertions(+)
---
base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
change-id: 20260522-ultrarisc-clock-a1b7aa59f60b

Best regards,
--  
Jia Wang <wangjia@ultrarisc.com>


