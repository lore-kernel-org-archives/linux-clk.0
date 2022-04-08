Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 804FBC433F5
	for <linux-clk@archiver.kernel.org>; Fri,  8 Apr 2022 13:36:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236306AbiDHNiZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Apr 2022 09:38:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236291AbiDHNiY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Apr 2022 09:38:24 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9343B1CABD8
        for <linux-clk@vger.kernel.org>; Fri,  8 Apr 2022 06:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1649424981; x=1680960981;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GzivDmB0lx1bGzeLeC0FKo+NMwuup2XVOjx0DuzkeMA=;
  b=j9YVT7pXGNq8vp7HMeUDReDz57Gs90LRP6hQTuE9N3MKVFQrx7romvfH
   5VHp7YAomLXXzSXK1fk6J2GyPZfDJpVxDv7lN7TTO+3Jyzl4oeGePF62d
   I+Knf7EtGRFlIq0kUNK2ghy8PQcBn9JBKhQUaWeMC+Rk/vCXb3rr+t6bT
   mRzaX35nKOMdBKPnjXLv8JkQzov1BQvWoA7McpkZj/qcOsp77MJwXm7QZ
   FUaM+Qtla2gk9kQzExMqG18OpJOoNO6Kcw98jja4ZvEe/nwgqim3M4P+5
   N3iAfipXWRxt05eeh7RcuPplRremGzEnVpTToqQYzrXCjLZbjqfRZR+0e
   g==;
X-IronPort-AV: E=Sophos;i="5.90,245,1643698800"; 
   d="scan'208";a="159438664"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Apr 2022 06:36:21 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 8 Apr 2022 06:36:19 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 8 Apr 2022 06:36:17 -0700
From:   Conor Dooley <conor.dooley@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>,
        <palmer@rivosinc.com>
CC:     <daire.mcnamara@microchip.com>, <linux-clk@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>,
        Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v1 1/3] clk: microchip: mpfs: fix parents for FIC clocks
Date:   Fri, 8 Apr 2022 13:35:42 +0000
Message-ID: <20220408133543.3537118-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408133543.3537118-1-conor.dooley@microchip.com>
References: <20220408133543.3537118-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The fabric interconnects are on the AXI bus not AHB.
Update their parent clocks to fix this.

Fixes: 635e5e73370e ("clk: microchip: Add driver for Microchip PolarFire SoC")
Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/clk/microchip/clk-mpfs.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
index 4ddc7e7c9766..bf2fd855cc58 100644
--- a/drivers/clk/microchip/clk-mpfs.c
+++ b/drivers/clk/microchip/clk-mpfs.c
@@ -265,11 +265,11 @@ static struct mpfs_periph_hw_clock mpfs_periph_clks[] = {
 	CLK_PERIPH(CLK_GPIO1, "clk_periph_gpio1", PARENT_CLK(AHB), 21, 0),
 	CLK_PERIPH(CLK_GPIO2, "clk_periph_gpio2", PARENT_CLK(AHB), 22, 0),
 	CLK_PERIPH(CLK_DDRC, "clk_periph_ddrc", PARENT_CLK(AHB), 23, CLK_IS_CRITICAL),
-	CLK_PERIPH(CLK_FIC0, "clk_periph_fic0", PARENT_CLK(AHB), 24, CLK_IS_CRITICAL),
-	CLK_PERIPH(CLK_FIC1, "clk_periph_fic1", PARENT_CLK(AHB), 25, CLK_IS_CRITICAL),
-	CLK_PERIPH(CLK_FIC2, "clk_periph_fic2", PARENT_CLK(AHB), 26, CLK_IS_CRITICAL),
-	CLK_PERIPH(CLK_FIC3, "clk_periph_fic3", PARENT_CLK(AHB), 27, CLK_IS_CRITICAL),
-	CLK_PERIPH(CLK_ATHENA, "clk_periph_athena", PARENT_CLK(AHB), 28, 0),
+	CLK_PERIPH(CLK_FIC0, "clk_periph_fic0", PARENT_CLK(AXI), 24, CLK_IS_CRITICAL),
+	CLK_PERIPH(CLK_FIC1, "clk_periph_fic1", PARENT_CLK(AXI), 25, CLK_IS_CRITICAL),
+	CLK_PERIPH(CLK_FIC2, "clk_periph_fic2", PARENT_CLK(AXI), 26, CLK_IS_CRITICAL),
+	CLK_PERIPH(CLK_FIC3, "clk_periph_fic3", PARENT_CLK(AXI), 27, CLK_IS_CRITICAL),
+	CLK_PERIPH(CLK_ATHENA, "clk_periph_athena", PARENT_CLK(AXI), 28, 0),
 	CLK_PERIPH(CLK_CFM, "clk_periph_cfm", PARENT_CLK(AHB), 29, 0),
 };
 
-- 
2.35.1

