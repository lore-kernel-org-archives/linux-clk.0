Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB9B388876;
	Wed, 10 Jun 2026 08:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781079304; cv=none; b=fE64l69M47NW3cPERCiSCHkOr/se76sxYe8Wz69cgK62tlEINEFZFkhgTHdgjRh9gnNMzqjRv/dHlYY99KhHFNJ+laj8neY1pi6ATbIJ6DgUXYEIC98o4gBCZHLbLzC6vAxoU08NHIYFFOVgq6RzYjBbbwFo7aA4aQzw39VT/10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781079304; c=relaxed/simple;
	bh=zbqOoMcHfvoA4jobdCXSeR8psyrC1HWfG49UiZtEOgA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hFBfcrQ0TsaOf1Q9A0E2uC5/au9fdZ/Zwkg+0hiMlB1u9H+WS2fu5TS0dn862gtMfzf1rbNnkguDdZ6gxpmBIhR61sbithziMidTL/yCT/euKYei9DMsaaYzjFP7f8I4skkofujrOO6Z4NIqOwDBLbM9Sw+DtOBRVfU/KZoU7TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WVliarnE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WVliarnE"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DF82DC2BCB8;
	Wed, 10 Jun 2026 08:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781079304;
	bh=zbqOoMcHfvoA4jobdCXSeR8psyrC1HWfG49UiZtEOgA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=WVliarnE9qzYCC5JSsOceME++GeR8LENSyaCnSDfMnUnwUKpygzbfZgmVlBtWILmg
	 1xg/9Pp9ehc3lmZhImYZgsCQ34lLzZpm0QHxIc7wr4V3m1dMkCVesWHJ9dQx+uJBo2
	 kFT9Ng8KJX/K3/rbeuz4jmBCEKzBgsVGIgCOCnA7qR0peQQ/ikySfImOYEy1/h5has
	 Y+UyZcIXB6Rnm9pn4hkxxxpPI2ZJVH2vWZJykbtcPUVtejKOOqm+zuWOaT4Do8jbHk
	 p/RmZ1r8vQdG+XyWyFwgtYjkNiDRwndzwgCFCyteWiGC3fsBrMl+z5bYr/CdN6zn56
	 iXLHmW4VVAn2A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2780CD8CB9;
	Wed, 10 Jun 2026 08:15:03 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Subject: [PATCH v3 0/2] clk: amlogic: Add A9 peripherals clock controller
Date: Wed, 10 Jun 2026 16:14:53 +0800
Message-Id: <20260610-a9_peripherals-v3-0-d07a78085f71@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP0cKWoC/3WMQQrCMBAAv1L2bCRJa2o9+Q8pErdrs9A2IZGgl
 P7d2LvHGZhZIVFkSnCpVoiUObFfCtSHCtDZZSTBQ2HQUhtpZC1sdw8lCY6inZJotGqo7Vp5GhB
 KFCI9+b0Pb31hx+nl42f/Z/2zf1dZCymI1OOM0ioyeLXz5EfGI/oZ+m3bvrwlE0OuAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781079301; l=1973;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=zbqOoMcHfvoA4jobdCXSeR8psyrC1HWfG49UiZtEOgA=;
 b=XTRwIOdCoz0uS9hAn0/t60goTMKKStNMxXoYQUSRMnTL988Q1uD5xZ55OUpuyolRIeRSJ5z4e
 Ubj6G/gAPYxAPyIXmYmNZgNZ5zH/KFEPZsoQjwrTzmNsKo5OTaB4j+h
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

 .../clock/amlogic,a9-peripherals-clkc.yaml         |  160 ++
 drivers/clk/meson/Kconfig                          |   15 +
 drivers/clk/meson/Makefile                         |    1 +
 drivers/clk/meson/a9-peripherals.c                 | 1925 ++++++++++++++++++++
 .../clock/amlogic,a9-peripherals-clkc.h            |  352 ++++
 5 files changed, 2453 insertions(+)
---
base-commit: ca89c88bcf69daca829044c638a8163d5ce47af0
change-id: 20260603-a9_peripherals-4214e79705dc

Best regards,
-- 
Jian Hu <jian.hu@amlogic.com>


