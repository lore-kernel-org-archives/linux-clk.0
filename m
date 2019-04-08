Return-Path: <SRS0=sViq=SK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E529C10F13
	for <linux-clk@archiver.kernel.org>; Mon,  8 Apr 2019 10:20:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3AF4D20880
	for <linux-clk@archiver.kernel.org>; Mon,  8 Apr 2019 10:20:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DywZhTaQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726212AbfDHKUz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Apr 2019 06:20:55 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46556 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726060AbfDHKUz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 Apr 2019 06:20:55 -0400
Received: by mail-wr1-f68.google.com with SMTP id t17so15622597wrw.13
        for <linux-clk@vger.kernel.org>; Mon, 08 Apr 2019 03:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8mnGAkNqcxuZE1d5o1rT7GTZ86DBLiU2npJH1dz7dSo=;
        b=DywZhTaQ+ZX7cqT81xN4buH8CasFserd6KDvdKG/o8+XYFMWVMR4VaUVPq3i24vkQW
         boUgCf3jqQTRGP7snfdkIaPyQf3jGFL7zFTFmt8mW03h5H98DukFtCInlQRjbmon0IpT
         cCq1bdnosnbzdC3HQVj9+py+dXK0et1nJw4gPDIZvgySyXHYZqsytjJitNo2WgulUr9q
         QWnPyNK6ESkbX9zrfUHLr/wfQsZ2dxr06btQ/ixUoZEmOGuLIVMvzDt8TjAn/xuxFu+d
         q98nNSzMOqqnMANit2i33EU8fSiWfHNotDuQoayHo+Kut/lAQ6zDSRzCwreKEvkunbch
         2New==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8mnGAkNqcxuZE1d5o1rT7GTZ86DBLiU2npJH1dz7dSo=;
        b=psIPOoBBml4vIxMKW465Im72Nt9TfM0ekeFibBsz860RhrnGP1svQwoOmyLG9xVO+U
         6oNWFdvXeTLQXTUJDpyQG7NmHqNj6KDsbdwAvcgbYgqYVNkYZsbqqOKd1/W9xlzwqEap
         Rk5967DccnBS2hx8D0Tb4138G94gTrp2KBLYepn+B/i6KV3NJ4LeOA7fnS2ypYvxMFH+
         kVmPSaiDU2NShBdvlLJ5Izv3k+XlgEamnQL3PJwkKFQfZs07FWtM+jebetswyibsP5cX
         S4tArT514kIpaae0l7Y+w3bw3FtjIWaD0rqITMBAW4edT0hpKe5ZzjJrbRW4M7RM+PfH
         Gu/w==
X-Gm-Message-State: APjAAAXVn/GfUdP5MPVSw9rn/lX2zyHwSJUoX9Z7vQ9GrLUrNXudRQeW
        p2dSnbmc9V8ymiPp+cph74TqD0Ml
X-Google-Smtp-Source: APXvYqw5kDHRzKsb+PuXwdGRHw4C2MsjbCzF5y22PTMSaLYmQHuGk8fBCcINMiKlb6tWmaPbtU9Cow==
X-Received: by 2002:adf:f7d0:: with SMTP id a16mr17629386wrq.94.1554718853687;
        Mon, 08 Apr 2019 03:20:53 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:9e39::64])
        by smtp.gmail.com with ESMTPSA id d6sm39336069wrx.62.2019.04.08.03.20.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Apr 2019 03:20:53 -0700 (PDT)
From:   Jonas Gorski <jonas.gorski@gmail.com>
To:     linux-clk@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc:     Anatolij Gustschin <agust@denx.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH RFC/RFT 1/6] clk: core: add support for generic big endian accesses
Date:   Mon,  8 Apr 2019 12:20:34 +0200
Message-Id: <20190408102039.6366-2-jonas.gorski@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20190408102039.6366-1-jonas.gorski@gmail.com>
References: <20190408102039.6366-1-jonas.gorski@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a generic flag to mark a clock as big endian register based, and add
accessors following these.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 drivers/clk/clk.c            |  1 +
 include/linux/clk-provider.h | 27 +++++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 96053a96fe2f..b706022bb83d 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2859,6 +2859,7 @@ static const struct {
 	ENTRY(CLK_IS_CRITICAL),
 	ENTRY(CLK_OPS_PARENT_ENABLE),
 	ENTRY(CLK_DUTY_CYCLE_PARENT),
+	ENTRY(CLK_IS_BIG_ENDIAN),
 #undef ENTRY
 };
 
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index b7cf80a71293..2c7c17652d75 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -35,6 +35,7 @@
 #define CLK_OPS_PARENT_ENABLE	BIT(12)
 /* duty cycle call may be forwarded to the parent clock */
 #define CLK_DUTY_CYCLE_PARENT	BIT(13)
+#define CLK_IS_BIG_ENDIAN	BIT(14) /* clk registers are big endian */
 
 struct clk;
 struct clk_hw;
@@ -1024,6 +1025,32 @@ static inline void clk_writel(u32 val, u32 __iomem *reg)
 
 #endif	/* platform dependent I/O accessors */
 
+static inline u32 clk_readl_be(u32 __iomem *reg)
+{
+	return ioread32be(reg);
+}
+
+static inline void clk_writel_be(u32 val, u32 __iomem *reg)
+{
+	iowrite32be(val, reg);
+}
+
+static inline u32 clk_hw_readl(struct clk_hw *clk, u32 __iomem *reg)
+{
+	if (clk_hw_get_flags(clk) & CLK_IS_BIG_ENDIAN)
+		return clk_readl_be(reg);
+	else
+		return clk_readl(reg);
+}
+
+static inline void clk_hw_writel(struct clk_hw *clk, u32 val, u32 __iomem *reg)
+{
+	if (clk_hw_get_flags(clk) & CLK_IS_BIG_ENDIAN)
+		clk_writel_be(val, reg);
+	else
+		clk_writel(val, reg);
+}
+
 void clk_gate_restore_context(struct clk_hw *hw);
 
 #endif /* CONFIG_COMMON_CLK */
-- 
2.13.2

