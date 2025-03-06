Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D61820AF71
	for <linux-clk@vger.kernel.org>; Thu,  6 Mar 2025 11:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741260637; cv=none; b=sa2UrGHoyuJcQsWajfDS8L04KbkbOCLnQ+XjfkZ9xzqMuPbelZuge4HotmHK3+lFvZkTJ8EYa3O/SS8ulLnE1TQjU2jqW0d33WTFW+mqg386198zhiUwYXmlkZh15ROyw//p2PhMNNcxk2MD/YP0apqzXhHuyfCY400/H+r/UCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741260637; c=relaxed/simple;
	bh=bLfPdxBF2Z0/DguVhNOFs3TZhUfDJOJ4M/LtG48XDEk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YJ/nl3wlGlN+/+aCKDHW5BW5SxsDfoNRHQs5sgSWyohiLHdlXHwNE/PAILGHvTjGplwVJXE/K8+Cly22Hoih/EopHKgoXOPbt1J1YPxBhJpVLEtKgdtCwJTtgzIf/P42UN0sbyVO9OCUPkXdS8aYplisrZmmKbxhK61RCBbn/bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=UbKxdJTA; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="UbKxdJTA"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-390e702d481so291740f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 06 Mar 2025 03:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1741260632; x=1741865432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QwtYTrDkWH6misbjcDOah4aj3UXSwDbuBhEff6JQElI=;
        b=UbKxdJTAckBmgUzOvR5T1OFZ7F5RkZ/Xrvwe0zjo+wA/kxA5/Z+wpC9vHXPyo0qW7c
         NUsSTc6NTB8WSSI1lYv6i9NMERuhm87sPcXvFlHR22Q5P1hw58Gs3KU8K965QZhd2OY2
         nOYAdeVgEtt4gl71LIr7FjEPLYfI8Y1/kl6x4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741260632; x=1741865432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QwtYTrDkWH6misbjcDOah4aj3UXSwDbuBhEff6JQElI=;
        b=bbohWPzfEaGOzwyQcQgN6V32WTqTjVDG862dFLFlxqXwH79tR0aMCfbD90TZnO8djp
         HJSb68K9ejytbN1FV9TxGp8pWLdVS9rmz0j+tp7nkmRYL73Xds1leHLVyoYh35gM8ikG
         v5G38TbfJUtAejzaUuY7geNJF7DsXe0+1AJKZ3NUXBad9p0PfbV+/IjE1txx229xD4sT
         16XhmSXv7k4wSRwk7bYNOo8lxD4NzHcvTAc/xkPQAcOaWkgLhUYFbByIpACqzzEle+34
         diuIa2ThFxhFL2vdJWsLl+10WrHC61Cn26MSnxDhD9s2+oDwYkgVhKV8YqHc3mskvbyx
         Aj0Q==
X-Forwarded-Encrypted: i=1; AJvYcCV53XZGTU7r1Cg1ZI2AiqLTQnq5iVxLk4deflkmua+tpZj/rHrEk9fk3x0S1vEcrv+9C1WD06ddb3I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfct4xwEh/sLu4FlkXwy418tZGzU3PRdF5WBZPII+b8Gsy/o/G
	Ip5Aqh8yb85Jq7GpFpnv0XRbK8vIKnRU0+IhAnLR1e/H2eX/Sh62BD1u/K78HnY=
X-Gm-Gg: ASbGncuqjjwWRimDhENXfSj7LE8YaWD2pIaA115Eunl6HYdL0WYLQ2wj+qUt+HH/njh
	7ZgRAhHp4DoM8/CivLU2ra6ykF0kTmaOQkIfo0xrYf2S3lql++G3FVVKJ/hxdbf4i6w0E99gud0
	OhBQOyg1ACrwSrrCiq4z3cA7ag9M62VEFWF7FZVvIXTT7Dk0NbZCCwvWHCUQz6qw6BVAMMDGCxw
	XFr6R2zFmfC3txPW1+sppx2RvUlvaobtafv+KeQtnE7Nf4XQ3rsqY2N/Q1c4OHJCHL0M8uEe9ca
	Ze6HcmupRVfX7HlrAldPXJYVisneVhaoQMl6GAdTvNgy2mzLjM9a+njYjpAzY4DxwHp4rb+7mrS
	3RyRrvg==
