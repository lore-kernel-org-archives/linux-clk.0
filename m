Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA2F42BE99
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 18:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785176709; cv=none; b=ulAVWnG6mt4Ct58isWo/d5aWuCJvF0qwuLp2+9W6zB5vxQyUXhhPFkEp+5IAlGSxw0Z2EL7E1325tXN7089Ok2Qk0oRUbO7L8rNi5ZF+z+IyB3o3T3hT8qYpWuQxUG04ZnvGpuPsdS9v5gmfHDV+j1iS0QnQKIw1sZeQ53UtrT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785176709; c=relaxed/simple;
	bh=a1igq8mkMk4mreJV1Z3wj7gnO0ZvVuZ7sQZARfSkGlk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Nt7ppFsqyLrPt6LzbUVFrRtocSUYBmaFhrHHXmfuVm2QfMjV54TemlyZXwtEGDQfYv5dXYapcDh0FPxBH3OXCTX0kPEq0bKFLK/OpxJqjuPZGm60maATQUpOhLKZTCEGLH30ksMq72U2W4hlJHjlPCSVwyrT0zpmaX8VBsM6oTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MXLC5zlS; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MXLC5zlS"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49555a0e68bso15410665e9.2
        for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 11:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785176705; x=1785781505; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bUauX33l50Q6x8k+dgRME3aKqn6GO64E5e73rlsiEhA=;
        b=MXLC5zlSNKGuQB8w6gVMZl7R3Pd//MpcDe3cwVPGwT37N4vGU0r3xB5jdp8nNILP8f
         IaODjDGx3EbpaGD9S28Fxg6pkC8/6bziLfplaMF2GTXlMu3XdxdntF9DPCgZuoo/N/mm
         8enl5AmMnrnfvtbxERjTy88npEq4FB02Hzgx492tzAAlCIaU+HD6Mccyxg/0NYuSdM56
         xtpTo1i92lMagu4lyr3IkadfjgdWsA9kIEXUOfWa5MJpkXvoyWCL7IVCOCJZ3608vPIp
         prurZTbq82GFhdhodysJ24mIazVzZaXAtJZiEOG3N8/iSeEowV/Gj1GYPKsFd1vnOxY7
         xSjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785176705; x=1785781505;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bUauX33l50Q6x8k+dgRME3aKqn6GO64E5e73rlsiEhA=;
        b=gCEQVQ1HpcFUqxTA3z051KwfkoP9rjV+T4H/IYmjG/JN+bPkwQS0cCa6yc9QWgi4+N
         Z5B3DOwhRhLIUju27IjR5CzWsHn9z879R9rYqcKffRad6TVQYM0py5iQFYKhLYQr0h1+
         xbGzpfctwaAMCOs4xyU6Fw+VoPYyNAYjmGY0aryeVutCpq9PADGg/8yyJjj6XcUEfhR9
         PoIcjos1ndsq/uAH5uHfobBUELwsJzhfNXyJlnN8yzShwOcXrlv14jPJOQVahMLppNhv
         dOpT5RVDrYBA9MNPdVduoYVmnMaVx0QIam4S2AHu51Ki5X65LJVL67YwyuWOpdWsFRgm
         2baw==
X-Gm-Message-State: AOJu0YyVP6E+Hqu6i78yct2iXWrHNY8D3LyeOURm3tsNebx1r6fSWTJD
	D9tUdvsBtnoFIdCybZUcz5mb5zr49WaF7Nf+FXASRRSAqW4KyG78GxMT
X-Gm-Gg: AR+sD12WgXoAMklyFhhomgfUr+S6LSuCb5je9WY5P4K0EtYFhwf54x0Tm214QYpuUEz
	eRtSbFwtTt5l5ZJ8KnBNfcX1+VG7S6NzxnMYGInhbSvxrwLGgMdKgVl/J9GhapMguIGAAcVNHZ6
	zo9DJmoVbNu4Gw02dho9WoeBpvewx+ltkMWTMvPE2xgUmRxmM6BuPneqpBXM9uH56LjyCaUnLtz
	dlZBYrEpb1+N9Z56f5VWALYDGiPiJQ9pPsTpTfYEP1axh6DiUhtl+7YMYwbbNrmBFZhRf55xV5G
	6V7cWglz/ZGLGE1kMKGxrzH7hXYh9QMHm93qGSdMBuWsipQ5zxm42lb9Z+GmWbfCJmoj5Ig5wIu
	uAbkWsWFMaIHnL/MuwqtjTVD98v4e9y4mDHD1dTT6vsNBWtwfZN71RX0r1YYS5GPA8GFV5XU3/F
	dK12obsTyAkPfN
X-Received: by 2002:a05:600c:138a:b0:495:4b24:1b64 with SMTP id 5b1f17b1804b1-496c4c3a159mr3057045e9.0.1785176705107;
        Mon, 27 Jul 2026 11:25:05 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c53052sm50689288f8f.18.2026.07.27.11.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 11:25:04 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Subject: [PATCH v8 00/12] ZTE zx297520v3 clock bindings and driver
