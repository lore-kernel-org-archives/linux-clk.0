Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB392DFA5A
	for <linux-clk@vger.kernel.org>; Fri,  9 Jan 2026 04:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767933271; cv=none; b=OGXFuwM5GdUfiLOGvXefRv8QPezfQ0h8YJ7R8Bg1wRDEzredyXyMvN+3ej0ZZ6XZi6xoPl0CRUX4xu5N1hXxtvq1sj7ojnif2jUXFSg0wJvrM+x0eGVaQPGwQQMNtIaNE/I4fO15s5wEyrwKUrwO13KehsxRZmODA+h5Ejyd9yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767933271; c=relaxed/simple;
	bh=2abIKdioHKuqFCVVrc2rlxdq1wJZS4xz8H+W/r0DMWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ESdMPa9DGtFAPCdptCZmCR9rNSgh8hNMXz0vtCPUhOogdRDRRpEsfvrQnntvPVV2TMJ1MDKOSho9Sv0ZMH5aGwzJpo+Xtp1A3Hn8QDXpr6lArxyaii3PHUd4FedZlAUyfeuhyCK5ZTz8nT5GINzWa9Om5jW0xQDZcF9a8JTQL0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TQ60iQqM; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TQ60iQqM"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-3eae4e590a4so2022254fac.1
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 20:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767933264; x=1768538064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VymCizJkrbUg3Dme3lvHp49OC7wgHu27DgIm2cwwCWU=;
        b=TQ60iQqMUKe2uCIohS5XyyzpfJ+dTYRvxRLDE0Xgbtx7DE3bLIQWau5OksA0C+V3rz
         es0U/abwqL98tjLiDUCCzfmYgN+wyAFt6+hzP9RuCqR6X/ChQB3+Wncu2sIJ77ZY4NXW
         JKCC4TcdFBOhmAWfrEdy8kx28MWZXVRya3E2bWeJcgCI19FfV2MUsq5H2XKLinPg1imw
         6pdKS8TiII5/3bxAPh5uYNdkYrzcHfbeePIIrOSBVaX94WTSBKA65HrK2VbgGhuhhndi
         TU7ltlw0fkpyRz0lZ6pRAkgjgC4G3Hv6b+eH+5kc0EPX8RewboN6PcJerraeuqeuZyPm
         YAkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767933264; x=1768538064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VymCizJkrbUg3Dme3lvHp49OC7wgHu27DgIm2cwwCWU=;
        b=DQApvF23QNeWfverUTICzeoPidZenZUilWg3sF6B4ysUceuYe9omkH8JIsmcFFYSXQ
         ORBf79ImnZjxxQ4ULHzH2mZFXGDpJ3yrY80kfBi8xr7LZYoM8dzOLG5xF8yeaMfaK3GH
         DpOMjR/uwnKcgAct8r57tqRBoapQfXSRiqU7XXOnxxjBsIJRpo0Oq7oG9P2JR69mlzPO
         IKCI9fPjcutu0XxCZ3SZOIc76KYuy+0qv+qlVQiX+aWP1rh2oafC4LNWjd2oUASGNoV2
         yS60RW4d8OOhUbu/hIVk2GZBW4m8vloL4CmWV0ostT+6d1zHUuJK917rUen9TB5XQjYZ
         ofRg==
X-Forwarded-Encrypted: i=1; AJvYcCXAlFxwtZcuiVuzqKFd21HZ2V7gIKW0KwlH2q6WDiWOIXsEsIk/BzZ2sE/qOME0Y/NgwLNSnMLsbQc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzkhw7Le6ORm2C0mYqNFQFZ0IvG+IjldAJo7absbFz0G0vYh2x
	3R6d/EBE6noILsd6jfdgfGcZXN3Y7kA+YW5+2zi6VpyxJ1wVBjOo78sB