X-Google-Smtp-Source: AGHT+IG+TcbJyD3W5mUa064KhIh9QfeUH7pp3e0x4snBKzkDHDCXO3ufzJW4A84fTYipKUabpUNjwQ==
X-Received: by 2002:a05:6000:4022:b0:390:ffd0:4138 with SMTP id ffacd0b85a97d-3911f756719mr5772700f8f.24.1741260632475;
        Thu, 06 Mar 2025 03:30:32 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:4703:aa8c:6eab:8161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb79b9sm1749650f8f.3.2025.03.06.03.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 03:30:31 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v10 00/18] Support spread spectrum clocking for i.MX8M PLLs
Date: Thu,  6 Mar 2025 12:27:49 +0100
Message-ID: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This version keeps the version v9 patches that can be merged and
removes the patches that will need to be modified in case Peng's
PR https://github.com/devicetree-org/dt-schema/pull/154 is accepted.
The idea is to speed up the merging of the patches in the series
that have already been reviewed and are not dependent on the
introduction of the assigned-clocks-sscs property, and postpone
the patches for spread spectrum to a future series once it becomes
clear what needs to be done.

Specifically, the patches:

01/18 dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
02/18 clk: imx8mm: rename video_pll1 to video_pll
03/18 dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
04/18 clk: imx8mp: rename video_pll1 to video_pll

are a replica for i.MX8MM and i.MX8MP of the patch for i.MX8MM
bedcf9d1dcf88 ("clk: imx: rename video_pll1 to video_pll"), which was
merged some time ago. The patches are split into four because, during
the review, Krzysztof asked me to separate the driver modifications
from the dt-bindings changes.

All the other patches in the series, from 5 to 18, are necessary for
the implementation of the anatop driver for i.MX8M{M,N,P}. The review of
this series has taken a long time, partly due to misunderstandings
arising from incorrect design choices.

As Peng stated in [1]:
"In current design, CCM is taken as producer of CLK_IMX8M_VIDEO_PLL, not consumer."

These patches fix this issue by ensuring that the PLLs are now produced by
Anatop and consumed by CCM, aligning with the hardware logic.

Finally, a clarification: I decided to keep the same title for the series
despite having removed all the patches for spread spectrum support in order
to maintain a clear connection with the previous versions.

[1] https://patchwork.kernel.org/project/linux-clk/patch/20241106090549.3684963-2-dario.binacchi@amarulasolutions.com/

Changes in v10:
- Drop the v9 patches:
  16/23 dt-bindings: clock: imx8m-clock: support spread spectrum clocking
  17/23 clk: imx: pll14xx: support spread spectrum clock generation
  17/23 clk: imx8mn: support spread spectrum clock generation
  21/23 clk: imx8mp: support spread spectrum clock generation
  23/23 clk: imx8mm: support spread spectrum clock generation

Changes in v9:
- Add 'Reviewed-by' tag of Peng Fan for imx8mn platform patches
- Fix building warning raised by the kernel test robot for patch
  v8, 11/18 clk: imx: add support for i.MX8MN anatop clock driver
- Add patches for imx8m{m,p} platforms:
  - 23/23 clk: imx8mm: support spread spectrum clock generation
  - 22/23 clk: imx: add support for i.MX8MM anatop clock driver
  - 21/23 clk: imx8mp: support spread spectrum clock generation
  - 20/23 clk: imx8mp: rename ccm_base to base
  - 19/23 clk: imx: add support for i.MX8MP anatop clock driver

Changes in v8:
- Drop the patches added in version 7:
  - 10/23 dt-bindings: clock: imx8m-clock: add phandle to the anatop
  - 11/23 arm64: dts: imx8mm: add phandle to anatop within CCM
  - 12/23 arm64: dts: imx8mn: add phandle to anatop within CCM
  - 13/23 arm64: dts: imx8mp: add phandle to anatop within CCM
  - 14/23 arm64: dts: imx8mq: add phandle to anatop within CCM

Changes in v7:
- Add and manage fsl,anatop property as phandle to the anatop node with
  the new patches:
  - 10/23 dt-bindings: clock: imx8m-clock: add phandle to the anatop
  - 11/23 arm64: dts: imx8mm: add phandle to anatop within CCM
  - 12/23 arm64: dts: imx8mn: add phandle to anatop within CCM
  - 13/23 arm64: dts: imx8mp: add phandle to anatop within CCM
  - 14/23 arm64: dts: imx8mq: add phandle to anatop within CCM

