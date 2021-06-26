Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2700C49EB7
	for <linux-clk@archiver.kernel.org>; Sat, 26 Jun 2021 06:18:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9FA9461954
	for <linux-clk@archiver.kernel.org>; Sat, 26 Jun 2021 06:18:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbhFZGVO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 26 Jun 2021 02:21:14 -0400
Received: from out28-123.mail.aliyun.com ([115.124.28.123]:38643 "EHLO
        out28-123.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbhFZGVN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 26 Jun 2021 02:21:13 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.2150873|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0085278-0.000800631-0.990672;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047192;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.KYGAXY7_1624688322;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KYGAXY7_1624688322)
          by smtp.aliyun-inc.com(10.147.41.143);
          Sat, 26 Jun 2021 14:18:48 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        sboyd@kernel.org, paul@crapouillou.net, robh+dt@kernel.org
Cc:     linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com
Subject: [PATCH v4 1/5] MIPS: X1830: Respect cell count of common properties.
Date:   Sat, 26 Jun 2021 14:18:37 +0800
Message-Id: <1624688321-69131-2-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1624688321-69131-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1624688321-69131-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

If N fields of X cells should be provided, then that's what the
devicetree should represent, instead of having one single field of
(N * X) cells.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
Acked-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v1->v2:
    No change.
    
    v2->v3:
    No change.
    
    v3->v4:
    No change.

 arch/mips/boot/dts/ingenic/x1830.dtsi | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/mips/boot/dts/ingenic/x1830.dtsi b/arch/mips/boot/dts/ingenic/x1830.dtsi
index b21c930..59ca3a8 100644
--- a/arch/mips/boot/dts/ingenic/x1830.dtsi
+++ b/arch/mips/boot/dts/ingenic/x1830.dtsi
@@ -97,9 +97,9 @@
 
 		#clock-cells = <1>;
 
-		clocks = <&cgu X1830_CLK_RTCLK
-			  &cgu X1830_CLK_EXCLK
-			  &cgu X1830_CLK_PCLK>;
+		clocks = <&cgu X1830_CLK_RTCLK>,
+			 <&cgu X1830_CLK_EXCLK>,
+			 <&cgu X1830_CLK_PCLK>;
 		clock-names = "rtc", "ext", "pclk";
 
 		interrupt-controller;
@@ -274,8 +274,7 @@
 
 	pdma: dma-controller@13420000 {
 		compatible = "ingenic,x1830-dma";
-		reg = <0x13420000 0x400
-			   0x13421000 0x40>;
+		reg = <0x13420000 0x400>, <0x13421000 0x40>;
 		#dma-cells = <2>;
 
 		interrupt-parent = <&intc>;
-- 
2.7.4

