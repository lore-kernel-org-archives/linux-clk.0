Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA684E66D0
	for <linux-clk@vger.kernel.org>; Thu,  3 Sep 2026 15:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449934; cv=none; b=Avb87ZQjM312bBgF8nkfFo/DCiC/olYmcLz7VacF5IMfSdIEJz1Yx1nwJdU5tkAtOstHA/n2dvo9DcI+a17XH9idHLruE9VgbhRODqBGKqRJ8l5hVfr1QIpMW1nig3BKsrQemK23Ylv5Eg/xMCuMvLmKdrTbfPN6LN9bgfru1G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449934; c=relaxed/simple;
	bh=rSLnVsPL9u/lrUTkhemPtZizvTSuCW/b7J5C50Xg6dU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R6xcLJASvibalJOpTXOpn+8786IPfzqIodPKJpwWixzr8GryMFB0XF1vP48mwvwKld0duMFNMiH/kETOa1zJFOCs63UWRGVtYHELB3EVkQ33jOF+LdLYDLnKDHjN5wfPfiAnQlIB/Ko//mHJe044OGVIcO0GRVC83FZznZBs86E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=GXsy9DcU; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="GXsy9DcU"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47de0093c42so2516158f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 08:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788449931; x=1789054731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cfbXs+O7gl4kgXTDO65gSIX2ToO03QaBPpDK6T1ajt8=;
        b=GXsy9DcU4YeNPFhSyZxpDjrN/zbVLagIvgiSM+PybSFNaTQ7R+SLtGpiqEukbXqMpn
         Gf2AZyKRa4ggPaa4m5r/Sil3/AsfYmVtmrLGleiZ1LDpX0hcZVs3GTNJa2Wtw0qIpjEE
         zHgaKBrkPciyEAOiKDNxizALmNxsFXEFGSIVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449931; x=1789054731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cfbXs+O7gl4kgXTDO65gSIX2ToO03QaBPpDK6T1ajt8=;
        b=BmW3kBFckjSdieBIDfRFfPN69hV1nvIxl/JLlHITPSzlA/PU+U07o8c9FtjDVLJ7Jk
         9LkvWxGAFzg+9YBy3x9PI7VZ/oV4uAhXoThsh4tlzqzM8+2lhXCO/ZhOW/QwCSfReTjn
         iEXPukOzsZmNmw0npJucf/U7HUxMPcgiJ3PqMVPJNpUCWyIY1A+Z+h1aVepkz2pzS3PN
         cFZCZHEnPtfQ2VpuOR+9h9HUF7fSwFTArde+CFw1Jya7smNJ3bEclxPcSERjM4mmab0g
         9tgR45QnDwb4k8g3jt72itRM7Bx8SCCx2W6GD8Ct5a+5IJlWApBT6W6kn2iwdbvXewLQ
         iEZA==
X-Forwarded-Encrypted: i=1; AKwUvBwuK74/mUz2OBnAYU/MMLFssSsrTlB3rpOBmF8OswUvpy4ve10yWp8eqGeSvJzHzfF7VI4ZoW1HWI8=@vger.kernel.org
X-Gm-Message-State: AFuF++luBnSY7eBLxv4YbS0jIsHBr9s4bTHrKTAqA9JVzU7uNvqvFDVg
	SW8ILGsQXCcDBjQbHgq3flc+NvspSnDgs+taKYFKzBhV4+iz6g6QIpTnUXOdqWpN2vY=
