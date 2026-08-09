Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E05F346E51
	for <linux-clk@vger.kernel.org>; Sun,  9 Aug 2026 21:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786310935; cv=none; b=JS4cqdMma5MIoOivyGTyUasAvGhCHp82kqJNAawl/nSBT1P9xfF9vukHmmr2610ZBPIWpaApFQLAT6C1Fj1a6coPipKgfELJhVfEMPFzsHEIc6vK1zYV6LWStpN1PlKQTfuQnllkSlH6Js409IHGiV8H7to1szs0WnLQbBYi6BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786310935; c=relaxed/simple;
	bh=UjBdBzBXYg8Znb/Jp52IyvPHovSzZo17ugDX1DQT9Co=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iB1+dqL/UuT/CI+DyJ9g5/+jTkRPTAjWaSKk/WukQ8H48qR5HTLKyPrfHkL0H/ys6LOT9VrWxgnblMkAUN9UiBha6HGS80EB09Layzx4Q7g72Q08pC1HIZUP0MkxfB5yo+rIZCYAqPfMNEKjvTJbfQiBZOWcuepg23GBMbM73KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IX4AfuNH; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IX4AfuNH"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-480001972b8so411091f8f.2
        for <linux-clk@vger.kernel.org>; Sun, 09 Aug 2026 14:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786310932; x=1786915732; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NkfEeNib2nAHRGypNGRoaM9481JICC18/vExFNYAQBw=;
        b=IX4AfuNHrOXVfrZh6vV2iXVzPhUrahEVoUvDQM8b1ifP2poXpCng+Qhp5e2hHae61Q
         wfxTolp4pCEweEepGCXkGqe+32gnr8vYMwelGsKxibUip52EkG4z/ZKQgHixnn3Ynqpg
         my+xhjKY7roLup9KdNOm1uf6vx9erdppvyRz0c0+AWc/CYyyz3dknHTjYxYlNP1goY02
         6np8OFLRNNrPbeR1vvsrAMnb7M/mHGd9i2fZAK4Y+T8wJ3yTgvPEkF2mhpOgRf/kqWlf
         +xYYnm4E3XoKrAPKJ/6/63PFfYhiBl4VH7p8CjZfUdUUe4abvJ0B+jpni1ZrvWSiiQok
         sYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786310932; x=1786915732;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NkfEeNib2nAHRGypNGRoaM9481JICC18/vExFNYAQBw=;
        b=GBr3HcdLQ2czF5qOc15nJsuRavcuJWxqbrZSymeDW6UWvRjaQBv0oXTZEzbnzRxL00
         zRSqKwlnBhLKzQwY58iw5VHC05JxuEYg+2wCg/kY+VOpQKNd0C+rj4ountPEjntFfdmN
         ic6dg/uTWEFDBqwIHS2vU2U1fZTrTmO66Zrbf5Y8wjGJb58ZASYCaljjmbZdwLcqlWLS
         aAIZXaWyFWv0CX+dWRHLc1Cn9e2BaAhGCyZsFNCN51cZa3doqDpNXGoYr7aD4r5227wb
         fTeIPEuRDg7hfn/GBhDUFnUVWddUOIzhbtefkrPi7ZV3XP2xGwhSNLzQ1HZECYM/MzPi
         0gvg==
X-Gm-Message-State: AOJu0YylGeeozdWEfL5hRqIP6zQ0SuImRVbFjfNjvoIss5I+CZgLVzCf
	e0Zoxjgp6etg2Nt0hEYInHooAcrSSOqNeuGNQkb8oxZlJFEXg56NPeA2
