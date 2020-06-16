Return-Path: <SRS0=U6aT=75=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E335BC433E0
	for <linux-clk@archiver.kernel.org>; Tue, 16 Jun 2020 20:24:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B459B2078D
	for <linux-clk@archiver.kernel.org>; Tue, 16 Jun 2020 20:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592339062;
	bh=f0CYZfAZ2s1wrAZbRRwKWczpWjC2SMPXg5adaVXXyE8=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=VWG92vqiWThis26Dm98KISlJ0V7GVQawJiKctfup4rOxp4yBObc91hDmQug7PgRFI
	 FHzWXTKLq3JUtwNqoL2w9ztApWQ3JFjs6In8joyKvHpuDfyFvrseKAYcPhfueeCyCM
	 on4xwZxdvsknFMbCeL85Fqnw+bIMzLI687/LCdKc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726856AbgFPUYW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Jun 2020 16:24:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:34376 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726428AbgFPUYW (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 16 Jun 2020 16:24:22 -0400
Received: from localhost.localdomain (cpe-70-114-128-244.austin.res.rr.com [70.114.128.244])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 476482078D;
        Tue, 16 Jun 2020 20:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592339062;
        bh=f0CYZfAZ2s1wrAZbRRwKWczpWjC2SMPXg5adaVXXyE8=;
        h=From:To:Cc:Subject:Date:From;
        b=yetVL13XCxbItEOy3Zqhd0JHAxVDzLn8wYC4acq79axyXzez3XPhTta6AquZmyny5
         ea4aKRUfpoqsihfOVK4o3zSQ76iTlY3Bc6OYqRRG42cp2mu6l5IwmoJJlNiRO161Hu
         CmeYfFT/PVRJtn+nUAuR2r4jyrGMIfm+7P/OcUgw=
From:   Dinh Nguyen <dinguyen@kernel.org>
To:     linux-clk@vger.kernel.org
Cc:     dinguyen@kernel.org, devicetree@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org
Subject: [PATCH 1/3] dt-bindings: agilex: add NAND_X_CLK and NAND_ECC_CLK
Date:   Tue, 16 Jun 2020 15:24:15 -0500
Message-Id: <20200616202417.14376-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the NAND_X_CLK and NAND_ECC_CLK clocks.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 include/dt-bindings/clock/agilex-clock.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/agilex-clock.h b/include/dt-bindings/clock/agilex-clock.h
index f19cf8ccbdd2..06feca07e08e 100644
--- a/include/dt-bindings/clock/agilex-clock.h
+++ b/include/dt-bindings/clock/agilex-clock.h
@@ -65,6 +65,8 @@
 #define AGILEX_SDMMC_CLK		50
 #define AGILEX_SPI_M_CLK		51
 #define AGILEX_USB_CLK			52
-#define AGILEX_NUM_CLKS			53
+#define AGILEX_NAND_X_CLK		53
+#define AGILEX_NAND_ECC_CLK		54
+#define AGILEX_NUM_CLKS			55
 
 #endif	/* __AGILEX_CLOCK_H */
-- 
2.17.1

