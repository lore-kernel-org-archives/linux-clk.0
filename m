Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD9B43801B
	for <linux-clk@vger.kernel.org>; Wed,  2 Sep 2026 10:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344134; cv=none; b=arv+ILyWwU/+TcDCKK4mzuQgabvqhhoy1jskXZr92YZhv4Jsm716AQVjD87NVJX+gI0XM2a4ee2BQUK1toUre5UAiRqB/5CqeIbe9TcGBuuQfNYx6qcEMtwiYZHDaqTCtk75GrAUyx7FGo1QdGv2XeaHzv9NkYFTkIS63M47vkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344134; c=relaxed/simple;
	bh=2LsvSr38hGOtCdfpIHy9WpAc5Go4Jc4P01Qw/e9O0DE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gpoWA9eHndsjzyAmU4MYZyfBaGa5F1S2G5RkhgGXFwIUZo2k/nVUY9M4514BJ3GaRWptMnT0Hdzhsc/qa2E+4+sI4lBuHlmmEJQcywYkvrsaJvYaeyd6XMmzThtzYgFJxt4mRELCPnockxIugmloN+xlL3dqngKWxUpMwPv2G30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=fgKdATJk; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="fgKdATJk"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so9550775e9.2
        for <linux-clk@vger.kernel.org>; Wed, 02 Sep 2026 03:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788344130; x=1788948930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pJqwdWZe9Hp0I5xyr2vQgi9tkUCIeJggyV1DIcC1SHo=;
        b=fgKdATJkQw45e+gQbecKrCGGQd6VMKigd7cUQzK8DLCwghPEYwZC7BfmJD348CS8ib
         ZlG17wLQD7AtTBcd0imWpnxd7kfe0C5JGaEDH8nCVTIYfS9MdwMdqGB+lSUeNoMuvDJA
         ykt54VAOtshtE3aACWW9Z2zTO4FU1pToj2X70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788344130; x=1788948930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pJqwdWZe9Hp0I5xyr2vQgi9tkUCIeJggyV1DIcC1SHo=;
        b=hJjLMM5V7TrbqC/wP/0hRFADuVGr1D9e43FFJXvMjpTroh9KG+0Okl81K8c3ngGtty
         D8/bVo9zytHC8xaIImMyedp9vX5iARi4t2KpsekkZ99jEBZx22oOlbBfyWxHvyyYT1Dc
         DSHqVC/GHuxdgLm7cSFistKHleu90HmoslRdCdlJb+1JSwJ/dx0ZTTRS717sYcHAqGqE
         OvDQd6CnaOJMyvEfKAvgSpGWw92vh3o/a09oEWDw7wWpTtnU/QV6O717Ob/eOKwWNk6H
         WViCJUhirRjKwPopisBL/LBMG4wYEBW4h9LmzQgGMPmeJK+m4h83XZ3RZRPajAb4O+7h
         vUCA==
X-Forwarded-Encrypted: i=1; AHgh+RqVUSzdO7ylC8qEGbz/6sRHDMdV6pqYK4Y3sdGnHCqLi6iUnDzu7RV8c2R41BcYDx7i7rgneoBG0TI=@vger.kernel.org
X-Gm-Message-State: AFuF++nWAYE2XrM/r0BNkuEXgGwSjKOkU/0w0v1UsFAURrcwLSTx+Ihu
	PmmaBnDEPjlhTzLEuYEJm5ZRG43FtT9YC8as1QxAuojb5pn3S8cXOR5UDc5UAtQLlwc=
X-Gm-Gg: AR+sD10z3QKZKggjH4SGC2FXx/kc2qzasgTQAgBSYoaPmUwDJIoehFwtOUyGIonGyUm
	8lG32CHKb26bXjHWrCK9YM7YjTNLpLmxlv0pn8uA3aq3haz9WNSpCxalvLorSGIilkPKz/tY3z/
	x6ildRNpIvKrsStFIurPtehSay6rj+wJWkpXpYpStVJKei8TVhBsDJUxg2jpUh4DA+vwKmwJY7v
	xQ4qy1vZI2fH4IKdvitwdcqoI1ScI4qiVs1qWde/GzRZqDgfi8QaFYWV5xs9awESCwwmrVR+Qw3
	W+jwy4o2vALAIBtMgjfU8rjZAHgkH8bi8Kiv1aqjnR201hOMwY6r90onib8gYsi2pZwpv/HseOS
	BmcMK7ZJJd/010BHN54R2rHm6rKPTvDOklnmilS6R9CWXJ9E1BcrYy+vqqxhz6vDRsF/2PhDVIE
	SMD0+iUa+s5xGrLa9b0tnfYSys0zjBm/8+wlRAP2QyWUAzDfdUMAEI23IviABsH8sm+AAvNCghr
	4VLTICJEJaVVt6vJSpt80PFKXFbfq/2R+HVrW+QXVcl61cUEwrkOfy9UpFeUwuMgsPwwO5AeX0c
	FeuY5LtWVVdg3IAof3Qf2wWfDe9pu6kFns8gkhgl1X/QAW7m2JZZ6hyDhVfN
X-Received: by 2002:a05:600c:6208:b0:49c:df2b:15fc with SMTP id 5b1f17b1804b1-49ce57f7113mr70770465e9.8.1788344129574;
        Wed, 02 Sep 2026 03:15:29 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-87-9-102-148.retail.telecomitalia.it. [87.9.102.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdd73f7a4sm139618475e9.12.2026.09.02.03.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:15:27 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
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
Subject: [PATCH v12 0/3] Support spread spectrum clocking for i.MX8M PLLs
Date: Wed,  2 Sep 2026 12:07:32 +0200
Message-ID: <20260902101515.167819-1-dario.binacchi@amarulasolutions.com>
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

Dario Binacchi (3):
  clk: scmi: fix SSC permyriad conversion
  clk: validate spread spectrum configuration
  clk: imx: pll14xx: support spread spectrum clock generation

 drivers/clk/clk-scmi-oem.c    |  2 +-
 drivers/clk/clk.c             | 14 +++++
 drivers/clk/imx/clk-pll14xx.c | 99 +++++++++++++++++++++++++++++++++++
 3 files changed, 114 insertions(+), 1 deletion(-)

---
base-commit: 89a312991dc6e638a36adc43ccb91dbc25504c04
branch: imx-pll14xx-spread-spectrum

-- 
2.43.0

