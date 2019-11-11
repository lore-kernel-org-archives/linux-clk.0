Return-Path: <SRS0=ilwl=ZD=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 626EEC43331
	for <linux-clk@archiver.kernel.org>; Mon, 11 Nov 2019 14:45:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 385B82184C
	for <linux-clk@archiver.kernel.org>; Mon, 11 Nov 2019 14:45:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MVUEU1jw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726853AbfKKOpQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Nov 2019 09:45:16 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:33463 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726871AbfKKOpP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Nov 2019 09:45:15 -0500
Received: by mail-wm1-f66.google.com with SMTP id a17so64575wmb.0;
        Mon, 11 Nov 2019 06:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A19SM0cDblvtBWIiJtrkwG3Fu+AIASBpJHeBYd+bEMY=;
        b=MVUEU1jwYtOodyfwL4ulWivSpubxE9ETBUXbZQ1xJ0gsZeTKpIQPtnXLlyeX2lSpxp
         4aZPXIGQRpMsfKJo/AOCdpoc2AUpaxHSXVEJDv9J+LpmyKY0iPHNA1MwR+Gh23n2/sTN
         fDmq+jCBPDFEelGGjOzolXjyoNZ5JnZDWw1SacKdanUc9vvN5yQb8pPiY5idyh4RjpSZ
         odNTV2eq2Rhv8dV4040JlMMA1FRQDU6hm/TqoJKWdrt1I+162kVBGiY+FTnDKJtqiKDm
         SISy5GCWJEKEw4fkl9on8I+zIkeNrCW1sjxkBqeljyCXKHu2aNGenQmvBROH4Ad409od
         vYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A19SM0cDblvtBWIiJtrkwG3Fu+AIASBpJHeBYd+bEMY=;
        b=l3mGHcoKpaESJD5/XxQFyimtay3joss53EofA/YTuL4pqVtWlxUWAJSmiRxZUYnDCy
         dP92/dyBA+6GjYigCxoUAf3RUWhpSbiKsYmU2v2qasJH8WLpUg9TK1lBVVuwNTv4lDJG
         7+JwgwZB9UHywdk5GbB2CzxGQwPEsNduqsddTAg1WpbY86VIF1kuiFNDZwGKqNhgsbRI
         FIHyBpRkRk+Gkxg8OOQZr7yn0HcqeM9GUBsfeJO98F53OQVeS2RESkMpZMxpE2QrZ3Gh
         HqHk2AASoFsME4w1rKZtDRyIbO663IOjYEj5MoI7nnDatJ14DYbEPn8VbaROvcABuA8H
         5cSQ==
X-Gm-Message-State: APjAAAXAngITB1BfjjrFQfs5ViwVeA63NiHlLggpVgK3vht39uvgvhAH
        fpnUEr91T69Hwe5R/VWQMAM=
X-Google-Smtp-Source: APXvYqyDO4jDXn8b0JGO4z6V7FzQwDHeCl2q6iIQ7inMkbKj8m3/j+dEYkOUBzhdEWc5rCzLyng17Q==
X-Received: by 2002:a1c:a9cb:: with SMTP id s194mr22153596wme.92.1573483512561;
        Mon, 11 Nov 2019 06:45:12 -0800 (PST)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id n17sm15089414wrp.40.2019.11.11.06.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 06:45:11 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL v2 2/2] clk: tegra: Changes for v5.5-rc1
Date:   Mon, 11 Nov 2019 15:45:07 +0100
Message-Id: <20191111144507.4027979-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191111144507.4027979-1-thierry.reding@gmail.com>
References: <20191111144507.4027979-1-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.5-clk-v2

for you to fetch changes up to 07b293c5b01483f3c65372e72e62a2ee559ce1cf:

  clk: tegra: Fix build error without CONFIG_PM_SLEEP (2019-11-11 14:53:05 +0100)

This updated pull request contains changes needed for the updated API to
retrieve a clock's parent's index as well as additional Acked-bys from
Stephen.

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
      Merge branch 'for-5.5/clk-core' into for-5.5/clk
      Merge branch 'for-5.5/dt-bindings' into for-5.5/clk
      clk: tegra: Remove last remains of TEGRA210_CLK_SOR1_SRC
      clk: tegra: Move SOR0 implementation to Tegra124
      clk: tegra: Rename sor0_lvds to sor0_out
      clk: tegra: Reimplement SOR clock on Tegra124
      clk: tegra: Reimplement SOR clocks on Tegra210

YueHaibing (1):
      clk: tegra: Fix build error without CONFIG_PM_SLEEP

 drivers/clk/clk.c                               |  18 ++
 drivers/clk/tegra/Makefile                      |   2 +
 drivers/clk/tegra/clk-dfll.c                    |  56 +++++
 drivers/clk/tegra/clk-dfll.h                    |   2 +
 drivers/clk/tegra/clk-divider.c                 |  11 +
 drivers/clk/tegra/clk-id.h                      |   4 +-
 drivers/clk/tegra/clk-periph.c                  |  21 ++
 drivers/clk/tegra/clk-pll-out.c                 |   9 +
 drivers/clk/tegra/clk-pll.c                     |  86 ++++---
 drivers/clk/tegra/clk-sdmmc-mux.c               |  16 ++
 drivers/clk/tegra/clk-super.c                   |  41 ++++
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
 26 files changed, 997 insertions(+), 188 deletions(-)
 create mode 100644 drivers/clk/tegra/clk-tegra20-emc.c
