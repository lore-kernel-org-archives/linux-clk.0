Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF24C433E0
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 14:22:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4859664EA1
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 14:22:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230386AbhBKOV6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Feb 2021 09:21:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232144AbhBKOTm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Feb 2021 09:19:42 -0500
Received: from mail-wm1-x364.google.com (mail-wm1-x364.google.com [IPv6:2a00:1450:4864:20::364])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FC38C0613D6
        for <linux-clk@vger.kernel.org>; Thu, 11 Feb 2021 06:18:55 -0800 (PST)
Received: by mail-wm1-x364.google.com with SMTP id w4so5704647wmi.4
        for <linux-clk@vger.kernel.org>; Thu, 11 Feb 2021 06:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flowbird.group; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=X6a3XjmDak/vsr4FAYNcNkOoo6lQjp5prDu/T8MjYs4=;
        b=PaMLeJ1ScHlVK9d06eDyMw6Uzh8Ov+ByK/0Vfx/1HuqrD04SW+qOGX/9tXJe7Jkhtf
         02kv3FSr+XIxuYPctfML1aWlTAzS/Aa3Q1q6yxi02wyE8cObXlxtFLpFEnSoABPpsOtU
         AizQtWIv7tNGvVG6LkzRb3bfxVEZTXvHNB0OfvtyFJNlNZEW8ab8q7Krv5Z9pmr4W9WA
         EgQzCiuEutRKeSRY7TYwbZ6SjNpraoQB9Swe3OwZd+wt9/7EBd/vyxNgM9/TQdWcUoq+
         lvBFs8I/NDRiqe/2lGqvdmEFNAvEFUH0KVCuZVyLlBfeUot0hFMtC790Wm5qVlqKvyiT
         M/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=X6a3XjmDak/vsr4FAYNcNkOoo6lQjp5prDu/T8MjYs4=;
        b=L9wWM47yqQfFkBXsvnBBlb/tBc62UfV+qTcn6C9i3VgvOoLIaowiD20NSOfwlKoCO0
         evjiBSY8YYvMsN9ODSZseTTV35rcxuSLz0Axaj77XcgmYDf4VKpmFTRRZ3vmaDu7M7b9
         okwQoyeOJ37tZ3Al+OOuXIm+w4sfWt4fujvve9aKbfkxdkSugapqca78XbcGNeeN0mNG
         Hds4QnnMQ/yZibpUwiknH02D3GR5aM943RoaLZkXXSMdJCIvVbxgKBZGbp6Haq7P0bE3
         5RHK6tJxmq0ylA0/PL0AAk1SVFGtKdlOmp3sByWGTdq5Z2+m5EUybV0Ir+X3oRywGJFP
         28/Q==
X-Gm-Message-State: AOAM531zR/vuUSPoFMTXV76X/X3btHUE4Abiu9OdFPip8Ois8C099PqV
        JESoEtdCR6cDPu2KNxWFWqxszn4Pc3kxhfOuyBqRzCOhTF0x
X-Google-Smtp-Source: ABdhPJzmbaQRYk1FPRG9nFSfphAIkK5ARQ/Tk+97XvI+n4pIOgAF7ES9DqgwRGeJ27BnVwhBv3weR8GU6n4+
X-Received: by 2002:a7b:c193:: with SMTP id y19mr5363115wmi.23.1613053133686;
        Thu, 11 Feb 2021 06:18:53 -0800 (PST)
Received: from mta1.parkeon.com ([185.149.63.251])
        by smtp-relay.gmail.com with ESMTPS id r16sm253298wrx.37.2021.02.11.06.18.53
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Feb 2021 06:18:53 -0800 (PST)
X-Relaying-Domain: flowbird.group
Received: from [172.16.13.226] (port=59918 helo=PC12445-BES.dynamic.besancon.parkeon.com)
        by mta1.parkeon.com with esmtp (Exim 4.71)
        (envelope-from <martin.fuzzey@flowbird.group>)
        id 1lACo1-0007Sd-5V; Thu, 11 Feb 2021 15:18:53 +0100
From:   Martin Fuzzey <martin.fuzzey@flowbird.group>
To:     Alexandre Torgue <alexandre.torgue@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: stm32mp1: wait for LSE to become ready after enabling
Date:   Thu, 11 Feb 2021 15:17:52 +0100
Message-Id: <1613053132-29632-1-git-send-email-martin.fuzzey@flowbird.group>
X-Mailer: git-send-email 1.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

After enabling the LSE clock it is necessary to wait to for
the ready bit to be set.
This takes 4096 cycles of the clock frequency (typically 32kHz)

Currently this is not done and causes the RTC driver to fail to probe
when built as a module:
	stm32_rtc 5c004000.rtc: Can't enter in init mode. Prescaler config failed.

The reason is that if no built in driver uses LSE the clock framework will
switch it off at the end of kernel boot. When the RTC driver is later
probed as a module it will enable the LSE clock but since there is no
wait the RTC driver will time out waiting for the RTC to initialise.

When the RTC driver is built in it works, provided the LSE has already
been enabled by the bootloader.

Signed-off-by: Martin Fuzzey <martin.fuzzey@flowbird.group>
---
 drivers/clk/clk-stm32mp1.c | 73 +++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 69 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-stm32mp1.c b/drivers/clk/clk-stm32mp1.c
