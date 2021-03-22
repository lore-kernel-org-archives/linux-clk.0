Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD77DC433C1
	for <linux-clk@archiver.kernel.org>; Mon, 22 Mar 2021 06:19:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8560961966
	for <linux-clk@archiver.kernel.org>; Mon, 22 Mar 2021 06:19:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbhCVGSw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 22 Mar 2021 02:18:52 -0400
Received: from mo-csw1515.securemx.jp ([210.130.202.154]:60544 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbhCVGSX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 Mar 2021 02:18:23 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1515) id 12M6IAP9031998; Mon, 22 Mar 2021 15:18:10 +0900
X-Iguazu-Qid: 34tMbaYFC39EyMje7v
X-Iguazu-QSIG: v=2; s=0; t=1616393890; q=34tMbaYFC39EyMje7v; m=PjKeQH+BVzJOYo8llJ6tR3NWiVLi7YmTZJAU0PPX3t0=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
        by relay.securemx.jp (mx-mr1510) id 12M6I97T024828
        (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
        Mon, 22 Mar 2021 15:18:09 +0900
Received: from enc01.toshiba.co.jp (enc01.toshiba.co.jp [106.186.93.100])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by imx2-a.toshiba.co.jp (Postfix) with ESMTPS id C8BBA1000B9;
        Mon, 22 Mar 2021 15:18:09 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
        by enc01.toshiba.co.jp  with ESMTP id 12M6I9fH022508;
        Mon, 22 Mar 2021 15:18:09 +0900
From:   Punit Agrawal <punit1.agrawal@toshiba.co.jp>
To:     michal.simek@xilinx.com
Cc:     Punit Agrawal <punit1.agrawal@toshiba.co.jp>, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/2] clk: zynqmp: Enable the driver if ZYNQMP_FIRMWARE is selected
Date:   Mon, 22 Mar 2021 15:17:53 +0900
X-TSB-HOP: ON
Message-Id: <20210322061754.1065367-2-punit1.agrawal@toshiba.co.jp>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210322061754.1065367-1-punit1.agrawal@toshiba.co.jp>
References: <20210322061754.1065367-1-punit1.agrawal@toshiba.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

When booting the kernel on zynqmp based platforms such as Ultra96v2,
peripheral drivers such as that for the sdcard depend on the presence
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

