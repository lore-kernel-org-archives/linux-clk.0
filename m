Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD30C4332B
	for <linux-clk@archiver.kernel.org>; Wed, 20 Jan 2021 14:08:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E261233ED
	for <linux-clk@archiver.kernel.org>; Wed, 20 Jan 2021 14:08:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389668AbhATOIb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 20 Jan 2021 09:08:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:52718 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732767AbhATNLV (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 20 Jan 2021 08:11:21 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4775C22210;
        Wed, 20 Jan 2021 13:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611148234;
        bh=HeUaa9V7+T0Cd1++ap0qKxCQi1k/nEtK/fA45tZ4CGw=;
        h=From:To:Cc:Subject:Date:From;
        b=dJqLumxXoww4YwhhfzFvgfB599lLkdoIsqI6tITcTgyc/Y+xz5SoQoi+qx/PzvV/j
         KpIy3Ny62gE8OusZWIyVsqgGn9GmWkrd5WhgstETSk+W5yUCWOMRRfoIydZqlbSs/d
         H+m3VTRaZfWVJT10joqmdZU1I3cv20t0Ch1aYLAozMnF2nW0ZZqtiq6A2tlvzDu3jr
         LX2eIUQImW3CsqjT1LWd41OdO4Bsv2L3sE20gHyk9eBFRPlhNu9h7oymuOm5/3op37
         dtll1trD7Vl4yVCfBCrNBrWwqdMwG4Yx1jPNM0DKgJfwiMwfW3U4ipRpoz+2/9emlj
         q8t0DU3zBP82g==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 0/4] clk: remove unused device drivers
Date:   Wed, 20 Jan 2021 14:10:22 +0100
Message-Id: <20210120131026.1721788-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

A few Arm platforms are getting removed in v5.12, this removes
the corresponding clk drivers.

Link: https://lore.kernel.org/linux-arm-kernel/20210120124812.2800027-1-arnd@kernel.org/T/

Arnd Bergmann (4):
  clk: remove tango4 driver
  clk: remove zte zx driver
  clk: remove sirf prima2/atlas drivers
  clk: remove u300 driver

 .../bindings/clock/csr,atlas7-car.txt         |   55 -
 .../bindings/clock/prima2-clock.txt           |   73 -
 .../bindings/clock/ste-u300-syscon-clock.txt  |   80 -
 .../bindings/clock/tango4-clock.txt           |   23 -
 .../bindings/clock/zx296702-clk.txt           |   34 -
 .../bindings/clock/zx296718-clk.txt           |   37 -
 drivers/clk/Makefile                          |    4 -
 drivers/clk/clk-tango4.c                      |   85 -
 drivers/clk/clk-u300.c                        | 1199 ------------
 drivers/clk/sirf/Makefile                     |    6 -
 drivers/clk/sirf/atlas6.h                     |   32 -
 drivers/clk/sirf/clk-atlas6.c                 |  150 --
 drivers/clk/sirf/clk-atlas7.c                 | 1682 -----------------
 drivers/clk/sirf/clk-common.c                 | 1037 ----------
 drivers/clk/sirf/clk-prima2.c                 |  149 --
 drivers/clk/sirf/prima2.h                     |   26 -
 drivers/clk/zte/Makefile                      |    4 -
 drivers/clk/zte/clk-zx296702.c                |  741 --------
 drivers/clk/zte/clk-zx296718.c                | 1074 -----------
 drivers/clk/zte/clk.c                         |  446 -----
 drivers/clk/zte/clk.h                         |  174 --
 include/dt-bindings/clock/zx296702-clock.h    |  180 --
 include/linux/platform_data/clk-u300.h        |    1 -
 23 files changed, 7292 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/csr,atlas7-car.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/prima2-clock.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/ste-u300-syscon-clock.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/tango4-clock.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/zx296702-clk.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/zx296718-clk.txt
 delete mode 100644 drivers/clk/clk-tango4.c
 delete mode 100644 drivers/clk/clk-u300.c
 delete mode 100644 drivers/clk/sirf/Makefile
 delete mode 100644 drivers/clk/sirf/atlas6.h
 delete mode 100644 drivers/clk/sirf/clk-atlas6.c
 delete mode 100644 drivers/clk/sirf/clk-atlas7.c
 delete mode 100644 drivers/clk/sirf/clk-common.c
 delete mode 100644 drivers/clk/sirf/clk-prima2.c
 delete mode 100644 drivers/clk/sirf/prima2.h
 delete mode 100644 drivers/clk/zte/Makefile
 delete mode 100644 drivers/clk/zte/clk-zx296702.c
 delete mode 100644 drivers/clk/zte/clk-zx296718.c
 delete mode 100644 drivers/clk/zte/clk.c
 delete mode 100644 drivers/clk/zte/clk.h
 delete mode 100644 include/dt-bindings/clock/zx296702-clock.h
 delete mode 100644 include/linux/platform_data/clk-u300.h

-- 
2.29.2

