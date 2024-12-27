Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FA11F76CE
	for <linux-clk@vger.kernel.org>; Fri, 27 Dec 2024 16:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735318647; cv=none; b=YI8nkfk/wRD6U8e5l2JeUsyMEWfMlwd3Fazjj9eLjtWeW1c2nz6F6k9mTssnbBl/q8QtaKizZKHgzmy/xJ9wAx8tiRbdJRSwzlMhvTJsX7YgPDR0h20l8LaAnccmIMwtCCDIYX9eZDCS0Ruvic44VLz7xW05LNOin9G18cuA1VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735318647; c=relaxed/simple;
	bh=6paNlcYvYJUZiXBgyD0n+6Ka2Hj7cB0DVBUR7nXq8Po=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GzH3jmPkVB9aZYE/Qz2S3lF2q71QyVR6kV2TgMFMnliz0H5R32R5+HqVjpVI/EG6DVly6yCj/hNz6R+wQZPXUFbYdql98KMcV43LFt7EypUwbOow09YqTwXACbdd21AJDBMSrVSNkQCjv7c0MNs6MdNBoX3jRP+rOPGv76Y3puc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Zl+8yr6q; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Zl+8yr6q"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aa66c1345caso333906566b.3
        for <linux-clk@vger.kernel.org>; Fri, 27 Dec 2024 08:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735318643; x=1735923443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=npfMp13q1tQsxXMRukSmRqEG6KBpV1Zq2CsR4oTVCfM=;
        b=Zl+8yr6q8IKP5T2CBmgJWITrC/v7My4Ym2abv5OH6UDXNvvNMW1QMRpwP5nAY0o9G0
         5I4vlu+lzGBai1hqKic5P2gxU9rmTsSZciblq8/w8a+aYVKxqF3Jnuf9rfTEfSlWVnkq
         x3jC1cXkD1ujxSy7sGMrrYI761x80yhwvsxHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735318643; x=1735923443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=npfMp13q1tQsxXMRukSmRqEG6KBpV1Zq2CsR4oTVCfM=;
        b=f/MSn9p+Hs8yUdEFQkcS3nF1DvLgARhJYsU2pY2vY6n0ztoNzlZMWO/gG7Jl0z7ViU
         wVJkN4ok34xI+GhvmXS0WsdRPN9cIjnlVoDilJivim9bOD+opeQqMjvRTg4YuEmA5b8U
         3bgHyOpGtrB7KEIF2eVTDnBJ6WgfWSnFBINkOSBovGBcvFPxF+zWmrNkbWoH/WqTJmT3
         4daAQdXr9Svwq8b4yITh/8HoeCTkKXdSC8R+oyOBqd9oe4O0iqgsLCblh/N2iXaSEfT2
         6GSu9+A+KBsUb15UOfQ51Lk+ZYkBDdFeMUpAByoicqRi7NXalSXJh53fPPurNrt+4wNg
         PdHw==
X-Forwarded-Encrypted: i=1; AJvYcCVZcD5qlFgmmCpKpZxcYOyYHWAuSgYxa9s6R3zlDv1j7yQS3GI7hlBTvF1ay33HK1VmsiNndtCA2UQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlkgzhDXjhf5OGtC8Aeir7oQfTI6dO1tlG1G8/Gbqxa9cmaRDo
	Z9m7DC/tQN3pA4+/zDdWjFoetDzRJra9wvD/PEj/tOcPUIMvpWQmDGmEn4cMDgE=
X-Gm-Gg: ASbGnctym/OhjlkeJeXyNM+hFnWOYxUepTSQPD882+J4iMc57K1StxekRo+bPi8loAs
	Y8vx8uNFyM5V8zhoFr+G1wEaHl9R92QEoTdPS1LUYcEoHnFhyMF7n7Delky3hILuDjfHm3RLGMD
	rDlomFTNIvDhmroALahXo9nO86JqUHhSXTsNqoJcD/uX7G6+hMivO01nCospL4eL4qHlF99QCnD
	BwCIag+qwyU971amxHdQ21eVLLnU9r2n12Nq6xeYP3nKTF2WuBJ77PKiQb+QHT3GYwXqvdVXYwX
	8TlLQraK3qTXWDLm/iYGGA==
