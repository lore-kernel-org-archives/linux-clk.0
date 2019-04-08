Return-Path: <SRS0=sViq=SK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74AEAC10F14
	for <linux-clk@archiver.kernel.org>; Mon,  8 Apr 2019 10:20:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4009E20833
	for <linux-clk@archiver.kernel.org>; Mon,  8 Apr 2019 10:20:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sq2r5Vov"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbfDHKU6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Apr 2019 06:20:58 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43725 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726060AbfDHKU5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 Apr 2019 06:20:57 -0400
Received: by mail-wr1-f66.google.com with SMTP id k17so15639125wrx.10
        for <linux-clk@vger.kernel.org>; Mon, 08 Apr 2019 03:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=hTUtY+IM6B2DQhgBPY5XhL9p0M/rApXoH/mpj/PDFoY=;
        b=sq2r5Vov8P/Semw1Ej8fJQpWocfFSHJjaD6v9pTnKlD9IUt0Sv5vC7anT6Lup8riNV
         vIMEsdznzok4BIYIOFfhVJx0lj+HAiw1EyRwVBCdRGDvdcy9zz44Oq/UmzAHXdYqwRl+
         kmm0oNVTSxhVM8izxxpJpVNH1aB5s5TPAtVyFSIoVfPrezbfvdiGVTQSWsNqYKFcS+TE
         k70Kn/DEpWc3IBdIQ8esaa06Ra9yqmljfOb5U5q6M9BL5un0bqSc/KvTNnLMYkw8HRGk
         4gKwci7LlwyyTBLI2AxFOgE8WoaXXJtGk7q9hl/gDn49hjWglcnCSocxkXkuWzYeqIsk
         MkJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=hTUtY+IM6B2DQhgBPY5XhL9p0M/rApXoH/mpj/PDFoY=;
        b=KHfD8nKAZ6FRpZ8KRRk5454jBmVWFEL6pdmAZMXpB/PwXd7/fOrNxmdVnQIjV2N2Hx
         oqKeTq5ldDpQZJHnkNeTUcFJrV/O8D5XsdRBSRL8ZFfEy32w7+jQAScknyb8aoIdhe+Q
         x9BV0dTx28LNgM6a/qOOeYQXNqX618kr6bKHNHDiXJVnfsanw2RWI71KSXkzov8/8y+g
         i34javjaQjLfCpvEcVxr9JwI2UjlOUXRaHSoIOcj4L7MvnrgIubfeJF7oJ8qQK+rWHti
         4V2a0zSrRaopsL6l32fsF9fMCuS6+SkTR6JVOftJf6UVuFi/AQ8PEB1DWwTtHD+QCcfT
         e0Hg==
X-Gm-Message-State: APjAAAX9OWX1nIWqkPTSBMo/BQ8AdZ9+SKyvuwHQ/pFHcZbWAlCzGqYE
        gJmClcwYp0sZvULx+cgQiJuEqi2H
X-Google-Smtp-Source: APXvYqxXMOOiznr7X3UgEMH3uwv3ba77V/uKMP6Ele1Ewr+54acgQAGzE5rfU/YLFKoCMJe0+N0Tqw==
X-Received: by 2002:adf:f101:: with SMTP id r1mr18583435wro.251.1554718856058;
        Mon, 08 Apr 2019 03:20:56 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:9e39::64])
        by smtp.gmail.com with ESMTPSA id d6sm39336069wrx.62.2019.04.08.03.20.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Apr 2019 03:20:55 -0700 (PDT)
From:   Jonas Gorski <jonas.gorski@gmail.com>
To:     linux-clk@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc:     Anatolij Gustschin <agust@denx.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH RFC/RFT 3/6] clk: divider: make endian aware
Date:   Mon,  8 Apr 2019 12:20:36 +0200
Message-Id: <20190408102039.6366-4-jonas.gorski@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20190408102039.6366-1-jonas.gorski@gmail.com>
References: <20190408102039.6366-1-jonas.gorski@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Switch clk-divider to the endianness aware accessors to allow big endian
divider clocks on a per device level.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 drivers/clk/clk-divider.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index e5a17265cfaf..63cb8617a007 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -135,7 +135,7 @@ static unsigned long clk_divider_recalc_rate(struct clk_hw *hw,
 	struct clk_divider *divider = to_clk_divider(hw);
 	unsigned int val;
 
-	val = clk_readl(divider->reg) >> divider->shift;
+	val = clk_hw_readl(hw, divider->reg) >> divider->shift;
 	val &= clk_div_mask(divider->width);
 
 	return divider_recalc_rate(hw, parent_rate, val, divider->table,
@@ -370,7 +370,7 @@ static long clk_divider_round_rate(struct clk_hw *hw, unsigned long rate,
 	if (divider->flags & CLK_DIVIDER_READ_ONLY) {
 		u32 val;
 
-		val = clk_readl(divider->reg) >> divider->shift;
+		val = clk_hw_readl(hw, divider->reg) >> divider->shift;
 		val &= clk_div_mask(divider->width);
 
 		return divider_ro_round_rate(hw, rate, prate, divider->table,
@@ -420,11 +420,11 @@ static int clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,
 	if (divider->flags & CLK_DIVIDER_HIWORD_MASK) {
 		val = clk_div_mask(divider->width) << (divider->shift + 16);
 	} else {
-		val = clk_readl(divider->reg);
+		val = clk_hw_readl(hw, divider->reg);
 		val &= ~(clk_div_mask(divider->width) << divider->shift);
 	}
 	val |= (u32)value << divider->shift;
-	clk_writel(val, divider->reg);
+	clk_hw_writel(hw, val, divider->reg);
 
 	if (divider->lock)
 		spin_unlock_irqrestore(divider->lock, flags);
-- 
2.13.2