X-Gm-Gg: AR+sD112vjkULfWy8gbpThbDv4ecKfIKR8VuTOGFI8JkpZXRPYObV6LSr35TZW+rih1
	6UnV6cwyVI87uziL5TxlOrG0im1u+/G9O8LCVKAr+MYU4xgIh+56ogxY0p+vZDZ77FzgdrAjYem
	A0YqoxsdORwcPn80w97iolJMDIr0tEp18uba7UNuy16rklEp+IMAxqE28AQQignN7YIk/cA3hJ0
	gs34a5ysMZbOSHqlSu1YVfj0tgbo3eBv9OMbhxfggidkFYZ2khKNnBrWi9DK9SdC/DFTxQP8zV5
	vu7xzVWbqC9dsNFUgMoMRw1nnscjGukf0FFZmwpY8cq+06qTmIBk9O/l+OPfUADuIufFIiUQevO
	sKzmM6pjno5Ndes7cJmgnSWPtUg6eH7f4m027k1BVaIL05T/B0IOmGy9sx8sRP6pKmZR6IPz3er
	NDbSMb9S6riusGpZlW/ZM/vJ77JzKzCiJhwwfSk2HoWzUvcf8UzLyZa7Fv39WN+jEHqz3sXKQ=
X-Received: by 2002:adf:e012:0:20b0:47f:753c:5393 with SMTP id ffacd0b85a97d-47fec4e888cmr46287976f8f.6.1786310931797;
        Sun, 09 Aug 2026 14:28:51 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.226.68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e8c5asm28987451f8f.18.2026.08.09.14.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 14:28:51 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Subject: [PATCH v10 00/12] ZTE zx297520v3 clock bindings and driver
Date: Mon, 10 Aug 2026 00:28:19 +0300
Message-Id: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XQSW4DIRAF0KtYrNNRUcxe5R5RFgyFjeIh6XZaT
 izfPdhegNrLKvE+Hy5sorHQxNarCxtpLlM5HurA4WXF4tYfNjSUVBcMATUoDsPfGV3cfQ5IMgl
 HgqONrJ7+GimX8z3q/eMxj/T9UxNPjyULfqIhHvf7clqvdLDR+qy4TEa4BEKorJRxQVlFgMEHs
 t6gYbesbZlOx/H33nLm97CnPjMfYCAefMw5k9PmbbP3ZfdaL7xnzNg73hxWhy4DpSgAslo60Tl
 0zYnqosmkJHlhbV462Zzmujl5c945GRIiubR0qnNom1PVGZczSEmSO1w63ZwBbE5XJ4wJBmS2E
 OXSmc5x05ypToKVnMccs9BLZzuHnbO3np6DCfU3eXp6n2vO9j1ddQmUEpCsSmh7d71e/wGNS1i
 uqwIAAA==
X-Change-ID: 20260510-zx29clk-2e4d39e3128c
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8252;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=UjBdBzBXYg8Znb/Jp52IyvPHovSzZo17ugDX1DQT9Co=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqePEIVd1rySIKpgStz0skca3tAjLUKeIDBd3ak
 TuN3zJhA/WJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCanjxCBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJwqw//VjelfyUPqnKG3P8Wwygeo52MxYK6/ZS
 uj8SLtCoSF/nexyZuRsXvy9uE3IfKYfWh9QiFtSMXYHipVZ9qcURCX2wiPgA6mdORiBeB1VNX2D
 udaYFKd9BagBDvD3R49CvHPaq627sQwXgpOr5sA9f3PII+zTaytFguaC3eMtl+USCO3GLuVO5B0
 p6bQycal1JuePm+QTuaIDtT9lXT7BVfN1qOlmPeXX5LKMkKOPE16MQYHyx13FROdHDmZFPZd76J
 CUhJlNVr0qaAQdGQqdF3PI517uT6bOMMTBaH5O3rddRY4jjYVtGi86BV3XqSDQ/hsK0Mc2cpzIw
 L3hL4mVJp9NRFo/o2HedHrOmWUiGyr1r+BCWTPH/uuUv95YAunEtdZOxc/QmJKR2ICD6ycrwuXi
 Ldvlwoyd3bsJrEQ9bVDvTdbB7JhhtXlRY5GBlZRSGEASzazwxEDtHxQP5CN0BmxKRhTFLxVS6g+
 LGFuxYzXZhiR77U1sOVjo9j8fRw2UYiI2IWFT++LP/QJ6McRtTzpm2VZ/RtUPQtGoMdbcAbhKsY
 oetY7k2H1EGq+GbqqJM4jYuekIkxZWz3kFJ8CgsxPaTEltoNngkuZzdFkJcxNFOetXNb9XWuO7I
 45xY2Sw0sdxGQvxzw9/rQdSwNN030khPgHu4luzLbf2yeBCrdRek=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

