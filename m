Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469E81F4C96
	for <linux-clk@vger.kernel.org>; Sat, 25 Jul 2026 05:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784956034; cv=none; b=GM+wNHaNrO3aWtrseD3gJ/a6b0aXLTfL78syM/CG61m4KIMBAT6O7iJm5jPTuPnBTm5gHAxL+b8G27+SsN4LyCOoiVxnzg6DBemG38IgmamWJO6Xn+SaqkqEsmoEthrAaqaw+RpNV3zBri8g9Z3sCT3GJFfmWfblX2H0dn0X0EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784956034; c=relaxed/simple;
	bh=9gb+3WFUr9T5BUxBHuwx/ljQE1d49u9xE4q8pr9qSw4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=r7b+QuHBnG0RvW7cLcnGKRQu13X+nIbKIP8uF8+jEnhVlM6z08TL+5+Nl1dfNdx5Wauk71yEG8erR/NYS3v+iuMaesnxG0dmk9D0+0KE9TFVvHyK7KGruHiaIcFzWM63F2reJro7/dRRUAu7yUtPGWStuNc7FYjRXRqX6gOPC+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AAfOT8sX; arc=none smtp.client-ip=74.125.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AAfOT8sX"
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-cbb8ebaca74so494379a12.1
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 22:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784956032; x=1785560832; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lGkHba1dpLm3kZ77OrZxUFezmNhR7Fx9pZtETx4Zo3s=;
        b=AAfOT8sX92ww3mNl+cbV0wBhuJb62H/oT2Z0xKj+wUtj7LozMgkDH1ktrj0Kr3NzMl
         PU3A6eqklQY0exj7uGVTDA34zyoR6txd+cFfVhbVlhp2KfPtkonizjxpafFzVCJl4X7q
         CPY/8zBt64HQlEDHcvGTUYH/EbCpcUQp8v6vt9gMliiYoTIZuKGjFL1xDaSagGr/io4E
         XKXcxOdU2i5ck3YxSii18NzCBkZLIH0xa44EUm76hJZQbSR4CUbWdVlRk1FvDOMi7N3m
         enlgP3jquSYnel/R+7Xa2rp0gDwh7QYDvRPryuNbqNOtMB1eQPQgsIS/62VZy5GUb9sx
         NZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784956032; x=1785560832;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lGkHba1dpLm3kZ77OrZxUFezmNhR7Fx9pZtETx4Zo3s=;
        b=PsEmXnXLL5bc6PRPYm3w06b1AfpydfAjp+HLYiCBt+VbX9K6zhLOqj6jDgLfEbX8W/
         2Hy0WP1PaiiLl+Oox31K/80walek3eJt+VZZcUHf6UKQIyMU1FzrNToav+8h0+Rh1UuR
         FoMXIvmqexDhI7zQHhb3duLLlGyn+o53io13fBMY+hs2dbsVtc2WQDpuAFlMDYAtLVUP
         W8E8gnUbM4wDF06FiiYp0kZBhKfANM30ASrVdWTk4X6LrkpG5ODKTkNK7WbHjSVdQo2I
         IGPDih8jF6wLnpPY7LtUreNi148xM16Zf/d+wEO1/xMe47BrNG4qbbDPZ5hK0cFr7DHx
         K9nA==
X-Forwarded-Encrypted: i=1; AHgh+Rolh0MBeA3tLvowsfOiv/nuZk0Ur/OY12oSh+vIU6gB59u6DziRovqiA576v3ioFu/nMHTT3o06VVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2t/+iwzIUAO/6b99PJ8H7u8o+maLAGRk0qiZ9bakb7cm2xbbs
	CEEKivhe/nCPtJym09zkZZ0Fajx1Tv11yoQOLrCRc/i0xX23buivyxLW
X-Gm-Gg: AR+sD10kYy/BbWuqVUGt220JKiD5xD3JVB3M9sz0YtX6HPxPWWc7ItuN1mjGNJw7wHG
	css+3JA0ZMe6i4WtobkOti4LW0dyM6tBJ2FkWdQFvPgikG59U16P+R/a4ldlP+/QqZwgFM05rIE
	T3aopUs2LtsHgYKWk088pfgMZD4hpKB4K+533bAPCo/fb7JuZQTycVvxk5QP5moJgPy74VhoqTi
	PthDIJM+CQTJr/rI7bQ5bjBZvcDrYlPkZ0u4i2DFas/SKi/lTrpoWa+ntM4XKYWRtkyNNL6owzm
	dAXyY8SOMM4kEd5h+mF6P+SCuMoqyr7Id+qEduuGtyfQoSM5WFVoJPRTKVGQudfHrwkuGJpVSh7
	Qw81UWhUzR1UKyHjVgaZrC3Y7IxRhV3XEjsABKnDyP8olYLDWpXGbb8w=
