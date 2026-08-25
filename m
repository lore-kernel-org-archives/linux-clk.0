Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D3A3D649C
	for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 21:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787693068; cv=none; b=B7rwSSGslF9T2WMEUycgCqB8TpnjuhWWZU00HNkI4KZoqe1MGLN9Pq61LO5aHdGh0dozbLKWTDJr+KWcuFHFAUYaN02nxRETj91l0vGCr6XcaAZl3MxBySG9Z02lHcnN6sSGlZjlHvHt6HtZKvUoO1gUkXOQRKIoZRDykqWJSns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787693068; c=relaxed/simple;
	bh=lHZ01xK6z7HeMA3bWHVf/8BkzwYtauT1FfmgY7fMppw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aR1EgUyiK7SGj4T24a6IMB/aEZ0QwOtRLI/5/VNPHUK0DgNbwmHs0YM1ZmjOr056o16ZHd3FxB+N/b5E7zUrGKRDehdqPMD1sPPm6183PkVkR+FrmJ7WUcNCP9VGHe5hqsF+8710ImhltHT/Z4vAFJCzNrW8vBBmindBGWz3uaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IwmLbNdL; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IwmLbNdL"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c15b1da6b82so20188366b.1
        for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 14:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787693065; x=1788297865; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CE+SIH9CU3mvrwPuRIH+h2nOsgV2qTCNT2M+oGbmRW4=;
        b=IwmLbNdLKuKw8xqz37tpM7XEYb8wc4Cyd6kX5V4bmoVnUIDfgA/RPaeR83AWc9UepP
         SDl+7MSjvEbIvabknT1lyTxVC6jlRfdRZO/EFU/8rA8boH652nR+jlNNL8aWvedMUAiW
         KuZ7AdioPppRpb1bFmjE2Qu+XsJhnV+OFwXzht+jSh25dzUQo4ssdb39zMYJKyvQfulK
         oVIUrIRkxf1FHHf+2w6EkbBQo1M0vcgB6yrpz+KvzsPd21IVSzbpsM3JI8Tri1d6HZ4n
         S3zdJqSOSJYD0qu4KhN/VD2clTpAWxbQ1julBEk2UW2vg0ljerWFpDA9z4DF+ojhwUpS
         Zrig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787693065; x=1788297865;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CE+SIH9CU3mvrwPuRIH+h2nOsgV2qTCNT2M+oGbmRW4=;
        b=BRF8V0kcrfzwEofZipnYqv4SIT1Q4mwe+6QpyPTUtQ3rLXcNdvjG1O8j/Gghp6bWp4
         tUUi+sDrK9Acg3DFBwD8sghYxKw9EgikFhxsAKixDExWrIkock38Y++mYP906DcOOJZj
         6L8E+YcjzjpRBtx8+Q9dI+01X05SHRPMzU8YFCBpj6LCNIOJ3WwbJO3jUqQrEjpMPsGW
         izvc9/zYuNar0u02/kBV1w2oQHAFnaI8gUhyX1rWTQBEgrDqg3V7hwyH3FXUAOLH9JgV
         vYWhBweOLnO7LzCx/MkRz6ESHAuv+UK4KsOgkHx2WohVDw0WTHxJQc2XsJM8FUJYCPpF
         pBvQ==
X-Gm-Message-State: AFuF++lR154suxBA2Oyn4FhsBNmn4tYsatpQhnCBMJoFffJxlpIOo8nF
	8VW/sNlV+I38QU0d+jTxtZmaRinqazQp6pnpq2an3Eo6Z01KqrG9O0RB
X-Gm-Gg: AR+sD13Gasp1JUCmdVsBGxtHIa2hexRIIL702xJ6GsMmC03OIjuewEgtblYw+Cpx+VP
	sUkI+oiusjwigFRPVm5es9ZjgjWguayfOu3+q8DObZIlOg1RRFaVCNDMeIjcdUpxz12MfkdvSNo
	HEbCYpkjbDPZYqcSL7oSPVyikWUiAGqysYYpkz5ZXrpknlMZjDVTBFoUHMl5lVu0IErHcvRKZxV
	IKLCmXq+n06+5Cy5u26O9Y+h2NHMU9Y1pOm6MltQWrttZS2CkuCsDWYHzQXCY8s4gPnPhlQ2OIy
	23AOrzrOKCigBAGMTAItoDNRLF+e2hTK8Y2MFAzFMePobLixGGnV4922vQT/zbkqhCjAgU1/rRl
	3YeSQkN+z2n0Bzzpm8oUNffXIIb7dWjHQhymdkXAUFGlmFuME5XuRVIR54rKk5Egpxaw9dEJIaU
	zcbLDGF1SHOhZxZeh/hNH5TU5Rcq4/htRwIl9GPyi4v4IcT06TPO9BnqT2aX0zFydx6YlBChFVX
	iqEWboiomxON2XE5LXT
X-Received: by 2002:a17:907:3e90:b0:c24:d430:3929 with SMTP id a640c23a62f3a-c250bb05b51mr191458966b.1.1787693064734;
        Tue, 25 Aug 2026 14:24:24 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.227.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9ec343sm98297866b.57.2026.08.25.14.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 14:24:23 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Subject: [PATCH v11 00/12] ZTE zx297520v3 clock bindings and driver
