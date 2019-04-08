Return-Path: <SRS0=sViq=SK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40891C10F13
	for <linux-clk@archiver.kernel.org>; Mon,  8 Apr 2019 10:21:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 156AA20833
	for <linux-clk@archiver.kernel.org>; Mon,  8 Apr 2019 10:21:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d17i09sr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbfDHKU7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Apr 2019 06:20:59 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:34849 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726060AbfDHKU7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 Apr 2019 06:20:59 -0400
Received: by mail-wm1-f66.google.com with SMTP id y197so14099323wmd.0
        for <linux-clk@vger.kernel.org>; Mon, 08 Apr 2019 03:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=uos6Ss4ukbBTFHAWbjMX+2nhjoQLM7lIBz4DiklN5mM=;
        b=d17i09sroO1+C8AnLcntaK5z4ZZl5PI/HhpnTM5AwjEf0+Xt5dZFPZzmoOP6DcAFx7
         bgpQhjwSXHQ7XZyB+WSomVPsLl1Q77MdG4r5H8PW0ousSNEiZYBv4sRrpTN6phuq05Ei
         fkVDQWpH54nWEqu5xEzUeaHGSN6fbca1qUKH0mB87cWxQ5VnO3f1BvvtfKHphi2k6tQg
         orVnZCizLIbuD6fmhZtXxzsiuEHBHBIea5dQ2yXck7XVX1SfR6Au0m+C1+YuHi6nIsCH
         HB3Sb3anmwVg8MZxlA+//VSxf8c1mHJ28xLb7wm3+vI167mf5hJG8ab0UG/v9KXXJMeN
         MJ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=uos6Ss4ukbBTFHAWbjMX+2nhjoQLM7lIBz4DiklN5mM=;
        b=BMwlPoMNobVMaz4rS0G1lcwUEl53cbzGlmUt1QjN21uMTbP3ZdSOKVGmUb46udgM9/
         ZRlKBG4We8hUTGux9K/QwVqmprjEl9wD9BjUN1fl5VA75CoeZQYVbpdmG6eR01GDQ08b
         XCNYPaacWllM0+iB2Y3L9rdiUMoGHL3ENdGrQgjbgmxZxf73DjKYuV8+2Z4sZUDNYPWI
         vTp7TWDGWbm3T5yrXNkn+Bpj4HiOWD3Oy8N9s552eA9DkT2kLutmjErgTxg0rHZKKH9e
         HJQvORYesXs55CkgiQGQDumVNT60xG3xGUxVZHlM4Wmx7lSWdRpPUUb8pm0WZveFsSpt
         ma8Q==
X-Gm-Message-State: APjAAAVhHlh2kfYlb5yARJqLwNrinGhhZ8zqkY8cudTldYiWGkCDjBhk
        k19eGM1vnt9+JgEsssjyvjgdENPP
X-Google-Smtp-Source: APXvYqy/e+I3FKRmUAEVmK3w9u/9ZjxjvsC+m463esRFcYln100KieuofO9WNZlnXC6P+AXSXH5itA==
X-Received: by 2002:a1c:208c:: with SMTP id g134mr17366615wmg.70.1554718857505;
        Mon, 08 Apr 2019 03:20:57 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:9e39::64])
        by smtp.gmail.com with ESMTPSA id d6sm39336069wrx.62.2019.04.08.03.20.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Apr 2019 03:20:56 -0700 (PDT)
From:   Jonas Gorski <jonas.gorski@gmail.com>
To:     linux-clk@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc:     Anatolij Gustschin <agust@denx.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH RFC/RFT 4/6] clk: mux: make endian aware
Date:   Mon,  8 Apr 2019 12:20:37 +0200
Message-Id: <20190408102039.6366-5-jonas.gorski@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20190408102039.6366-1-jonas.gorski@gmail.com>
References: <20190408102039.6366-1-jonas.gorski@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Switch clk-mux to the endianness aware accessors to allow big endian
mux clocks on a per device level.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 drivers/clk/clk-mux.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-mux.c b/drivers/clk/clk-mux.c
index 2ad2df2e8909..4a02db06eb29 100644
--- a/drivers/clk/clk-mux.c
+++ b/drivers/clk/clk-mux.c
@@ -73,7 +73,7 @@ static u8 clk_mux_get_parent(struct clk_hw *hw)
 	struct clk_mux *mux = to_clk_mux(hw);
 	u32 val;
 
-	val = clk_readl(mux->reg) >> mux->shift;
+	val = clk_hw_readl(hw, mux->reg) >> mux->shift;
 	val &= mux->mask;
 
 	return clk_mux_val_to_index(hw, mux->table, mux->flags, val);
@@ -94,12 +94,12 @@ static int clk_mux_set_parent(struct clk_hw *hw, u8 index)
 	if (mux->flags & CLK_MUX_HIWORD_MASK) {
 		reg = mux->mask << (mux->shift + 16);
 	} else {
-		reg = clk_readl(mux->reg);
+		reg = clk_hw_readl(hw, mux->reg);
 		reg &= ~(mux->mask << mux->shift);
 	}
 	val = val << mux->shift;
 	reg |= val;
-	clk_writel(reg, mux->reg);
+	clk_hw_writel(hw, reg, mux->reg);
 
 	if (mux->lock)
 		spin_unlock_irqrestore(mux->lock, flags);
-- 
2.13.2