Hi,

I am sending version 10 of my zx297520v3 clock patch. It fixes review 
issues and refines the ZSP DSP rproc clocks and resets a little bit.

I think the list of clocks in my driver is fairly complete; It is 
certainly a lot better than what the downstream ZTE drivers have. I 
deduced a lot of it by trial and error. I am sure there are some clocks 
missing that will need to be added to the binding later. AFAIU adding 
clocks is not an issue, but removing or reordering them is an ABI break.

Merge dependencies: The binding patches (1, 2, 3) and DT patch (12) in 
order. The MFD parent (4) is independent, although changing the ordering 
likely needs trivial adjustments in MAINTAINERS. The clock driver 
patches depend on the headers added by 1-3 and apply in order 
(5-10). Reset needs headers (1-3), but it is independent of clock.

Though in practice mfd, clock and reset drivers are dead code until 
patch 12 adds the DT nodes. Clock and reset drivers won't be 
instantiated without the MFD parent.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
What's the next step after all the individual patches are reviewed? 
Should I submit them as pull requests to the DT, mfd, clock, reset 
trees? Or do the maintainers pick them from the list?

Changes in v10:
*) Clock infrastructure: Fix issues pointed out by Brian. The individual 
patches have more details in the changelog
*) MFD infrastructure: Remove _MFD_ from the match data enums
*) Further refinement of LTE related clocks and resets: The ZSP rproc 
has two resets, one in topcrm and one in matrixcrm. I don't know what 
the difference between them is, but both need to be deasserted for it to 
work. Previously I thought the matrixcrm register 0x3c is a clock. The 
clock gate is actually in 0x34.

Changes in v9:
*) Use parent_data in the clock driver instead of parent_names. That 
required some infrastructure to keep track of registered clocks rather 
than devm-and-forget. A nice side effect is that it uncovered a missing 
top->matrix clock link. (Brian)

*) Remove the self-referencing USB PHY reset in topcrm (Krzysztof)

*) (Hopefully) get unevaluatedProperties and additionalProperties right 
in topcrm (Krzysztof)

*) GMAC and SDIO on the matrixcrm controller need topcrm's ahb clock as 
parent. It is added to Matrix's binding and fixed in the driver

*) LSP reset and pclk handling moved from clock child to mfd parent 
driver

- Link to v8: https://lore.kernel.org/r/20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com

Changes in v8:
*) Put #phy-cells into topcrm. The mfd child will have to assign itself 
the MFD parent's of_node to satisfy the check in phy-core.c's
__of_phy_provider_register().

*) Added another register to matrixclk that controls in-controller 
distribution gates. No functional change, but it nicely confirms the 
top->matrix interface

*) Changed clock indices to start at 0, adjusted driver to not use 0 as 
"do not export" marker.

*) Rename DT fixed clock nodes from osc26m -> clock-26m and osc32k -> 
clock-32k

*) Fixed more issues pointed out by Sashiko

- Link to v7: https://lore.kernel.org/r/20260717-zx29clk-v7-0-408411cfcf36@gmail.com

Changes in v7:

*) Moved DT bindings back to clock/ (Krzysztof)
*) Added a usb-phy child node to top to expose the USB status register
*) Add clock gates that control input of PLL clocks into topcrm and 
forward to matrixcrm. Strip down matrixcrm inputs in the bindings to the 
known clocks in this register
*) Add DDR clocks and resets, arm arch timer clock. They are marked 
critical and tell CCF not to gate off the aforementioned input/forward 
gates
*) Remove syscon from matrixcrm (Krzysztof). The DDR mailbox system is 
on a different controller (soc_sys at 0x140000). ZTE's code merely 
controlled clocks in matrixcrm, which doesn't require syscon on this 
controller.
*) Consistently use double quotes in bindings and full include paths 
(Krzysztof)

The individual patches call out changes in more detail.

- Link to v6: https://lore.kernel.org/r/20260702-zx29clk-v6-0-377b704f80c4@gmail.com