X-Received: by 2002:a05:6a00:4218:b0:84a:6726:62f9 with SMTP id d2e1a72fcca58-84e5942e629mr681366b3a.9.1784949429047;
        Fri, 24 Jul 2026 20:17:09 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::403c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53432834sm640542b3a.50.2026.07.24.20.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 20:17:08 -0700 (PDT)
From: Cody Kang <codykang.hk@gmail.com>
Subject: [PATCH 00/17] drm/spacemit: add SpacemiT K3 display support
Date: Fri, 24 Jul 2026 23:16:32 -0400
Message-Id: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJEqZGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDc0Nj3Wxj3ZTM4oKcxErdVIu0tNQUM/NUS2MzJaCGgqLUtMwKsGHRsRB
 +cWlSVmpyCcgEpdpaAGzX92NuAAAA
X-Change-ID: 20260713-k3-display-e8ffed67e936
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, Cody Kang <codykang.hk@gmail.com>
X-Mailer: b4 0.15.1

This series adds display support for the SpacemiT K3 [2], a RISC-V SoC:
a new DRM driver, a new PHY driver and three new bindings.

The display path is three blocks deep:

  Saturn DPU -> Innosilicon DP/eDP controller -> Innosilicon DP PHY

The Saturn DPU is SpacemiT's own display processing unit. It has a private
address translation unit and a command-list composer that replays a batch
of register writes when a flush is latched. It exposes one CRTC with one
primary plane. The K3 instantiates two DPUs, one per display path.

The DPU driver arrives as five staged patches to keep each one a
reasonable size. The driver only becomes buildable with that last patch.
Bisect safe.

The DP/eDP controller and its PHY are Innosilicon IP, also two instances
of each. An instance behaves as embedded DisplayPort or as external
DisplayPort purely according to what its output port is wired to, so the
bindings do not distinguish them. The PHY's registers are interleaved
with the controller's inside one MMIO window, which is why it is
described as a child node and shares the controller's regmap.

The pixel clock is generated by the DP PHY's PLL, and the SoC's APMU
pixel-clock mux takes that PLL as an input. Rather than let the display
driver reach into PHY registers, the PHY registers its PLL as a clock
provider and the APMU mux is parented to it through the clock framework.
That is what patches 2, 4, 5 and 6 are for, and it is also what keeps the
APMU and the DP/eDP controller out of a devicetree provider cycle.

As a first posting of the K3 display subsystem, this patchset supports:
a single primary plane per CRTC, linear RGB scanout (no plane scaling,
rotation, YUV or writeback). It does not support DSI, DSC or DP audio,
and link rates are capped at HBR2.

