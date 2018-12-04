Return-Path: <SRS0=3Y/e=ON=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5BCEC04EBF
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 19:49:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8A61A20834
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 19:49:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="MJLJckbO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A61A20834
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725874AbeLDTtt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Dec 2018 14:49:49 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37890 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725866AbeLDTts (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Dec 2018 14:49:48 -0500
Received: by mail-lj1-f194.google.com with SMTP id c19-v6so16082304lja.5
        for <linux-clk@vger.kernel.org>; Tue, 04 Dec 2018 11:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:references:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/o6KHpko38zQTER6xvHRq4G5yD/Y25AI3XjjTxYj3I8=;
        b=MJLJckbOE/BwkB6no2+Ogvp5ZYGIUHOKgIbkiYauUESlq7UgcIyEuTCqL/BNs16OqN
         ekLUuCzqlkmFdfVXzir0rwzPKV97+z7bgbg9JdIhAVcftDadOiU8nt+YzD512ZkrTT/h
         IOcDICt9NgpZgD0Ui5pO9E1DZJc3u6TtQa9GvX8LlFRZV+bnyZ5PrM5I90+iGzE0sYJN
         mrxXXG4nWwy6DQHe8y6pJIRXh9Eu3dUxkHQQU7hDuJ1tGhbioMxNdJWXG8sm17ArJGmK
         MlNhW7H9NXAxLV5GzQ3h2N7ZJUxkVVxnBoVrpjbh4il5JQSmEN9kNG0gUFC31an9gK2N
         1w6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=/o6KHpko38zQTER6xvHRq4G5yD/Y25AI3XjjTxYj3I8=;
        b=RAfwmgjkbGFP8VbKu4uODkmCGTxnBGe5k+emhYVbGNsp/U08ey/UpNoXIl1Z9SwoWJ
         MNU3wvDfGsWydjgDZtuTq8khrD1Pvfb3fcuRZIb9WWX+uI92pG2KzSwAkS8Nt4n1pToK
         rWwHnS6sfCdFYTwciU/oNLy1yiqttfgA5xgH8koGxO3yTwrGtQz+kcIuZ1KjLen1c2QH
         YcqBeBumGdJMG3iXSRFHNEHiGP2g351+i8afOECAJqZRDqB4LMyTyW/NuUkIbhq1fRSz
         Cw99O3oPYcJ5k+t2e7ypX+ZbkpGH2C7WKHyHnU57zzRkD3zntuw8AkbHCzkWsPj5vRyx
         FKpQ==
X-Gm-Message-State: AA+aEWYNm4BwXgq363Ln0zddm3DmkcvID6B9QSjF964BzawNtvmUKQba
        FMBQpsJi4Fm4ALBooiQLuZy++23uJ9Q=
X-Google-Smtp-Source: AFSGD/WoQ7Ts7DxWCHlO5ORta/V8fiLPVGzt+oDAghXpZ/KSCn2iXJACVUqSqI0BXu83olfpzTKB7Q==
X-Received: by 2002:a2e:80d3:: with SMTP id r19-v6mr13824436ljg.151.1543952985753;
        Tue, 04 Dec 2018 11:49:45 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.84.250])
        by smtp.gmail.com with ESMTPSA id p21sm539276lfj.10.2018.12.04.11.49.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Dec 2018 11:49:45 -0800 (PST)
Subject: [PATCH v2 2/4] clk: renesas: rcar-gen3-cpg: add spinlock
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     linux-renesas-soc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
References: <cfd91d1f-3b1e-c6c4-0975-7aac09383fdf@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <eef5ee23-311a-4367-43b5-b793357f06ef@cogentembedded.com>
Date:   Tue, 4 Dec 2018 22:49:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <cfd91d1f-3b1e-c6c4-0975-7aac09383fdf@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Protect the CPG register read-modify-write sequence with a spinlock.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
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
@@ -604,5 +609,8 @@ int __init rcar_gen3_cpg_init(const stru
 	if (attr)
 		cpg_quirks = (uintptr_t)attr->data;
 	pr_debug("%s: mode = 0x%x quirks = 0x%x\n", __func__, mode, cpg_quirks);
+
+	spin_lock_init(&cpg_lock);
+
 	return 0;
 }
