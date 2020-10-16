Return-Path: <SRS0=W/YM=DX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8024FC433E7
	for <linux-clk@archiver.kernel.org>; Fri, 16 Oct 2020 09:18:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1938120FC3
	for <linux-clk@archiver.kernel.org>; Fri, 16 Oct 2020 09:18:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="b8sPn/iN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405968AbgJPJSc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Oct 2020 05:18:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405391AbgJPJSb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 16 Oct 2020 05:18:31 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F2BEC061755
        for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2020 02:18:32 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id k8so1147141pfk.2
        for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2020 02:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5VJmUi2hckCsijxBcYyhh03sDZwAMNbDuXEf/NPFrU4=;
        b=b8sPn/iNZ1hbUzVpPTulPn8fj7ufJEu2637RgBM8VxE9XMymWItCB/8oAIZlAU6V3/
         ulvQ0s3Md9tj7JuyvdmisQNwH1gF3Ai6rSu+/T85Tp0TE6mWavWcwznhxS+gOz/Nu6GA
         HbN28t9OrYj6QNZCpoOOzUPhs7YxQoXaG6WBxjMdcRHQYlvPof0W93p5qV8iFhlbSnlv
         4+Ggxl1o0nHi0nLrWdK6gSMnRvMkLEzHnkLJ/Vec/eL1MpzR5R6B8Rm2iadxTedPXf4W
         lvmgM5Mpe4S8y+at1XI++plh5fAmrOPNeDMCtEbjN3lOlGshcG7/gBv6jxKdXLE8OvFB
         MGLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5VJmUi2hckCsijxBcYyhh03sDZwAMNbDuXEf/NPFrU4=;
        b=p3bsmJe4nLqowi7xBXfV4UfXT1GzfiP/exI6hVAgdCLR+cmfpQz+gCAcMNoKM3stGN
         7xRIy7tIe3sMu0xqoUlS62eCo/WW8RwVWkS1VBySF5PhqQFGCAfOqDy9z2Q+LZD0OBto
         EpzIG4ehVmsP/YNyqGTFvtQYOzazMTraKyoSg75Ph4H1+08q5FBmseZ751FLV+UhC/e9
         0U/rJPtEEzNGqNV5InPs2I2AkJtiX0XEnhGqZwuHdFnmJ9A4fFeBiqvKE86V4FaVljUU
         Y26AJNHOpjKU3n0FETiwA42Ziha3lw0ZwgzqWZG7+WbjVtc9f7/J2Ml6hxFew85T6UIl
         I29g==
X-Gm-Message-State: AOAM531hiO7mJKO+aWyAJLtkEbGik38hJ0ON+u5CE2nBLEXtAo51x4IG
        nUN3M9nA8ydn/7knZxNBwR1d1g==
X-Google-Smtp-Source: ABdhPJxZY7syDdW76ZozIFq6p/RBmSoveEp5Ylw9O1uyIBddkks60ZtOQigzuvNjRHEcvFRBPIL0pw==
X-Received: by 2002:a63:6f46:: with SMTP id k67mr2230777pgc.296.1602839911585;
        Fri, 16 Oct 2020 02:18:31 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
        by smtp.gmail.com with ESMTPSA id h5sm2093263pfh.9.2020.10.16.02.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 02:18:31 -0700 (PDT)
From:   Zong Li <zong.li@sifive.com>
To:     paul.walmsley@sifive.com, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, mturquette@baylibre.com, sboyd@kernel.org,
        yash.shah@sifive.com, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org
Cc:     Zong Li <zong.li@sifive.com>
Subject: [PATCH 0/4] clk: add driver for the SiFive FU740
Date:   Fri, 16 Oct 2020 17:18:22 +0800
Message-Id: <cover.1602838910.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a driver for the SiFive FU740 PRCI IP block, which handles more
clocks than FU540. These patches also refactor the original
implementation by spliting the dependent-code of fu540 and fu740
respectively.

Zong Li (4):
  clk: sifive: Extract prci core to common base
  clk: sifive: Use common name for prci configuration
  clk: sifive: Add a driver for the SiFive FU740 PRCI IP block
  clk: sifive: Refactor __prci_clock array by using macro

 arch/riscv/Kconfig.socs                       |   2 +-
 drivers/clk/sifive/Kconfig                    |   8 +-
 drivers/clk/sifive/Makefile                   |   5 +-
 drivers/clk/sifive/fu540-prci.c               | 618 +-----------------
 drivers/clk/sifive/fu540-prci.h               |  21 +
 drivers/clk/sifive/fu740-prci.c               | 102 +++
 drivers/clk/sifive/fu740-prci.h               |  21 +
 drivers/clk/sifive/sifive-prci.c              | 529 +++++++++++++++
 drivers/clk/sifive/sifive-prci.h              | 297 +++++++++
 include/dt-bindings/clock/sifive-fu740-prci.h |  23 +
 10 files changed, 1032 insertions(+), 594 deletions(-)
 create mode 100644 drivers/clk/sifive/fu540-prci.h
 create mode 100644 drivers/clk/sifive/fu740-prci.c
 create mode 100644 drivers/clk/sifive/fu740-prci.h
 create mode 100644 drivers/clk/sifive/sifive-prci.c
 create mode 100644 drivers/clk/sifive/sifive-prci.h
 create mode 100644 include/dt-bindings/clock/sifive-fu740-prci.h

-- 
2.28.0