X-Gm-Gg: AY/fxX4HAJ8Kr3MlmXihck3QDVvu5utUHKBwHWYtGv/0mEIwD/DR+LCQfO/mAUAj1Iv
	fgS0MUGC03hOO/j21V4cCz00foX8vr+8Bn1SFD+PAbSQ0D7FDBloOJwF0K2woD505X1/5mafrIw
	hzITHN1T3qh2zasjpiXAPgZo5fvjvjbzUZW9uSvCbNhCn6yTW7LcRwc47XxRTnW7JXkZqMzHs5M
	Zh3KmwEGf3ooeq2Kd6sIwt57dcESqtVHFzzh2W7JMpHUjFOmmK+PGk5KR+q8AyvYhKkIUiP6YV/
	+SMm/DM7uK5V3IvBwtt5okFSK9bgPsCAJWKYKKgRqxviIpFYd3/afXRVtg6mEnpVOGC72jz5JlR
	gVD9DZd+fDyK0ZOr4bIrRPB5uM0KVbYfLD7bpLwDUTOqrk8oPCVPa5lGnj+A/UnCUL9r+7WXyIB
	OIuxqVy4FcxcShAb3Iuv7YaJGgZao6NZWgI5PMdNRA53x8b06hyKTHs8j2ujv3vL7+w56dBS87q
	00PuLiKJ5jIXBDl1ecRTzWXYzesnpFpC45/ksE=
X-Google-Smtp-Source: AGHT+IGKogmUEb02ZbJlLltI7+PDxuLuhx/ja1knaw86NH00xOU50PG9fwQfnQN39e+H79FvmbOjIA==
X-Received: by 2002:a05:6871:e709:b0:3e9:35d4:213f with SMTP id 586e51a60fabf-3ffc090099amr4432615fac.10.1767933264320;
        Thu, 08 Jan 2026 20:34:24 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ffa515f4dasm6274421fac.21.2026.01.08.20.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 20:34:22 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: andersson@kernel.org,
	krzk+dt@kernel.org,
	mturquette@baylibre.com,
	linux-remoteproc@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: robh@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [PATCH v2 9/9] remoteproc: qcom_q6v5_wcss: use bulk clk API for q6 clocks in QCS404
