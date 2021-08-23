Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37EBDC4338F
	for <linux-clk@archiver.kernel.org>; Mon, 23 Aug 2021 11:33:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 20DB261361
	for <linux-clk@archiver.kernel.org>; Mon, 23 Aug 2021 11:33:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236118AbhHWLeg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Aug 2021 07:34:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234997AbhHWLeg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Aug 2021 07:34:36 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3191C061575
        for <linux-clk@vger.kernel.org>; Mon, 23 Aug 2021 04:33:53 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id s25so13005783edw.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Aug 2021 04:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C2okYUf1AtblKbXwagU9YAK3CN+7qGUOMB9Z5HBBHko=;
        b=A+Ladic4SYAhhQwxbEd6g9Zl+UDI2GpD0djH9z3bsHqLihU08PgqEj53L22qkk1595
         2hNEFm6lUpTJmjcRd+lNu9KJ3eAWga8UwRTxhSeq/4R8WoR/WOiHE7JAtIXCClQvHulY
         xODStzP/LuWGcIhIR+GCljJ1FFt+bOYqntEQe41zo9PapW+aIBupXaShv0TJIJ0FqExs
         nhz+nL8HrLoXwabDSTiXxF84X3HluqH627NjG2APmcylAs/jLxT5H2P+EbMJR/Mmz7SZ
         BVzCxg1j655HKbiR/7RgTDdGclBlZg7uMw1OFITgM7jC+j1ssffILbANKyOQZ2NSmooZ
         A6xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=C2okYUf1AtblKbXwagU9YAK3CN+7qGUOMB9Z5HBBHko=;
        b=kqZOTGSTGOQhcU6xMqCllzFATsfcHKZxaJwQ/LfWWOjFLww0CkbU54LXg5/L2QEwnG
         j58s+aLwNnbowsGYKdZQV8f8j2Fa0Cqx0zMY8f1U6fFGGQ0qu/p6JliPYUJRsjuuwdyf
         CpgtcXr9K0Mctq8rE+hXQL0qVrJYitW7mR3zPfIi+Z8/qQqSNFrFcneRXiTe6+PvHoLJ
         QcH+NsFIwAXniWAWWvR64BCh9xZ6CmgGZLbpRj0AAsJgCaCWZOtG0ckEgm1rhW7TI1tP
         MbXgibUVSy7zpwf5YQmBjtOq8lmhoHB3b079RjgHVBUDwzCBD7CEHMXNAKT2+AmTR+MP
         xCOg==
X-Gm-Message-State: AOAM532OiTgupCos1udeTGNE9Y0e9Y/kXzFzwMVhgOxiTxJzaIiGQx3Q
        dV0ZsgSBPlXgqh34f4YxRl9Djw==
X-Google-Smtp-Source: ABdhPJyPqe+s/qFujaqzUWX1M4ldSixz6qi10KOX3mjL3/Q1Xe70hxlcXOID7+5ApG++uzAz9Tx0rA==
X-Received: by 2002:a05:6402:190f:: with SMTP id e15mr8536169edz.171.1629718432382;
        Mon, 23 Aug 2021 04:33:52 -0700 (PDT)
Received: from localhost ([2a02:768:2307:40d6:f666:9af6:3fed:e53b])
        by smtp.gmail.com with ESMTPSA id v23sm9014840edy.21.2021.08.23.04.33.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Aug 2021 04:33:52 -0700 (PDT)
Sender: Michal Simek <monstr@monstr.eu>
From:   Michal Simek <michal.simek@xilinx.com>
To:     linux-kernel@vger.kernel.org, monstr@monstr.eu,
        michal.simek@xilinx.com, git@xilinx.com, sboyd@kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Rajan Vaja <rajan.vaja@xilinx.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [PATCH] clk: zynqmp: Fix kernel-doc format
Date:   Mon, 23 Aug 2021 13:33:47 +0200
Message-Id: <26526e144296373b2c75e75865dd023158f9bfc7.1629718424.git.michal.simek@xilinx.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Align structure and function names with definitions.

Issues are reported by kernel-doc script as:
drivers/clk/zynqmp/clk-gate-zynqmp.c:24: warning: expecting prototype for
struct clk_gate. Prototype was for struct zynqmp_clk_gate instead
drivers/clk/zynqmp/clk-gate-zynqmp.c:75: warning: expecting prototype for
zynqmp_clk_gate_is_enable(). Prototype was for zynqmp_clk_gate_is_enabled()
instead

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 drivers/clk/zynqmp/clk-gate-zynqmp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/zynqmp/clk-gate-zynqmp.c b/drivers/clk/zynqmp/clk-gate-zynqmp.c
index 695feaa82da5..565ed67a0430 100644
--- a/drivers/clk/zynqmp/clk-gate-zynqmp.c
+++ b/drivers/clk/zynqmp/clk-gate-zynqmp.c
@@ -12,7 +12,7 @@
 #include "clk-zynqmp.h"
 
 /**
- * struct clk_gate - gating clock
+ * struct zynqmp_clk_gate - gating clock
  * @hw:		handle between common and hardware-specific interfaces
  * @flags:	hardware-specific flags
  * @clk_id:	Id of clock
@@ -66,7 +66,7 @@ static void zynqmp_clk_gate_disable(struct clk_hw *hw)
 }
 
 /**
- * zynqmp_clk_gate_is_enable() - Check clock state
+ * zynqmp_clk_gate_is_enabled() - Check clock state
  * @hw:		handle between common and hardware-specific interfaces
  *
  * Return: 1 if enabled, 0 if disabled else error code
-- 
2.33.0

