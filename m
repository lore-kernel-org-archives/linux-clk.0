Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61F9224AF7;
	Thu, 14 May 2026 09:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778750915; cv=pass; b=bo2GsRUvBGqLwl2GF0+Qx1dhD8dYquQX8YD++oyQjVlmqD5WnNyFxyPTew9DD9cI3CbdrcoFCRL4WBTnf4XanvuTd6q/+cK6Cwu00kFcTIkn4POPqezCVddo8KOb1tHdqAW3eFiaqSiGQ03Is20ciF3a5lwSXYnr8SDWv9pPmXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778750915; c=relaxed/simple;
	bh=J2/S40TiCw6k69eaOKQI442EBK/SDfU7izqJXnyyuIg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sLm7jnS2VdfdY79Vob8j3e8TZGSo5hX2G4Mq/jbTDyZ/IrCg0n0T5nIKygCOomQF1rAtybJHTvo976y9TDENn73FLS0xj8gmE1Zc/g/cfKcFYiTvvuj+2qDnEBMJ+xDnxKtjLMSggu5cRvljTy3m6lj9L0C1PBjNyINDIBx1asE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=PkZSnwI7; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="PkZSnwI7"
ARC-Seal: i=1; a=rsa-sha256; t=1778750872; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RhHQfrrDQxOr/Pyjl84FNSqHp4hhEjak7rPRt5BzbYPLp/M4/QUWnN3a4kCjHnc1WXeUOiUdaBS5CLnZ55zabk5ILFQUou854P746petd1HA8WCKhYACULKG82mBDvV5kMGj7yDy9ZBj3rOKAdOx30e/z7w8C6gaistPMH6Oy7w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1778750872; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=X59KxAk7T+LmST/s9ktNmLejHGQz11xABLTtF0WEZCM=; 
	b=gzQX9yZeoKKrYU8D4xkqeFCBRxbNH57+uKr6Lf5idsr0XVLFo63s/F/4LQY/bPomRd9wWmjDHEDVLLf/KnIrGj5907AlERGrXCOVSiztX2Bl6N4GFD1b/Fhdtkm8bmR/3alsP9rCx+JJd2HFcJtp6UHNnZe0elGCb0RIy6fRylI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778750872;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=X59KxAk7T+LmST/s9ktNmLejHGQz11xABLTtF0WEZCM=;
	b=PkZSnwI76jhiMlb0EebhcgptBNrQ34C6EVEvjCu3eLGbjDPm4oewouO31OxPPE32
	7VvdSlpGW3L5bxd5P9HtwOxeMRb5WE/DZ3/ryvvBT4+WUg9xW186X5//CWZHc6ktq0f
	JtGu0ouykxPMYHUbUbavZ/4AC7Kp7wBvWr7sjp00=
Received: by mx.zohomail.com with SMTPS id 1778750868733531.0360837030714;
	Thu, 14 May 2026 02:27:48 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH v5 0/6] clk/reset: anlogic: add support for DR1V90 SoC
Date: Thu, 14 May 2026 17:27:16 +0800
Message-Id: <20260514-dr1v90-cru-v5-0-34f3021aab51@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23NQQ6CMBCF4auYrq1pp4VSV97DuIDOKE1UtGCjI
 dzdoomKYfkm+f7pWUvBU8vWi54Fir71zTmNbLlgri7PB+Ie02YgIBMWgGOQ0Qruwo0bXVZaOLM
 Ho1gCl0B7f3/Ftrv3DnS9pWb3Pda+7ZrweD2McrzOtqPkgpOyCk1WIGnaXPzh1ITyuOrI1WxMR
 fhwKSCfcEhcqyo3pcMcEee4+nKQU64Sz8A5qwqUWIk5rn+4khOuE0+scIUxVFn5z4dheAIDbFi
 6egEAAA==
X-Change-ID: 20250922-dr1v90-cru-74ab40c7f273
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Brian Masney <bmasney@redhat.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778750853; l=4246;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=J2/S40TiCw6k69eaOKQI442EBK/SDfU7izqJXnyyuIg=;
 b=NNCEe7KtjpFVpBn6ik3E1byVkkVGWoX74sJ0/BJ3iEp5x0pvVcwqCs6GDRVYw6aZmK6xj4ZC1
 G2JM3g+fyyJC7oSDPMZD0IQ4Z8lHfnHeo+ogInmUWo4zX5i1fOjYfxt
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External