Changes in v6:
*) Use MFD for all 3 controllers - I hope both Conor and Philipp will 
agree. I kept top and matrix bindings in soc/zte and lsp in clock/ 
though.

*) Clean up issues found by Sashiko. I pointed them out in the individual 
patches. They are localized fixes and don't affect the overall design

*) Small code consistency: Changed "zx297520v3_lsp" to use "-" , "rst" 
in driver names to "reset"

Changes in v5:
*) Use MFD instead of aux bus for top and matrix clocks
*) Move top and matrix bindings to soc/zte
*) Give USB PHY its own resets
*) Other localized changes are noted in the individual patches
- Link to v4: https://lore.kernel.org/r/20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com

Changes in v4:
*) Use syscon and regmap instead of raw IO
*) Move reset to its own driver on the aux bus, but keep reset and clk 
in the same binding as it matches the way the hardware works
*) Go back to having matrixclk in its own device because syscon deals 
poorly with multi io reg devices. List all PLL outputs from topclk as 
inputs to matrixclk
*) Some more hardware research: Figure out the parents of the 4 possible
GPIO clock outputs and declare them in the driver. They are unused on 
the hardware I have, but they show that all PLLs can be used.

- Link to v3: https://lore.kernel.org/r/20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com

Changes in v3:
Model top and matrix clocks as one device
Add PLL driver
Fixed a few issues found by Sashiko: register lock, some missing devm_, 
error handling

v2: Fix build issues introduced by checkpatch.pl fixes that I didn't 
spot earlier.

---
Stefan Dösinger (12):
      dt-bindings: clk: zte: Add zx297520v3 top clock and reset controller
      dt-bindings: clk: zte: Add zx297520v3 matrix clock and reset controller
      dt-bindings: clk: zte: Add zx297520v3 LSP clock and reset controller
      mfd: zx297520v3: Add a clock and reset MFD driver
      clk: zte: Add Clock registration infrastructure
      clk: zte: Add regmap-based clocks
      clk: zte: Add zx PLL support infrastructure
      clk: zte: Introduce a driver for zx297520v3 top clocks
      clk: zte: Introduce a driver for zx297520v3 matrix clocks
      clk: zte: Introduce a driver for zx297520v3 LSP clocks
      reset: zte: Add a zx297520v3 reset driver
      ARM: dts: zte: Declare zx297520v3 CRM device nodes

 .../bindings/clock/zte,zx297520v3-lspcrm.yaml      |  101 ++
 .../bindings/clock/zte,zx297520v3-matrixcrm.yaml   |   98 ++
 .../bindings/clock/zte,zx297520v3-topcrm.yaml      |  122 ++
 MAINTAINERS                                        |    9 +
 arch/arm/boot/dts/zte/zx297520v3.dtsi              |  101 +-
 drivers/clk/Kconfig                                |    1 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/zte/Kconfig                            |   28 +
 drivers/clk/zte/Makefile                           |    6 +
 drivers/clk/zte/clk-regmap.c                       |  237 +++
 drivers/clk/zte/clk-zx.c                           |  192 +++
 drivers/clk/zte/clk-zx.h                           |  137 ++
 drivers/clk/zte/clk-zx297520v3.c                   | 1599 ++++++++++++++++++++
 drivers/clk/zte/pll-zx.c                           |  580 +++++++
 drivers/mfd/Kconfig                                |   13 +
 drivers/mfd/Makefile                               |    2 +
 drivers/mfd/zte-zx297520v3-crm.c                   |  117 ++
 drivers/reset/Kconfig                              |   13 +
 drivers/reset/Makefile                             |    1 +
 drivers/reset/reset-zte-zx297520v3.c               |  237 +++
 include/dt-bindings/clock/zte,zx297520v3-clk.h     |  145 ++
 include/dt-bindings/phy/zte,zx297520v3-topcrm.h    |   12 +
 include/dt-bindings/reset/zte,zx297520v3-reset.h   |   62 +
 23 files changed, 3802 insertions(+), 12 deletions(-)
---
base-commit: 6b8c8af514d739d0335f5579b585e02babe8a727
change-id: 20260510-zx29clk-2e4d39e3128c

Best regards,
-- 
Stefan Dösinger <stefandoesinger@gmail.com>

