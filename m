Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13764C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 30 Nov 2021 09:34:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240273AbhK3JiB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 Nov 2021 04:38:01 -0500
Received: from mta-p6.oit.umn.edu ([134.84.196.206]:37614 "EHLO
        mta-p6.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240264AbhK3Jh6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 Nov 2021 04:37:58 -0500
Received: from localhost (unknown [127.0.0.1])
        by mta-p6.oit.umn.edu (Postfix) with ESMTP id 4J3H9l4YnYz9vC7k
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 09:34:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p6.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p6.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id YdZvM2Pr3WfO for <linux-clk@vger.kernel.org>;
        Tue, 30 Nov 2021 03:34:35 -0600 (CST)
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p6.oit.umn.edu (Postfix) with ESMTPS id 4J3H9l2LzWz9vC8H
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 03:34:35 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p6.oit.umn.edu 4J3H9l2LzWz9vC8H
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p6.oit.umn.edu 4J3H9l2LzWz9vC8H
Received: by mail-pg1-f200.google.com with SMTP id d2-20020a656202000000b00325603f7d0bso4572051pgv.12
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 01:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TDsBAodbkJK1sTWl0h68gHfBD40liffXghGQbkMt8+8=;
        b=I7fqMmv0X1qKLOC4SuT9Gybc7pfg6RlaeR1Ga7XfJrUCnsA85LW9EOc0ywwVA0gRPv
         IhQa+Yr1B7SZqJi0n/hP1SQtyPZs9A1exN+lOnXF9tktk3nBakJCbgHQFoZcvwSbLVFs
         ghvr0yJKCaJ4mCBgl2V1C24mb7yY39xZ8sNRJ/rOqAiVraPrP2dG8MY2L5zHeY67jL1f
         tGTrAgPs3qxwDcO+136yRsq13j6CgQ0KvZqwZeR7b8A/KE5ydQko1IUadWs5FKzNphDT
         U1GG7usPKjo/iHCs9/aqONh9+Mq8HkaKLtEgjH2rQQUPpzKCkDqoqdfvcZXMt5zL6lVN
         NWQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TDsBAodbkJK1sTWl0h68gHfBD40liffXghGQbkMt8+8=;
        b=RkDMK1AJYtcKR1B4KvGcuJRDeXdyLUK0OEnVyy08VxkLwfWfISZfsvt4vhP3AKY1Ba
         WP3sPpGxIIEagXKxjRm/NQ4cmeOzNXI8X0uv7SBC11JZFGlcAsaVM7Mv7WvXraJrtYB8
         VVSdUzgMBGv6xIkZeFdr28Ok0GRmebslAvPBt3Xah3ppVMiLOwzcbjETvTv/rcfg0gVG
         Q6yyl2X72IMZl6XdlM92kLwclkTxaUXr8jv4GB8QswXdmRt6Q1cN4wI39cIIUDq+Iq9Y
         GOiXL5vHQWq0UYJPzhnurUJfPfMVTxeoobHHRrMUPcOhjvfh4kMOie3LPMEyogAPOxYb
         NoLQ==
X-Gm-Message-State: AOAM532d8ijj9ykWdiVV85VBRf93fbjJDbX2p8zSDBE39aS39sra/ZIA
        hNoY8aqwnrFM9bEod9wEQY64QfVJndxuXOYIPhvzQ3a35cdJH1HsIQQSE5XbZc6D4PCCNOl1xY2
        Zbckm5fVjdGIzIyAtJ1KypmRb
X-Received: by 2002:aa7:9575:0:b0:49f:ddab:dcdb with SMTP id x21-20020aa79575000000b0049fddabdcdbmr45022270pfq.13.1638264874342;
        Tue, 30 Nov 2021 01:34:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxsDWM9P1f5MUfWqEnY5V636f+gBeBhvK0l6UDhiuZ55X6bQo/QkB81s6VykNd/tyEgtDCV1w==
X-Received: by 2002:aa7:9575:0:b0:49f:ddab:dcdb with SMTP id x21-20020aa79575000000b0049fddabdcdbmr45022232pfq.13.1638264873975;
        Tue, 30 Nov 2021 01:34:33 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
        by smtp.gmail.com with ESMTPSA id j2sm13833949pgl.73.2021.11.30.01.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 01:34:33 -0800 (PST)
From:   Zhou Qingyang <zhou1615@umn.edu>
To:     zhou1615@umn.edu
Cc:     kjlu@umn.edu, Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Chen Zhong <chen.zhong@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: mediatek: mt7622: Fix a NULL pointer dereference in mtk_infrasys_init()
Date:   Tue, 30 Nov 2021 17:34:26 +0800
Message-Id: <20211130093428.87802-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In mtk_infrasys_init(), the return value of mtk_alloc_clk_data() is
assigned to clk_data and used in mtk_clk_register_cpumuxes(). There is a
dereference of clk_data in mtk_clk_register_cpumuxes(), which could lead
to a NULL pointer dereference on failure of mtk_alloc_clk_data().

Fix this bug by adding a check of clk_data.

Another way to fix this bug is to add a check of clk_data in
mtk_clk_register_cpumuxes(), which may solve many similar bugs but could
cause potential problems to previously correct cases as the API is changed.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_COMMON_CLK_MT7622=y show no new warnings, and our
static analyzer no longer warns about this code.

Fixes: 2fc0a509e4ee ("clk: mediatek: add clock support for MT7622 SoC")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/clk/mediatek/clk-mt7622.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt7622.c b/drivers/clk/mediatek/clk-mt7622.c
index ef5947e15c75..3a389fa915c1 100644
--- a/drivers/clk/mediatek/clk-mt7622.c
+++ b/drivers/clk/mediatek/clk-mt7622.c
@@ -653,6 +653,8 @@ static int mtk_infrasys_init(struct platform_device *pdev)
 
 	mtk_clk_register_gates(node, infra_clks, ARRAY_SIZE(infra_clks),
 			       clk_data);
+	if (!clk_data)
+		return -ENOMEM;
 
 	mtk_clk_register_cpumuxes(node, infra_muxes, ARRAY_SIZE(infra_muxes),
 				  clk_data);
-- 
2.25.1

