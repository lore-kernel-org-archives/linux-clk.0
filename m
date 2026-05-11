Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3323630AD;
	Mon, 11 May 2026 12:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778503657; cv=none; b=to7Ojaw/qDK3mVr/svReRyBhEfNUBtEarWG/C1Mj9vogkWIpNK/c6qnHKsqNzIVLdVdGpyjV/dT8rSLeOP3XVPZWlzEZniAaLxE7QcVVys8300NrWtNTpiQLQ5xEDUezmqPKLBZph68IPCwcFBuqLLnbXbtcWg2WUuHcgO5eEm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778503657; c=relaxed/simple;
	bh=d/bn89pQhI2eZfLETFYCMIW9bPsVZbUfOMIG98dS5ow=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uCDgsrPyUw+evn7pv1e5iPxTfa06E3WWf6zYXXCUnmUqkWSU0q0h2KP4TzagJK5t32UFkc+7yFQ58qu4YeTLNLsuDxm1sO6k1acC09t9uf2VG8sq3vLl8npc+GpRIbVxZxkEIiWLoHlJ9qDoSgSTWviVEIetE5MZC2aJD1viKzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qw9WdMUN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qw9WdMUN"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C5C3C2BCB0;
	Mon, 11 May 2026 12:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778503657;
	bh=d/bn89pQhI2eZfLETFYCMIW9bPsVZbUfOMIG98dS5ow=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Qw9WdMUNgGqK8AfboWuXU5o59I10StRQMnuTXn91d9s0/qNjfQ+4DFK/jW2yEdESZ
	 mu/hCKvve91312R5G6r/315BmFpsD3LuYQ5z8A2MWkOeZm56kzWov2WG2t13TxFYOG
	 VfuzMIG0gi2oMA+Z7uXmSA2GgKrkvK9cMdCO/U8nfwJIbbSmks3DHjwg20bfOvUy5+
	 kGLnoGUUBpfjkkR1kUluMUwTLeZAqxGgk/tyLArUHJ47ImJl8NXoYI9g7WDnsCFzHy
	 6MrK4PU10sIFlmBphz2bCrjl/MmLXhF/nZV6OWNFPaAt8lYlvtouyOa1F0MJDT0JS1
	 E1NW9NTpxEBcw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25A8DCD4840;
	Mon, 11 May 2026 12:47:37 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Subject: [PATCH 00/10] Add support for A9 family clock controller
Date: Mon, 11 May 2026 20:47:22 +0800
Message-Id: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANvPAWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDU0ND3SQT3UTL+OScbF0zczNTo2TDxFRTs1QloPqCotS0zAqwWdGxtbU
 AQ6L9iVsAAAA=
X-Change-ID: 20260511-b4-a9_clk-67652c1ae56e
To: Michael Turquette <mturquette@baylibre.com>, 
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
 linux-arm-kernel@lists.infradead.org, Jian Hu <jian.hu@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778503655; l=3503;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=d/bn89pQhI2eZfLETFYCMIW9bPsVZbUfOMIG98dS5ow=;
 b=LlCL2gW0AbGiMXgURqP5wwCamriSIUD5Er+NKhm9/SMSQrpiAR/13zXTQ2VlPl/eICNq37nPq
 5A9qDf5T7EmBFn5HX3ZqZb76Rgaz5RkDb4nFutBsWItSUe9zONYQfk9
X-Developer-Key: i=jian.hu@amlogic.com; a=ed25519;
 pk=zHUE+rNtH9z+Sb8au1/elWknjFQmy5QDVkBoxleuOIA=
X-Endpoint-Received: by B4 Relay for jian.hu@amlogic.com/20260415 with
 auth_id=735
X-Original-From: Jian Hu <jian.hu@amlogic.com>
Reply-To: jian.hu@amlogic.com

There are 4 clock controllers in A9 SoC:
- SCMI clock controller: these clocks are managed by the
  Trusted Firmware-A(TF-A) and handled through SCMI.
- PLL clock controller.
- peripheral clock controller.
- AO clock controller.

There are reserved register regions placed between individual PLLs, so a
separate driver is implemented for each PLL, similar to T7.

Compared to previous SoCs PLLs, the A9 PLL controller introduces 4 new features:
1.PLL l_detect signal supports active-high configuration.
  Previous A7 and T7 l_detect signals are active-low.
2.PLL reset signal supports active-low configuration.
  Previous reset signals are active-high.
3.Support POWER_OF_TWO for the PLL pre-divider N;
  the N pre-divider follows the same calculation rule as OD.
4.The PLL input path includes an inherent divide-by-2 divider.

Implement the first three features in clk-pll.c (verified on A9 and T7),
with no impact to PLL logic on existing SoCs. Add a fixed divide-by-2 to
A9 PLL driver for the fourth feature.
 
A9 PLL is composed as follows:
 
                       PLL
          +---------------------------------+
          |                                 |
          |             +--+                |
   in/2 >>---[ /2^N ]-->|  |      +-----+   |
          |             |  |------| DCO |----->> out
          |  +--------->|  |      +--v--+   |
          |  |          +--+         |      |
          |  |                       |      |
          |  +--[ *(M + (F/Fmax) ]<--+      |
          |                                 |
          +---------------------------------+
 
  out = in / 2  * (m + frac / frac_max) / 2^n

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
Jian Hu (10):
      dt-bindings: clock: Add Amlogic A9 SCMI clock controller
      dt-bindings: clock: Add Amlogic A9 PLL clock controller
      dt-bindings: clock: Add Amlogic A9 peripherals clock controller
      dt-bindings: clock: Add Amlogic A9 AO clock controller
      clk: amlogic: PLL l_detect signal supports active-high configuration
      clk: amlogic: PLL reset signal supports active-low configuration
      clk: amlogic: Support POWER_OF_TWO for PLL pre-divider
      clk: amlogic: Add A9 PLL clock controller driver
      clk: amlogic: Add A9 peripherals clock controller driver
      clk: amlogic: Add A9 AO clock controller driver

 .../bindings/clock/amlogic,a9-aoclkc.yaml          |   76 +
 .../clock/amlogic,a9-peripherals-clkc.yaml         |  150 ++
 .../bindings/clock/amlogic,a9-pll-clkc.yaml        |  110 +
 drivers/clk/meson/Kconfig                          |   28 +
 drivers/clk/meson/Makefile                         |    2 +
 drivers/clk/meson/a9-aoclk.c                       |  494 +++++
 drivers/clk/meson/a9-peripherals.c                 | 2317 ++++++++++++++++++++
 drivers/clk/meson/a9-pll.c                         |  831 +++++++
 drivers/clk/meson/clk-pll.c                        |   79 +-
 drivers/clk/meson/clk-pll.h                        |    6 +
 include/dt-bindings/clock/amlogic,a9-aoclkc.h      |   76 +
 .../clock/amlogic,a9-peripherals-clkc.h            |  352 +++
 include/dt-bindings/clock/amlogic,a9-pll-clkc.h    |   55 +
 include/dt-bindings/clock/amlogic,a9-scmi-clkc.h   |   51 +
 14 files changed, 4609 insertions(+), 18 deletions(-)
---
base-commit: ca89c88bcf69daca829044c638a8163d5ce47af0
change-id: 20260511-b4-a9_clk-67652c1ae56e

Best regards,
-- 
Jian Hu <jian.hu@amlogic.com>


