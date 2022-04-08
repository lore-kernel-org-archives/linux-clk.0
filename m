Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CEDDC4332F
	for <linux-clk@archiver.kernel.org>; Fri,  8 Apr 2022 13:36:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235221AbiDHNi2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Apr 2022 09:38:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235274AbiDHNi1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Apr 2022 09:38:27 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EA1B1CFF8B
        for <linux-clk@vger.kernel.org>; Fri,  8 Apr 2022 06:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1649424983; x=1680960983;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZE/cIBg2Sdnpqycyh4VnV3YYtximyDUjNsk8ktF/LLk=;
  b=LeNC1Xz6RscKYkluIfeajR7VEoJfo8871PBoKYKNCLrF5r9W3LvcyIfC
   EMEFwYG6h62jTY/ETKRvVBPSnU3KfLaxtQ45CkQGW8Z+Vc/+2HY+fqpjD
   vKZdylubDt3hEczpjO6b8l33lSNk6DtQAVGBmAoTs835JJWOJr4B6z9Kc
   q8PC1S54RCiksHjR2Orl+Gd3Uk9hju+IAaKhsKF7AVPmNdW5qs5ou0amU
   Bq7H1Mh8wGvTxNZ+Q8S3MsHAtY5RXMV9zaPb4Fwe3fSjnvWYEIucG+pix
   U1Dq9+5CO0gsIlmvEQe3hLbIPi/YmJHgBp3FejkHmtdVe9FQQGxmIGTSk
   Q==;
X-IronPort-AV: E=Sophos;i="5.90,245,1643698800"; 
   d="scan'208";a="91766885"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Apr 2022 06:36:22 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 8 Apr 2022 06:36:22 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 8 Apr 2022 06:36:20 -0700
From:   Conor Dooley <conor.dooley@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>,
        <palmer@rivosinc.com>
CC:     <daire.mcnamara@microchip.com>, <linux-clk@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>,
        Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v1 2/3] clk: microchip: mpfs: mark CLK_ATHENA as critical
Date:   Fri, 8 Apr 2022 13:35:43 +0000
Message-ID: <20220408133543.3537118-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408133543.3537118-1-conor.dooley@microchip.com>
References: <20220408133543.3537118-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

CLK_ATHENA is another fabric interconnect and should be marked as critical
as with FIC0-3, since disabling it will cause part of the fabric to go
into reset.

Fixes: 635e5e73370e ("clk: microchip: Add driver for Microchip PolarFire SoC")
Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/clk/microchip/clk-mpfs.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
index bf2fd855cc58..c82a79a5979f 100644
--- a/drivers/clk/microchip/clk-mpfs.c
+++ b/drivers/clk/microchip/clk-mpfs.c
@@ -237,8 +237,10 @@ static const struct clk_ops mpfs_periph_clk_ops = {
  *   trap handler
  * - CLK_MMUART0: reserved by the hss
  * - CLK_DDRC: provides clock to the ddr subsystem
- * - CLK_FICx: these provide clocks for sections of the fpga fabric, disabling them would
- *   cause the fabric to go into reset
+ * - CLK_FICx: these provide the processor side clocks to the "FIC" (Fabric InterConnect)
+ *   clock domain crossers which provide the interface to the FPGA fabric. Disabling them
+ *   causes the FPGA fabric to go into reset.
+ * - CLK_ATHENA: The athena clock is FIC4, which is reserved for the Athena TeraFire.
  */
 
 static struct mpfs_periph_hw_clock mpfs_periph_clks[] = {
@@ -269,7 +271,7 @@ static struct mpfs_periph_hw_clock mpfs_periph_clks[] = {
 	CLK_PERIPH(CLK_FIC1, "clk_periph_fic1", PARENT_CLK(AXI), 25, CLK_IS_CRITICAL),
 	CLK_PERIPH(CLK_FIC2, "clk_periph_fic2", PARENT_CLK(AXI), 26, CLK_IS_CRITICAL),
 	CLK_PERIPH(CLK_FIC3, "clk_periph_fic3", PARENT_CLK(AXI), 27, CLK_IS_CRITICAL),
-	CLK_PERIPH(CLK_ATHENA, "clk_periph_athena", PARENT_CLK(AXI), 28, 0),
+	CLK_PERIPH(CLK_ATHENA, "clk_periph_athena", PARENT_CLK(AXI), 28, CLK_IS_CRITICAL),
 	CLK_PERIPH(CLK_CFM, "clk_periph_cfm", PARENT_CLK(AHB), 29, 0),
 };
 
-- 
2.35.1

