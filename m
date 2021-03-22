Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05421C433E0
	for <linux-clk@archiver.kernel.org>; Mon, 22 Mar 2021 06:19:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CAAC661966
	for <linux-clk@archiver.kernel.org>; Mon, 22 Mar 2021 06:19:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229866AbhCVGSx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 22 Mar 2021 02:18:53 -0400
Received: from mo-csw1116.securemx.jp ([210.130.202.158]:48582 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbhCVGS3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 Mar 2021 02:18:29 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1116) id 12M6IFKJ010189; Mon, 22 Mar 2021 15:18:16 +0900
X-Iguazu-Qid: 2wGqzdbCYyb0oDGf3N
X-Iguazu-QSIG: v=2; s=0; t=1616393895; q=2wGqzdbCYyb0oDGf3N; m=jyZtgONCN7l+24XMZvGJIiB7KnOHl2PGc6s4LE7ecD4=
Received: from imx12-a.toshiba.co.jp (imx12-a.toshiba.co.jp [61.202.160.135])
        by relay.securemx.jp (mx-mr1110) id 12M6IE9v016866
        (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
        Mon, 22 Mar 2021 15:18:15 +0900
Received: from enc02.toshiba.co.jp (enc02.toshiba.co.jp [61.202.160.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by imx12-a.toshiba.co.jp (Postfix) with ESMTPS id C5A0D10007E;
        Mon, 22 Mar 2021 15:18:14 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 12M6IEIZ004009;
        Mon, 22 Mar 2021 15:18:14 +0900
From:   Punit Agrawal <punit1.agrawal@toshiba.co.jp>
To:     michal.simek@xilinx.com
Cc:     Punit Agrawal <punit1.agrawal@toshiba.co.jp>, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/2] clk: zynqmp: Drop dependency on ARCH_ZYNQMP
Date:   Mon, 22 Mar 2021 15:17:54 +0900
X-TSB-HOP: ON
Message-Id: <20210322061754.1065367-3-punit1.agrawal@toshiba.co.jp>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210322061754.1065367-1-punit1.agrawal@toshiba.co.jp>
References: <20210322061754.1065367-1-punit1.agrawal@toshiba.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The clock driver depends on ZYNQMP_FIRMWARE which in turn depends on
ARCH_ZYNQMP. Simplify the Kconfig by dropping the redundant dependency
on ARCH_ZYNQMP as it'll be applied transitively via ZYNQMP_FIRMWARE.

Signed-off-by: Punit Agrawal <punit1.agrawal@toshiba.co.jp>
---
 drivers/clk/zynqmp/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/zynqmp/Kconfig b/drivers/clk/zynqmp/Kconfig
index 14e4f5c55525..00df6be25c5d 100644
--- a/drivers/clk/zynqmp/Kconfig
+++ b/drivers/clk/zynqmp/Kconfig
@@ -2,8 +2,7 @@
 
 config COMMON_CLK_ZYNQMP
 	bool "Support for Xilinx ZynqMP Ultrascale+ clock controllers"
-	depends on ARCH_ZYNQMP || COMPILE_TEST
-	depends on ZYNQMP_FIRMWARE
+	depends on ZYNQMP_FIRMWARE || COMPILE_TEST
 	default ZYNQMP_FIRMWARE
 	help
 	  Support for the Zynqmp Ultrascale clock controller.
-- 
2.30.1

