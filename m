Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929C64195A3
	for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2026 18:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790188156; cv=none; b=H7gTZnEgQS5WQtTryAiKkisp5xEArqsJtL+ZyR2sH2GKS4BU8NVaY7tj/eYhkR+WEUw5FyFnQXJWx1rw8hEo0WxgjgKYQmm9RalJmPIzZAr8L8XHAiuhuPMQfeMO6IdNmw45Lv8FZHF7IYet2VYlW/9simlf1MEhZIksj0FqOQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790188156; c=relaxed/simple;
	bh=odLYXBLLTAUFSAcct0giyKXVG6mXLsRBOh+Bu7S8H/s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pL5NS7/OPTFlEGJPomq53aUgaQMgQ0ZjSmkWdJwtLuXCuB7sSEmWKnhsuPOsp2sVkZom0lDcuM2MMHJ91jJ4So22t0NTbVXq8O/wWvBIoJA/6zJcKZU1QaayJqxXXS4AlBSOX5RidepOCbjT+w7FMGjDgSVTi4Z57Xh0lXmE+Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=omy7rOxZ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="omy7rOxZ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccead2aecso5865255e9.0
        for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2026 11:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790188150; x=1790792950; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AfG7nyA7zL2ZXlQFwQ/K4+VIU8z6ZJGl6YJba+Cg2mQ=;
        b=omy7rOxZ4G4Etq6/OAmSNVUdarqd6GTtdljtbeAxwQiIASuEPT+4l7Yvs6G3FO/Ai4
         Ihirt86HaXB4YtBc1GpG+e8sjlLuZP+N10ii7qlzsbXEf0XY5AeB53jvXeRNPPeNGgpu
         d4XkGO4uoLLQR/UavF4d2pq/gA2MrySyaFdaZ133Qv2mLFsmYlDal+ULG/8FNpYyNoid
         0NFu6MHcconpuNmyvpUslEmow3cuxZ97yNpHNB44KbBZdYFTTmolCip/bg32diOYdHAQ
         aOj/hvwyKKbxaR7Mk3mW39bkcFucAKD3mSn1gCc1rmIq49aqqGSngP/ZKb/aMBqNyAW7
         hT4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790188150; x=1790792950;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AfG7nyA7zL2ZXlQFwQ/K4+VIU8z6ZJGl6YJba+Cg2mQ=;
        b=ih2ZNpDxch/StONcfHDjSNg3uOq0HxnOU41zSYpD3qac3RrbQS76t6A8muxS/jYHaN
         KsiqKseP5qdhptwEsg+uTP2MjOztOycs0tTGKZ0TixalpLKycneEqd2IgycgMal1NFgZ
         qpoy8jBlQGunUmfQvf8nbVJ697lbkER62Zq887vQ1eesufVgJMGe9a64I1gRfefpxHms
         pAGHiR0wcuk56VO1qkmzOiHlM1SFrDvqCgOTbGXhzM/hjtIERaGe1xrbOG9yWwW+TCoA
         RcU2d/DBCIa6jHuZ9nZVFzvSMqlLwGieS/1OiaXUhg4aX3lD8hu70ohNQYfbOySFXcbI
         A30Q==
X-Gm-Message-State: AFuF++kD+6ofiWp9LA5dUe3vrV7tOfJChgIm39lh5pNxR5nWNEGRqU1a
	zan3vvQGaV6tEz8r9H0nq6HAUqhG2YlVteLGLW1RLKs0mzzpVwOYZvna
X-Gm-Gg: AYBFou2sIOi/NfLu18smNnftLvlJC8uBHGBudKJQ1SOAAdAE19AmxUVbTXCFqUGaV2p
	1aeQz1KEcf1xq1rLmZ07+pFH5aKjxLDQSUHvVqnRfcQrIGG9W686RdcUxGeubRmxci6w+KE84EY
	fp1xvsNa/quPp4ZoCUe41I+Ih9wrVp2tBHOFKjSF/yt/PlgPoCBwWENAHrdFzZLni0FL2lndzv8
	I8NHvriYhlroJ5r4cAGl12pFAc7VFjOTzmmOf8wQVXU2zSPy2th31CAp0IZ3ECosbMuGcW7DNcj
	PGY0vHCEhsT8/3/rv6rUqge+PxulKy13hN9L33983/T0lJ2XzBMiI+HWSRSZcEm8D8is4ff9Esu
	WSbWaLkLZnJ4i1vxy5KFyzqcyUqwNq6oCZ5Aov0V7H49MEuVAuQMJtT7HFnYM+xX3FhNZx00KEl
	+8SaNR1mKmzJ4ho6gNNr7iKgbtm9TGWOyiW0qoSCrJ1CS+TSDJszptNMulTSu8aRDh05rMB076A
	/sh
X-Received: by 2002:a05:600c:1d0c:b0:49f:bc43:9e96 with SMTP id 5b1f17b1804b1-49fe66d103bmr1265635e9.8.1790188150285;
        Wed, 23 Sep 2026 11:29:10 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd3d5csm4711835e9.14.2026.09.23.11.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 11:29:08 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Subject: [PATCH v12 00/12] ZTE zx297520v3 clock bindings and driver
