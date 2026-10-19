Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A718345D911;
	Mon, 19 Oct 2026 04:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792385746; cv=none; b=fkBXApSu0FSqHjmJYUgd06cM7WN7ZZMLtC4Br6XcixL9uFVUhrP8/CIGVopSn1mSMYo3ymGfJE4VOtMcsgkmrfQE8Y0oSCQzw6sUTFVoj9QvEGhDkq+UGgGmA0+g+IbRioTgdQm1wnondp+VbBybS1rKATfKfs10ZiRL4FfPazw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792385746; c=relaxed/simple;
	bh=ZhUYbZ95NLFa/Rn1zmjWlfg7lpCSN/HC3tfwt4ccO2k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WdnxFP2i7UkP1qIGiQdNNRHM0YYobesSZ5iezq+QZfZX0xBePgj2VJ/zMm7ce6HsPFNS+6FS4nx6vqXeKv7oV9Vk79CJhvvvcjVVc/VC2AxwWWEEbPd13BOB6rrNcCK2sIaCdEIAp34KBSZfvM2cBLuUpRR3vnu5R43Jy4AKSBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KxPoUGhK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KxPoUGhK"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0F87CC2BCF4;
	Mon, 19 Oct 2026 04:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792385746;
	bh=ZhUYbZ95NLFa/Rn1zmjWlfg7lpCSN/HC3tfwt4ccO2k=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=KxPoUGhKuoAQgV3Y34Pe7Pw6PAXKXgRRH2HliH5txWP0NlsFFc0VGcQs49wH2qxop
	 zPrMseUdsVBFn/8O67jq07sSnSIDJKLVZOx41boTlVoHiV1x7kD5cqFcBSvJ5YGy7i
	 MmvImxNMifLmuxu0WnMDFSSGCq/9Rs88Dcc3K5vEeHowb/5O1SiODiihd6r5VIcGZ3
	 7GlDijpjWr54N9Ucxy+d197X+Kf7Na8sXsAwiNsjorKpTORj/R21gl0kXI3CmA/Zue
	 Qnx6G8s3i+Zb6MU41c37vujAeCgfi0PMEi45k0QfqTpoBQLl+7fl+cbQI9ZPKmHnhB
	 BelyNRV7pR0Tg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF958CCF2D4;
	Mon, 19 Oct 2026 04:55:45 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Subject: [PATCH v10 0/5] arm64: add Ambarella CV75 SoC support
Date: Mon, 19 Oct 2026 12:55:38 +0800
Message-Id: <20261019-cv75-soc-v10-0-d386065e2dd5@ambarella.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMqi1WoC/zWNQQ6CMBBFr0JmbU2pUAor72FYlHGQGqCmxUZDe
 ncLxGQ2/+f9Nyt4coY8NNkKjoLxxs4p5PyUAQ56fhAz91SA4ELmnFcMQ1Uyb5GRFKq/lFXPpYS
 Evxz15rO7bu2R/bt7Ei7bfiMG4xfrvvuzUG/cX5sf2pCuZpwVSiIKVeuiU1c9ddrROOoz2gnaG
 OMP/TT72rYAAAA=
X-Change-ID: 20261007-cv75-soc-e628f357f066
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org, 
 Brian Masney <masneyb@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 Long Zhao <longzhao@ambarella.com>, Long Zhao <zl020895@163.com>, 
 linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792385743; l=4886;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=ZhUYbZ95NLFa/Rn1zmjWlfg7lpCSN/HC3tfwt4ccO2k=;
 b=LResnsxn04Owvm0w55MCC1Uo/RgsQXcvWGXasac6sOU6bloesyJhMTc+5mirtAswNhKvCIiXf
 z5B5m98br0KAJNrpJ5SG+bsFZqqtb4ObU9Jvqw1CJtCCYeP2jL0AAtM
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com

Apply the patches in this order:

1. board binding
2. RCT clock binding and clock ID header
3. RCT clock driver
4. ARCH_AMBARELLA and the CV75 SoC and EVK device trees
5. MAINTAINERS

cv75.dtsi includes the clock ID header, so patch 2 has to be applied
before patch 4. The DT sources then preprocess without a separate
clock series.

