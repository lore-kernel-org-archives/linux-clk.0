Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FB1317148;
	Wed, 17 Jun 2026 06:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781676187; cv=none; b=n77L/HK5JURM7FusvPhRBOxINxL/B1x+1xP4XY7iEAF8IEShjGbm8Tj88aogLBWLa7YumD6aT+qJ83PwUdIg2Mv2BuNRCn3hWrHqpcpYZcz+ZeQmO70KRXfeN6q2B0u2hQT1lodP8LEjeZfgnYrs4wLGMVGmmh9MVUhT0ZWq8Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781676187; c=relaxed/simple;
	bh=k4Je7gBSERMamWU1GgAynav5HbHuPvN2n+14RP4eS0Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XX8bpCwRJPuAwIaOCKOJq6t6aYHVM1xGF6cOdKO9cMwVJapIkBmM8/qTxRnWnkd9NTB/Pcue0knTM/GkbVHKzfCwg6cic3O8LHvNydsM9WMPazYRPHudmEozcwUhXYUEzLVZh/YG/5caHyl24l86v8UGCQK0NgD3SZZ7uTdFN/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OEmr6oxG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OEmr6oxG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01D18C2BCB0;
	Wed, 17 Jun 2026 06:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781676187;
	bh=k4Je7gBSERMamWU1GgAynav5HbHuPvN2n+14RP4eS0Q=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=OEmr6oxG1F+ob053yog7L2H6Kl/+lfoGaEDTejBDzyTstrvI1O1jGgAO1zOwJ1duu
	 TgXFutzeVMNzrenrUIJzBGCLyuZGmx4FQ1y0EDRSSdO1icEg2yZQWLMqr4b5fpiOgh
	 3en2980RBX0a8X+v1coYxDQMhUB58Rc31C53+a7ganlEmFBPDqSOdQUobI9CFgz5my
	 AwE174DIyX3dwbxs6JZCN8NTy0xoam7lIxkiKOYJdYex9USZCYnP1uab4u04OLo/2h
	 xh+wJDJoXZThwIlF+MW+aBw1xb+Cnh6e1luxljcFI/0oDaGsCPKqykRuLRxO1PJxaY
	 ibkzpHREtgIhg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8580CD98EE;
	Wed, 17 Jun 2026 06:03:06 +0000 (UTC)
From: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>
Subject: [PATCH v2 0/2] clk: ultrarisc: add DP1000 clock support
Date: Wed, 17 Jun 2026 14:02:53 +0800
Message-Id: <20260617-ultrarisc-clock-v2-0-9cb16083e15e@ultrarisc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI04MmoC/2WNyw6CMBBFf4XM2pq2CAZX/Idh0Q6DjCI1bSEaw
 r/LI3Hj8iTnnjtBIM8U4JJM4GnkwK5fQB8SwNb0NxJcLwxa6lxmWouhi954Diiwc/gQRtmzMVn
 R5NLCsnp5avi9Fa/VzmGwd8K4Zlaj5RCd/2yXo1q9vZ4r9VcflZBC10VK1p4QVVr+jCO6J1TzP
 H8Bsb5SasQAAAA=
X-Change-ID: 20260522-ultrarisc-clock-a1b7aa59f60b
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jia Wang <wangjia@ultrarisc.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781676184; l=2055;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=k4Je7gBSERMamWU1GgAynav5HbHuPvN2n+14RP4eS0Q=;
 b=Cl9KmxJ0tjSzJfWFSwgvTlUUAVUGUOPRZW1be1d0yHbmpQowZXpn96mH71aUGlWKNy+z+y/v4
 /LcqAmri7TkARU9x/ug37CGFKhiy19LOCqBnjRpOeoc5eijMZdtBXJS
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-Endpoint-Received: by B4 Relay for wangjia@ultrarisc.com/20260515 with
 auth_id=779
X-Original-From: Jia Wang <wangjia@ultrarisc.com>
Reply-To: wangjia@ultrarisc.com

This series adds the devicetree binding and the clock driver for the
UltraRISC DP1000 SoC.

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
Changes in v2:
- Drop the redundant clock-names property from the clock binding.
- Move DP1000_CLK_NUM from the dt-bindings header into the driver.
- Clarify the divider load-bit handling in the common clock core.
- Validate that all advertised clock IDs are populated before registering
  the onecell clock provider.
- Rework divider composite clock registration so the driver builds
  correctly as a module.
- Link to v1: https://patch.msgid.link/20260611-ultrarisc-clock-v1-0-2d93ebb4cc13@ultrarisc.com

---
Jia Wang (2):
      dt-bindings: clock: ultrarisc: Add DP1000 Clock Controller
      clk: ultrarisc: add DP1000 clock driver

 .../bindings/clock/ultrarisc,dp1000-clk.yaml       |  60 +++
 MAINTAINERS                                        |   8 +
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/ultrarisc/Kconfig                      |  18 +
 drivers/clk/ultrarisc/Makefile                     |   4 +
 drivers/clk/ultrarisc/clk-dp1000.c                 | 153 +++++++
 drivers/clk/ultrarisc/clk-ultrarisc.c              | 459 +++++++++++++++++++++
 drivers/clk/ultrarisc/clk-ultrarisc.h              |  73 ++++
 include/dt-bindings/clock/ultrarisc,dp1000-clk.h   |  27 ++
 10 files changed, 804 insertions(+)
---
base-commit: b1cbabe84ca1381a004fb91ee1791a1a53bce44e
change-id: 20260522-ultrarisc-clock-a1b7aa59f60b

Best regards,
--  
Jia Wang <wangjia@ultrarisc.com>


