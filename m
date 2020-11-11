Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D62CC388F9
	for <linux-clk@archiver.kernel.org>; Wed, 11 Nov 2020 09:35:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E93C20759
	for <linux-clk@archiver.kernel.org>; Wed, 11 Nov 2020 09:35:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="QLVIoBk/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbgKKJfU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Nov 2020 04:35:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbgKKJfU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Nov 2020 04:35:20 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F366BC0613D1
        for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2020 01:35:19 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id x15so696560pll.2
        for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2020 01:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QmA+jLoNrTCA2+Mt4Q5LbDfOt6s2dRJWxbjFrCs/Ci8=;
        b=QLVIoBk/QSBtn4VAMXQrR7hbsG73rbW5vsg4oZUfQYgF8WYlkhZh4p99J65QEoVpRM
         toarObrHKgOx39tSEQkO6AMetfVfGcKHGA3C1BG6A7+4xuXSMnz0NrjriacAHwSGbalu
         hqk0GHgP1E7sN4E8vawpAzTodtSyYTzfShIEwQJIAQx8UuhTfB7pB32htUG+Who08anm
         t02xIU3jKF0hzrx9+S8b4x1t2doNpslf8tHm4jpZOyUOEeuMxYT3Prkh6tIk/JQmFAPK
         YhxjN9tY/8c1317TBKXlK17TE8BgGxFt4eG8Gcqh0N1ovjaTrjCOv4dqqCPQP+LDdvvQ
         u5tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QmA+jLoNrTCA2+Mt4Q5LbDfOt6s2dRJWxbjFrCs/Ci8=;
        b=JvXQhy4dVZsqPUDw4sX9C/Pr2efbWOzlxvzOQf7Kxy0q60iT/neLlydSvZfooWbx8U
         3Vnyx0U7OfGLWGQ03OVtt7QV7wVF9ChkEtxjs/RwDHV0649pYvCLAYUwE9oWPFMZJOnZ
         Ewi6378u4RBAjQtqRTJwK4bKaatIodSuS58YwUHbAjMi1VGUR9lK2xuMWOBt9HruP2GF
         AKZVe2Mh5SkojK053KClQHepUYCNeRCTLZGedVJqtnoOz317NFaNgFff7OfCVasUQ7WG
         qtphEYTzpt9AyCNmg5tiBdCaoy7WWPD3IsZhVfZmosthVEn2BGFoWGHjIajgRxW/GiMk
         JIUw==
X-Gm-Message-State: AOAM5313BXP7WglK1XtQXX5W4y1zNf8G1JlQDUR6oCFEtwBRWL+Boy0f
        IW+9/jJb7sbqrz4HBBjTku1LvA==
X-Google-Smtp-Source: ABdhPJxC70iXZ53+Zu2FOrGuQQx34cC84+q4xcOoLMcPe0csIhqPxj/fM/F6TDzKykpV8fkPWsfbTQ==
X-Received: by 2002:a17:90a:d182:: with SMTP id fu2mr3078446pjb.145.1605087319519;
        Wed, 11 Nov 2020 01:35:19 -0800 (PST)
Received: from hsinchu02.internal.sifive.com (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
        by smtp.gmail.com with ESMTPSA id m6sm1862424pfa.61.2020.11.11.01.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 01:35:19 -0800 (PST)
From:   Zong Li <zong.li@sifive.com>
To:     paul.walmsley@sifive.com, palmer@dabbelt.com, sboyd@kernel.org,
        schwab@linux-m68k.org, pragnesh.patel@openfive.com,
        aou@eecs.berkeley.edu, mturquette@baylibre.com,
        yash.shah@sifive.com, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org
Cc:     Zong Li <zong.li@sifive.com>
Subject: [PATCH v3 0/3] clk: add driver for the SiFive FU740
Date:   Wed, 11 Nov 2020 17:35:11 +0800
Message-Id: <20201111093514.103155-1-zong.li@sifive.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a driver for the SiFive FU740 PRCI IP block, which handles more
clocks than FU540. These patches also refactor the original
implementation by spliting the dependent-code of fu540 and fu740
respectively.

Changed in v3:
 - Fix the worng bit field shift.

Changed in v2:
 - Remove the macro definition for __prci_clock_array.
 - Indicate the functional changes in commit message.
 - Using option -M and -C to create patches.
 - Rebase code to kernel v5.10-rc3.

Zong Li (3):
  clk: sifive: Extract prci core to common base
  clk: sifive: Use common name for prci configuration
  clk: sifive: Add a driver for the SiFive FU740 PRCI IP block

 arch/riscv/Kconfig.socs                       |   2 +-
 drivers/clk/sifive/Kconfig                    |   8 +-
 drivers/clk/sifive/Makefile                   |   5 +-
 drivers/clk/sifive/fu540-prci.c               | 586 +-----------------
 drivers/clk/sifive/fu540-prci.h               |  21 +
 drivers/clk/sifive/fu740-prci.c               | 122 ++++
 drivers/clk/sifive/fu740-prci.h               |  21 +
 .../sifive/{fu540-prci.c => sifive-prci.c}    | 499 ++++++---------
 drivers/clk/sifive/sifive-prci.h              | 289 +++++++++
 include/dt-bindings/clock/sifive-fu740-prci.h |  23 +
 10 files changed, 703 insertions(+), 873 deletions(-)
 create mode 100644 drivers/clk/sifive/fu540-prci.h
 create mode 100644 drivers/clk/sifive/fu740-prci.c
 create mode 100644 drivers/clk/sifive/fu740-prci.h
 copy drivers/clk/sifive/{fu540-prci.c => sifive-prci.c} (45%)
 create mode 100644 drivers/clk/sifive/sifive-prci.h
 create mode 100644 include/dt-bindings/clock/sifive-fu740-prci.h

-- 
2.29.2

