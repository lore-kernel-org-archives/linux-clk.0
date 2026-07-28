Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D6D380FCE
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 16:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785256767; cv=none; b=AafYf9k9l9Nemd2/Lkh6kpns78p5yI8LjOARhfQUnwKcfrul4gm9xhh4Mw91boG/iDfUjcNQLRKzoYda2r3Xde6tfiORuVbhePj/N1Cql8UITzpL3SUNX7HUX/S4m/cCI8HbgI2QBLBk0APzatrw+5wqAu/1PyN1CAgfCvlt1E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785256767; c=relaxed/simple;
	bh=2VwahX0hXZe1afQ13RkBrJInqADAeT7RR1OJABOmJHY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lVczuzzMxLAyMew5UhnDE8vvCNrpo0mkVvQ7XaXRHmQ8evYKMFu5i6TADXvaszNwtQK1nuIuX+VueuaXe57GmYonjUVUFxN3DeqNUxJawETAcOVBtefnAeUKjj1h+cWJWcTC1eyGHElbY76oazOp+WJy/gIjRMyHL2pRBE2m+eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SNYQjmSO; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Tfd15HR9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SNYQjmSO";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Tfd15HR9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785256764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2ugtH5lXLPdHAmq0dZl1713vxjNwp/oKWY6qEjgCRb0=;
	b=SNYQjmSOMd6E7K+VzKNqK2KzRSWQeGXrS2twWDAyIaORj+mXkfBwVvV7Sphg8jnLNVG6QL
	0uE1QElOrXEL5R7KWfT5A5r2kba2Wze/HS+hnvMQrpYLN0mfzd2INJmONVmQWtFRdQZR+i
	BwYb4uzst35DzBufUiZoKYwNlERRYFI=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-261-mYB0SGaxNdaBFT--EhUK3A-1; Tue, 28 Jul 2026 12:39:22 -0400
X-MC-Unique: mYB0SGaxNdaBFT--EhUK3A-1
X-Mimecast-MFC-AGG-ID: mYB0SGaxNdaBFT--EhUK3A_1785256762
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930b6bdcb4fso12725285a.2
        for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 09:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785256762; x=1785861562; darn=vger.kernel.org;
        h=user-agent:content-transfer-encoding:content-disposition
         :content-type:mime-version:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2ugtH5lXLPdHAmq0dZl1713vxjNwp/oKWY6qEjgCRb0=;
        b=Tfd15HR9DvYflzKe1XiTvdjtwp5vmvdMN2A2MGeTYDaGXjoBoBr31SYxD5pPIOGQ0i
         Lq5hoVXd7GjEE4TODMTBdH+BLqefT1E4AiuY8DimsXa0Jg4970h7SECYBHmfqwZAmEVz
         tD+PwbnZjJbL0A0Ks+1uJRpSrtY+Kyrd3lyT+5u9uTWddj9EMU+gQYQ8fao4ZBtWDV62
         1PS+lxkgDWsb87mD9V0jwF+9e1K7kKyht32/5Zbv0vAs0OdFb5oM1BF1+27BwhhJQMyY
         DtyWBbUI3Pe4oA0QDnsmPJXyjuVDNgEmgXchHQKohOR9mPStD26IvLPxbjwKd+kRwrKX
         6ONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785256762; x=1785861562;
        h=user-agent:content-transfer-encoding:content-disposition
         :content-type:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2ugtH5lXLPdHAmq0dZl1713vxjNwp/oKWY6qEjgCRb0=;
        b=pgS/WUmSLD/qdssV/n98Ffw6RKewOBrXEU7Qm5s3v4aqf3BH4KLIufnsZINeOBb2pu
         HBXY5IkDjtLojD/is2JE6ScKxjsce00Tw3S78lgHNHQ0tooqdCf2L5SAvXJ4GaLdMh2I
         1ZAn4UsFGU91mCJpnYqpl3TYsrTF9/odbPDz/xo/jxB7cigi7cd0Nm8A/B33wtpXs+DD
         pNDltfU4QDZexIgPXJ6Lxz+FVhU8iKucOm0Yr0DoXKfsqiVrkCPJwwFxPE/bZqWjoFOL
         jRYrf09yJncggs/McjoKObTvXBMQVSei9utptLSwA/2TBJHHh4dlWyUh/RF7ELFz4l1m
         vZEg==