Add Clock and Reset Unit (CRU) support for the Anlogic DR1V90 SoC, as
well as corresponding dts bindings and dts integration.

The CRU driver framework is built around the clock controller as the
primary device, with the reset controller implemented as an auxiliary
device. The clock part refers to the vendor's code [1] to determine the
structure of the clock tree.

The Anlogic DR1 series includes not only the DR1V90 (based on the Nuclei
UX900 RISC-V core), but also the DR1M90 (based on the Cortex-A35 ARM64
core). Most of the clock tree and CRU design can be shared between them.
This series only adds CRU support for DR1V90. Nevertheless, the driver
is structured to make future extension to other DR1 variants like
DR1M90.

Link: https://gitee.com/anlogic/linux/blob/anlogic-6.1.54/drivers/clk/anlogic/anl_dr1x90_crp.c [1]

---
Changes in v5:
- Use the standard GENMASK() macro for clk_div_mask() instead of a 1L
  cast
- Rename the main oscillator from "osc_33m" to "osc" across bindings
  and driver
- Move the main oscillator clock-frequency definition from the SoC dtsi
  to the board dts
- Add MAINTAINERS entry for only the DR1V90 CRU driver instead of using
  broad wildcards to match all DR1V90 files
- Link to v4: https://lore.kernel.org/r/20251231-dr1v90-cru-v4-0-1db8c877eb91@pigmoral.tech

Changes in v4:
- Change common cru_dr1 code into a standalone module for future reuse
- Remove redundant .round_rate() in the clock driver
- Use devm_auxiliary_device_create() to simplify auxiliary device
  registration
- Pass register base from clk to reset via platform_data instead of
  performing a second ioremap
- Update clock Kconfig and Makefile licenses to GPL-2.0-only from
  deprecated GPL-2.0
- Add Kconfig dependency for the reset driver on the clock driver
- Link to v3: https://lore.kernel.org/r/20251216-dr1v90-cru-v3-0-52cc938d1db0@pigmoral.tech

Changes in v3:
- Remove incorrect __free(kfree) usage for auxiliary_device in clock
  driver
- Replace __clk_get_enable_count with __clk_is_enabled in clock driver
- Add a lock to protect register read-modify-write in reset driver
- Rebase to v6.19-rc1
- Link to v2: https://lore.kernel.org/r/20251026-dr1v90-cru-v2-0-43b67acd6ddd@pigmoral.tech

Changes in v2:
- Update copyright infomation
- Add the original vendor author's infomation to the clock driver
- Rebase on the v3 basic DT patch, which is based on v6.18-rc1
- Link to v1: https://lore.kernel.org/r/20250922-dr1v90-cru-v1-0-e393d758de4e@pigmoral.tech

---
Junhui Liu (6):
      clk: correct clk_div_mask() return value for width == 32
      dt-bindings: clock: add Anlogic DR1V90 CRU
      clk: anlogic: add cru support for Anlogic DR1V90 SoC
      reset: anlogic: add support for Anlogic DR1V90 resets
      riscv: dts: anlogic: add clocks and CRU for DR1V90
      MAINTAINERS: Add Anlogic DR1V90 CRU driver entry

 .../bindings/clock/anlogic,dr1v90-cru.yaml         |  60 ++++++
 MAINTAINERS                                        |   9 +
 arch/riscv/boot/dts/anlogic/dr1v90-mlkpai-fs01.dts |   4 +
 arch/riscv/boot/dts/anlogic/dr1v90.dtsi            |  40 +++-
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/anlogic/Kconfig                        |  21 ++
 drivers/clk/anlogic/Makefile                       |   7 +
 drivers/clk/anlogic/cru-dr1v90.c                   | 192 +++++++++++++++++
 drivers/clk/anlogic/cru_dr1.c                      | 226 +++++++++++++++++++++
 drivers/clk/anlogic/cru_dr1.h                      | 117 +++++++++++
 drivers/reset/Kconfig                              |  10 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-dr1v90.c                       | 140 +++++++++++++
 include/dt-bindings/clock/anlogic,dr1v90-cru.h     |  46 +++++
 include/dt-bindings/reset/anlogic,dr1v90-cru.h     |  41 ++++
 include/linux/clk-provider.h                       |   3 +-
 17 files changed, 916 insertions(+), 3 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20250922-dr1v90-cru-74ab40c7f273

Best regards,
-- 
Junhui Liu <junhui.liu@pigmoral.tech>

