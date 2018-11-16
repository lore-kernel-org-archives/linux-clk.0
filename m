Return-Path: <SRS0=Wnie=N3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84F64C43441
	for <linux-clk@archiver.kernel.org>; Fri, 16 Nov 2018 15:06:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5922D2087A
	for <linux-clk@archiver.kernel.org>; Fri, 16 Nov 2018 15:06:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5922D2087A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728354AbeKQBSs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Nov 2018 20:18:48 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:49008 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728169AbeKQBSs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 16 Nov 2018 20:18:48 -0500
Received: from unknown (HELO relmlir3.idc.renesas.com) ([10.200.68.153])
  by relmlie6.idc.renesas.com with ESMTP; 17 Nov 2018 00:01:01 +0900
Received: from relmlii2.idc.renesas.com (relmlii2.idc.renesas.com [10.200.68.66])
        by relmlir3.idc.renesas.com (Postfix) with ESMTP id 3C3DF100374;
        Sat, 17 Nov 2018 00:01:01 +0900 (JST)
X-IronPort-AV: E=Sophos;i="5.56,240,1539615600"; 
   d="scan'208";a="297674605"
Received: from unknown (HELO vbox.ree.adwin.renesas.com) ([10.226.37.67])
  by relmlii2.idc.renesas.com with ESMTP; 17 Nov 2018 00:00:59 +0900
From:   Phil Edworthy <phil.edworthy@renesas.com>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Guan Xuetao <gxt@pku.edu.cn>
Subject: [PATCH v6 6/6] arch/unicore32/kernel/clock.c: Add clk_get_optional() function
Date:   Fri, 16 Nov 2018 14:59:37 +0000
Message-Id: <20181116145937.27660-7-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181116145937.27660-1-phil.edworthy@renesas.com>
References: <20181116145937.27660-1-phil.edworthy@renesas.com>
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

clk_get_optional() returns NULL if not found instead of -ENOENT,
otherwise the behaviour is the same as clk_get().

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
---
 arch/unicore32/kernel/clock.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/unicore32/kernel/clock.c b/arch/unicore32/kernel/clock.c
index b1ca775f6f6e..03def0b43192 100644
--- a/arch/unicore32/kernel/clock.c
+++ b/arch/unicore32/kernel/clock.c
@@ -74,6 +74,17 @@ struct clk *clk_get(struct device *dev, const char *id)
 }
 EXPORT_SYMBOL(clk_get);
 
+struct clk *clk_get_optional(struct device *dev, const char *id)
+{
+	struct clk *clk = clk_get(dev, id);
+
+	if (clk == ERR_PTR(-ENOENT))
+		clk = NULL;
+
+	return clk;
+}
+EXPORT_SYMBOL(clk_get_optional);
+
 void clk_put(struct clk *clk)
 {
 }
-- 
2.17.1

