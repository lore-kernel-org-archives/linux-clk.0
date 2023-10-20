Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CA44CDB474
	for <linux-clk@archiver.kernel.org>; Fri, 20 Oct 2023 15:37:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377709AbjJTPhU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 20 Oct 2023 11:37:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377651AbjJTPhT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 Oct 2023 11:37:19 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 168B3D63
        for <linux-clk@vger.kernel.org>; Fri, 20 Oct 2023 08:37:16 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9ada2e6e75fso147793166b.2
        for <linux-clk@vger.kernel.org>; Fri, 20 Oct 2023 08:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697816234; x=1698421034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BcjhE/VDAP/vUUzCJ5UsdBYIA+V/VX3Pzs2a+6tDBk0=;
        b=DPT5PnNa8mJCnKthHN449tMAbgDaAVvmnWz93V7a6pmBh0OaH/7waVtlK7kwZ5glry
         siiM/1bglLhTH7bhsLancP82MDDC08qEqESSbd7pZgegOmGWSoVfFD1yhWJf5on0ACEA
         G5Olav9y9ShwNSaI003NSQDa+vjt78UTsrsFQNfAU/rbV4ZhqmF5wRCDI60NSDDQdSN3
         kpdLAEzV9Eo6sq2QfopPYYbD5HFeiyqE3kpNWxwZIwQT4mn3s71ClYvQbV78aiVQLllo
         TCLyr3iaDT83ex6wOw4H0mvuKxCxGqOEC/1XBzRkTta2fTSr98X04lCTQDEwANkbumpM
         FJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697816234; x=1698421034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BcjhE/VDAP/vUUzCJ5UsdBYIA+V/VX3Pzs2a+6tDBk0=;
        b=uEOP4beWXYZc0GQYjjtOLdbDQHRzfXJp9F2VAePYURSZTCKBhHMGh5CEsnlvyYYwnj
         zXFlXWNYt1kv3nY97hn2fx/PNE1TG51yprsmIlaEvQz2Qce2U7xxntMTPsXceATI1EcD
         ZnYKUUU1zdcs3zh29tatEK8FNjFgxla8rRvnc2M3hQS3cauR3IXk6VJJf0BIjQSyH4oU
         mlk2AfBF+Y+warFCQqoZBBbxWWyonA8NMNS5kpgG8YHLvKHhviKn9ZgNZaoofQfp6dkH
         rqe1GrS57xXN1sD9Nn7yIkEVTVDw4ZlWgVR0C0rL253310lz2kD06iZAYT2f54QV8StJ
         uygA==
X-Gm-Message-State: AOJu0YxBhs/N1x61m3Qiegz1R6nGrHPTW2BvLep/kwzwziMm3NgJDCeg
        PHw/8DXwZSX18K1DtLlsNFIP0g==
X-Google-Smtp-Source: AGHT+IHZPN2+UrCMVFrf3KNUsmji8s01Mviv4I64tQ8tn/u/gi1W+3A4Y/35RW/yDbc3Pj+6dUwMVw==
X-Received: by 2002:a17:907:3688:b0:9c2:a072:78bf with SMTP id bi8-20020a170907368800b009c2a07278bfmr1701512ejc.26.1697816234418;
        Fri, 20 Oct 2023 08:37:14 -0700 (PDT)
Received: from hackbox.lan ([79.115.22.174])
        by smtp.gmail.com with ESMTPSA id x13-20020a170906710d00b009ad87fd4e65sm1692162ejj.108.2023.10.20.08.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 08:37:13 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     NXP Linux Team <linux-imx@nxp.com>, linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] clk: imx: Updates for v6.7
Date:   Fri, 20 Oct 2023 18:37:11 +0300
Message-Id: <20231020153711.1979439-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/ tags/clk-imx-6.7

for you to fetch changes up to 2838820800dcaa60f32bef715c7e2e87e049aebc:

  clk: imx: imx8qm/qxp: add more resources to whitelist (2023-10-04 15:44:19 +0300)

----------------------------------------------------------------
i.MX clocks changes for 6.7

- Select MXC_CLK when building in the CLK_IMX8QXP
- Fixes for error handling paths in i.MX8 ACM driver
- Move the clocks check in i.MX8 ACM driver in order to log any error
- Drop the unused return value of clk_imx_acm_detach_pm_domains
- Drop non-existant IMX8MP_CLK_AUDIOMIX_PDM_ROOT clock
- Fix error handling in i.MX8MQ clock driver
- Allow a different LCDIF1 clock parent if DT describes it for i.MX6SX
- Keep the SCU resource table sorted in the i.MX8DXL rsrc driver
- Move the elcdif PLL clock registration above lcd_clk, as it is its parent
- Correct some ENET specific clocks for i.MX8DXL platform
- Drop the VPU_UART and VPUCORE from i.MX8QM as latest HW revision doesn't have them
- Remove "de-featured" MLB support from i.MX8QM/QXP/DXL platforms
- Skip registering clocks owned by Cortex-A partition SCU-based platforms
- Add CAN_1/2 to i.MX8QM and M4_0, PI_0_PWM_0 and PI_0_I2C_0 to i.MX8QXP resources

----------------------------------------------------------------
Abel Vesa (1):
      clk: imx: Select MXC_CLK for CLK_IMX8QXP

Adam Ford (1):
      clk: imx8mp: Remove non-existent IMX8MP_CLK_AUDIOMIX_PDM_ROOT

Christophe JAILLET (5):
      clk: imx: imx8: Fix an error handling path in clk_imx_acm_attach_pm_domains()
      clk: imx: imx8: Fix an error handling path if devm_clk_hw_register_mux_parent_data_table() fails
      clk: imx: imx8: Fix an error handling path in imx8_acm_clk_probe()
      clk: imx: imx8: Add a message in case of devm_clk_hw_register_mux_parent_data_table() error
      clk: imx: imx8: Simplify clk_imx_acm_detach_pm_domains()

Fabio Estevam (1):
      clk: imx: imx6sx: Allow a different LCDIF1 clock parent

Peng Fan (5):
      clk: imx: imx8mq: correct error handling path
      clk: imx: imx8qm-rsrc: drop VPU_UART/VPUCORE
      clk: imx8: remove MLB support
      clk: imx: scu: ignore clks not owned by Cortex-A partition
      clk: imx: imx8qm/qxp: add more resources to whitelist

Robert Chiras (1):
      clk: imx: imx8qxp: Fix elcdif_pll clock

Shenwei Wang (1):
      clk: imx: imx8qxp: correct the enet clocks for i.MX8DXL

Viorel Suman (1):
      clk: imx: imx8dxl-rsrc: keep sorted in the ascending order

 drivers/clk/imx/Kconfig                  |  1 +
 drivers/clk/imx/clk-imx6sx.c             | 14 +++++++++++---
 drivers/clk/imx/clk-imx8-acm.c           | 33 +++++++++++++++++---------------
 drivers/clk/imx/clk-imx8dxl-rsrc.c       |  3 +--
 drivers/clk/imx/clk-imx8mq.c             | 17 +++++++++-------
 drivers/clk/imx/clk-imx8qm-rsrc.c        |  5 ++---
 drivers/clk/imx/clk-imx8qxp-lpcg.h       |  1 -
 drivers/clk/imx/clk-imx8qxp-rsrc.c       |  4 +++-
 drivers/clk/imx/clk-imx8qxp.c            | 13 ++++++++++---
 drivers/clk/imx/clk-scu.c                | 20 +++++++++++++++++++
 include/dt-bindings/clock/imx8mp-clock.h |  1 -
 11 files changed, 76 insertions(+), 36 deletions(-)