index a875649..b85ec88 100644
--- a/drivers/clk/clk-stm32mp1.c
+++ b/drivers/clk/clk-stm32mp1.c
@@ -10,6 +10,7 @@
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/slab.h>
@@ -325,9 +326,19 @@ struct clock_config {
 
 #define NO_ID ~0
 
+struct stm32_clk_rdy_gate {
+	struct clk_gate gate;
+	u32 timeout_us;
+	u8 rdy_bit_idx;
+};
+
+#define to_clk_rdy_gate(_gate) container_of(_gate, struct stm32_clk_rdy_gate, gate)
+
 struct gate_cfg {
 	u32 reg_off;
+	u32 timeout_us;
 	u8 bit_idx;
+	u8 rdy_bit_idx;
 	u8 gate_flags;
 };
 
@@ -469,6 +480,36 @@ static void mp1_gate_clk_disable(struct clk_hw *hw)
 	.is_enabled	= clk_gate_is_enabled,
 };
 
+static int ready_gate_clk_enable(struct clk_hw *hw)
+{
+	struct clk_gate *gate = to_clk_gate(hw);
+	struct stm32_clk_rdy_gate *rdy_gate = to_clk_rdy_gate(gate);
+	int ret = 0;
+
+	if (!clk_gate_ops.is_enabled(hw)) {
+		u32 val;
+
+		clk_gate_ops.enable(hw);
+		ret = readl_relaxed_poll_timeout_atomic(
+					gate->reg,
+					val, (val & BIT(rdy_gate->rdy_bit_idx)),
+					100, rdy_gate->timeout_us);
+	}
+
+	return ret;
+}
+
+static void ready_gate_clk_disable(struct clk_hw *hw)
+{
+	clk_gate_ops.disable(hw);
+}
+
+static const struct clk_ops ready_gate_clk_ops = {
+	.enable		= ready_gate_clk_enable,
+	.disable	= ready_gate_clk_disable,
+	.is_enabled	= clk_gate_is_enabled,
+};
+
 static struct clk_hw *_get_stm32_mux(void __iomem *base,
 				     const struct stm32_mux_cfg *cfg,
 				     spinlock_t *lock)
@@ -535,7 +576,7 @@ static struct clk_hw *_get_stm32_div(void __iomem *base,
 		const struct stm32_gate_cfg *cfg, spinlock_t *lock)
 {
 	struct stm32_clk_mgate *mgate;
-	struct clk_gate *gate;
+	struct stm32_clk_rdy_gate *rdy_gate;
 	struct clk_hw *gate_hw;
 
 	if (cfg->mgate) {
@@ -554,10 +595,15 @@ static struct clk_hw *_get_stm32_div(void __iomem *base,
 		gate_hw = &mgate->gate.hw;
 
 	} else {
-		gate = kzalloc(sizeof(*gate), GFP_KERNEL);
-		if (!gate)
+		struct clk_gate *gate;
+
+		rdy_gate = kzalloc(sizeof(*rdy_gate), GFP_KERNEL);
+		if (!rdy_gate)
 			return ERR_PTR(-ENOMEM);
 
+		gate = &rdy_gate->gate;
+		rdy_gate->rdy_bit_idx = cfg->gate->rdy_bit_idx;
+		rdy_gate->timeout_us = cfg->gate->timeout_us;
 		gate->reg = cfg->gate->reg_off + base;
 		gate->bit_idx = cfg->gate->bit_idx;
 		gate->flags = cfg->gate->gate_flags;
@@ -1211,6 +1257,23 @@ static struct clk_hw *_clk_register_cktim(struct device *dev,
 	_STM32_GATE(_gate_offset, _gate_bit_idx, _gate_flags,\
 		    NULL, NULL)\
 
+#define _READY_GATE(_gate_offset, _gate_bit_idx, _rdy_bit_idx, _timeout_us, _gate_flags)\
+	(&(struct stm32_gate_cfg) {\
+		&(struct gate_cfg) {\
+			.reg_off	= _gate_offset,\
+			.bit_idx	= _gate_bit_idx,\
+			.rdy_bit_idx	= _rdy_bit_idx,\
+			.timeout_us	= _timeout_us, \
+			.gate_flags	= _gate_flags,\
+		},\
+		.ops		= &ready_gate_clk_ops,\
+	})
+
+#define GATE_READY(_id, _name, _parent, _flags, _offset, _bit_idx, \
+		   _rdy_bit_idx, _timeout_us, _gate_flags) \
+	STM32_GATE(_id, _name, _parent, _flags,\
+		   _READY_GATE(_offset, _bit_idx, _rdy_bit_idx, _timeout_us, _gate_flags))
+
 #define _GATE_MP1(_gate_offset, _gate_bit_idx, _gate_flags)\
 	_STM32_GATE(_gate_offset, _gate_bit_idx, _gate_flags,\
 		    NULL, &mp1_gate_clk_ops)\
@@ -1668,7 +1731,9 @@ enum {
 		 RCC_OCENSETR, 4, 0),
 	GATE_MP1(CK_HSI, "ck_hsi", "clk-hsi-div", 0, RCC_OCENSETR, 0, 0),
 	GATE(CK_LSI, "ck_lsi", "clk-lsi", 0, RCC_RDLSICR, 0, 0),
-	GATE(CK_LSE, "ck_lse", "clk-lse", 0, RCC_BDCR, 0, 0),
+	GATE_READY(CK_LSE, "ck_lse", "clk-lse", 0, RCC_BDCR, 0, 2,
+		   /* Ready bit set after 4096 cycles of 32kHz clock 2* for safety */
+		   USEC_PER_SEC / 32768 * 4096 * 2, 0),
 
 	FIXED_FACTOR(CK_HSE_DIV2, "clk-hse-div2", "ck_hse", 0, 1, 2),
 
-- 
1.9.1

