Return-Path: <SRS0=Mnuj=P6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B727CC282C3
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 19:58:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 83A2521726
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 19:58:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="n9KghBzW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726035AbfAVT6p (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Jan 2019 14:58:45 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:41354 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726009AbfAVT6o (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Jan 2019 14:58:44 -0500
Received: by mail-lf1-f67.google.com with SMTP id c16so19013367lfj.8
        for <linux-clk@vger.kernel.org>; Tue, 22 Jan 2019 11:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:references:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WPaa9s6qqwjVhXcdKFVgWx7xVGXgDKS5Jm7FG/EZ3tA=;
        b=n9KghBzWI8PTppkBzsmCk5CHdK/bybGvtVxBBWFhVF8zyuLj91Uu7192wL+Kj4ls/G
         yNVYt+PxxK9oIxfe8GR6+PvgXCXfDATyn6e92Ja3T9QDVSNg2dpb7eD8OnrHGV0zNz9A
         YqA6v66IOoW3g8zxCRHXCuRsVid2VJr7O5sUc1qpweS12SDY5rBw8ya0LHOsWnlHjlzM
         lzZE490f4jmbtddb7cnL62EgqwdBwuIlfZl/BF/FC/dXWO4XUGA6R1DzNhbVah5dAF+e
         EIahuKWTfka7Rq2DxPLZW08YqrhunmyEVtsHJ3x9Hw0tBTuZZI45WxHQ0I0sQQdgBzDq
         Ndkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=WPaa9s6qqwjVhXcdKFVgWx7xVGXgDKS5Jm7FG/EZ3tA=;
        b=qKgCV23woKJk5hZKzBudXXEo4t25dOBpOi/iaKdfyI4PGkpXCWrK5fkQDfAKe4GXRH
         P+fxQnQVs3f1yeG5X2D0Hm4B1RbBwkVVOan4GAp6S0YDLSvzoJKCYipYJ8PxAdaS4wvO
         YLqX6NKQzBLnNCE3NuiiaR0BsYWuUkJg1wnROHi0X+sV8DulsE9FJ+qiFuEaIUfoorw/
         biVVIirJg+4NUZa6KFKdVdtPY4UlROO5OZ+Lm7Ed3F/E1UaxPzxZAl4ptJjulvUlbxVK
         RCOSKciwX8J9znBIl7VRSXJRk6z9rQT+foHoB2exBYzUxOb7d+WT92jXZ8l/grW5fuIP
         6dfQ==
X-Gm-Message-State: AJcUukdHF0p59wymeJ3Lqs8yDow9ATd+EohGzGt8+Dh4aMDloC9SZTL3
        1MUZ9TJN6zOpwNzTLEexrtiv1T4/2qw=
X-Google-Smtp-Source: ALg8bN7AQg4mcsSp/aQ3IEoygBAGBVYQMebZirolhKa6Zq82rtuGtv4Bf+VpW1N007yuzukgNs5HbA==
X-Received: by 2002:a19:8f45:: with SMTP id r66mr23186965lfd.9.1548187120506;
        Tue, 22 Jan 2019 11:58:40 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.82.69])
        by smtp.gmail.com with ESMTPSA id m13-v6sm147515ljg.56.2019.01.22.11.58.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Jan 2019 11:58:39 -0800 (PST)
Subject: [PATCH v3 2/4] clk: renesas: rcar-gen3-cpg: add spinlock
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     linux-renesas-soc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
References: <f1c53dd5-2dc5-9f11-44e3-8e222ed21903@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <8a630f60-c5a1-de98-f80a-40404199d8bd@cogentembedded.com>
Date:   Tue, 22 Jan 2019 22:58:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <f1c53dd5-2dc5-9f11-44e3-8e222ed21903@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Protect the CPG register read-modify-write sequence with a spinlock.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

---
Changes in version 3:
- refreshed the patch;
- added Geert's tag.

Changes in version 2:
- new patch.

 drivers/clk/renesas/rcar-gen3-cpg.c |    8 ++++++++
 1 file changed, 8 insertions(+)

Index: renesas-drivers/drivers/clk/renesas/rcar-gen3-cpg.c
===================================================================
--- renesas-drivers.orig/drivers/clk/renesas/rcar-gen3-cpg.c
+++ renesas-drivers/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -30,14 +30,19 @@
 
 #define CPG_RCKCR_CKSEL	BIT(15)	/* RCLK Clock Source Select */
 
+static spinlock_t cpg_lock;
+
 static void cpg_reg_modify(void __iomem *reg, u32 clear, u32 set)
 {
+	unsigned long flags;
 	u32 val;
 
+	spin_lock_irqsave(&cpg_lock, flags);
 	val = readl(reg);
 	val &= ~clear;
 	val |= set;
 	writel(val, reg);
+	spin_unlock_irqrestore(&cpg_lock, flags);
 };
 
 struct cpg_simple_notifier {
@@ -615,5 +620,8 @@ int __init rcar_gen3_cpg_init(const stru
 	if (attr)
 		cpg_quirks = (uintptr_t)attr->data;
 	pr_debug("%s: mode = 0x%x quirks = 0x%x\n", __func__, mode, cpg_quirks);
+
+	spin_lock_init(&cpg_lock);
+
 	return 0;
 }

