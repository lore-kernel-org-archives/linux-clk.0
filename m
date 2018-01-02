Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from outils.crapouillou.net ([89.234.176.41]:57108 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753428AbeABPJJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 2 Jan 2018 10:09:09 -0500
From: Paul Cercueil <paul@crapouillou.net>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Maarten ter Huurne <maarten@treewalker.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@linux-mips.org, linux-clk@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v5 09/15] MIPS: platform: add machtype IDs for more Ingenic SoCs
Date: Tue,  2 Jan 2018 16:08:42 +0100
Message-Id: <20180102150848.11314-9-paul@crapouillou.net>
In-Reply-To: <20180102150848.11314-1-paul@crapouillou.net>
References: <20180102150848.11314-1-paul@crapouillou.net>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Add a machtype ID for the JZ4780 SoC, which was missing, and one for the
newly supported JZ4770 SoC.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/include/asm/bootinfo.h | 2 ++
 1 file changed, 2 insertions(+)

 v2: No change
 v3: No change
 v5: No change

diff --git a/arch/mips/include/asm/bootinfo.h b/arch/mips/include/asm/bootinfo.h
index e26a093bb17a..a301a8f4bc66 100644
--- a/arch/mips/include/asm/bootinfo.h
+++ b/arch/mips/include/asm/bootinfo.h
@@ -79,6 +79,8 @@ enum loongson_machine_type {
  */
 #define  MACH_INGENIC_JZ4730	0	/* JZ4730 SOC		*/
 #define  MACH_INGENIC_JZ4740	1	/* JZ4740 SOC		*/
+#define  MACH_INGENIC_JZ4770	2	/* JZ4770 SOC		*/
+#define  MACH_INGENIC_JZ4780	3	/* JZ4780 SOC		*/
 
 extern char *system_type;
 const char *get_system_type(void);
-- 
2.11.0