Date: Wed, 26 Aug 2026 00:23:59 +0300
Message-Id: <20260826-zx29clk-v11-0-f8ad59c6426c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XRzU7DMAwH8FeZeqbIdr5sTrwH4tAmDlQwBu2YB
 tPenWwcEsoxVn7/2PGpW3SedOnuNqdu1sO0TLu3ckC82XTxeXh70n5KpdARkAeH0H8fSeLrS09
 qkxE1SBy7cvt91jwdr1EPj7/nWT8+S+L+t9iNw6J93G230/5uM7AFrz7CGMREhcAMKJ4NmxAts
 HOjcyKuu2Q9T8t+N39duzzgNexfPwfsoVcch5hzVvHh/mk7TK+35cFrxoFah9VRcSQZNEUDkN3
 amcaRVGeKiyGrszoY5rx2tjqPvjp7cYOIHRORSlo71zji6lxxQXIGa9Wi0Nr56gJQdb44E8IYw
 GaGaNcuNA5DdaG4sgiLGHPMxq8dN44ax5c+B4Qwlt/E9G8+qY7bPqW4BM4ZSOwS8dohNPDP4qF
 Ib9h6K2UEiq08n88/ISz1guUCAAA=
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8350;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=lHZ01xK6z7HeMA3bWHVf/8BkzwYtauT1FfmgY7fMppw=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqjgf7SoqQLw6/h8DyJLSpVmgTOAytD5yH0gs7/
 Vbe96mgQIqJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCao4H+xsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiIJxw//WL1K4EPuvDw6Jk6a+mhqgIrNH3bQL8f
 gTWfw+oXY58gQaHrb0aGd2wWpbYLNajB/7Cqs4NrPzwmwVgoGD4a8XB1CgzT6hPATu7u0InP/wE
 VoSbXooW6gFIOCcLsp7eV/GxHj3OcytCtSRguAbro96Ql4nvqjsqbhlKaivCNWpVJQFpjKUXZ7F
 JNKrcKsc/6pLgF94GL7wl0FWByow5Ou5zT0vr/epCuSPEmQ+/wIIuaJgLg/XdoiDzoZvqyJtjct
 GvBiUZ3YXFhtBZjZF7brk0JIvImIMpL7+LdGIN7EK9LvhFaNUs+XdTwaGLZJ426JS9U3H4nW4l8
 lnXeBzRwXAC6Y93gZf+t1Xavuatfl5YBXV1N71W9LQ/LCHyYssZLeV3jvvRjDGFdeCC9aE85ZQl
 YlJzLPJliU7vWL2hSvgEwA4ItwSnIRs7zNNXac4AN5tcEDGWhTUmwAUPiHi4LWjj+B4i+d/N7iq
 UJ4PeyM4ODF6GJEYsbe7NmfioDhNproZIQf1LppMWuQoRYoeBGlcbUhKF2mRT8jF42NL80fTPoB
 jwDxUjYQRzKNjd9l3yQH1j+73uIramaL8PPBPcxcn5tfbKcIK7KrHRoSPuN0P0mgBgazNRjM90L
 eKL810Z7KMwHvdS+wUoe+WRLOZsQhDTwtYJvQ75WFrVcjWncEdK4=
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

v2: Fix build issues introduced by checkpatch.pl fixes that I didn't 
spot earlier.

---
Stefan Dösinger (12):
      dt-bindings: clk: zte: Add zx297520v3 top clock and reset controller
      dt-bindings: clk: zte: Add zx297520v3 matrix clock and reset controller
      dt-bindings: clk: zte: Add zx297520v3 LSP clock and reset controller
      ARM: dts: zte: Declare zx297520v3 CRM device nodes
      mfd: zx297520v3: Add a clock and reset MFD driver
      clk: zte: Add Clock registration infrastructure
      clk: zte: Add regmap-based clocks
      clk: zte: Add zx PLL support infrastructure
      clk: zte: Introduce a driver for zx297520v3 top clocks
      clk: zte: Introduce a driver for zx297520v3 matrix clocks
      clk: zte: Introduce a driver for zx297520v3 LSP clocks
      reset: zte: Add a zx297520v3 reset driver

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
 drivers/clk/zte/pll-zx.c                           |  576 +++++++
 drivers/mfd/Kconfig                                |   12 +
 drivers/mfd/Makefile                               |    2 +
 drivers/mfd/zte-zx297520v3-crm.c                   |  101 ++
 drivers/reset/Kconfig                              |   13 +
 drivers/reset/Makefile                             |    1 +
 drivers/reset/reset-zte-zx297520v3.c               |  237 +++
 include/dt-bindings/clock/zte,zx297520v3-clk.h     |  145 ++
 include/dt-bindings/phy/zte,zx297520v3-topcrm.h    |   12 +
 include/dt-bindings/reset/zte,zx297520v3-reset.h   |   62 +
 23 files changed, 3781 insertions(+), 12 deletions(-)
---
base-commit: a8406e6c0b793ce0788019683837c40855b55995
change-id: 20260510-zx29clk-2e4d39e3128c

Best regards,
-- 
Stefan Dösinger <stefandoesinger@gmail.com>

