Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1753C433E0
	for <linux-clk@archiver.kernel.org>; Tue, 16 Mar 2021 10:01:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 73E3064F91
	for <linux-clk@archiver.kernel.org>; Tue, 16 Mar 2021 10:01:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236209AbhCPKBY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Mar 2021 06:01:24 -0400
Received: from mo-csw-fb1116.securemx.jp ([210.130.202.175]:45816 "EHLO
        mo-csw-fb.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236180AbhCPKBQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 16 Mar 2021 06:01:16 -0400
X-Greylist: delayed 3313 seconds by postgrey-1.27 at vger.kernel.org; Tue, 16 Mar 2021 06:01:16 EDT
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1116) id 12G963mK024954; Tue, 16 Mar 2021 18:06:03 +0900
Received: by mo-csw.securemx.jp (mx-mo-csw1114) id 12G95kl0007561; Tue, 16 Mar 2021 18:05:46 +0900
X-Iguazu-Qid: 2wHHUp6aQcEREq8NFC
X-Iguazu-QSIG: v=2; s=0; t=1615885545; q=2wHHUp6aQcEREq8NFC; m=sqWN70LhMhpsOpU1ImSOegK4fCUlQj9sgY4Ee89588I=
Received: from imx12-a.toshiba.co.jp (imx12-a.toshiba.co.jp [61.202.160.135])
        by relay.securemx.jp (mx-mr1110) id 12G95jTj011931
        (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
        Tue, 16 Mar 2021 18:05:45 +0900
Received: from enc02.toshiba.co.jp (enc02.toshiba.co.jp [61.202.160.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by imx12-a.toshiba.co.jp (Postfix) with ESMTPS id ECF501000CE;
        Tue, 16 Mar 2021 18:05:44 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 12G95iLQ003783;
        Tue, 16 Mar 2021 18:05:44 +0900
From:   Punit Agrawal <punit1.agrawal@toshiba.co.jp>
To:     sboyd@kernel.org, michal.simek@xilinx.com
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Punit Agrawal <punit1.agrawal@toshiba.co.jp>
Subject: [PATCH] clk: zynqmp: Enable the driver if ZYNQMP_FIRMWARE is selected
Date:   Tue, 16 Mar 2021 18:05:40 +0900
X-TSB-HOP: ON
Message-Id: <20210316090540.973014-1-punit1.agrawal@toshiba.co.jp>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

When booting the kernel on zynqmp based platforms such as Ultra96v2,
peripheral drivers such as that for the sdcard depend on the presense
of clocks.

Enable the clock driver if it's dependencies are compiled to avoid
building an unbootable kernel.

Signed-off-by: Punit Agrawal <punit1.agrawal@toshiba.co.jp>
---
 drivers/clk/zynqmp/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/zynqmp/Kconfig b/drivers/clk/zynqmp/Kconfig
index 17086059be8b..14e4f5c55525 100644
--- a/drivers/clk/zynqmp/Kconfig
+++ b/drivers/clk/zynqmp/Kconfig
@@ -4,6 +4,7 @@ config COMMON_CLK_ZYNQMP
 	bool "Support for Xilinx ZynqMP Ultrascale+ clock controllers"
 	depends on ARCH_ZYNQMP || COMPILE_TEST
 	depends on ZYNQMP_FIRMWARE
+	default ZYNQMP_FIRMWARE
 	help
 	  Support for the Zynqmp Ultrascale clock controller.
 	  It has a dependency on the PMU firmware.
-- 
2.30.1

