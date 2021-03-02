Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3DBFC43331
	for <linux-clk@archiver.kernel.org>; Wed,  3 Mar 2021 04:24:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A0A2864E86
	for <linux-clk@archiver.kernel.org>; Wed,  3 Mar 2021 04:24:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235968AbhCCEJM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 2 Mar 2021 23:09:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349645AbhCBLAY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 2 Mar 2021 06:00:24 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6374DC06178A
        for <linux-clk@vger.kernel.org>; Tue,  2 Mar 2021 02:59:28 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id b15so1699717pjb.0
        for <linux-clk@vger.kernel.org>; Tue, 02 Mar 2021 02:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bxei/8aDMCYKqmTkktTk9ZHLkhHxr5aG3PN4M0TW8C4=;
        b=O5WIbc61G3ZDHjgS4F7URCW/4/U7Isq2Mu3Wvdscu+y5vjL7ou79cWwbkvEnMvSgxq
         1hzCTP07F89/w9x4GCJYWoM72kALz0iJfAWEJmmpHI0lFed1eRkp2DDe9YzHvtaTIZOl
         vOuYG5dMQg0TLfE7crXbgi98xIBLaAl2GJmy+UMx5vYLZ4Yz4T1h7SzQoa+RNw3iqJ1U
         ssCHXncGsytBp7FBr2Py8/qa53OWNBYf5gFCJ1LdXz6IkNZBloB4hKeCMspdquSxmZxc
         0Zp6zzcH9fJwVtBv1DoVoVh6h+AmcHOMV/EoCxHt4CgJuGoF+r2+VN0EhKGaRyOBJSu9
         yyDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bxei/8aDMCYKqmTkktTk9ZHLkhHxr5aG3PN4M0TW8C4=;
        b=HtZBlKDvFhEfJSrttU+8UeE9Bu6OQy/r7LcLHdY+cErx8i4VZsPxftcYfURIChDOVH
         JnLCb4w0aKuZ7xqrKo8tToOC9hBNqFxHPxoFjyMO15m3HlYu2QkOtCsTsPVnfhlK6kiq
         TN3WOf6WBBGBXWqdY1mC9zJgZNPdqYv/tWXHMmZipO7IwVoxcGwb+ADCKW4OOAbLfZRB
         O7NW4XKR9pcPUzesxHfT2Nky/Jn0bCniFL5k9zqfnbVLE7jJhaaX5clqq1UmvNRMBG93
         g29NJsjFF+b5FpFWf3ng0BAOfYUhCg0wJhHxIYc+PZ6rGqCVmtxkaIPI6/pStpg8fCb6
         jC4Q==
X-Gm-Message-State: AOAM533Bs3FkkoPC95VI/s8WRf61A4eiAU1X1gMUsqMKAgdatAjGDOk7
        AybkuSjSMayiKUlwz2NkQZZpug==
X-Google-Smtp-Source: ABdhPJwIhIDCZFAmjDINOMpTIcq157qIxL63LYhmKeq117MzPFuyqWv2PhA0oDZBd4g793JCy1+/lQ==
X-Received: by 2002:a17:90a:5d09:: with SMTP id s9mr3715808pji.172.1614682767885;
        Tue, 02 Mar 2021 02:59:27 -0800 (PST)
Received: from hsinchu02.internal.sifive.com (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
        by smtp.gmail.com with ESMTPSA id t26sm19500451pfq.208.2021.03.02.02.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 02:59:27 -0800 (PST)
From:   Greentime Hu <greentime.hu@sifive.com>
To:     greentime.hu@sifive.com, paul.walmsley@sifive.com, hes@sifive.com,
        erik.danie@sifive.com, zong.li@sifive.com, bhelgaas@google.com,
        robh+dt@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
        mturquette@baylibre.com, sboyd@kernel.org,
        lorenzo.pieralisi@arm.com, p.zabel@pengutronix.de,
        alex.dewar90@gmail.com, khilman@baylibre.com,
        hayashi.kunihiko@socionext.com, vidyas@nvidia.com,
        jh80.chung@samsung.com, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [RFC PATCH 0/6] Add SiFive FU740 PCIe host controller driver support
Date:   Tue,  2 Mar 2021 18:59:11 +0800
Message-Id: <cover.1614681831.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patchset includes SiFive FU740 PCIe host controller driver. We also
add pcie_aux clock and pcie_power_on_reset controller to prci driver for
PCIe driver to use it.

This is tested with e1000e: Intel(R) PRO/1000 Network Card and SP M.2 PCIe
Gen 3 SSD in SiFive Unmatched.

Greentime Hu (5):
  clk: sifive: Add pcie_aux clock in prci driver for PCIe driver
  clk: sifive: Use reset-simple in prci driver for PCIe driver
  MAINTAINERS: Add maintainers for SiFive FU740 PCIe driver
  dt-bindings: PCI: Add SiFive FU740 PCIe host controller
  riscv: dts: Add PCIe support for the SiFive FU740-C000 SoC

Paul Walmsley (1):
  PCI: designware: Add SiFive FU740 PCIe host controller driver

 .../bindings/pci/sifive,fu740-pcie.yaml       | 119 +++++
 MAINTAINERS                                   |   8 +
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi    |  34 ++
 drivers/clk/sifive/Kconfig                    |   2 +
 drivers/clk/sifive/fu740-prci.c               |  11 +
 drivers/clk/sifive/fu740-prci.h               |   2 +-
 drivers/clk/sifive/sifive-prci.c              |  55 +++
 drivers/clk/sifive/sifive-prci.h              |  13 +
 drivers/pci/controller/dwc/Kconfig            |   9 +
 drivers/pci/controller/dwc/Makefile           |   1 +
 drivers/pci/controller/dwc/pcie-fu740.c       | 455 ++++++++++++++++++
 drivers/reset/Kconfig                         |   3 +-
 include/dt-bindings/clock/sifive-fu740-prci.h |   1 +
 13 files changed, 711 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
 create mode 100644 drivers/pci/controller/dwc/pcie-fu740.c

-- 
2.30.0

