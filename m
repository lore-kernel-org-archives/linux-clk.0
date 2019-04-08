Return-Path: <SRS0=sViq=SK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE4BC282CE
	for <linux-clk@archiver.kernel.org>; Mon,  8 Apr 2019 10:20:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3E2CD20833
	for <linux-clk@archiver.kernel.org>; Mon,  8 Apr 2019 10:20:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nYqtbsFv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726240AbfDHKU5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Apr 2019 06:20:57 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46557 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbfDHKU4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 Apr 2019 06:20:56 -0400
Received: by mail-wr1-f66.google.com with SMTP id t17so15622666wrw.13
        for <linux-clk@vger.kernel.org>; Mon, 08 Apr 2019 03:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NVmL03g/69kkqfLIzfzWYuQgrBWQBk/oveRzpCawG2w=;
        b=nYqtbsFvdqDaq9Z+dgV59ADFSXuYziC+nnDk/gC9YK7sOXzQalG4+KhNAqMGbdqdpJ
         7v1vjGkoVujw8LdBQ2qY95RvmZ5YXGvExwxivsWMmb3aoy2IhOXVRguF0+8pUdEXSZq7
         daRFWAiZn9765pb+UIvLuRN5vET5cAU6sDLLj4K/fLSE7Inm4l4iIC8QCxglHBVclUMF
         S/x8a/nvsZYnsZ4KCnlqL+2QUzfNQuGBQb9+IElq4iyk/1sVzLGlJMaEisxf1Qdk/mmS
         w+BnI2cdN1HuJJbSY1oyHnZXm/4PxMmrbgeIVeN9AftjKaS/PPUUuep7TFlY6t6aosfI
         f3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=NVmL03g/69kkqfLIzfzWYuQgrBWQBk/oveRzpCawG2w=;
        b=JgwzlgnKI7foJZtu7GhmO7rN9js9j6ssIP9rJbtZy8480I9EbumpakOlMPKhbuqdMb
         g+uxVGRfO0ajakDV9AYg1SQMppr8i/QOl0EG2tDq8w297FZuwSFA+2HfPbooh+B1xUeq
         lVPgPnVlUy3p2b0Gf5k+6RV4FMw52pZAq7PJwnROxnwhKQPiWa/vkxDvJfv4ggCtktML
         jKPlQzx4jKQdeDVN1tRSnf+VP8DfjWP9wKI4h+SOgXG3bSVdttSaODqgaO14If812604
         hW4+mVoJr4KWfxyy/xsrz7/MV0faH/Gr4YeBDlkBxVj8HJvutGdtKqVJO7/KlPtAjCuG
         L6/g==
X-Gm-Message-State: APjAAAUfBEH69gsWB19tj1YN3Wpu6jXie1e7YLlYH3mM2OLf/jdpdVem
        MTxhVuurxog8RhDUWDnu9Ft1WI3a
X-Google-Smtp-Source: APXvYqx3A5BPmwdS6ZMo6XnxwIg+1qK1eBDHM0Dzs76vfsGvc2VF4UbzvmXgRS+JM/YGZpdcNUDp7A==
X-Received: by 2002:adf:f70e:: with SMTP id r14mr18094535wrp.37.1554718854753;
        Mon, 08 Apr 2019 03:20:54 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:9e39::64])
        by smtp.gmail.com with ESMTPSA id d6sm39336069wrx.62.2019.04.08.03.20.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Apr 2019 03:20:54 -0700 (PDT)
From:   Jonas Gorski <jonas.gorski@gmail.com>
To:     linux-clk@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc:     Anatolij Gustschin <agust@denx.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH RFC/RFT 2/6] clk: gate: make endian-aware
Date:   Mon,  8 Apr 2019 12:20:35 +0200
Message-Id: <20190408102039.6366-3-jonas.gorski@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20190408102039.6366-1-jonas.gorski@gmail.com>
References: <20190408102039.6366-1-jonas.gorski@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Switch clk-gate to the endianness aware accessors to allow big endian
gated clocks on a per device level.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 drivers/clk/clk-gate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-gate.c b/drivers/clk/clk-gate.c
index f05823cd9b21..0e585ac133c7 100644
--- a/drivers/clk/clk-gate.c
+++ b/drivers/clk/clk-gate.c
@@ -55,7 +55,7 @@ static void clk_gate_endisable(struct clk_hw *hw, int enable)
 		if (set)
 			reg |= BIT(gate->bit_idx);
 	} else {
-		reg = clk_readl(gate->reg);
+		reg = clk_hw_readl(hw, gate->reg);
 
 		if (set)
 			reg |= BIT(gate->bit_idx);
@@ -63,7 +63,7 @@ static void clk_gate_endisable(struct clk_hw *hw, int enable)
 			reg &= ~BIT(gate->bit_idx);
 	}
 
-	clk_writel(reg, gate->reg);
+	clk_hw_writel(hw, reg, gate->reg);
 
 	if (gate->lock)
 		spin_unlock_irqrestore(gate->lock, flags);
@@ -88,7 +88,7 @@ int clk_gate_is_enabled(struct clk_hw *hw)
 	u32 reg;
 	struct clk_gate *gate = to_clk_gate(hw);
 
-	reg = clk_readl(gate->reg);
+	reg = clk_hw_readl(hw, gate->reg);
 
 	/* if a set bit disables this clk, flip it before masking */
 	if (gate->flags & CLK_GATE_SET_TO_DISABLE)
-- 
2.13.2

