Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8D09C07548
	for <linux-clk@archiver.kernel.org>; Wed, 13 Jan 2021 18:39:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A8B2B207A3
	for <linux-clk@archiver.kernel.org>; Wed, 13 Jan 2021 18:39:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728625AbhAMSjp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Jan 2021 13:39:45 -0500
Received: from relay02.th.seeweb.it ([5.144.164.163]:53453 "EHLO
        relay02.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728512AbhAMSjp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 13 Jan 2021 13:39:45 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 6E7CD2007D;
        Wed, 13 Jan 2021 19:38:21 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     agross@kernel.org
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH v2 7/9] clk: qcom: gdsc: Implement NO_RET_PERIPH flag
Date:   Wed, 13 Jan 2021 19:38:15 +0100
Message-Id: <20210113183817.447866-8-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210113183817.447866-1-angelogioacchino.delregno@somainline.org>
References: <20210113183817.447866-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In some rare occasions, we want to only set the RETAIN_MEM bit, but
not the RETAIN_PERIPH one: this is seen on at least SDM630/636/660's
GPU-GX GDSC, where unsetting and setting back the RETAIN_PERIPH bit
will generate chaos and panics during GPU suspend time (mainly, the
chaos is unaligned access).

For this reason, introduce a new NO_RET_PERIPH flag to the GDSC
driver to address this corner case.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/clk/qcom/gdsc.c | 10 ++++++++--
 drivers/clk/qcom/gdsc.h |  3 ++-
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index af26e0695b86..51ed640e527b 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -183,7 +183,10 @@ static inline int gdsc_assert_reset(struct gdsc *sc)
 static inline void gdsc_force_mem_on(struct gdsc *sc)
 {
 	int i;
-	u32 mask = RETAIN_MEM | RETAIN_PERIPH;
+	u32 mask = RETAIN_MEM;
+
+	if (!(sc->flags & NO_RET_PERIPH))
+		mask |= RETAIN_PERIPH;
 
 	for (i = 0; i < sc->cxc_count; i++)
 		regmap_update_bits(sc->regmap, sc->cxcs[i], mask, mask);
@@ -192,7 +195,10 @@ static inline void gdsc_force_mem_on(struct gdsc *sc)
 static inline void gdsc_clear_mem_on(struct gdsc *sc)
 {
 	int i;
-	u32 mask = RETAIN_MEM | RETAIN_PERIPH;
+	u32 mask = RETAIN_MEM;
+
+	if (!(sc->flags & NO_RET_PERIPH))
+		mask |= RETAIN_PERIPH;
 
 	for (i = 0; i < sc->cxc_count; i++)
 		regmap_update_bits(sc->regmap, sc->cxcs[i], mask, 0);
diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
index bd537438c793..5bb396b344d1 100644
--- a/drivers/clk/qcom/gdsc.h
+++ b/drivers/clk/qcom/gdsc.h
@@ -42,7 +42,7 @@ struct gdsc {
 #define PWRSTS_ON		BIT(2)
 #define PWRSTS_OFF_ON		(PWRSTS_OFF | PWRSTS_ON)
 #define PWRSTS_RET_ON		(PWRSTS_RET | PWRSTS_ON)
-	const u8			flags;
+	const u16			flags;
 #define VOTABLE		BIT(0)
 #define CLAMP_IO	BIT(1)
 #define HW_CTRL		BIT(2)
@@ -51,6 +51,7 @@ struct gdsc {
 #define POLL_CFG_GDSCR	BIT(5)
 #define ALWAYS_ON	BIT(6)
 #define RETAIN_FF_ENABLE	BIT(7)
+#define NO_RET_PERIPH	BIT(8)
 	struct reset_controller_dev	*rcdev;
 	unsigned int			*resets;
 	unsigned int			reset_count;
-- 
2.29.2

