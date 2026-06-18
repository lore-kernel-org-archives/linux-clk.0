Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA1E3DEACC;
	Thu, 18 Jun 2026 09:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781776304; cv=none; b=nxmpRUViUZlkFpc9qpN3ra7pZc/8Tmh4wk8iZiC5kSPqpMU3WHwJ+11KvhUPsN+t/+KxBqtkjYQBwgTn2ZlTT8OUzrb2X4kRsy/PvoTERXStPwSTCcqkvq0gU8RHY1/mhCJKKxv3CG+7aX8jXqv/WfknaUBbU1kLjk3XiQ98pOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781776304; c=relaxed/simple;
	bh=2iDQPlbmPVUAaFjbr8wzhMjUOmj3jSkBapShfOfT0FE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=G6WSRCBHT0iaCFTu2PqQSENxmxMlzLUD9cve+NJ2ELrVNcDQp6Qfezn6o70UClk/wsA1HhMMacXaDkUx9usbSc7bFDsTbWBYzKydurVCrNwG/yMT1oI/+jbTuU5BSTu3fpg69sHhZoIHQOZQ0RL+kPi8Ga3SNajY6bm9MKa+0r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GBFQAin0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GBFQAin0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2797C2BCC9;
	Thu, 18 Jun 2026 09:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781776304;
	bh=2iDQPlbmPVUAaFjbr8wzhMjUOmj3jSkBapShfOfT0FE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=GBFQAin0P6D01UvIazGK5PA2+WWrRoLYbJ48CViG0EcsizyTw6RqSUmBZVvbE2jXJ
	 zhjNEf5Ygj6pYlCOHWWBSzBLbmyekOZdvU1H/kQ/RZ66yg2KpSqJhFBrZ3aHL91TZE
	 bcRyzsjhBFRRGXSQpvJNUAMSXzNK6qgDbcWc9wwEIS8J91mURnbRUfd4Iy0mlayKvC
	 0HyDkCDT/7N9TTo0aj7YKz6cpiz9S3g0xYz0RTvQmDi6bIefayNkRLh4y+6Q1V9HG0
	 +64htX8GyarBxdvTLObvb/E1zf6g4vBFPdGSEXYv3M1D6xb4Xdag3UC6ru8eQH9ixv
	 0bpOnGdCjvZVw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8D7CCD98ED;
	Thu, 18 Jun 2026 09:51:43 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Subject: [PATCH v4 0/2] clk: amlogic: Add A9 peripherals clock controller
Date: Thu, 18 Jun 2026 17:51:35 +0800
Message-Id: <20260618-a9_peripherals-v4-0-fe120de44e77@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKe/M2oC/3XMSwrCMBSF4a2UjI3cpI+0jtyHiMT0tr3QNiGRo
 JTu3bQjRRz+B863sICeMLBTtjCPkQLZOUVxyJgZ9NwjpzY1kyArqCDnurm5dHEDej0GXkhRoGo
 UlK1h6eQ8dvTcwcs19UDhYf1r96Pc1r9UlBw4orjXBrTAypz1NNqezNHYiW1YzD8AAT9AnoAWl
 FY11GWnxDewrusbn7nRbe8AAAA=
X-Change-ID: 20260603-a9_peripherals-4214e79705dc
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Jian Hu <jian.hu@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781776301; l=2378;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=2iDQPlbmPVUAaFjbr8wzhMjUOmj3jSkBapShfOfT0FE=;
 b=Rcsd4H/kqYgUEF8g0pEECbfhxdxgSN0/haNr/6E85d3PyHkVzxW039C51cMbdwT075NIlGG28
 I1oVsI4Fr1+C6+cFhrR0Q7QR1WKsJ8wXPrfUpiA11Ahb2t+ot4G/WdI
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
Changes in v4:
- Expose channel 3 for gen_clk.
- Add suffix 0 for some clocks.
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
 drivers/clk/meson/a9-peripherals.c                 | 2096 ++++++++++++++++++++
 .../clock/amlogic,a9-peripherals-clkc.h            |  352 ++++
 5 files changed, 2628 insertions(+)
---
base-commit: ca89c88bcf69daca829044c638a8163d5ce47af0
change-id: 20260603-a9_peripherals-4214e79705dc

Best regards,
-- 
Jian Hu <jian.hu@amlogic.com>


