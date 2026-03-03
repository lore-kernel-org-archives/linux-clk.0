Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CB337DE89
	for <linux-clk@vger.kernel.org>; Tue,  3 Mar 2026 03:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772509772; cv=none; b=utGO/7U5FIWqZEKDlhUv4c2DSEmHg1fFZa4TaQCEe1JGh/uhf0HtvVlSdph1LXR4V43SWx20fCTYafkdWMpktIeDFyuVMQMSgaof57qkClBGv6m6OCoizXCaL9ewzMIIeHYWL2OJv39zUhfysCkvBC/4h1XFRolJZptNAQIbWEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772509772; c=relaxed/simple;
	bh=sIMzmBRl7F2254Xp2z1eNy5UC3Yxqw+c8cCYSyVdArc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kTgvzPevujsICXvQ+9T4iCNd+MC+dHinO65x3VpbpFNDN7byAh4OsLyv+WJb0jQDHi0qXl72DMqp7VBl7ndA2HYKExsY2c3yWDDGc5muw73InFvUtYCBwEkSGxpUrc+30cYyEj/P0sXVaQJtmpU8TY01vnGFwtxKN/NW8SKd9NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=Xb5DXXQy; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="Xb5DXXQy"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1772509769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TSkgsnsf+FgtWgqbbfEStI+11ELiu+OKexgV71tabUQ=;
	b=Xb5DXXQyd1+XElR/7rxWQv+ccJQQ1BMmvMKBlhBz45yfMwkuiT0vaxrrRUaD8r2yEXrdIp
	8K7sbLuZia3E4Wonc00U5nt3RarjzH9H9i1M2nWYH3T9PNuViN2HDwmzNlfSzls9cF9aIg
	ZqApnBeSiozZixSmJ4NBNKrBPVZc+4JT++Al4W/p7zlmkfuJnGikLc071cHQpmtTZALYY6
	gdQU4rC+++7lWPn+pEqroEpboC5RCps+hHNZbNImvbVmIAePiE29Y3cYzYMGlJ2IMonCMi
	DdmPVZ6IAOeV7zYK0+gOshSG9C3uL+RrzPlFMJ9Dxv9uktZbjSxoBmN0sEaMBg==
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
Subject: [PATCH v3 3/6] clk: qcom: dispcc-sm6115: Add missing MDSS resets
Date: Tue,  3 Mar 2026 00:41:22 -0300
Message-ID: <20260303034847.13870-4-val@packett.cool>
In-Reply-To: <20260303034847.13870-1-val@packett.cool>
References: <20260303034847.13870-1-val@packett.cool>
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

