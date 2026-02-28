Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057EB2FBDE0
	for <linux-clk@vger.kernel.org>; Sat, 28 Feb 2026 20:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772311654; cv=none; b=FtEM0KZjZINJzefMobGTmM00jickhzKipAWHOcke4Ox6VSMRXWllv+BTBTzt0uvJczBI9EQXMiVcgVw6Nak8cN9ElxUZLePlBqWGO/WBDG34q1EDve6kPcjIRfMoJzRIpkLzbPmVaJLwe1QbGAzF1CXZKG5/cOxq8w+m5oUsSGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772311654; c=relaxed/simple;
	bh=n6Kysv3y+Bh7w5m/Mx9pi9ekuHYd4YNBA/XVZLCnfd8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V8HQNHFn3/Zd2UqDaZSgeIoSKYeTtF4neYYaePGjd5udwNIzSkdKbznDzIJuex8HIMnH3qlQ0ln3rvOAF1G1kKZM/YxGN34//PBDeHtTN22YiTc1Mv2lVnhWFNKXJXOlXte/gcIBxN0cZIBDLTchB//vahn/+2TAuZsy1j4QmnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=SDl2zt+6; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="SDl2zt+6"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1772311651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VsrcVA9q15mmQyK3nCK8woc/QzSwfJr7l6sf3pEqHBk=;
	b=SDl2zt+6Ys7QxNZD+Kix0iZMkrhi38ST8yPZ6XM07Z7Q2QvfHO23W09XvLIO0H0/oE4oOp
	gFaSDfSThWUbCkA3IJm9voIoCtRg82EOABmGUr4IltRjj7iVaVLbfguxjLKvVe44yxUlo3
	bo+VWXADJ0TPo6eY6/txXIIh85zO+eH0mjHxB82WfxKwwT77yCpnD/uDh0WwZr5qzAdlFn
	VcwshOgTlsIfoDsmcHaMWLo/SB6Hne9FACWt91D/aQ+KHNhZbMgZhvY53qhWRfQB3tjwQb
	IVfWv0owP14AYqhY70HGR7N/2/7QQqOyfhDcROipgDB7ndIyg+EPUxVjYbDWSg==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Adam Skladowski <a39.skl@gmail.com>
Cc: Val Packett <val@packett.cool>,
	linux-arm-msm@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 3/6] clk: qcom: dispcc-sm6115: Add missing MDSS resets
Date: Sat, 28 Feb 2026 17:41:29 -0300
Message-ID: <20260228204638.11705-4-val@packett.cool>
In-Reply-To: <20260228204638.11705-1-val@packett.cool>
References: <20260228204638.11705-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The MDSS resets were left undescribed. Add them to allow resetting the
display subsystem, which is necessary to avoid issues caused by state
left over from the bootloader on various platforms.

Fixes: 9b518788631c ("clk: qcom: Add display clock controller driver for SM6115")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/clk/qcom/dispcc-sm6115.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/qcom/dispcc-sm6115.c b/drivers/clk/qcom/dispcc-sm6115.c
index 8ae25d51db94..75bd57213079 100644
--- a/drivers/clk/qcom/dispcc-sm6115.c
+++ b/drivers/clk/qcom/dispcc-sm6115.c
@@ -22,6 +22,7 @@
 #include "clk-regmap-divider.h"
 #include "common.h"
 #include "gdsc.h"
+#include "reset.h"
 
 enum {
 	DT_BI_TCXO,
@@ -511,6 +512,10 @@ static struct clk_branch disp_cc_sleep_clk = {
 	},
 };
 
+static const struct qcom_reset_map disp_cc_sm6115_resets[] = {
+	[DISP_CC_MDSS_CORE_BCR] = { 0x2000 },
+};
+
 static struct gdsc mdss_gdsc = {
 	.gdscr = 0x3000,
 	.pd = {
@@ -561,6 +566,8 @@ static const struct qcom_cc_desc disp_cc_sm6115_desc = {
 	.config = &disp_cc_sm6115_regmap_config,
 	.clks = disp_cc_sm6115_clocks,
 	.num_clks = ARRAY_SIZE(disp_cc_sm6115_clocks),
+	.resets = disp_cc_sm6115_resets,
+	.num_resets = ARRAY_SIZE(disp_cc_sm6115_resets),
 	.gdscs = disp_cc_sm6115_gdscs,
 	.num_gdscs = ARRAY_SIZE(disp_cc_sm6115_gdscs),
 };
-- 
2.52.0