X-Gm-Message-State: AOJu0YwUNsp4mlZwnbxO7cjSn8GafeuZcRzYxIuwkUWPYABlcevwn0Dz
	ItIQsJOce7uI6B1OKU+IAFDFEic88188grASE6haxAGPuAhJ0ATXUCcTmQz0jt8X9GEy7/+BnOI
	wbn9AqcLZD/4lL9vxh6JIIA7psuWKF/dNT0EJaD7C59fJEQfuujB5ixV+Pu6Njg==
X-Gm-Gg: AR+sD129cBahmSworXfIsywAh4CZRfUcvwWT9m1XPLQ97ezlaZr7Pjx68xufrjbhqa8
	QOVKwZTpcKbu+AMLlunvADeQeYalvtVzhwnmvqBuQceg4fhnehFw4WOeHFQ0BqOqgGWOnjSffXf
	PDYZvJi+D7IidoDNY5biE5Sb0Ihv9Dl1chILIvjOQJp8nsfqTnO6u7piFwcX/BgrocSX3cp/MwT
	uq4q/0o2LBXQQPiduuMjXnUwRag5DRyGpFnhXe/m33KVNN0Laq/BFNw3sHrNNZE4T61Q1m3OqUx
	vDupRAIxKJnPjT2XSRgZ5aoo04dvinxjlDdB7bbI1ZEbvz7Zcx18S3VdzP/vdqoNEx8qSQL/NuL
	R82lyhWtBJNCjx733OIXEtg0F66MKkGjbD8k=
X-Received: by 2002:a05:620a:d8e:b0:930:8489:6857 with SMTP id af79cd13be357-933027921d0mr347085585a.88.1785256761734;
        Tue, 28 Jul 2026 09:39:21 -0700 (PDT)
X-Received: by 2002:a05:620a:d8e:b0:930:8489:6857 with SMTP id af79cd13be357-933027921d0mr347080785a.88.1785256761155;
        Tue, 28 Jul 2026 09:39:21 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-932de53febasm881103185a.14.2026.07.28.09.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 09:39:20 -0700 (PDT)
Date: Tue, 28 Jul 2026 12:39:18 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Ni <nichen@iscas.ac.cn>, Chen-Yu Tsai <wenst@chromium.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Colin Foster <colin.foster@in-advantage.com>,
	Dan Carpenter <error27@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Jia Wang <wangjia@ultrarisc.com>,
	Joakim Zhang <joakim.zhang@cixtech.com>,
	Kostas Damaskinakis <kostas.damaskinakis@gmail.com>,
	longlong yan <yanlonglong@kylinos.cn>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Myeonghun Pak <mhun512@gmail.com>,
	Pavel =?iso-8859-1?Q?L=F6bl?= <pavel@loebl.cz>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>, Rosen Penev <rosenp@gmail.com>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Suraj Gupta <suraj.gupta2@amd.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [GIT PULL] clk: Clock driver updates for v7.3 (round two)
Message-ID: <amjbNiVjm5HkPRu9@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Stephen and Michael,

Here's some changes that were posted since June 29th that I feel are ready to
be picked up. These are changes where a clk submaintainer typically won't send
the changes in via a separate pull.

Note that I have a separate outstanding pull for some changes posted during
the last merge window that I feel is also ready for inclusion.

    https://lore.kernel.org/linux-clk/akLzCVzbMbUsgDda@redhat.com/