Based on drm-misc-next at commit 5b9af25f2d0b ("accel/ivpu: Remove
unnecessary min_t()/max_t() usage"), v7.2-rc2 based.

Testing this series needs a SpacemiT u-boot carrying display support
[1]. SpacemiT expects to add that support into an official u-boot
release in August 2026.

Tested on two K3 boards:

  - Pico-ITX: an eDP panel and an external DisplayPort monitor.
  - CoM260-IFX: DisplayPort only, no eDP.

Note: The eDP panel DTS enablement is not part of this series; a separate
      series will follow showing how eDP can be verified.

What was run on both boards, with modetest from libdrm and with kmscube:

  - modetest -s, looped over 1920x1080, 1280x720 and 3840x2160
    on DisplayPort and 2560x1600 on eDP
  - kmscube, on each head and on both at once
  - hot-plug and sink swap on the DisplayPort connector

Both built-in and modular configurations were tested, and the runs above
were repeated in both. Patch 17 defconfig adds them as modules.

[1] https://github.com/spacemit-com/uboot-for-k3-display-verify/tree/k3-br-v1.0.y
[2] https://www.spacemit.com/community/document/info?lang=en&nodepath=hardware/key_stone/k3

Signed-off-by: Cody Kang <codykang.hk@gmail.com>
---
Cody Kang (17):
      dt-bindings: display: spacemit: add K3 Saturn DPU controller
      dt-bindings: phy: add SpacemiT K3 Innosilicon DP PHY
      dt-bindings: display: spacemit: add K3 Innosilicon DP/eDP controller
      dt-bindings: soc: spacemit: allow eDP/DP PHY PLL pixel clocks on K3 APMU
      phy: spacemit: add Innosilicon DP TX PHY driver
      clk: spacemit: k3: parent eDP/DP pixel clock to the PHY PLL
      drm/spacemit: add Saturn DPU register model
      drm/spacemit: add Saturn DPU core types, cmdlist and display MMU
      drm/spacemit: add Saturn DPU hardware backend
      drm/spacemit: add Saturn DPU KMS pipeline
      drm/spacemit: add Saturn DPU DRM device driver
      drm/spacemit: add Innosilicon DP/eDP controller bridge driver
      MAINTAINERS: add SpacemiT K3 display driver entry
      riscv: dts: spacemit: k3: add display nodes
      riscv: dts: spacemit: k3-pico-itx: enable the DisplayPort output
      riscv: dts: spacemit: k3-com260-ifx: enable the DisplayPort output
      riscv: defconfig: spacemit: k3: enable display driver

 .../display/spacemit/spacemit,k3-inno-dp.yaml      |  140 ++
 .../display/spacemit/spacemit,k3-saturn-dpu.yaml   |  132 ++
 .../bindings/phy/spacemit,k3-inno-dp-phy.yaml      |   48 +
 .../bindings/soc/spacemit/spacemit,k1-syscon.yaml  |   30 +-
 MAINTAINERS                                        |   10 +
 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts     |   11 +
 arch/riscv/boot/dts/spacemit/k3-display.dtsi       |  156 ++
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts       |   11 +
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi       |   22 +
 arch/riscv/configs/defconfig                       |    2 +
 drivers/clk/spacemit/ccu-k3.c                      |    4 +-
 drivers/gpu/drm/Kconfig                            |    1 +
 drivers/gpu/drm/Makefile                           |    1 +
 drivers/gpu/drm/spacemit/Kconfig                   |   37 +
 drivers/gpu/drm/spacemit/Makefile                  |   15 +
 drivers/gpu/drm/spacemit/dpu/dpu_saturn.c          |  483 ++++
 drivers/gpu/drm/spacemit/dpu/dpu_saturn.h          |   35 +
 drivers/gpu/drm/spacemit/dpu/dpu_saturn_hee.c      |  896 +++++++
 drivers/gpu/drm/spacemit/dpu/dpu_trace.h           |  350 +++
 drivers/gpu/drm/spacemit/dpu/saturn_fbcmem.c       |  152 ++
 drivers/gpu/drm/spacemit/dpu/saturn_fbcmem.h       |   21 +
 drivers/gpu/drm/spacemit/dpu/saturn_regs/dpu_int.h |   25 +
 drivers/gpu/drm/spacemit/dpu/saturn_regs/ops_hee.h |   52 +
 .../gpu/drm/spacemit/dpu/saturn_regs/reg_map_hee.h |   64 +
 .../drm/spacemit/dpu/saturn_regs/saturn_fields.h   |  298 +++
 drivers/gpu/drm/spacemit/spacemit_cmdlist.c        |  304 +++
 drivers/gpu/drm/spacemit/spacemit_cmdlist.h        |  146 ++
 drivers/gpu/drm/spacemit/spacemit_crtc.c           |  815 +++++++
 drivers/gpu/drm/spacemit/spacemit_crtc.h           |  259 +++
 drivers/gpu/drm/spacemit/spacemit_dmmu.c           |  103 +
 drivers/gpu/drm/spacemit/spacemit_dmmu.h           |   40 +
 drivers/gpu/drm/spacemit/spacemit_dpu_ids.h        |   22 +
 drivers/gpu/drm/spacemit/spacemit_dpu_reg.h        |  108 +
 drivers/gpu/drm/spacemit/spacemit_drm.c            |  132 ++
 drivers/gpu/drm/spacemit/spacemit_drm.h            |   68 +
 drivers/gpu/drm/spacemit/spacemit_inno_dp.c        | 2443 ++++++++++++++++++++
 drivers/gpu/drm/spacemit/spacemit_inno_dp.h        |  328 +++
 drivers/gpu/drm/spacemit/spacemit_planes.c         |  376 +++
 drivers/phy/spacemit/Kconfig                       |   13 +
 drivers/phy/spacemit/Makefile                      |    1 +
 drivers/phy/spacemit/phy-k3-inno-dp.c              |  948 ++++++++
 41 files changed, 9099 insertions(+), 3 deletions(-)
---
base-commit: 5b9af25f2d0b574b4058c9f8c84486a597168116
change-id: 20260713-k3-display-e8ffed67e936

Best regards,
--  
Cody Kang <codykang.hk@gmail.com>

