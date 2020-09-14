Return-Path: <SRS0=A1Rx=CX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAEA9C43461
	for <linux-clk@archiver.kernel.org>; Mon, 14 Sep 2020 09:04:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5915C221F0
	for <linux-clk@archiver.kernel.org>; Mon, 14 Sep 2020 09:04:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Cu9Qjn1Q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726233AbgINJEk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Sep 2020 05:04:40 -0400
Received: from www.zeus03.de ([194.117.254.33]:58420 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726314AbgINJEh (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 14 Sep 2020 05:04:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=gT6dzQDQFHBO+trWW/9fBSfs90F
        LTVRCkxN9+03/YRs=; b=Cu9Qjn1Q/IwPdBjnCj2IFudVpjgoNBqikyBaylRWR9k
        lgy3sSPQMxJXJp7S7SNWi6zeOH7mwzghGZt6wx/yPJNVab69Sm4/BpbGTQd42Rvg
        uePW3d5xNrpt6PeyZVVvyk/1vcNAa8IGAcucecQKJqM61068dX8FP8q87XN8490k
        =
Received: (qmail 1800978 invoked from network); 14 Sep 2020 11:04:35 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Sep 2020 11:04:35 +0200
X-UD-Smtp-Session: l3s3148p1@CYXOUkKvruEgAwDPXwXYAPlEQEA0NVnc
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH] clk: renesas: rcar-gen3: remove stp_ck handling for SDHI
Date:   Mon, 14 Sep 2020 11:04:26 +0200
Message-Id: <20200914090426.16022-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

There is no case (and none forseen) where we would need to disable the
SDn clock. So, for simplicity, remove its handling.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

One paradigm is to stay minimal and remove unneeded things. Another one
is to not change working code unnecessarily. I favor the first one a bit
more, but would understand arguing with the second one.

Despite that, tested on a Renesas Salvator-XS (M3-N) with eMMC and two
kinds of SD cards. Checksumming large files works at expected speeds.

 drivers/clk/renesas/rcar-gen3-cpg.c | 51 ++++++++++++++---------------
 1 file changed, 25 insertions(+), 26 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 488f8b3980c5..a7debddf7d09 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -224,10 +224,9 @@ static struct clk * __init cpg_z_clk_register(const char *name,
 #define CPG_SD_STP_MASK		(CPG_SD_STP_HCK | CPG_SD_STP_CK)
 #define CPG_SD_FC_MASK		(0x7 << 2 | 0x3 << 0)
 
-#define CPG_SD_DIV_TABLE_DATA(stp_hck, stp_ck, sd_srcfc, sd_fc, sd_div) \
+#define CPG_SD_DIV_TABLE_DATA(stp_hck, sd_srcfc, sd_fc, sd_div) \
 { \
 	.val = ((stp_hck) ? CPG_SD_STP_HCK : 0) | \
-	       ((stp_ck) ? CPG_SD_STP_CK : 0) | \
 	       ((sd_srcfc) << 2) | \
 	       ((sd_fc) << 0), \
 	.div = (sd_div), \
@@ -247,36 +246,36 @@ struct sd_clock {
 };
 
 /* SDn divider
- *                     sd_srcfc   sd_fc   div
- * stp_hck   stp_ck    (div)      (div)     = sd_srcfc x sd_fc
- *-------------------------------------------------------------------
- *  0         0         0 (1)      1 (4)      4 : SDR104 / HS200 / HS400 (8 TAP)
- *  0         0         1 (2)      1 (4)      8 : SDR50
- *  1         0         2 (4)      1 (4)     16 : HS / SDR25
- *  1         0         3 (8)      1 (4)     32 : NS / SDR12
- *  1         0         4 (16)     1 (4)     64
- *  0         0         0 (1)      0 (2)      2
- *  0         0         1 (2)      0 (2)      4 : SDR104 / HS200 / HS400 (4 TAP)
- *  1         0         2 (4)      0 (2)      8
- *  1         0         3 (8)      0 (2)     16
- *  1         0         4 (16)     0 (2)     32
+ *           sd_srcfc   sd_fc   div
+ * stp_hck   (div)      (div)     = sd_srcfc x sd_fc
+ *---------------------------------------------------------
+ *  0         0 (1)      1 (4)      4 : SDR104 / HS200 / HS400 (8 TAP)
+ *  0         1 (2)      1 (4)      8 : SDR50
+ *  1         2 (4)      1 (4)     16 : HS / SDR25
+ *  1         3 (8)      1 (4)     32 : NS / SDR12
+ *  1         4 (16)     1 (4)     64
+ *  0         0 (1)      0 (2)      2
+ *  0         1 (2)      0 (2)      4 : SDR104 / HS200 / HS400 (4 TAP)
+ *  1         2 (4)      0 (2)      8
+ *  1         3 (8)      0 (2)     16
+ *  1         4 (16)     0 (2)     32
  *
  *  NOTE: There is a quirk option to ignore the first row of the dividers
  *  table when searching for suitable settings. This is because HS400 on
  *  early ES versions of H3 and M3-W requires a specific setting to work.
  */
 static const struct sd_div_table cpg_sd_div_table[] = {
-/*	CPG_SD_DIV_TABLE_DATA(stp_hck,  stp_ck,   sd_srcfc,   sd_fc,  sd_div) */
-	CPG_SD_DIV_TABLE_DATA(0,        0,        0,          1,        4),
-	CPG_SD_DIV_TABLE_DATA(0,        0,        1,          1,        8),
-	CPG_SD_DIV_TABLE_DATA(1,        0,        2,          1,       16),
-	CPG_SD_DIV_TABLE_DATA(1,        0,        3,          1,       32),
-	CPG_SD_DIV_TABLE_DATA(1,        0,        4,          1,       64),
-	CPG_SD_DIV_TABLE_DATA(0,        0,        0,          0,        2),
-	CPG_SD_DIV_TABLE_DATA(0,        0,        1,          0,        4),
-	CPG_SD_DIV_TABLE_DATA(1,        0,        2,          0,        8),
-	CPG_SD_DIV_TABLE_DATA(1,        0,        3,          0,       16),
-	CPG_SD_DIV_TABLE_DATA(1,        0,        4,          0,       32),
+/*	CPG_SD_DIV_TABLE_DATA(stp_hck,  sd_srcfc,   sd_fc,  sd_div) */
+	CPG_SD_DIV_TABLE_DATA(0,        0,          1,        4),
+	CPG_SD_DIV_TABLE_DATA(0,        1,          1,        8),
+	CPG_SD_DIV_TABLE_DATA(1,        2,          1,       16),
+	CPG_SD_DIV_TABLE_DATA(1,        3,          1,       32),
+	CPG_SD_DIV_TABLE_DATA(1,        4,          1,       64),
+	CPG_SD_DIV_TABLE_DATA(0,        0,          0,        2),
+	CPG_SD_DIV_TABLE_DATA(0,        1,          0,        4),
+	CPG_SD_DIV_TABLE_DATA(1,        2,          0,        8),
+	CPG_SD_DIV_TABLE_DATA(1,        3,          0,       16),
+	CPG_SD_DIV_TABLE_DATA(1,        4,          0,       32),
 };
 
 #define to_sd_clock(_hw) container_of(_hw, struct sd_clock, hw)
-- 
2.20.1