There is a minor conflict in drivers/clk/clk-si544.c between these two pulls.
You'll need to add the .name and .driver_data name initializers like the
following based on the work from Uwe Kleine-König:

-        { "si544a", (kernel_ulong_t)&clk_si544a_info },
+        { .name = "si544a", .driver_data = (kernel_ulong_t)&clk_si544a_info },

With the conflict resolved, I verified that both merges can go in together, or
individually.


The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://github.com/masneyb/linux tags/clk-misc-round-two-for-v7.3

for you to fetch changes up to cf561283254dd9f55805800237e6f82f08d91497:

  clk: tegra: set up proper EMC clock implementation for Tegra114 (2026-07-28 11:31:34 -0400)

----------------------------------------------------------------
clk: Clock driver updates for v7.3 (round two)

- New clock controller drivers for the Cix Sky1 audio subsystem (AUDSS),
  UltraRISC DP1000, and MediaTek MT8173 MFG_TOP, along with their devicetree
  bindings. Si549 support was added to the existing si544 driver.

- New clock and reset support for the Aspeed AST2700 PECI controller and Airoha
  EN7523 PCIe PERSTOUT reset lines.

- The clk core gains devm_clk_bulk_get_enable() as the mandatory counterpart to
  the existing optional variant, and exports
  devm_clk_hw_register_composite_pdata() for modular drivers.

- Tegra gets a proper EMC clock implementation for Tegra114, 48MHz pll_p_out1
  support needed for UEFI on Surface2, and the Xilinx clocking-wizard gains PLL
  charge pump/lock parameter programming during dynamic reconfiguration.

- Bug fixes for a NULL pointer dereference from uninitialized clk_init_data in
  the eswin driver, an IO remap leak in the MediaTek pllfh error path, inverted
  gate control for MT8135 devapc_ck, a missing OF node put in tegra124-emc on
  registration failure, a prepare reference leak in the palmas driver,
  unregistered PLLs on MT6735 probe failure, a missing kasprintf NULL check in
  pmc_atom, PCIe warm boot instability in the Airoha EN7523 driver, and a
  clocking-wizard clock difference detection bug.

- Various cleanups across tegra, st, and mvebu providers to stop misusing the
  consumer clock API, along with other minor fixes and improvements.

Signed-off-by: Brian Masney <bmasney@redhat.com>
----------------------------------------------------------------
Akari Tsuyukusa (1):
      clk: mediatek: mt8135: Fix inverted gate control for devapc_ck

Chen Ni (2):
      clk: mmp: pxa1908-apbc: Remove unneeded semicolon
      clk: mmp: pxa1908-apbcp: Remove unneeded semicolon

Chen-Yu Tsai (2):
      dt-bindings: clock: mediatek: Add mt8173 mfgtop
      clk: mediatek: Add mt8173-mfgtop driver

Christian Marangi (3):
      clk: en7523: reset PCIE HB on init for AN7581
      dt-bindings: clock: airoha: Add additional reset for PCIe PERSTOUT
      clk: en7523: add support for dedicated PCIe PERSTOUT reset

Colin Foster (3):
      clk: clocking-wizard: fix clock difference detection
      clk: clocking-wizard: optimize clock search
      clk: clocking-wizard: remove 20kHz restriction

Dan Carpenter (1):
      clk: document that clk_get_parent() returns NULL

Dmitry Osipenko (1):
      clk: tegra: support 48MHz clock for pll_p_out1

Guangshuo Li (1):
      clk: tegra: tegra124-emc: put EMC node on register failure

Herve Codina (1):
      clk: lan966x: Add MCHP_LAN966X_PCI dependency

Jerome Brunet (3):
      clk: mvebu: clean-up simple provider misuse of the consumer API
      clk: st: clean-up simple provider misuse of the consumer API
      clk: tegra: clean-up simple provider misuse of the consumer API

