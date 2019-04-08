Return-Path: <SRS0=sViq=SK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,TVD_SUBJ_WIPE_DEBT,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E9CEC10F13
	for <linux-clk@archiver.kernel.org>; Mon,  8 Apr 2019 10:21:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E307920833
	for <linux-clk@archiver.kernel.org>; Mon,  8 Apr 2019 10:21:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CvSZzgqT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726388AbfDHKVC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Apr 2019 06:21:02 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39055 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbfDHKVC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 Apr 2019 06:21:02 -0400
Received: by mail-wm1-f67.google.com with SMTP id n25so14058841wmk.4
        for <linux-clk@vger.kernel.org>; Mon, 08 Apr 2019 03:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8d4+YOFpkrO0DI3J1F6jt29ItFJWGxGJfwQOSXJrk3Y=;
        b=CvSZzgqTYVThKj0KYm2VCJHtbpg34B6q/tDBx1AJj/5ME2Gj2H5Yw5ZwIzvv3YfKYV
         /Pu4l/yo8gECqCWdYXmece7AvG/MNDk7icUgQE//bIyF8GZos+j/KDMAns8Nlq8xv0ZU
         ZdYe7gyoO1IZWNQbTAbbEdalrQHd79JIXwkkzxlbDlwbKslRwZxXNC8r/ELLtPZesIzr
         QtqZD75Df0MkE6wbLu/CSKjyOxtTYB4ouvNXRrzHc6TDlyyhTDZvaM/8mYnQDQnL8O9H
         /gcWJzl1WI5pdwXcjrv2y1ehUjqpQmhMIo4J+9qnPxA9UA1DgPPYDCmQZ5TrZo+Ix3Ow
         mgmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8d4+YOFpkrO0DI3J1F6jt29ItFJWGxGJfwQOSXJrk3Y=;
        b=K5RFhwvs2ZoWeRJL4ctR7g4N1yhuOjOoMjRbrtrRuisuTngxkyTUHwM0yWYMHEnPJP
         l7m8Stv+7wx78zIU/xiaoA++ThWVZguePl1EWHGRZLKH6wh9whQJbDOEqNfcrB0HGAcX
         D68KXa0Hq+o6NnG1QeN9wTmUzTTEFLLC+jo+wRwIgfZnMd64V3pR6QNiKJgU7ji0hw41
         V2/fJAKouE1E13XCt2gXWEwUhS8+xyH3Jjjvq0g1wzujVCATOcG0dyfH+r7YB3rmIwQQ
         NNObE+maPyY0XNqPJj39rwu4chXu+aVkBOucrBiKu2ml3cEAzNJwS+b6iaSxPacPV5T0
         VNSw==
X-Gm-Message-State: APjAAAUVzixDAGQCSdhJEtN5zRvzqIshxFEGpPGRHiIwly9eqEOp1Drr
        5oHiyPp9O3QObKJblPwpak0i3vb1
X-Google-Smtp-Source: APXvYqzzoBCdlgNEMB3F1Oldh1igkRdDt3NwP6IMwi/KUg5s8MlWW9wTLX+0gcAoVGXL97HfI+w21g==
X-Received: by 2002:a1c:b646:: with SMTP id g67mr18014054wmf.125.1554718860361;
        Mon, 08 Apr 2019 03:21:00 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:9e39::64])
        by smtp.gmail.com with ESMTPSA id d6sm39336069wrx.62.2019.04.08.03.20.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Apr 2019 03:20:59 -0700 (PDT)
From:   Jonas Gorski <jonas.gorski@gmail.com>
To:     linux-clk@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc:     Anatolij Gustschin <agust@denx.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH RFC/RFT 6/6] clk: core: remove powerpc special handling
Date:   Mon,  8 Apr 2019 12:20:39 +0200
Message-Id: <20190408102039.6366-7-jonas.gorski@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20190408102039.6366-1-jonas.gorski@gmail.com>
References: <20190408102039.6366-1-jonas.gorski@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Now that the powerpc clocks are properly marked as big endian, we can
remove the special handling for PowerPC.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 include/linux/clk-provider.h | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 2c7c17652d75..6755befb6cee 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -999,20 +999,6 @@ static inline int of_clk_detect_critical(struct device_node *np, int index,
  * for improved portability across platforms
  */
 
-#if IS_ENABLED(CONFIG_PPC)
-
-static inline u32 clk_readl(u32 __iomem *reg)
-{
-	return ioread32be(reg);
-}
-
-static inline void clk_writel(u32 val, u32 __iomem *reg)
-{
-	iowrite32be(val, reg);
-}
-
-#else	/* platform dependent I/O accessors */
-
 static inline u32 clk_readl(u32 __iomem *reg)
 {
 	return readl(reg);
@@ -1023,8 +1009,6 @@ static inline void clk_writel(u32 val, u32 __iomem *reg)
 	writel(val, reg);
 }
 
-#endif	/* platform dependent I/O accessors */
-
 static inline u32 clk_readl_be(u32 __iomem *reg)
 {
 	return ioread32be(reg);
-- 
2.13.2

