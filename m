Return-Path: <SRS0=NIgS=TN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB1D3C04AA7
	for <linux-clk@archiver.kernel.org>; Mon, 13 May 2019 21:31:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 980F120873
	for <linux-clk@archiver.kernel.org>; Mon, 13 May 2019 21:31:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="RqsxKwF0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbfEMVbC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 May 2019 17:31:02 -0400
Received: from mail-it1-f193.google.com ([209.85.166.193]:36030 "EHLO
        mail-it1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbfEMVbC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 May 2019 17:31:02 -0400
Received: by mail-it1-f193.google.com with SMTP id e184so1492336ite.1
        for <linux-clk@vger.kernel.org>; Mon, 13 May 2019 14:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nG/cg6n0i3VSt9q4OWPy6u/pN1SDfSXSymhq0fKGvbU=;
        b=RqsxKwF0KdojF4QODMrB/rU9fsaiNOfClSr+OIrD9umBxWYtvs7bbsk4AGpRC9NijC
         C9lQXaYeGa6z3m+wsbaPl5o5Gp9+JCzAVFkrDufA9vHZBERuo13JsVUaq3ikN8YL3F0w
         M177eKIdp2P06S3dsMJfMYLd2JyotZSvmdCwEdzqGkSOb5tZvOw9hzy4kW0+BejB1bVu
         JncY3m5gfPZ/LrsrpY0PIrH0vvVid6Oo0ssEVPtlobht1O+TpXR1ddrTwrkUQtTJgLLg
         ZnOsfdGJY0QB2LtjLyjGjAvUIPhHt3xKigszby+2nhnlg9IOEjKn1I47ngMnmbieGJbd
         X6Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nG/cg6n0i3VSt9q4OWPy6u/pN1SDfSXSymhq0fKGvbU=;
        b=c+vwCyIByGqfLD5IvQvpYDB2hv5FUXkDaZu2WFUtXygz2ojUbEkC/mrZYUpnii8+Nv
         3TiP/udskOfPQVYNz48bND9dcnSvRGfVt7f5XbH62BmNBXkKlLMWybXw/UGNVVHVqVte
         iKSxQTRoCQjg6FM8SHbKMzxrEgrNybQYWTcrtogRRrySGXoKveKpWnQLDvozHLB8bzmy
         Gq1nTGJmMWck1V3cxFLKB4Ozw0CiakxDPGTa5pLWEpggkwvQRoglvID90mDDG5D7flKh
         v7G6AuG7CyHbu43/T40dQy+OetMPqqgjbYqyZ9rxtymCF0JY4RPFzKJTU4RrioklCSGu
         YNsA==
X-Gm-Message-State: APjAAAVobUQ0UMm4stmbD2i/Fkqa2V8q9oe0Kx7O+yN4ePuBSnTJvkyr
        JDucyZDZtHmn8ptsP7NWIF3+eg==
X-Google-Smtp-Source: APXvYqwk7m0Q/MrpP8+eiR066EdhYUGK5GRiDbH6KYzeur6dRFebxEN9XETfcxzRVeqe5EtcWgllUg==
X-Received: by 2002:a24:b713:: with SMTP id h19mr959141itf.73.1557783060343;
        Mon, 13 May 2019 14:31:00 -0700 (PDT)
Received: from viisi.lan (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
        by smtp.gmail.com with ESMTPSA id 26sm1332438iog.59.2019.05.13.14.30.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 14:30:59 -0700 (PDT)
From:   Paul Walmsley <paul.walmsley@sifive.com>
To:     sboyd@kernel.org, mturquette@baylibre.com, pavel@ucw.cz
Cc:     linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-clk@vger.kernel.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Paul Walmsley <paul@pwsan.com>
Subject: [PATCH v2] clk: sifive: restrict Kconfig scope for the FU540 PRCI driver
Date:   Mon, 13 May 2019 14:30:04 -0700
Message-Id: <20190513213001.23956-1-paul.walmsley@sifive.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Restrict Kconfig scope for SiFive clock and reset IP block drivers
such that they won't appear on most configurations that are unlikely
to support them.  This is based on a suggestion from Pavel Machek
<pavel@ucw.cz>.  Ideally this should be dependent on
CONFIG_ARCH_SIFIVE, but since that Kconfig directive does not yet
exist, add dependencies on RISCV or COMPILE_TEST for now.

Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Signed-off-by: Paul Walmsley <paul@pwsan.com>
Reported-by: Pavel Machek <pavel@ucw.cz>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
---
This second version incorporates non-functional changes requested
by Stephen Boyd <sboyd@kernel.org>.

 drivers/clk/sifive/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/sifive/Kconfig b/drivers/clk/sifive/Kconfig
index 8db4a3eb4782..f3b4eb9cb0f5 100644
--- a/drivers/clk/sifive/Kconfig
+++ b/drivers/clk/sifive/Kconfig
@@ -2,6 +2,7 @@
 
 menuconfig CLK_SIFIVE
 	bool "SiFive SoC driver support"
+	depends on RISCV || COMPILE_TEST
 	help
 	  SoC drivers for SiFive Linux-capable SoCs.
 
-- 
2.20.1

