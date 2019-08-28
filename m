Return-Path: <SRS0=KEZg=WY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49E09C3A5A4
	for <linux-clk@archiver.kernel.org>; Wed, 28 Aug 2019 10:20:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2100F208CB
	for <linux-clk@archiver.kernel.org>; Wed, 28 Aug 2019 10:20:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="BDeAjkuI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726651AbfH1KU3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Aug 2019 06:20:29 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37741 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726370AbfH1KU3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Aug 2019 06:20:29 -0400
Received: by mail-wr1-f68.google.com with SMTP id z11so1916300wrt.4
        for <linux-clk@vger.kernel.org>; Wed, 28 Aug 2019 03:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ocJZV37nPOjCQpD5jGIqbfcblqJ3FvP/nrAfM6Yzp2k=;
        b=BDeAjkuIKtMtqzLAgv+Uw8aeCCdZJjXr4SY6NpOzS1QELI9FW9kcm4RxOJ+sro995B
         e7DAriJSXeclG0yz8H+6X33CcfByiSjtJ86Q7t3rLRV1MfVcgohdZ3JAALMP9x+QZDJv
         88w3GNYojueYchGkxve6WUyhhxb5T2KFzrwg6fn2qfZk4/g8dzbEtL2hovhMu0YAtiNP
         okpMDOXobpUkd3TH924jYcQeJz9AHkwpWkq5++kGxurcp4UQVxRVOtMoIyse/0nF/e+C
         eaSsfDRCLtPYsWHl99PObWNFCnNB/Mftz2qwnWkg1mHV8sKxH8o7KHVZEKChYU4etf+T
         09kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ocJZV37nPOjCQpD5jGIqbfcblqJ3FvP/nrAfM6Yzp2k=;
        b=fv3sS5xH70gITfiM4MD0Eaa5iaF/27feCSI6SKFSmjdQVl7fNhCmLj+vUJDOZHB32W
         Tz0u4BoORyIVFDftAyQmYqxEIA1/t1pX5FjSIobT3KJjMwyOYAAXfGSsM9I7zMQg2539
         7vm6WgjDR1GBiqOMmV9dhwaFV385BsdxzbR+oN08rO8fsblg90/cGthR8R+EQVOUHv3d
         2Hz4hWNhFYIxbrw7U8pFlh3BfC6o47W1C5T0/+aezGfsFqzH2hnGCNbd/WsbaRNILS51
         47t0gKopugsudyVZ6/udWgSq9vC8So6HsjjBjnZLfgBsnaH9E4coa5KbnYzXq812g2Jk
         AYcQ==
X-Gm-Message-State: APjAAAUjVWxUkNvC/iqV6DQPOI0suucEXLdUup/SD33PQZFZXo1Kqx49
        0EhTw4DfLr28yPQOsK2IHIzaiaMKh0A=
X-Google-Smtp-Source: APXvYqzSVY4Scs/TlaFrvHScrN3SI4TK4d/DNHMphCuM0FQXg4qZ1pHKcPGEjspJ1LhJJZzQv+2gWQ==
X-Received: by 2002:adf:9224:: with SMTP id 33mr3564952wrj.238.1566987627933;
        Wed, 28 Aug 2019 03:20:27 -0700 (PDT)
Received: from starbuck.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id k9sm2583522wrq.15.2019.08.28.03.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2019 03:20:27 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org
Subject: [PATCH RFC 1/5] clk: actually call the clock init before any other callback of the clock
Date:   Wed, 28 Aug 2019 12:20:08 +0200
Message-Id: <20190828102012.4493-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190828102012.4493-1-jbrunet@baylibre.com>
References: <20190828102012.4493-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

 __clk_init_parent() will call the .get_parent() callback of the clock
 so .init() must run before.

Fixes: 541debae0adf ("clk: call the clock init() callback before any other ops callback")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 2ba52b8dafcc..4ae25c1c1824 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3306,6 +3306,21 @@ static int __clk_core_init(struct clk_core *core)
 		goto out;
 	}
 
+	/*
+	 * optional platform-specific magic
+	 *
+	 * The .init callback is not used by any of the basic clock types, but
+	 * exists for weird hardware that must perform initialization magic.
+	 * Please consider other ways of solving initialization problems before
+	 * using this callback, as its use is discouraged.
+	 *
+	 * If it exist, this callback should called before any other callback of
+	 * the clock
+	 */
+	if (core->ops->init)
+		core->ops->init(core->hw);
+
+
 	core->parent = __clk_init_parent(core);
 
 	/*
@@ -3330,17 +3345,6 @@ static int __clk_core_init(struct clk_core *core)
 		core->orphan = true;
 	}
 
-	/*
-	 * optional platform-specific magic
-	 *
-	 * The .init callback is not used by any of the basic clock types, but
-	 * exists for weird hardware that must perform initialization magic.
-	 * Please consider other ways of solving initialization problems before
-	 * using this callback, as its use is discouraged.
-	 */
-	if (core->ops->init)
-		core->ops->init(core->hw);
-
 	/*
 	 * Set clk's accuracy.  The preferred method is to use
 	 * .recalc_accuracy. For simple clocks and lazy developers the default
-- 
2.21.0