Jia Wang (3):
      clk: composite: Export devm composite pdata helper
      dt-bindings: clock: ultrarisc: Add DP1000 Clock Controller
      clk: ultrarisc: Add DP1000 clock driver

Joakim Zhang (4):
      dt-bindings: soc: cix: add sky1 audss cru controller
      clk: cix: add sky1 audss clock controller
      reset: cix: add sky1 audss auxiliary reset driver
      arm64: dts: cix: sky1: add audss cru

Kostas Damaskinakis (1):
      clk: eswin: Zero-initialize stack-allocated clk_init_data

Louis-Alexis Eyraud (1):
      clk: mediatek: pllfh: Fix IO remapping leak in register_pllfhs error path

Myeonghun Pak (3):
      clk: mediatek: mt6735: Unregister PLLs on probe failure
      clk: palmas: Manage external-control prepare with devm
      clk: palmas: Use devm_of_clk_add_hw_provider()

Pavel Löbl (2):
      dt-bindings: clock: si544: add si549 compatible
      clk: si544: add support for si549

Pengpeng Hou (2):
      clk: mediatek: mt6735-vdecsys: add missing MODULE_DEVICE_TABLE()
      clk: mediatek: mt6735-vencsys: add missing MODULE_DEVICE_TABLE()

Rosen Penev (3):
      clk: stm32: add missing bitfield.h header
      clk: stm32: allow STM32MP COMPILE_TEST builds
      clk: hisilicon: hi3660-stub: use devm_platform_ioremap_resource

Ryan Chen (2):
      dt-bindings: clock: ast2700: add PECI clock
      clk: aspeed: add AST2700 PECI clock

Sang-Heon Jeon (1):
      clk: remove conditional return with no effect

Shubhrajyoti Datta (1):
      clk: clocking-wizard: Program PLL CP/RES and lock parameters on reconfig

Suraj Gupta (1):
      clk: Add devm_clk_bulk_get_enable()

Svyatoslav Ryhel (1):
      clk: tegra: set up proper EMC clock implementation for Tegra114

Wolfram Sang (1):
      clk: mediatek: remove unneeded 'fast_io' parameter in regmap_config