Changes in v6:
- Merge patches:
  10/20 dt-bindings: clock: imx8mm: add binding definitions for anatop
  11/20 dt-bindings: clock: imx8mn: add binding definitions for anatop
  12/20 dt-bindings: clock: imx8mp: add binding definitions for anatop
  to
  05/20 dt-bindings: clock: imx8m-anatop: define clocks/clock-names
  now renamed
  05/18 dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
- Split the patch
  15/20 dt-bindings-clock-imx8m-clock-support-spread-spectru.patch
  into
  12/18 dt-bindings: clock: imx8m-clock: add PLLs
  16/18 dt-bindings: clock: imx8m-clock: support spread spectrum clocking

Changes in v5:
- Fix compilation errors.
- Separate driver code from dt-bindings

Changes in v4:
- Add dt-bindings for anatop
- Add anatop driver
- Drop fsl,ssc-clocks from spread spectrum dt-bindings

Changes in v3:
- Patches 1/8 has been added in version 3. The dt-bindings have
  been moved from fsl,imx8m-anatop.yaml to imx8m-clock.yaml. The
  anatop device (fsl,imx8m-anatop.yaml) is indeed more or less a
  syscon, so it represents a memory area accessible by ccm
  (imx8m-clock.yaml) to setup the PLLs.
- Patches {3,5}/8 have been added in version 3.
- Patches {4,6,8}/8 use ccm device node instead of the anatop one.

Changes in v2:
- Add "allOf:" and place it after "required:" block, like in the
  example schema.
- Move the properties definition to the top-level.
- Drop unit types as requested by the "make dt_binding_check" command.

Dario Binacchi (18):
  dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
  clk: imx8mm: rename video_pll1 to video_pll
  dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
  clk: imx8mp: rename video_pll1 to video_pll
  dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
  arm64: dts: imx8mm: add anatop clocks
  arm64: dts: imx8mn: add anatop clocks
  arm64: dts: imx8mp: add anatop clocks
  arm64: dts: imx8mq: add anatop clocks
  clk: imx: add hw API imx_anatop_get_clk_hw
  clk: imx: add support for i.MX8MM anatop clock driver
  clk: imx: add support for i.MX8MN anatop clock driver
  clk: imx: add support for i.MX8MP anatop clock driver
  clk: imx8mp: rename ccm_base to base
  dt-bindings: clock: imx8m-clock: add PLLs
  arm64: dts: imx8mm: add PLLs to clock controller module (CCM)
  arm64: dts: imx8mn: add PLLs to clock controller module (CCM)
  arm64: dts: imx8mp: add PLLs to clock controller module (CCM)

 .../bindings/clock/fsl,imx8m-anatop.yaml      |  53 +-
 .../bindings/clock/imx8m-clock.yaml           |  27 +-
 arch/arm64/boot/dts/freescale/imx8mm.dtsi     |  11 +-
 arch/arm64/boot/dts/freescale/imx8mn.dtsi     |  11 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  11 +-
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     |   2 +
 drivers/clk/imx/Makefile                      |   6 +-
 drivers/clk/imx/clk-imx8mm-anatop.c           | 287 ++++++++
 drivers/clk/imx/clk-imx8mm.c                  | 262 ++++---
 drivers/clk/imx/clk-imx8mn-anatop.c           | 283 ++++++++
 drivers/clk/imx/clk-imx8mn.c                  | 183 +++--
 drivers/clk/imx/clk-imx8mp-anatop.c           | 306 ++++++++
 drivers/clk/imx/clk-imx8mp.c                  | 672 +++++++++---------
 drivers/clk/imx/clk.c                         |  15 +
 drivers/clk/imx/clk.h                         |   2 +
 include/dt-bindings/clock/imx8mm-clock.h      |  76 +-
 include/dt-bindings/clock/imx8mn-clock.h      |  64 ++
 include/dt-bindings/clock/imx8mp-clock.h      |  80 ++-
 18 files changed, 1740 insertions(+), 611 deletions(-)
 create mode 100644 drivers/clk/imx/clk-imx8mm-anatop.c
 create mode 100644 drivers/clk/imx/clk-imx8mn-anatop.c
 create mode 100644 drivers/clk/imx/clk-imx8mp-anatop.c

-- 
2.43.0