Date: Mon, 27 Jul 2026 21:24:15 +0300
Message-Id: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XOTU7DMBAF4KtUXhNkj8d/XXEPxMJ2ZloL2kJSo
 kLVu+OmC0dh+Ub+nt9VjDQUGsV2cxUDTWUsp2MN/mkj8j4ed9SVvmYBEqw0Sna/Fwj5470Dwl4
 H0gp8FvX150BcLnPT69sjD/T1XQvPj6NIcaQunw6Hct5uEpGzujesUaUQMqODyJSM9D0G79lCt
 Dkqce/al/F8Gn7mkZOay/7tmVQnO1IpZmamYN3L7hDLx3P9cO6YYOlUc1AdBJbUZy0lm7XTCwe
 hOV1ddkwGKeo6eO2wOatsc3h3MQRMPQCFfu3MwoFvzlTnArNEJFQB1s425yQ0Z6vTziUnkb3Mu
 HZu4ZRrzlWH0qNSmTNru3S32+0P0zjxGToCAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6874;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=a1igq8mkMk4mreJV1Z3wj7gnO0ZvVuZ7sQZARfSkGlk=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqZ6J6kHnsK+WZKdFSj4Ev1eCoGKGsOoeTXMlKp
 UpaSn3oSruJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCameiehsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiL/Eg//ZXQbi7BjhpgWatKITNTB9qm+Vhxnzmz
 leaih5NJuQ8FXB0AGOBJqZKrWmSXXeOBKuObZGhrqKg/7iJ5fL9JcFlIYGNS4I31hTJkBsj0A55
 dr4mCzv/NLqkTV/wnDD6BSQujFYeFZPZssxxWuvC8kjWLlZqKPEaoaA2TfM371VQYqWx2ZTwifv
 L143HKRtnlYdWfrRol4RCHT6POj1icwi72KklpDVr+RJJn3XYxl6oQU/z0z4uieXToBG/JJvR1r
 G7J5tq7xo/8MjhzfP4O9/wXOoKLA6tqP7qWWfJ0IeC1SV43d24N0cFx9FRhKstx/aaus2CiHaZC
 zTyLkwK8L4YnGAEk12AA33OJ+Lp/NwsH5KL0lyOJXx0kSuUrn8c1zGfDOHqRBBL9n/VDyVwHYbD
 bhaOgd040pGBAprx+ppclfVGIR6RkjyYJqFWPasSHuoCSuqzaEDLi462nis3K20BlrRq3Kjfu9m
 7enqHtYOa/TP+pxq9XTPWZrpnNiHC5qQOUr+9FsHBjnsiqv+Dc44TzRTmoHdhQP1vTe2KQLfqQl
 Xmfu3zjzUJT29Q9YQ8z+sR2098jjHDOEsR0tMl4klepo8Er6M8MNxqbR0kdt0H3nu9Z/9CS1S4C
 ZfCgqDWagALz37SbJWq6Xli3ZWtmIR3us+WB1xwCm5ndLKXxpB6k=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

Hi,

I am sending version 8 of my zx297520v3 clock patch. The main change vs 
v6 is the reverse engineering of the PLL input and forward gates in 
top+0x140 and according reduction of the input clocks in the matrix 
binding.

I think the list of clocks in my driver is fairly complete; It is 
certainly a lot better than what the downstream ZTE drivers have. I 
deduced a lot of it by trial and error. I am sure there are some clocks 
missing that will need to be added to the binding later. Afaiu adding 
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
 .../bindings/clock/zte,zx297520v3-matrixcrm.yaml   |   96 ++
 .../bindings/clock/zte,zx297520v3-topcrm.yaml      |  136 +++
 MAINTAINERS                                        |    9 +
 arch/arm/boot/dts/zte/zx297520v3.dtsi              |   84 +-
 drivers/clk/Kconfig                                |    1 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/zte/Kconfig                            |   27 +
 drivers/clk/zte/Makefile                           |    6 +
 drivers/clk/zte/clk-regmap.c                       |  246 +++++
 drivers/clk/zte/clk-zx.c                           |  155 +++
 drivers/clk/zte/clk-zx.h                           |   91 ++
 drivers/clk/zte/clk-zx297520v3.c                   | 1103 ++++++++++++++++++++
 drivers/clk/zte/pll-zx.c                           |  560 ++++++++++
 drivers/mfd/Kconfig                                |   11 +
 drivers/mfd/Makefile                               |    2 +
 drivers/mfd/zte-zx297520v3-crm.c                   |   98 ++
 drivers/reset/Kconfig                              |   12 +
 drivers/reset/Makefile                             |    1 +
 drivers/reset/reset-zte-zx297520v3.c               |  237 +++++
 include/dt-bindings/clock/zte,zx297520v3-clk.h     |  144 +++
 include/dt-bindings/phy/zte,zx297520v3-topcrm.h    |   12 +
 include/dt-bindings/reset/zte,zx297520v3-reset.h   |   63 ++
 23 files changed, 3188 insertions(+), 8 deletions(-)
---
base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
change-id: 20260510-zx29clk-2e4d39e3128c

Best regards,
-- 
Stefan Dösinger <stefandoesinger@gmail.com>

