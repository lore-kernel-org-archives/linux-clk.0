Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D8ECC71156
	for <linux-clk@archiver.kernel.org>; Mon, 30 Nov 2020 08:25:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3C32520857
	for <linux-clk@archiver.kernel.org>; Mon, 30 Nov 2020 08:25:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="lt0l2V3u"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727353AbgK3IZB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 30 Nov 2020 03:25:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727331AbgK3IZA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 30 Nov 2020 03:25:00 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DBB5C061A48
        for <linux-clk@vger.kernel.org>; Mon, 30 Nov 2020 00:23:48 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id q10so9949785pfn.0
        for <linux-clk@vger.kernel.org>; Mon, 30 Nov 2020 00:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PrCTAg81K8KnVj0cwCcOSdceG5jg9Rol6nxvrFRqC7s=;
        b=lt0l2V3uqwgrOX/KWWmPjQ+STQ7rfmcGtdnYPy8xaVV2vUWvn5MIcbKX+FU6bf1t+k
         PMSNLeIx2s56sZBrSUHmxwFvsrbBnMZsSZ53/j67DulJnCXJt/rudQYsQL1CLmKvrfBf
         n3fSLN/XHnloQImpzF4cdtzPBq/G7WYseUNFERjM3jowk60VGbfoWgFlE9lbPXmtsc2O
         AMWUKwKoePv3VqpYf+RnQU10bNnxB7pFfwVYRl6P9abGqaLj3xsToyuwNdY5KqKsBAOk
         psx71FVYVJjSG9PlNlno4QN39HRl8vIIjSrgEKW+aYZXzT2K+Mi00m/fmQl4WCEJkk3S
         Ueyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PrCTAg81K8KnVj0cwCcOSdceG5jg9Rol6nxvrFRqC7s=;
        b=fN4ZwNQNKT9Fk4sWJ9g27CFnYFISgw85DuXaP0U+allAEA6YRaYYXbD3SoPC2l6DUn
         Nh2scpqPKHG+xgmY3Tn4kdISffHJhhcjrtpn+UsQHNEyx5jk1Ae/jd3lm2NaGEKDMlG1
         5PwGR5BRcCb7sqpiGCGLGDxk0h38Ldh4lQAwCAhsO9zS9OuQ5EM2oGRsl/DqlxLV0q5g
         ujKOA0SfPTnp7ZJBJQzHZURX6k8zghvrYzXICDAdTcQzFQwgHXmut5uRqSrX1YV3kKCK
         kfobedtnxTdb5g8GFXPpGCC7nrcIhsfW0vBrClMrZT/FL3YRCUrbWA5QFCMKvbUpMtsX
         n0og==
X-Gm-Message-State: AOAM531GYGyD4XoSNcvW+ycF/UrHnQPubFSNWRbgHHonmgg0EIUMCliw
        8ztjdItd7EMQ57Sf3Oq8Zxdp5w==
X-Google-Smtp-Source: ABdhPJwm8bzingF0I/74ejGc/kgQfw750DP5StvzaRpp/51pCP7HUnslf5gGjaXL7cVJsH1YUNBv1A==
X-Received: by 2002:a62:1d4b:0:b029:18a:df98:515f with SMTP id d72-20020a621d4b0000b029018adf98515fmr18055282pfd.30.1606724627920;
        Mon, 30 Nov 2020 00:23:47 -0800 (PST)
Received: from hsinchu02.internal.sifive.com (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
        by smtp.gmail.com with ESMTPSA id u1sm21265338pjn.40.2020.11.30.00.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 00:23:47 -0800 (PST)
From:   Zong Li <zong.li@sifive.com>
To:     paul.walmsley@sifive.com, palmer@dabbelt.com, sboyd@kernel.org,
        schwab@linux-m68k.org, pragnesh.patel@openfive.com,
        aou@eecs.berkeley.edu, mturquette@baylibre.com,
        yash.shah@sifive.com, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org
Cc:     Zong Li <zong.li@sifive.com>,
        Pragnesh Patel <pragnesh.patel@sifive.com>
Subject: [PATCH v5 4/5] clk: sifive: Fix the wrong bit field shift
Date:   Mon, 30 Nov 2020 16:23:29 +0800
Message-Id: <20201130082330.77268-5-zong.li@sifive.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201130082330.77268-1-zong.li@sifive.com>
References: <20201130082330.77268-1-zong.li@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The clk enable bit should be 31 instead of 24.

Signed-off-by: Zong Li <zong.li@sifive.com>
Reported-by: Pragnesh Patel <pragnesh.patel@sifive.com>
---
 drivers/clk/sifive/sifive-prci.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sifive/sifive-prci.h b/drivers/clk/sifive/sifive-prci.h
index 7e509dfb72d1..88493f3b9edf 100644
--- a/drivers/clk/sifive/sifive-prci.h
+++ b/drivers/clk/sifive/sifive-prci.h
@@ -59,7 +59,7 @@
 
 /* DDRPLLCFG1 */
 #define PRCI_DDRPLLCFG1_OFFSET		0x10
-#define PRCI_DDRPLLCFG1_CKE_SHIFT	24
+#define PRCI_DDRPLLCFG1_CKE_SHIFT	31
 #define PRCI_DDRPLLCFG1_CKE_MASK	(0x1 << PRCI_DDRPLLCFG1_CKE_SHIFT)
 
 /* GEMGXLPLLCFG0 */
@@ -81,7 +81,7 @@
 
 /* GEMGXLPLLCFG1 */
 #define PRCI_GEMGXLPLLCFG1_OFFSET	0x20
-#define PRCI_GEMGXLPLLCFG1_CKE_SHIFT	24
+#define PRCI_GEMGXLPLLCFG1_CKE_SHIFT	31
 #define PRCI_GEMGXLPLLCFG1_CKE_MASK	(0x1 << PRCI_GEMGXLPLLCFG1_CKE_SHIFT)
 
 /* CORECLKSEL */
-- 
2.29.2

