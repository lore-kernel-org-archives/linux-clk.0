Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794894772A4
	for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2026 09:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253785; cv=none; b=VPyjRWAkM2B+MF4qaoerx36sS+dsbbIK/zdazD0RpHReIQLV/Si4LBYgCqcP0UP9C4HND3aZ0MxIeg6+pFtXN1w9JI7OaX/2sdJxwBXYjCF2oZxl/2X9H5M9GTbZMSxYMJGITocLGosfHY5ICEv1sZYyak7VCvccqsEiqpL9+XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253785; c=relaxed/simple;
	bh=s7OwmMd7z/CvhHqL8SqrmB96oUwRDyMihyU61UF48Os=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C0+0dt6Wzl5SESJ0Qg0jG19w+dB51VG+UjEfyAVBT4HKofUFX2H2FkLIUBXTi5gofhh3TbhbIDE+I+zXS7x0U3szYQWM0UMOTGg9LLShSUdzsHzqSuXNI4kdFqczOpmb81nkIvFoQLDz7WNDFICAjAVRKKmm6ij6ucDFmFIB0bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=eMqT0tGo; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="eMqT0tGo"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-495590dde14so44683495e9.0
        for <linux-clk@vger.kernel.org>; Tue, 01 Sep 2026 02:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788253774; x=1788858574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T9TiGLOlBJPaa6ACMJt76ajLLQMGHpzZnyu3DaDv9wI=;
        b=eMqT0tGoQS7uoYSWORui1JssXLeUfMin/saqc7XiNtm2Y/v0ahwzKgV79QeMmOBLta
         L/AD3HLXi+rEUlLzExkNPEyX5YdmlZ0BqfNUeROcTLEYUZ0yNxCuUPItlnCBqaHXs3f4
         AVpZMYTFxqDaXT+fLGV6q5BpxhRp6Hq7/Hq2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788253774; x=1788858574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T9TiGLOlBJPaa6ACMJt76ajLLQMGHpzZnyu3DaDv9wI=;
        b=E/xbc32RP0Da7gzwToQTAHRrP2gPVlk8zIdO5b8+/7t/PDOU0cb+reLW6HOz9l8tZQ
         vFUvXQy5i06Sfn+puNTnoRzAOufP4dChrcjAG0P8oUR+U6bBOqTQ4/DAubn6t8MhaJoz
         D4gunz+0mcF03BaHuK5011hsJyf/O8UGkoPSD2f0eBO6Hy+7CnCCDc9Tq0nA4w3BtbfQ
         KKnQnnES9dgt6ePcLRayuEaUqpCs3vloWZuKq+30PXU3hrzLSxF4baCiv7xgGihRIht4
         yQmpYS2ega6VIduzMZCcSFD9ywenoTOq9jN5kU5a5QxVllyAOPhUFOIE21a79meTYaFM
         x4/w==
X-Forwarded-Encrypted: i=1; AHgh+RqwBuugYFYMARPsRZ6cntKOXdFd8GVdMAJKqIkgjp/1LFQzs/ZSXMwzsM8eeleh0igvSkV6QotM2dM=@vger.kernel.org
X-Gm-Message-State: AFuF++lKBZD36+sIPzHy8wy/lHv60QUndD7LZ2ZFNyj4tb5hJYjWUn54
	BgtUw7c0moKQDGC6mz1FgzoQtoE6LgVFyb9ptB80WsSfYY0JDRVl0+jeR4iSabmJXnQ=
X-Gm-Gg: AR+sD12rsquErtRqKCidhLrqH5eRiPZChOND8AsUcWXdG6Sjv2x70yGnYh7u2TbMdux
	Nz0WdKeuqBP7SSfvI7oaAnSEolY+iXTf368414p46S+9i48uBqqYOnSTWiMVAlMrW45rTrChasg
	slqjYp8azftsPZW3B6Ao/XnYyAA3t1M5zYWvPYC4OrmYVMZL+G6thmM7ondkllXj5DTjECOo4DB
	1QrwS/MWci9fpeuUToCtAs5ylAs6qU8Ele8CVwi6jVvHQByuD+Dpz0yourB6nqxTWynA46WFhlr
	PQkL0Cgw8DqA37MxA/Sgp3youo0oNvaILLq4VCnDES9s5i9+NWdnhx4ckDHiLLMsy0/WNuejn0X
	BHeBT3ig9qYsuWEGTdsosxgYG2bS4Ja2YCPmu2HN/65oUVnAc/o7PjGyG6zdHBgGyrT4ZEb6tXA
	oGG3bmBmDW/pGXjsANxruHDFaxKAnq0w3/PXRAwp2ySsF8JsV03P7IZmuxwNBHyAZ/3ZaADXySN
	IJIiwA7N1pbizfqa550MfyaJKgXh1ox4OxDQep8Z2MD6iu0oKK+rUNy2w5yBfFzhqcWBdx5iDHM
	eWLEvKZHFysqFaEIOQDKRiG6fUPSmhq6R9K8dUrURevEAzGpJeVP3NW+L0CKX21C1Q==
X-Received: by 2002:a05:600c:190a:b0:49c:e1f1:3dd5 with SMTP id 5b1f17b1804b1-49ce1f13dd6mr5345715e9.4.1788253767752;
        Tue, 01 Sep 2026 02:09:27 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com (host-87-9-102-148.retail.telecomitalia.it. [87.9.102.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442c425cesm3825273f8f.6.2026.09.01.02.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:09:27 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
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
Subject: [PATCH v11 0/2] Support spread spectrum clocking for i.MX8M PLLs
Date: Tue,  1 Sep 2026 11:05:16 +0200
Message-ID: <20260901090912.585681-1-dario.binacchi@amarulasolutions.com>
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

Changes in v11:
 - Add patch "clk: validate spread spectrum configuration" to reject
   invalid parameters in the clk core before they reach the providers.
 - Fix issues claimed by Sashiko. See the details in the patch changelog.
 
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

Dario Binacchi (2):
  clk: validate spread spectrum configuration
  clk: imx: pll14xx: support spread spectrum clock generation

 drivers/clk/clk.c             | 14 +++++++
 drivers/clk/imx/clk-pll14xx.c | 79 +++++++++++++++++++++++++++++++++++
 2 files changed, 93 insertions(+)

---
base-commit: 786262be6048deab760f68c8acc2c85607165894
branch: imx-pll14xx-spread-spectrum

-- 
2.43.0

