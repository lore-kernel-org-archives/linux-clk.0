Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30713C433C1
	for <linux-clk@archiver.kernel.org>; Wed, 24 Mar 2021 14:38:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E301461A07
	for <linux-clk@archiver.kernel.org>; Wed, 24 Mar 2021 14:38:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236080AbhCXOhi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 24 Mar 2021 10:37:38 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:53493 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235911AbhCXOhc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 24 Mar 2021 10:37:32 -0400
Received: from linux-e202.suse.de ([46.90.46.54]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MpUlO-1m1kMt1h4W-00puZr; Wed, 24 Mar 2021 15:37:27 +0100
From:   Fabian Vogt <fabian@ritter-vogt.de>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Daniel Tang <dt.tangr@gmail.com>, linux-clk@vger.kernel.org
Subject: [PATCH] clk: clk-nspire: Use a more complete algorithm for divider calculation
Date:   Wed, 24 Mar 2021 15:37:24 +0100
Message-ID: <5001083.BWDE7HjgcL@linux-e202.suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Provags-ID: V03:K1:GN4WyBHf19Ee2938SaCqBGH5Niqtp4DYYyceLO3ykyi4/6vW2ak
 QWlqoZuA7AJTSYEzN4IMPgHd/w8rNfxuuCu9sawel7tHGQH64LKH7oKpd1FK4i0JhV95J6b
 kZkcmX3Vb7UAKzHcdq+XbHZIL0wfiu4uEKzI6RxURxAkvKS2KdFp+5K34Wj+Zr12YASDv04
 VB7RoY9z7+nWUDlZpQnQA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BZbakof12No=:9zJoGOiZAdIGLuWU07YO91
 1rG6M+00Y4bs03ymnQmXhlHXUbIQZLF4+0fYZAX4at5qU+eaMyFYgVaUuW/lBgRaWUZDjouH/
 2HG1wIP7CvDRsjt4DC4GSPNwhfxE6hjD6kqPAzEliHCOqbXRpkaIjGw7iRn5cSYBs0dcD+G6I
 0j+Klsor5dTo5Z/StFJ622kVZBnksmHUuv2S7U9dcACSlm7mMKcz60oCUlrBSgAJk/KZQJ971
 aVP907UIHiFhrNxn3hb4/wBu4QE8rYbGfhmoGQnF6pKj+XTHZYU3TaUVThUfD1tvDNa9dmg7w
 A2eNIGTifrV/Dc6owhXIg/BDmbwEkvFneBowzTosExUwN5i4AMQqomJzcTpxC4EDJie/dXu2u
 QKK7AlbaAYlI4tcTZKH86noVRGP9RpPhc4E9GL33SuE6DsjztFlaJd0OD6Qn4uVXTXeSoalPf
 3zL34lB9+nOV1e0ShvdML4pBeznESJJiEDlBCPfBd9xNMES0Aq1t
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

For some reason it implemented a mixture of the fixed base and variable
base paths. Those actually differ, which led to a division by zero in some
cases.

Signed-off-by: Fabian Vogt <fabian@ritter-vogt.de>
---
 drivers/clk/clk-nspire.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/clk-nspire.c b/drivers/clk/clk-nspire.c
index 6305058dd0d3..97bad9423960 100644
--- a/drivers/clk/clk-nspire.c
+++ b/drivers/clk/clk-nspire.c
@@ -27,7 +27,7 @@
 #define CX_BASE_SHIFT		15
 #define CX_BASE_MASK		0x3F
 
-#define CX_UNKNOWN_SHIFT	21
+#define CX_UNKNOWN_SHIFT	30
 #define CX_UNKNOWN_MASK		0x03
 
 struct nspire_clk_info {
@@ -40,13 +40,17 @@ struct nspire_clk_info {
 #define EXTRACT(var, prop) (((var)>>prop##_SHIFT) & prop##_MASK)
 static void nspire_clkinfo_cx(u32 val, struct nspire_clk_info *clk)
 {
-	if (EXTRACT(val, FIXED_BASE))
+	if (EXTRACT(val, FIXED_BASE)) {
 		clk->base_clock = 48 * MHZ;
-	else
+		clk->base_cpu_ratio = 1 << EXTRACT(val, CX_UNKNOWN);
+		clk->base_ahb_ratio = clk->base_cpu_ratio * 2;
+	} else {
 		clk->base_clock = 6 * EXTRACT(val, CX_BASE) * MHZ;
-
-	clk->base_cpu_ratio = EXTRACT(val, BASE_CPU) * EXTRACT(val, CX_UNKNOWN);
-	clk->base_ahb_ratio = clk->base_cpu_ratio * (EXTRACT(val, CPU_AHB) + 1);
+		clk->base_cpu_ratio = 2;
+		if (EXTRACT(val, BASE_CPU))
+			clk->base_cpu_ratio = EXTRACT(val, BASE_CPU) * 2;
+		clk->base_ahb_ratio = clk->base_cpu_ratio * (EXTRACT(val, CPU_AHB) + 1);
+	}
 }
 
 static void nspire_clkinfo_classic(u32 val, struct nspire_clk_info *clk)
-- 
2.25.1