X-Google-Smtp-Source: AGHT+IES5n2L//hXjZJ3/INKYRA6hW3/84gbWd1/kG9HfUt8dKiZynJTzwMTEUXCKtTORh/cOo9UDQ==
X-Received: by 2002:a17:906:c145:b0:aa6:832b:8d76 with SMTP id a640c23a62f3a-aac2d447677mr2553602566b.12.1735318643006;
        Fri, 27 Dec 2024 08:57:23 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0159f1sm1130097266b.154.2024.12.27.08.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:57:22 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v7 00/23] Support spread spectrum clocking for i.MX8N PLLs
Date: Fri, 27 Dec 2024 17:56:03 +0100
Message-ID: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series adds support for spread spectrum clocking for i.MX8MN
PLLs (audio, video and DRAM). It has been tested for the video PLL on
a board using i.MX8MN.

The patches added in version 4, such as the dt-bindings and the driver
for anatop, were inspired by the extensive email exchange from version 3:
https://lore.kernel.org/imx/20241106090549.3684963-1-dario.binacchi@amarulasolutions.com/

The series added spectrum spread support for the imx8mn platform only,
but in case it was merged, confirming that the directives and suggestions
made by the maintainers were correctly understood and implemented, I will
extend this support to the imx8mm and imx8mp platforms as well.

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

Dario Binacchi (23):
  dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
  clk: imx8mm: rename video_pll1 to video_pll
  dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
  clk: imx8mp: rename video_pll1 to video_pll
  dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
  arm64: dts: imx8mm: add anatop clocks
  arm64: dts: imx8mn: add anatop clocks
  arm64: dts: imx8mp: add anatop clocks
  arm64: dts: imx8mq: add anatop clocks
  dt-bindings: clock: imx8m-clock: add phandle to the anatop
  arm64: dts: imx8mm: add phandle to anatop within CCM
  arm64: dts: imx8mn: add phandle to anatop within CCM
  arm64: dts: imx8mp: add phandle to anatop within CCM
  arm64: dts: imx8mq: add phandle to anatop within CCM
  clk: imx: add hw API imx_anatop_get_clk_hw
  clk: imx: add support for i.MX8MN anatop clock driver
  dt-bindings: clock: imx8m-clock: add PLLs
  arm64: dts: imx8mm: add PLLs to clock controller module (CCM)
  arm64: dts: imx8mn: add PLLs to clock controller module (CCM)
  arm64: dts: imx8mp: add PLLs to clock controller module (CCM)
  dt-bindings: clock: imx8m-clock: support spread spectrum clocking
  clk: imx: pll14xx: support spread spectrum clock generation
  clk: imx8mn: support spread spectrum clock generation

 .../bindings/clock/fsl,imx8m-anatop.yaml      |  53 +++-
 .../bindings/clock/imx8m-clock.yaml           |  84 +++++-
 arch/arm64/boot/dts/freescale/imx8mm.dtsi     |  12 +-
 arch/arm64/boot/dts/freescale/imx8mn.dtsi     |  12 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  12 +-
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     |   3 +
 drivers/clk/imx/Makefile                      |   2 +-
 drivers/clk/imx/clk-imx8mm.c                  | 102 +++----
 drivers/clk/imx/clk-imx8mn-anatop.c           | 283 ++++++++++++++++++
 drivers/clk/imx/clk-imx8mn.c                  | 199 ++++++------
 drivers/clk/imx/clk-imx8mp.c                  | 118 ++++----
 drivers/clk/imx/clk-pll14xx.c                 | 134 +++++++++
 drivers/clk/imx/clk.c                         |  15 +
 drivers/clk/imx/clk.h                         |  18 ++
 include/dt-bindings/clock/imx8mm-clock.h      |  76 ++++-
 include/dt-bindings/clock/imx8mn-clock.h      |  64 ++++
 include/dt-bindings/clock/imx8mp-clock.h      |  80 ++++-
 17 files changed, 1032 insertions(+), 235 deletions(-)
 create mode 100644 drivers/clk/imx/clk-imx8mn-anatop.c

-- 
2.43.0