Date: Thu,  8 Jan 2026 22:33:44 -0600
Message-ID: <20260109043352.3072933-10-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Five of the clocks on QCS404 are consistently enabled and disabled
together. Use the bulk clock API to get and enable them. They are
enabled after the Q6 reset is deasserted, implying that pre_boot is
not the appropriate designator. Store them in wcss->clks.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
Changes since v1:
 - Use wcss->clks, since wcss->q6_clks has been renamed.
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 99 ++++++++---------------------
 1 file changed, 28 insertions(+), 71 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index 2bb83e6afb6b..3c1794fde3f0 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -128,14 +128,9 @@ struct q6v5_wcss {
 	u32 halt_nc;
 
 	struct clk *xo;
-	struct clk *ahbfabric_cbcr_clk;
 	struct clk *gcc_abhs_cbcr;
 	struct clk *gcc_axim_cbcr;
-	struct clk *lcc_csr_cbcr;
 	struct clk *ahbs_cbcr;
-	struct clk *tcm_slave_cbcr;
-	struct clk *qdsp6ss_abhm_cbcr;
-	struct clk *qdsp6ss_axim_cbcr;
 	struct clk *lcc_bcr_sleep;
 	struct clk_bulk_data *clks;
 	/* clocks that must be started before the Q6 is booted */
@@ -427,35 +422,16 @@ static int q6v5_wcss_qcs404_power_on(struct q6v5_wcss *wcss)
 	/* Remove reset to the WCNSS QDSP6SS */
 	reset_control_deassert(wcss->wcss_q6_bcr_reset);
 
-	/* Enable Q6SSTOP_AHBFABRIC_CBCR clock */
-	ret = clk_prepare_enable(wcss->ahbfabric_cbcr_clk);
-	if (ret)
+	ret = clk_bulk_prepare_enable(wcss->num_clks, wcss->clks);
+	if (ret) {
+		dev_err(wcss->dev, "failed to enable q6 clocks, err=%d\n", ret);
 		goto disable_gcc_abhs_cbcr_clk;
-
-	/* Enable the LCCCSR CBC clock, Q6SSTOP_Q6SSTOP_LCC_CSR_CBCR clock */
-	ret = clk_prepare_enable(wcss->lcc_csr_cbcr);
-	if (ret)
-		goto disable_ahbfabric_cbcr_clk;
+	};
 
 	/* Enable the Q6AHBS CBC, Q6SSTOP_Q6SS_AHBS_CBCR clock */
 	ret = clk_prepare_enable(wcss->ahbs_cbcr);
 	if (ret)
-		goto disable_csr_cbcr_clk;
-
-	/* Enable the TCM slave CBC, Q6SSTOP_Q6SS_TCM_SLAVE_CBCR clock */
-	ret = clk_prepare_enable(wcss->tcm_slave_cbcr);
-	if (ret)
-		goto disable_ahbs_cbcr_clk;
-
-	/* Enable the Q6SS AHB master CBC, Q6SSTOP_Q6SS_AHBM_CBCR clock */
-	ret = clk_prepare_enable(wcss->qdsp6ss_abhm_cbcr);
-	if (ret)
-		goto disable_tcm_slave_cbcr_clk;
-
-	/* Enable the Q6SS AXI master CBC, Q6SSTOP_Q6SS_AXIM_CBCR clock */
-	ret = clk_prepare_enable(wcss->qdsp6ss_axim_cbcr);
-	if (ret)
-		goto disable_abhm_cbcr_clk;
+		goto disable_clks;
 
 	/* Enable the Q6SS XO CBC */
 	val = readl(wcss->reg_base + Q6SS_XO_CBCR);
@@ -538,17 +514,9 @@ static int q6v5_wcss_qcs404_power_on(struct q6v5_wcss *wcss)
 	val = readl(wcss->reg_base + Q6SS_XO_CBCR);
 	val &= ~Q6SS_CLK_ENABLE;
 	writel(val, wcss->reg_base + Q6SS_XO_CBCR);
-	clk_disable_unprepare(wcss->qdsp6ss_axim_cbcr);
-disable_abhm_cbcr_clk:
-	clk_disable_unprepare(wcss->qdsp6ss_abhm_cbcr);
-disable_tcm_slave_cbcr_clk:
-	clk_disable_unprepare(wcss->tcm_slave_cbcr);
-disable_ahbs_cbcr_clk:
 	clk_disable_unprepare(wcss->ahbs_cbcr);
-disable_csr_cbcr_clk:
-	clk_disable_unprepare(wcss->lcc_csr_cbcr);
-disable_ahbfabric_cbcr_clk:
-	clk_disable_unprepare(wcss->ahbfabric_cbcr_clk);
+disable_clks:
+	clk_bulk_disable_unprepare(wcss->num_clks, wcss->clks);
 disable_gcc_abhs_cbcr_clk:
 	clk_disable_unprepare(wcss->gcc_abhs_cbcr);
 
@@ -666,11 +634,7 @@ static int q6v5_qcs404_wcss_shutdown(struct q6v5_wcss *wcss)
 	val &= ~Q6SS_BHS_ON;
 	writel(val, wcss->reg_base + Q6SS_PWR_CTL_REG);
 
-	clk_disable_unprepare(wcss->ahbfabric_cbcr_clk);
-	clk_disable_unprepare(wcss->lcc_csr_cbcr);
-	clk_disable_unprepare(wcss->tcm_slave_cbcr);
-	clk_disable_unprepare(wcss->qdsp6ss_abhm_cbcr);
-	clk_disable_unprepare(wcss->qdsp6ss_axim_cbcr);
+	clk_bulk_disable_unprepare(wcss->num_clks, wcss->clks);
 
 	val = readl(wcss->reg_base + Q6SS_SLEEP_CBCR);
 	val &= ~BIT(0);
@@ -1112,6 +1076,20 @@ static int q6v5_alloc_memory_region(struct q6v5_wcss *wcss)
 
 static int q6v5_wcss_init_clock(struct q6v5_wcss *wcss)
 {
+	static const char *const bulk_clks[] = {
+		"lcc_ahbfabric_cbc", "tcsr_lcc_cbc", "lcc_tcm_slave_cbc",
+		"lcc_abhm_cbc", "lcc_axim_cbc" };
+	int ret, i;
+
+	wcss->num_clks = ARRAY_SIZE(bulk_clks);
+	wcss->clks = devm_kcalloc(wcss->dev, wcss->num_clks,
+				       sizeof(*wcss->clks), GFP_KERNEL);
+	if (!wcss->clks)
+		return -ENOMEM;
+
+	for (i = 0; i < wcss->num_clks; i++)
+		wcss->clks[i].id = bulk_clks[i];
+
 	wcss->xo = devm_clk_get(wcss->dev, "xo");
 	if (IS_ERR(wcss->xo))
 		return dev_err_probe(wcss->dev, PTR_ERR(wcss->xo),
@@ -1127,44 +1105,23 @@ static int q6v5_wcss_init_clock(struct q6v5_wcss *wcss)
 		return dev_err_probe(wcss->dev, PTR_ERR(wcss->gcc_axim_cbcr),
 				     "failed to get gcc axim clock\n");
 
-	wcss->ahbfabric_cbcr_clk = devm_clk_get(wcss->dev,
-						"lcc_ahbfabric_cbc");
-	if (IS_ERR(wcss->ahbfabric_cbcr_clk))
-		return dev_err_probe(wcss->dev, PTR_ERR(wcss->ahbfabric_cbcr_clk),
-				     "failed to get ahbfabric clock\n");
-
-	wcss->lcc_csr_cbcr = devm_clk_get(wcss->dev, "tcsr_lcc_cbc");
-	if (IS_ERR(wcss->lcc_csr_cbcr))
-		return dev_err_probe(wcss->dev, PTR_ERR(wcss->lcc_csr_cbcr),
-				     "failed to get csr cbcr clk\n");
-
 	wcss->ahbs_cbcr = devm_clk_get(wcss->dev,
 				       "lcc_abhs_cbc");
 	if (IS_ERR(wcss->ahbs_cbcr))
 		return dev_err_probe(wcss->dev, PTR_ERR(wcss->ahbs_cbcr),
 				     "failed to get ahbs_cbcr clk\n");
 
-	wcss->tcm_slave_cbcr = devm_clk_get(wcss->dev,
-					    "lcc_tcm_slave_cbc");
-	if (IS_ERR(wcss->tcm_slave_cbcr))
-		return dev_err_probe(wcss->dev, PTR_ERR(wcss->tcm_slave_cbcr),
-				     "failed to get tcm cbcr clk\n");
-
-	wcss->qdsp6ss_abhm_cbcr = devm_clk_get(wcss->dev, "lcc_abhm_cbc");
-	if (IS_ERR(wcss->qdsp6ss_abhm_cbcr))
-		return dev_err_probe(wcss->dev, PTR_ERR(wcss->qdsp6ss_abhm_cbcr),
-				     "failed to get abhm cbcr clk\n");
-
-	wcss->qdsp6ss_axim_cbcr = devm_clk_get(wcss->dev, "lcc_axim_cbc");
-	if (IS_ERR(wcss->qdsp6ss_axim_cbcr))
-		return dev_err_probe(wcss->dev, PTR_ERR(wcss->qdsp6ss_axim_cbcr),
-				     "failed to get axim cbcr clk\n");
-
 	wcss->lcc_bcr_sleep = devm_clk_get(wcss->dev, "lcc_bcr_sleep");
 	if (IS_ERR(wcss->lcc_bcr_sleep))
 		return dev_err_probe(wcss->dev, PTR_ERR(wcss->lcc_bcr_sleep),
 				     "failed to get bcr cbcr clk\n");
 
+	ret = devm_clk_bulk_get(wcss->dev, wcss->num_clks, wcss->clks);
+	if (ret < 0) {
+		return dev_err_probe(wcss->dev, ret,
+				     "failed to bulk get q6 clocks\n");
+	}
+
 	return 0;
 }
 
-- 
2.45.1