The ambarella vendor prefix [1] is in linux-next (applied by Rob).
Lee has applied the CV75 secure scratchpad syscon binding in the
mfd tree. This series does not repeat either of them.

GPIO [2] and UART [3] stay separate series. The prefix they need
is in linux-next. Their drivers do not depend on it. The CV75
pinctrl binding and driver are not in this series.

This is v10 of the SoC and clock patches from the combined CV75
series. The posting on Oct 9 numbered them v1 after the split. That
was a mistake. This series merges the SoC v1 and the clock v1.

Tested on the CV75 EVK. The board boots. That boot used a local tree
that also includes the GPIO, UART and pinctrl patches.

Changes since the combined v9 [4]:
- Fold the clock v1 into this series (Krzysztof). The clock series
  will not be resent:
  https://patch.msgid.link/20261009-cv75-clk-v1-0-6959b4da83c5@ambarella.com
- clk: drop CLK_GET_RATE_NOCACHE. The driver only implements
  recalc_rate (Brian).
- clk: use reverse Christmas tree order for the locals in
  cv75_pll_recalc_rate() (Brian).
- clk: the RCT helpers stay in clk-cv75.c for now. Only CV75 uses
  this PLL model, so the common part can move out when another SoC
  shares it (Brian).
- binding: #reset-cells stays on the RCT for now. This series has no
  resets= consumers, so the reset provider and the soft-reset IDs
  can wait for the first user (Brian).
- Link to v9: https://patch.msgid.link/20261001-cv75-v5-v9-0-486cc289a4b8@ambarella.com

Changes since the Oct 9 SoC posting [5]:
- the fold, clock and reset items listed above.
- Link to that posting: https://patch.msgid.link/20261009-cv75-soc-v1-0-808330e93ff1@ambarella.com

[1] https://patch.msgid.link/20261014-cv75-prefix-v1-1-fe95ed567880@ambarella.com
[2] https://patch.msgid.link/20261009-cv75-gpio-v1-0-5836bd438423@ambarella.com
[3] https://patch.msgid.link/20261009-cv75-uart-v1-0-38c098efaa99@ambarella.com
[4] https://patch.msgid.link/20261001-cv75-v5-v9-0-486cc289a4b8@ambarella.com
[5] https://patch.msgid.link/20261009-cv75-soc-v1-0-808330e93ff1@ambarella.com

To: Arnd Bergmann <arnd@arndb.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: soc@lists.linux.dev
To: linux-arm-kernel@lists.infradead.org
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-clk@vger.kernel.org
Cc: Brian Masney <masneyb@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev
Cc: devicetree@vger.kernel.org
Cc: Long Zhao <longzhao@ambarella.com>
Cc: Long Zhao <zl020895@163.com>
Cc: linux-kernel@vger.kernel.org

Assisted-by: LLM
Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
Long Zhao (5):
      dt-bindings: arm: add Ambarella CV75 platforms
      dt-bindings: clock: add Ambarella CV75 RCT
      clk: ambarella: add CV75 RCT clock controller
      arm64: ambarella: add ARCH_AMBARELLA and CV75 EVK DT
      MAINTAINERS: add ARM/AMBARELLA SoC support

 .../devicetree/bindings/arm/ambarella.yaml         |  24 ++
 .../bindings/clock/ambarella,cv75-rct.yaml         |  64 ++++
 MAINTAINERS                                        |  14 +
 arch/arm64/Kconfig.platforms                       |   6 +
 arch/arm64/boot/dts/Makefile                       |   1 +
 arch/arm64/boot/dts/ambarella/Makefile             |   3 +
 arch/arm64/boot/dts/ambarella/cv75-evk.dts         |  30 ++
 arch/arm64/boot/dts/ambarella/cv75.dtsi            | 177 ++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/ambarella/Kconfig                      |   9 +
 drivers/clk/ambarella/Makefile                     |   3 +
 drivers/clk/ambarella/clk-cv75.c                   | 361 +++++++++++++++++++++
 include/dt-bindings/clock/ambarella,cv75-rct.h     |  14 +
 15 files changed, 709 insertions(+)
---
base-commit: 34cf6dafc47441dfb6b356a095b89c3585a93714
change-id: 20261007-cv75-soc-e628f357f066

Best regards,
--  
Long Zhao <longzhao@ambarella.com>