X-Gm-Gg: AYBFou3ABJywmfPwLu7EE+2KuPktgKn4lu0GIZozCerryg8qu3RQisT7hdtjVtVXOV8
	mFOXf+HJHpyVv8msexs2o0yd6/e3GxnQKHmCy0FkmUVXxH6so75TdX6ATPARIBlcX8hPRaplgzM
	BeRWn81fMnL4WxMK4zeFO9h4VeK++rFjlU3LnTJ51pQHfEW79OpqWb0MuOzKDoSoJZWV2GIwu/P
	MSr8bBA/06ionzvnRiEc87i6mMCUcSkNLTm7iZPVql6B6jRQZAQmzyL1L79ZynM8J2Kdm+YfE/z
	QyX1TxrTUCSYNhL2GTDzuIkhsT1PgTbgadeJyE2q3OkArGJhIiPCL+GboyewvosHdzdSVJUODXH
	uWNz941uFf/wymp6X+D38keUYlC5nz/0cxqkUb7rjvuxZw9CxfYohpvwTAXTsPkFGFb7kE283Vk
	FQ6DipfDrC5mDB7P27WoDMybSGhRz37jzF/OriKY5W1ibvJhAX+3GpVmv6R1uj/4v2Yk5R7SaKw
	zRzevWpN7SwVmY5UqYqVexZ5QCdCbiNOx5Q7IYKPvTXJ6motEJTmZ6rhfnCC15g6FcyhH7r2zts
	uZBjMXrxmjlIvzPjGnhr04NiRGz9gYpLqr0Zah0S5Fq3ihhIF0MR9pE=
X-Received: by 2002:adf:f643:0:b0:482:e1b0:8a1a with SMTP id ffacd0b85a97d-485860bfd21mr1751594f8f.15.1788449931024;
        Thu, 03 Sep 2026 08:38:51 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com (host-95-245-93-90.retail.telecomitalia.it. [95.245.93.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72df2sm15366301f8f.1.2026.09.03.08.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:38:49 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebin Francis <sebin.francis@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v13 0/4] Support spread spectrum clocking for i.MX8M PLLs
Date: Thu,  3 Sep 2026 17:32:12 +0200
Message-ID: <20260903153836.373267-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series adds support for spread spectrum clocking for i.MX8M{M,N,P}
PLLs (audio, video and DRAM). It has been tested for the video PLL on
boards using i.MX8MN and i.MX8MP.

While at it, it validates the spread spectrum configuration in the clk
core before it reaches the providers, and fixes the i.MX SCMI OEM
extension, which converted the spread to the wrong unit.

Changes in v13:
 - Add patch "clk: scmi: reject SSC configuration out of the OEM field
   range".
 - Rename patch "clk: scmi: fix SSC permyriad conversion" to "clk: scmi:
   fix SSC spread conversion".

Changes in v12:
 - Add patch "clk: scmi: fix SSC permyriad conversion" to fix the
   permyriad to percent conversion in clk-scmi-oem.c, reported by
   Sashiko AI review.
 - Fix issues claimed by Sashiko for patch "clk: imx: pll14xx: support
   spread spectrum clock". See the details in the patch changelog.

Changes in v11:
 - Add patch "clk: validate spread spectrum configuration" to reject
   invalid parameters in the clk core before they reach the providers.
 - Fix issues claimed by Sashiko for patch "clk: imx: pll14xx: support
   spread spectrum clock". See the details in the patch changelog.
 
Changes in v10:
- Drop patches 1-22, superseded by the generic spread spectrum clocking
  support from Peng Fan, merged in 7.3, so the i.MX8M specific infrastructure
  is no longer needed. This patch is now based on the following commits:
  - ae794aa6e88d ("dt-bindings: clock: Add spread spectrum definition")
  - c86814e70390 ("clk: Introduce clk_hw_set_spread_spectrum")
  - a7f16660af39 ("clk: conf: Support assigned-clock-sscs")
  - 7d98de6ffdab ("clk: Add KUnit tests for assigned-clock-sscs")
  https://lore.kernel.org/all/20260826165611.236321-1-sboyd@kernel.org/

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

Dario Binacchi (4):
  clk: scmi: fix SSC spread conversion
  clk: scmi: reject SSC configuration out of the OEM field range
  clk: validate spread spectrum configuration
  clk: imx: pll14xx: support spread spectrum clock generation

 drivers/clk/clk-scmi-oem.c             | 17 ++++-
 drivers/clk/clk.c                      | 14 ++++
 drivers/clk/clk_test.c                 | 12 ++--
 drivers/clk/imx/clk-pll14xx.c          | 99 ++++++++++++++++++++++++++
 drivers/clk/kunit_clk_assigned_rates.h |  4 +-
 5 files changed, 136 insertions(+), 10 deletions(-)

---
base-commit: 940de590b839f71d6dc846160534bf202401b8b7
branch: imx-pll14xx-spread-spectrum

-- 
2.43.0

