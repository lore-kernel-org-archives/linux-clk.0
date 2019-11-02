Return-Path: <SRS0=2Ghr=Y2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC46CA9EC7
	for <linux-clk@archiver.kernel.org>; Sat,  2 Nov 2019 14:37:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A637F217D9
	for <linux-clk@archiver.kernel.org>; Sat,  2 Nov 2019 14:37:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S3Bh2H3z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726687AbfKBOho (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 2 Nov 2019 10:37:44 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46904 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726430AbfKBOho (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 2 Nov 2019 10:37:44 -0400
Received: by mail-wr1-f68.google.com with SMTP id b3so6651963wrs.13;
        Sat, 02 Nov 2019 07:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zBM3L0jlBGXj3TSuMClKg4IxiJ8Eu5J1lnCEn4l3MCY=;
        b=S3Bh2H3zIFIgBsSdIS4KPJeoDEVx1TjWGYPx2SVlOsghigEQnLXOL+AWMpsqrsEcWm
         fkt/whMnHt/IRsX86aO03OJVia4OWhLmVUy+xmyDkLSbuiYZFtxabQWBL7m1vQzlpL+e
         rHHxIBbVLT7Zx3g8mXYj9U0DoI/BwLnXIbphZUEI/v9tyayDBLXzFGq6Ay6DQ5Ka35dP
         12EdJayfMTXxs4zo8Um+VYEFcf4aDY9uDrhDav28NLfFM/+z9ELSFCUhFC21ebMPAQrh
         lrZRaFQiJWCVuETyv+df3A1pFGUIEkvPDWR6NPhiB7h6o8dxnvHZlabqSxowunsVDTkJ
         JkCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zBM3L0jlBGXj3TSuMClKg4IxiJ8Eu5J1lnCEn4l3MCY=;
        b=TUdnguAwTVhuvS2iYB0+temuDc3Ehfg5I7lUszdS3v2OiEuar/m+TXlL/riHbriQbU
         2YdXJLDj4KY4B6dmlZp/skQ5u6oJPhIu5Bcp8FQXbQEHwYpsZ9IjvpIh3u4uGT/1v4Xw
         2q4+zXy5uwJxrIE3qq5rrrXekOu0m4MzZ7Vajl+q7Wl3SRIikmWJSjqTFQN3qkb5M1RV
         k1H+jMf1R3oEg56fUmUcbg0sRbZVMi7xaSLk9oEvxGXWJA9XpBu0L+Cr+chtuc4wuKir
         YHyALmGQ+td5QUbL/SY61arbrFDzw1NMaiYyz/aHsLsqXqkjNF6wNOXuVm0ble5Zo0RW
         xtsg==
X-Gm-Message-State: APjAAAXT7IVOouSKm0q6rPPMnCMJ/Jc635IjhuzvNVG1GDlV20a8qmX9
        iDsB22Opx6lK0gAUWXsMSZDJrQzD
X-Google-Smtp-Source: APXvYqx56/jG9S+0Yf+xb7hIXguXh4vzyhnOtv2PVZHzd4mPeHKqawsdE1NW4dQovuulZTW3V4LBtg==
X-Received: by 2002:a5d:526a:: with SMTP id l10mr12217589wrc.72.1572705460880;
        Sat, 02 Nov 2019 07:37:40 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id s10sm10968978wrr.5.2019.11.02.07.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2019 07:37:39 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL 2/2] clk: tegra: Changes for v5.5-rc1
Date:   Sat,  2 Nov 2019 15:37:36 +0100
Message-Id: <20191102143736.3862768-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191102143736.3862768-1-thierry.reding@gmail.com>
References: <20191102143736.3862768-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Michael, Stephen,

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.5-clk

for you to fetch changes up to 25c6fa38444d1bad287895447a17a3cfdbaeee10:

  clk: tegra: Fix build error without CONFIG_PM_SLEEP (2019-11-01 10:44:52 +0100)

Thanks,
Thierry

----------------------------------------------------------------
clk: tegra: Changes for v5.5-rc1

The bulk of these changes implement suspend/resume support for Tegra210.
In addition, some of the SOR clocks on earlier Tegra generations are
reimplemented to more closely match the implementation on later chips,
which in turn makes it possible to handle HDMI and DP support in a more
unified way.

----------------------------------------------------------------
Dmitry Osipenko (3):
      clk: tegra: Add Tegra20/30 EMC clock implementation
      clk: tegra: Optimize PLLX restore on Tegra20/30
      clk: tegra: Add missing stubs for the case of !CONFIG_PM_SLEEP

Sowjanya Komatineni (12):
      clk: Add API to get index of the clock parent
      clk: tegra: divider: Save and restore divider rate
      clk: tegra: pllout: Save and restore pllout context
      clk: tegra: pll: Save and restore pll context
      clk: tegra: Support for OSC context save and restore
      clk: tegra: periph: Add restore_context support
      clk: tegra: clk-super: Fix to enable PLLP branches to CPU
      clk: tegra: clk-super: Add restore-context support
      clk: tegra: clk-dfll: Add suspend and resume support
      clk: tegra: Use fence_udelay() during PLLU init
      clk: tegra: Share clk and rst register defines with Tegra clock driver
      clk: tegra: Add suspend and resume support on Tegra210

Thierry Reding (8):
      dt-bindings: clock: tegra: Rename SOR0_LVDS to SOR0_OUT
      Merge branch 'for-5.5/clk-core'
      Merge branch 'for-5.5/dt-bindings'
      clk: tegra: Remove last remains of TEGRA210_CLK_SOR1_SRC
      clk: tegra: Move SOR0 implementation to Tegra124
      clk: tegra: Rename sor0_lvds to sor0_out
      clk: tegra: Reimplement SOR clock on Tegra124
      clk: tegra: Reimplement SOR clocks on Tegra210

YueHaibing (1):
      clk: tegra: Fix build error without CONFIG_PM_SLEEP

 drivers/clk/clk.c                               |  17 ++
 drivers/clk/tegra/Makefile                      |   2 +
 drivers/clk/tegra/clk-dfll.c                    |  56 +++++
 drivers/clk/tegra/clk-dfll.h                    |   2 +
 drivers/clk/tegra/clk-divider.c                 |  11 +
 drivers/clk/tegra/clk-id.h                      |   4 +-
 drivers/clk/tegra/clk-periph.c                  |  18 ++
 drivers/clk/tegra/clk-pll-out.c                 |   9 +
 drivers/clk/tegra/clk-pll.c                     |  86 ++++---
 drivers/clk/tegra/clk-sdmmc-mux.c               |  12 +
 drivers/clk/tegra/clk-super.c                   |  35 +++
 drivers/clk/tegra/clk-tegra-fixed.c             |  15 ++
 drivers/clk/tegra/clk-tegra-periph.c            |   8 -
 drivers/clk/tegra/clk-tegra-super-gen4.c        |   7 +-
 drivers/clk/tegra/clk-tegra124-dfll-fcpu.c      |   1 +
 drivers/clk/tegra/clk-tegra124.c                |  55 ++++-
 drivers/clk/tegra/clk-tegra20-emc.c             | 293 ++++++++++++++++++++++++
 drivers/clk/tegra/clk-tegra20.c                 |  80 +++----
 drivers/clk/tegra/clk-tegra210.c                | 181 ++++++++++++---
 drivers/clk/tegra/clk-tegra30.c                 |  63 +++--
 drivers/clk/tegra/clk.c                         | 112 +++++----
 drivers/clk/tegra/clk.h                         |  70 ++++++
 include/dt-bindings/clock/tegra124-car-common.h |   3 +-
 include/dt-bindings/clock/tegra210-car.h        |   6 +-
 include/linux/clk-provider.h                    |   1 +
 include/linux/clk/tegra.h                       |  24 ++
 26 files changed, 983 insertions(+), 188 deletions(-)
 create mode 100644 drivers/clk/tegra/clk-tegra20-emc.c
