Return-Path: <SRS0=WJeD=SU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D35FEC10F0E
	for <linux-clk@archiver.kernel.org>; Thu, 18 Apr 2019 11:12:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A6381214DA
	for <linux-clk@archiver.kernel.org>; Thu, 18 Apr 2019 11:12:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nh5HIHVL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388757AbfDRLMZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Apr 2019 07:12:25 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:33718 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388375AbfDRLMZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 Apr 2019 07:12:25 -0400
Received: by mail-wm1-f68.google.com with SMTP id z6so6701073wmi.0;
        Thu, 18 Apr 2019 04:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7rH6QiINrW20jZKJQ9mHqe+acRM5fOnj0AeCibP7tdo=;
        b=nh5HIHVL+iaMdKswN/1VECmDUAsvHer42OH6xA6YeVOt3d002kWpK+8tVEU4/in2sy
         5dKDBE0cey7kqrFDpfMO9f2GNGGciWLsaXPzGG5fpfNXIV46BQuprg2U/dfRr+SaKvKG
         2yJHHGxOHyPy63rbRNTvLcc9MPEgztaTgQAV2YL2xDVvDy7ObSO056yCjBo1aXfpBuvg
         BjEcCn3yfXbhUT76eTLUj9z4tvQlF6gSLkKfR1JH6sUbmEfBLB9FrL5wOeT5Ct/o1ITQ
         2mdgTcHGVqAQEdNoOPkWSmDTYz9HZ/rTiZ0sZ3NTGb93M2Qo5auH+q/CRrbv707/QE+t
         +46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7rH6QiINrW20jZKJQ9mHqe+acRM5fOnj0AeCibP7tdo=;
        b=Qf/vPDI9SQeFZx79MR9O2LI9IWz6Aaq6oSWodd4atOQ2Ingaf8fvonIYSZYdWkspaS
         D8RS1lyxLoNW29L3Oss+Zb3xIgUoqBeuM0Q7FvJmQW1ubLr2gA7f7zV6gVbOjXqKALqZ
         uYiOegveJBKIFXrrDJcVVEfVjp2q4AxGkY+Q3mDhtAtyTm4IDSXkk2Usp2QJTue6oNAq
         sDWBW3hwn72V7b1hNnLNbp0RXA9//SsCWcCn8SeMZES1nsoGQU5b51UbaxaYa1xc39+l
         CJOJR6j5rQpB3ITzIjSHUCzMTCwWNllPgCQQ043t+Mb+1SnqQxLfEvI95a6G81shUpPO
         fTNA==
X-Gm-Message-State: APjAAAUyGjJIQ4pJlJoNcBzAFwX8Oxu52Q0C1bp6B5AUor5Z6uoR0v0j
        +LlS8nj+eQYWtJ055CLNzWaSsVL6Ppg=
X-Google-Smtp-Source: APXvYqyqtoymM85mY8yDZvpZvH8yQ3m231qFQRM7gMJHvVMU6OFaUJjhJvrdys5NJLtR6ZDHgzO3fw==
X-Received: by 2002:a1c:43c2:: with SMTP id q185mr2724953wma.53.1555585943326;
        Thu, 18 Apr 2019 04:12:23 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:9e39::64])
        by smtp.gmail.com with ESMTPSA id z63sm2005594wme.30.2019.04.18.04.12.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Apr 2019 04:12:22 -0700 (PDT)
From:   Jonas Gorski <jonas.gorski@gmail.com>
To:     linux-clk@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org
Cc:     Anatolij Gustschin <agust@denx.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH RFT V3 6/8] powerpc/512x: mark clocks as big endian
Date:   Thu, 18 Apr 2019 13:12:09 +0200
Message-Id: <20190418111211.10474-7-jonas.gorski@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20190418111211.10474-1-jonas.gorski@gmail.com>
References: <20190418111211.10474-1-jonas.gorski@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

These clocks' registers are accessed as big endian, so mark them as
such.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
V2 -> V3:
 * slightly rework to avoid a line >80 chars
V1 -> V2:
 * switch from global to local flags

 arch/powerpc/platforms/512x/clock-commonclk.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/512x/clock-commonclk.c b/arch/powerpc/platforms/512x/clock-commonclk.c
index b3097fe6441b..af265ae40a61 100644
--- a/arch/powerpc/platforms/512x/clock-commonclk.c
+++ b/arch/powerpc/platforms/512x/clock-commonclk.c
@@ -239,6 +239,7 @@ static inline struct clk *mpc512x_clk_divider(
 	const char *name, const char *parent_name, u8 clkflags,
 	u32 __iomem *reg, u8 pos, u8 len, int divflags)
 {
+	divflags |= CLK_DIVIDER_BIG_ENDIAN;
 	return clk_register_divider(NULL, name, parent_name, clkflags,
 				    reg, pos, len, divflags, &clklock);
 }
@@ -250,7 +251,7 @@ static inline struct clk *mpc512x_clk_divtable(
 {
 	u8 divflags;
 
-	divflags = 0;
+	divflags = CLK_DIVIDER_BIG_ENDIAN;
 	return clk_register_divider_table(NULL, name, parent_name, 0,
 					  reg, pos, len, divflags,
 					  divtab, &clklock);
@@ -261,10 +262,12 @@ static inline struct clk *mpc512x_clk_gated(
 	u32 __iomem *reg, u8 pos)
 {
 	int clkflags;
+	u8 gateflags;
 
 	clkflags = CLK_SET_RATE_PARENT;
+	gateflags = CLK_GATE_BIG_ENDIAN;
 	return clk_register_gate(NULL, name, parent_name, clkflags,
-				 reg, pos, 0, &clklock);
+				 reg, pos, gateflags, &clklock);
 }
 
 static inline struct clk *mpc512x_clk_muxed(const char *name,
@@ -275,7 +278,7 @@ static inline struct clk *mpc512x_clk_muxed(const char *name,
 	u8 muxflags;
 
 	clkflags = CLK_SET_RATE_PARENT;
-	muxflags = 0;
+	muxflags = CLK_MUX_BIG_ENDIAN;
 	return clk_register_mux(NULL, name,
 				parent_names, parent_count, clkflags,
 				reg, pos, len, muxflags, &clklock);
-- 
2.13.2