longlong yan (1):
      clk/x86: pmc_atom: add kasprintf return value check

 .../bindings/clock/mediatek,mt8173-mfgtop.yaml     |   70 ++
 .../devicetree/bindings/clock/silabs,si544.yaml    |   10 +-
 .../bindings/clock/ultrarisc,dp1000-clk.yaml       |   60 +
 .../bindings/soc/cix/cix,sky1-audss-cru.yaml       |   92 ++
 Documentation/driver-api/driver-model/devres.rst   |    1 +
 MAINTAINERS                                        |    8 +
 arch/arm64/boot/dts/cix/sky1.dtsi                  |   18 +
 drivers/clk/Kconfig                                |   10 +-
 drivers/clk/Makefile                               |    4 +-
 drivers/clk/aspeed/clk-ast2700.c                   |   10 +
 drivers/clk/cix/Kconfig                            |   16 +
 drivers/clk/cix/Makefile                           |    3 +
 drivers/clk/cix/clk-sky1-audss.c                   | 1206 ++++++++++++++++++++
 drivers/clk/clk-composite.c                        |    1 +
 drivers/clk/clk-cs2000-cp.c                        |    6 +-
 drivers/clk/clk-devres.c                           |    7 +
 drivers/clk/clk-en7523.c                           |   43 +-
 drivers/clk/clk-lmk04832.c                         |   12 +-
 drivers/clk/clk-palmas.c                           |   24 +-
 drivers/clk/clk-si544.c                            |   82 +-
 drivers/clk/eswin/clk.c                            |    4 +-
 drivers/clk/hisilicon/clk-hi3660-stub.c            |   10 +-
 drivers/clk/mediatek/Kconfig                       |   10 +
 drivers/clk/mediatek/Makefile                      |    1 +
 drivers/clk/mediatek/clk-mt6735-apmixedsys.c       |    5 +-
 drivers/clk/mediatek/clk-mt6735-vdecsys.c          |    1 +
 drivers/clk/mediatek/clk-mt6735-vencsys.c          |    1 +
 drivers/clk/mediatek/clk-mt8135.c                  |    5 +-
 drivers/clk/mediatek/clk-mt8173-mfgtop.c           |  242 ++++
 drivers/clk/mediatek/clk-mt8196-vlpckgen.c         |    1 -
 drivers/clk/mediatek/clk-pllfh.c                   |   98 +-
 drivers/clk/mmp/clk-pxa1908-apbc.c                 |    2 +-
 drivers/clk/mmp/clk-pxa1908-apbcp.c                |    2 +-
 drivers/clk/mvebu/clk-cpu.c                        |    2 +-
 drivers/clk/st/clkgen-pll.c                        |   20 +-
 drivers/clk/stm32/clk-stm32mp21.c                  |    1 +
 drivers/clk/stm32/clk-stm32mp25.c                  |    1 +
 drivers/clk/tegra/clk-pll.c                        |    1 +
 drivers/clk/tegra/clk-tegra114.c                   |   39 +-
 drivers/clk/tegra/clk-tegra124-emc.c               |    1 +
 drivers/clk/tegra/clk-tegra210.c                   |    2 +-
 drivers/clk/ultrarisc/Kconfig                      |   18 +
 drivers/clk/ultrarisc/Makefile                     |    4 +
 drivers/clk/ultrarisc/clk-dp1000.c                 |  154 +++
 drivers/clk/ultrarisc/clk-ultrarisc.c              |  399 +++++++
 drivers/clk/ultrarisc/clk-ultrarisc.h              |   71 ++
 drivers/clk/x86/clk-pmc-atom.c                     |    3 +
 drivers/clk/xilinx/clk-xlnx-clock-wizard.c         |  142 ++-
 drivers/reset/Kconfig                              |   13 +
 drivers/reset/Makefile                             |    1 +
 drivers/reset/reset-sky1-audss.c                   |  127 +++
 include/dt-bindings/clock/aspeed,ast2700-scu.h     |    2 +
 include/dt-bindings/clock/cix,sky1-audss-cru.h     |   60 +
 include/dt-bindings/clock/mt8173-clk.h             |    7 +
 include/dt-bindings/clock/ultrarisc,dp1000-clk.h   |   27 +
 include/dt-bindings/reset/airoha,en7581-reset.h    |    4 +
 include/dt-bindings/reset/cix,sky1-audss-cru.h     |   25 +
 include/linux/clk.h                                |   27 +-
 58 files changed, 3065 insertions(+), 151 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgtop.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/ultrarisc,dp1000-clk.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/cix/cix,sky1-audss-cru.yaml
 create mode 100644 drivers/clk/cix/Kconfig
 create mode 100644 drivers/clk/cix/Makefile
 create mode 100644 drivers/clk/cix/clk-sky1-audss.c
 create mode 100644 drivers/clk/mediatek/clk-mt8173-mfgtop.c
 create mode 100644 drivers/clk/ultrarisc/Kconfig
 create mode 100644 drivers/clk/ultrarisc/Makefile
 create mode 100644 drivers/clk/ultrarisc/clk-dp1000.c
 create mode 100644 drivers/clk/ultrarisc/clk-ultrarisc.c
 create mode 100644 drivers/clk/ultrarisc/clk-ultrarisc.h
 create mode 100644 drivers/reset/reset-sky1-audss.c
 create mode 100644 include/dt-bindings/clock/cix,sky1-audss-cru.h
 create mode 100644 include/dt-bindings/clock/ultrarisc,dp1000-clk.h
 create mode 100644 include/dt-bindings/reset/cix,sky1-audss-cru.h

