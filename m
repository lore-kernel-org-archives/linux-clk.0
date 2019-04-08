Return-Path: <SRS0=sViq=SK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5172EC10F13
	for <linux-clk@archiver.kernel.org>; Mon,  8 Apr 2019 10:21:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 22C7420833
	for <linux-clk@archiver.kernel.org>; Mon,  8 Apr 2019 10:21:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rBKVd9DP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726060AbfDHKVA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Apr 2019 06:21:00 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53556 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbfDHKVA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 Apr 2019 06:21:00 -0400
Received: by mail-wm1-f65.google.com with SMTP id q16so13681743wmj.3
        for <linux-clk@vger.kernel.org>; Mon, 08 Apr 2019 03:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=AefBW/AvMar/umpkSgBRCO6SDsmqV5F3Ia9cimceqxI=;
        b=rBKVd9DPN9C+GpT4mA+99KIovJ/1lf/0okwLnzSckfuq9z+AlsO3MVB80fkDjmZfyp
         18yWGCqSSFJZpykilQm/w+KHTVOYmtOefiKgFUgS8pUf7Fze69TT3Up0HqrTOX5cq9f7
         j63WmBuk6Zw8bIlkIc4Nz4JNiSRS30SNfeHKdW37JH41FbowYzPfVmkUvqjCk4BUdzzC
         pi3Cmhqwg4gt5Q4eh6qTsDLjb5fQqtwuCz88sEjREWSJ6dzC+ROhvPo0UGOar5EcwKZT
         bxlHYp/n76TDy6XpwOwyJMOXKwSz9NgyHzj49odmJt2LD35JjJuMQZoVuZ61Rue4rc4l
         w+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=AefBW/AvMar/umpkSgBRCO6SDsmqV5F3Ia9cimceqxI=;
        b=i9l5XdvQVo0pEt4rXJSCQOAcHJMW3jtYtWplokVMPbVqT04h64RVhP+3rkoKu2Cc94
         C2ujZlIH0NzxyD1aE7WxO/Q57P9xayx8L2n0knk3NY2a3hA3uf5sx8fWoyjtB24IAVad
         MdwMmhBzhmuNDGOsyP4FehaOfrfwdaHIiUo4GzQsjXIodzg+xROfsc7atgjrPZt8l91s
         FNL0qh+yMq5MpBdUO8688NlsncVDLCfRnVquFfUBdBzwWwwsrUSa/j1qjeT/nRiesPTE
         lfkNkfrBbtLYpebsPeL2p0DTw4liS8ueoMp1tzFbJMGfW9FRojcrjuxqmtMsVxbJ6zxE
         LGLA==
X-Gm-Message-State: APjAAAXo5rlNKu2CPP6me5Ml8xlhTVaZFEA2+jo+Mp3clypIgSNe5McJ
        zr+BD8LPKehsnNUP2jXR8SDb01HY
X-Google-Smtp-Source: APXvYqyV30JZzAhFnNQyJv71EJs1kxMjta4LpfNnB+rvTsETu8FlIbM5jEnyxcRN8oeWMEaWfdqT2A==
X-Received: by 2002:a1c:be0e:: with SMTP id o14mr15950501wmf.11.1554718858833;
        Mon, 08 Apr 2019 03:20:58 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:9e39::64])
        by smtp.gmail.com with ESMTPSA id d6sm39336069wrx.62.2019.04.08.03.20.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Apr 2019 03:20:58 -0700 (PDT)
From:   Jonas Gorski <jonas.gorski@gmail.com>
To:     linux-clk@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc:     Anatolij Gustschin <agust@denx.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH RFC/RFT 5/6] powerpc/512x: mark clocks as big endian
Date:   Mon,  8 Apr 2019 12:20:38 +0200
Message-Id: <20190408102039.6366-6-jonas.gorski@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20190408102039.6366-1-jonas.gorski@gmail.com>
References: <20190408102039.6366-1-jonas.gorski@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

These clocks' registers are accessed as big endian, so mark them as
such.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 arch/powerpc/platforms/512x/clock-commonclk.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/512x/clock-commonclk.c b/arch/powerpc/platforms/512x/clock-commonclk.c
index b3097fe6441b..af86a65128f1 100644
--- a/arch/powerpc/platforms/512x/clock-commonclk.c
+++ b/arch/powerpc/platforms/512x/clock-commonclk.c
@@ -239,8 +239,9 @@ static inline struct clk *mpc512x_clk_divider(
 	const char *name, const char *parent_name, u8 clkflags,
 	u32 __iomem *reg, u8 pos, u8 len, int divflags)
 {
-	return clk_register_divider(NULL, name, parent_name, clkflags,
-				    reg, pos, len, divflags, &clklock);
+	return clk_register_divider(NULL, name, parent_name,
+				    clkflags | CLK_IS_BIG_ENDIAN, reg, pos, len,
+				    divflags, &clklock);
 }
 
 static inline struct clk *mpc512x_clk_divtable(
@@ -248,10 +249,12 @@ static inline struct clk *mpc512x_clk_divtable(
 	u32 __iomem *reg, u8 pos, u8 len,
 	const struct clk_div_table *divtab)
 {
+	int clkflags;
 	u8 divflags;
 
+	clkflags = CLK_IS_BIG_ENDIAN;
 	divflags = 0;
-	return clk_register_divider_table(NULL, name, parent_name, 0,
+	return clk_register_divider_table(NULL, name, parent_name, clkflags,
 					  reg, pos, len, divflags,
 					  divtab, &clklock);
 }
@@ -262,7 +265,7 @@ static inline struct clk *mpc512x_clk_gated(
 {
 	int clkflags;
 
-	clkflags = CLK_SET_RATE_PARENT;
+	clkflags = CLK_SET_RATE_PARENT | CLK_IS_BIG_ENDIAN;
 	return clk_register_gate(NULL, name, parent_name, clkflags,
 				 reg, pos, 0, &clklock);
 }
@@ -274,7 +277,7 @@ static inline struct clk *mpc512x_clk_muxed(const char *name,
 	int clkflags;
 	u8 muxflags;
 
-	clkflags = CLK_SET_RATE_PARENT;
+	clkflags = CLK_SET_RATE_PARENT | CLK_IS_BIG_ENDIAN;
 	muxflags = 0;
 	return clk_register_mux(NULL, name,
 				parent_names, parent_count, clkflags,
-- 
2.13.2

