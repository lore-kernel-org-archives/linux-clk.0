Return-Path: <SRS0=Ee6+=SG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3FECC4360F
	for <linux-clk@archiver.kernel.org>; Thu,  4 Apr 2019 15:05:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C44AB2064A
	for <linux-clk@archiver.kernel.org>; Thu,  4 Apr 2019 15:05:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="jTJto0ZX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729224AbfDDPFq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Apr 2019 11:05:46 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38380 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729423AbfDDPFq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 Apr 2019 11:05:46 -0400
Received: by mail-wr1-f66.google.com with SMTP id k11so4258200wro.5
        for <linux-clk@vger.kernel.org>; Thu, 04 Apr 2019 08:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MzS9le92cojNiBwsEcpVtVjv6C+c3kU/euAgZOl/ICU=;
        b=jTJto0ZXpcizm1AebWMBhu3/fxNqSf460QjW0538A70L95HJpM+9AnJafbMr6ON/1l
         A8dJ5Qz+x9hc9VetY3PqxNJoE/DfVyWPOej/Dmx/NAVmtp7NerkGZJuCSQxdjoy49fq1
         5cIR4goC1kvjh4JuprqmzkcvZBrMafLSqpqmhfz4t7GPApUmymkrx3LonXZok9smVkJC
         KpsVYIHSoJS9CfB5ZT9CgegAph0WBhUTBB0BDVPDi2CxRJkSs2avpsUDYsBkD1hQg/7O
         1M+H0+iVBAIkdScCpUGMUpcWFlM0UmsloYFJM1PXJyhDz5SY7YS0AyenqmoDXxge64mh
         4rvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MzS9le92cojNiBwsEcpVtVjv6C+c3kU/euAgZOl/ICU=;
        b=rQatgT4c3LK0pM2DScooxv+/HCmD0NJ9XWxK1rzNhkulyl05uaBVyPEeecFxoG/lP6
         t6e2I9yIxs3l5nfDwxxFLc+gUpVGCgzvpap4Pofy3oRXFD/9hKtoM6vD9NXo5d5jLcgx
         S/r2/gYMOMkXoLkXDwPsLQB0tjSM+QwbKE+7ZruDGKVq7ZjROaJmDt2dAh9gf1v94waM
         X56oApGWAV5tDLURatSoxYN3BOJYB89YMyUlH/UKLS6U5q017hlqsiMzB7CM+tuKVGnm
         2eSO+kzNrY1YwXQ7M2QTBOyZrrrEyxNp3cmOWjsVQE8Gm61/l2sVQmFCHvqTIWYGPolj
         tnQw==
X-Gm-Message-State: APjAAAVJTogKFwYtTEeBxtdOZW3sIfPr7A+Zznm09OAP7eIuGl8ghpjH
        srTGrvW3oW/O8hX3lTN6SwjgxA==
X-Google-Smtp-Source: APXvYqyZfZQ4gNDAxpQZSyJGinCu8vxmTWP6jr51aQb+A4G7jVIbw9tgWcnqtl1MXVr3JQlytlUT4A==
X-Received: by 2002:a5d:4646:: with SMTP id j6mr4838442wrs.56.1554390343904;
        Thu, 04 Apr 2019 08:05:43 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr. [176.150.251.154])
        by smtp.gmail.com with ESMTPSA id z23sm9880981wma.0.2019.04.04.08.05.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 04 Apr 2019 08:05:41 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     khilman@baylibre.com, jbrunet@baylibre.com
Cc:     baylibre-upstreaming@groups.io,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 3/6] clk: meson: g12a: mark fclk_div3 as critical
Date:   Thu,  4 Apr 2019 17:05:15 +0200
Message-Id: <20190404150518.30337-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190404150518.30337-1-narmstrong@baylibre.com>
References: <20190404150518.30337-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Amlogic Meson G12b platform, the fclk_div3 seems to be necessary for
the system to operate correctly.

Disabling it cause the entire system to freeze, including peripherals.

This patch patch marks this clock as critical, fixing boot on G12b platforms.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/g12a.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 14aaa02bb621..3554d1172169 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -1060,6 +1060,16 @@ static struct clk_regmap g12a_fclk_div3 = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_names = (const char *[]){ "fclk_div3_div" },
 		.num_parents = 1,
+		/*
+		 * This clock is used by the resident firmware and is required
+		 * by the platform to operate correctly.
+		 * Until the following condition are met, we need this clock to
+		 * be marked as critical:
+		 * a) Mark the clock used by a firmware resource, if possible
+		 * b) CCF has a clock hand-off mechanism to make the sure the
+		 *    clock stays on until the proper driver comes along
+		 */
+		.flags = CLK_IS_CRITICAL,
 	},
 };
 
-- 
2.21.0