Date: Wed, 23 Sep 2026 21:28:46 +0300
Message-Id: <20260923-zx29clk-v12-0-9c243796b6d2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XSzVLjMAwH8Ffp5EwYSZa/OPEezB4cW4IMlO4m3
 Q67TN8dtxxs0qM9/v0tW/ocVllmWYeH3eewyGle58N7XSDd7Yb8kt6fZZxL3RgIyIFFGP9/UMx
 vryMJFxPFIIU81NO/F9H54xr19Ot7vcifvzXx+L05TGmVMR/2+/n4sEsh24hS3OQ8RbQCk1gf2
 Ghkkyh5MkmVYbhkvczr8bD8u1Z5wmvYTT0nHGEUnFJWVYnOPz7v0/x2Xy+8Zpyod9gcVUdRQUo
 2AGq3znSOYnOmuuxVLEsyIejWcXMOXXN8cSlGngqRxLJ1tnMUmrPV+agKzMIYaetccx6oOVed8
 X7ywBog89b5zqFvzlfHEBgxa1bjti50jjoXLnUmBD/V38Ry877YXOjrjNUVsNZACbZQ2DqEDv5
 oPFTpTGDHsT6B8o3sRiZQ1wq8zIyGVGzMjsn9kOfz+Qvmhi6zHwMAAA==
X-Change-ID: 20260510-zx29clk-2e4d39e3128c
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9398;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=odLYXBLLTAUFSAcct0giyKXVG6mXLsRBOh+Bu7S8H/s=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqtBpp8OZs4ISR+FwZwkd6z+T71oTjnq3eJG0q7
 8G2L03OGWWJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCarQaaRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKKHhAAiMLG/Dvcb48pJqYR1gv+AthCuSJh4m0
 zI2FCVglu5juOA5vdMJMN2O8VEgoDrWWW0YsDRJNnT7vxQ6Jb32ft+MQOlwNCHVjQsQ58Sn4txl
 iK2yRNOjIyPyOVZ2ReIoLOwJzR3B5bG6szrNPBiH8Dau4QSgLHZkXnwkQYqeZx4f/vp5TKHuefl
 O7Yd/KXFNubLbSEyYvEpgBr/Ct5WMM0iUsSqocGb9E1s+gPQq2g1Z658Zybxglhg21mIplY69zl
 AoK7FYkREMVD3EF0FNv40RkK//O3ACpgO4yuNUN5DA7MIcl2ljDEc9w2LkSadhhSZ//ocfvKI0/
 0maevZ8463aw2+ygkgbao0VLBDtezOd8z7KJNpkjbFnqP7GDpdA3aWPnWeDGgL7CqrEzAKcMOyD
 lzQmzumfAGJwSHsV5rG1KaMwtzrvFYATjEKnrbgtN/xzp/Dpomh2gAdMJLrT3SXF/E3GAP2MY7U
 SILTOEde7HiFiphBnsz54QhqLNsvFjamh5irzyICejP7nYHcyJ+5Jowy0+KDJWIcVUymUh2ge87
 HR3ilhCEJRETUxVa5NrcnqzB9kxetKzqyyJjgHR9gXFpQGp3GAv1106v2Up2lVfFVsTpP0HeOFo
 5ukWisYrdIs/ZFtGIEErv/K1R4idlHzOsTr9LQb7ALAwH2v5O/DA=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

Hi,

I am sending version 11 of my zx297520v3 clock patch. It addresses review 
comments for the MFD driver but has no other substantial changes

I think the list of clocks in my driver is fairly complete; It is 
certainly a lot better than what the downstream ZTE drivers have. I 
deduced a lot of it by trial and error. I am sure there are some clocks 
missing that will need to be added to the binding later. AFAIU adding 
clocks is not an issue, but removing or reordering them is an ABI break.

Merge dependencies: The binding patches (1, 2, 3) and DT patch (4) in 
order. The MFD parent (5) is independent, although changing the ordering 
likely needs trivial adjustments in MAINTAINERS. The clock driver 
patches depend on the headers added by 1-3 and apply in order 
(6-11). Reset needs headers (1-3), but it is independent of clock.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
Changes in v12:
*) Add more comments to the MFD driver, explaining what the devices do 
and where the names come from
*) Correct SSC reset bit
*) Add some LTE and GSM related clocks that popped up during my 
experimentation with the phone hardware

- Link to v11: https://lore.kernel.org/r/20260826-zx29clk-v11-0-f8ad59c6426c@gmail.com

Changes in v11:
Addresses Lee Jones's comments on the MFD patch
Reorder the DTSI patch ahead of the driver patch to give it more 
visibility - it is the only patch in the series that hasn't seen a review 
so far. It is also order independent of the driver patches.

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

spot earlier.

To: Stefan Dösinger <stefandoesinger@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney+clk@redhat.com>
To: Jerome Brunet <jbrunet+clk@baylibre.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Manivannan Sadhasivam <mani@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Lee Jones <lee@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: mfd@lists.linux.dev
v2: Fix build issues introduced by checkpatch.pl fixes that I didn't

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
 drivers/clk/zte/clk-zx297520v3.c                   | 1656 ++++++++++++++++++++
 drivers/clk/zte/pll-zx.c                           |  576 +++++++
 drivers/mfd/Kconfig                                |   12 +
 drivers/mfd/Makefile                               |    2 +
 drivers/mfd/zte-zx297520v3-crm.c                   |  111 ++
 drivers/reset/Kconfig                              |   13 +
 drivers/reset/Makefile                             |    1 +
 drivers/reset/reset-zte-zx297520v3.c               |  237 +++
 include/dt-bindings/clock/zte,zx297520v3-clk.h     |  154 ++
 include/dt-bindings/phy/zte,zx297520v3-topcrm.h    |   12 +
 include/dt-bindings/reset/zte,zx297520v3-reset.h   |   62 +
 23 files changed, 3857 insertions(+), 12 deletions(-)
---
base-commit: a8c591ed6b672915e0be57843f943a2a723aff40
change-id: 20260510-zx29clk-2e4d39e3128c

Best regards,
--  
Stefan Dösinger <stefandoesinger@gmail.com>

