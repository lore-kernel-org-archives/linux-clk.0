Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FEC3E5EDC
	for <linux-clk@vger.kernel.org>; Wed,  6 May 2026 08:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778057049; cv=none; b=c14L2G/oKFuBcMRD/an4OVsLzrFCw5cksYRXPV64qjs16PnOSTcbTuU55sMB5H6bwH8zbfiYySV0j6kMpUlr5+fokUQzg7jupdxaFfjdKCxzIZH0iGstx8CotA+UsBQe4D1XHZcU7XPMYlMOSNwtZckoDHVsdiUBT3BNQbqRCVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778057049; c=relaxed/simple;
	bh=n1rUnxUioBDy/pkAI4pH6mkjd2iZyXulJZo7i6Vdk14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=syZ8ldXplcIgba4g1hSYCUiU3neaTXLNG9CT6K5XsUs0exTLii4i3GQuk0l3nkLNxdSFyo9KrqD/lV2wwirQpFAWJld+h89doe5FmTx+NjtORYe2yYaosUt5E817KMizLFhBTHyPAQ/aaxiDKqp7RJSjMnSOU83ao96RI5Ra7/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O3NXJSix; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NUzMiFRD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O3NXJSix";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NUzMiFRD"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6467toEr2427566
	for <linux-clk@vger.kernel.org>; Wed, 6 May 2026 08:44:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cLH74GdKMfXaeyDoctoNWjN7g6vXFsvRV92biMBblz8=; b=O3NXJSix21U2swvm
	DC2IAjhU7Z5GNO+oA5HSuJpAF81YGvYcbQF2lDOSKPlmTyTi9XBbq4y5/tppQ3vy
	DpZ+ov15AvQHK0FH7i9TPwubj140uwUqnfmr0FtYSXhgT1/PkVJ/aR/M3cwoBqSS
	sRaVneWxDrD9/eyglel4xVP0VK70J44cLm7yTZIr+bcySNArkExKxiJyj49EHwVk
	eacBPTUFyVForfvgbTO8mDSmNOUUKD2ARBBLeOKMyjgKyHqAIMasIcoknclEq0GA
	UF7fSe/wDHE8kvIsLEpF8w11vT+DPYvHvLUriVe/ntdI6/my44+A7haA7c7nhjDQ
	gx4ZgA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e01ph08m7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 08:44:06 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1309f4ee96dso5030456c88.1
        for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 01:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778057046; x=1778661846; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cLH74GdKMfXaeyDoctoNWjN7g6vXFsvRV92biMBblz8=;
        b=NUzMiFRDxjpenQooBw8xSmX1dYpgeQruqBjhlnyttOIRuvFQMZVZ39H39T8Oz1HNzN
         u9cC4P2w2Szfb6ceseDQzNmGJRcmumEZ3B3uBAzqPGkDNPqa6hi0fhngTmw9pQYGJi//
         ZbkXdSyhsJoH1hL+j8T7Q9edRQ1qZvVbH8NPs4DrNBxPmPx8xAPgota+ofhp3i0ZiO/U
         E/6H5xNplPYD/jdBCc8KPz4rziIFvIjNOKRqmYNKntbKmrPr7+1GHyIhJUFK8ExExmxv
         yTXtCy6VRVsMGHK88HmpNRoo9ZZkNV35xR0Fy2i5HJBvONiOsO7AHc1YBPEVXTmP+31B
         fZGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778057046; x=1778661846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cLH74GdKMfXaeyDoctoNWjN7g6vXFsvRV92biMBblz8=;
        b=suKjBTIhVSkDZfidFwpr7qefWK5DxAL0mYKowihG7jGn9zKibMwu4wqUc7qVa16De9
         eNQmm2xOKl8SNsTI6U1itn5Bu3xwH/Ocvmgg/oxwb+jJsRiFLugokLfZkYY7tairfJ+K
         knAcf8v92ZfBN84RmoMjcXxfIr+C+QCA760lPt4V7/B6gVA/L1IXxSOSH3yQGxnBcVR8
         WwQxLYFu+7qT8D6TUMBZ8Y02+iJPXvtXcVrSXEDxRV/dLpFEhqG96jHXa/QcOp/nlzRQ
         EBW4L9z+t6mdSuAEtNEBK/G47bq3SLqfAslus1FXG7B06cty7w7ojsqXwMrPEYoakKVt
         kr2w==
X-Forwarded-Encrypted: i=1; AFNElJ/tzKqyQWmNLaaBz6HIq3M/MfXPJis8aAWwj40saQTBoSCg558kCWTgkj6CZjEL9l59P30RusIIx1o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8o5vt+sr2tyL8mVbnjUeAhmtohXrrKsoudMDUozXdK/rdIZW/
	9YtGAwxjmtnamQAGi577wiXqH6jcfrRY+qeSYRKiIh24rSUNGsMB0ZPDlBMIhwCPHeTi60GoAKc
	eBdoOMuKLh9Jdj56HBx06nuRaCG6P4kdImHZYjMkn4xUMM8hOXDmfndXgeApQSy8=
X-Gm-Gg: AeBDieuJ/peZJLgnOeZfRYGgbNc1x58ZG1Ooe4Cnlmlze+OfRvax1vFl8u/is6hCkXe
	FGgFOtc2DyltdZc+l7/zHuvd3QZGfMl31eXBKdQCgegPPdNkTM1L1mAZq7R3QrHRqLGrhJbhLun
	wVpHhb6bPGEJLYzy94UUMKuAnYGCj0Bywb0WhA62YwndZZYpAu6kT2viGeF6DHWOAUDr77w5yFQ
	YjIVfjH8OSyGSnU1UEOjWizSO+fnrbosbUlj3mL1Atl4zGWI9jCBQAPk7d+QsagXm9OtBggujbq
	Hhilx03HfT5HqEK2xqh47bMTE+4WuPMgBs2KNJS3N1bm4Kn3yaYUX6rKee9abCwDyAUXaYR4skT
	BQ5WHKW0P7KEi7C0Rao+1Ev7OM6zf2XUm15eUQTCn+tQL2Tpv5aXECYeJFm2dYjU3uWaSH99JRp
	JnAII=
X-Received: by 2002:a05:7022:f212:b0:128:bf5f:7073 with SMTP id a92af1059eb24-1319cf55d9dmr1208113c88.24.1778057045549;
        Wed, 06 May 2026 01:44:05 -0700 (PDT)
X-Received: by 2002:a05:7022:f212:b0:128:bf5f:7073 with SMTP id a92af1059eb24-1319cf55d9dmr1208103c88.24.1778057045013;
        Wed, 06 May 2026 01:44:05 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13202fbf0efsm2257796c88.13.2026.05.06.01.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 01:44:04 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 06 May 2026 01:43:53 -0700
Subject: [PATCH v3 3/4] clk: qcom: tcsrcc-glymur: Migrate
 tcsr_pcie_N_clkref_en to clk_ref common helper
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-qref_vote_0506-v3-3-5ab71d2e6f16@oss.qualcomm.com>
References: <20260506-qref_vote_0506-v3-0-5ab71d2e6f16@oss.qualcomm.com>
In-Reply-To: <20260506-qref_vote_0506-v3-0-5ab71d2e6f16@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778057040; l=11221;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=n1rUnxUioBDy/pkAI4pH6mkjd2iZyXulJZo7i6Vdk14=;
 b=dXcBKjw/mSF/T5pz7m/q7wHjSiiNcf25vO+ylP30d81UQZIsEK7eFM9jTbeTZLU04it9f+P4m
 f8nDfMVTa3dBiFeL3kL+uOawHIYcj70TnnzU6e2Qr/pbUhFNFd2rXE9
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA4NCBTYWx0ZWRfX7gMRXYIEvqL2
 djXg+xZ09BXcaw7quxJcDitZuKJW7tGFJXZRyRX3WUVAGzbJVf3O2JFrG+nJcLWVk9vGlrv3wnC
 NWRb/HGD9Uub3+bfmOaFu8W9SSVOt2b6X9x6eJXcDmXh7QGoUGf7+IBMxj9tUC9bV13EQKcIeCC
 vhl8uN0f3ZJCFxo/L15AtJFevQ0de8W5f1MpJEuH+XYfHlQF60XSr/BhYulS1s0QzvUum5PZzWt
 gcJ22laF+/75bQBvg3wQa3ZdKfq9/R+1RLNQW9ZOrRTn380GKKlyfdIvBdKEMb/HHcEG6ZVsKuD
 ZXFLQuaVxRJ6qL+mVXBBzZpSdsKetdLIScecTfe/4utFzmJFsxQkt0WQMAFm5XJZTsgw6Eq6LSN
 ylRS8bcXbnpC9Ccy1MHu7DFsNYzv5z3tq6eWZhv3pVSK0Aq4Hy3yIiQLe8NcaRtlX2iwa0UihsL
 XFoDimWQ2WtQgaodXBA==
X-Proofpoint-GUID: quMWC-aa-XoQFncKhU059jlCBH0Clq11
X-Proofpoint-ORIG-GUID: quMWC-aa-XoQFncKhU059jlCBH0Clq11
X-Authority-Analysis: v=2.4 cv=MYhcfZ/f c=1 sm=1 tr=0 ts=69faff56 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=t2MV0Cpg_TU8-8Jkrg8A:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060084

Replace local clk_branch-based clkref definitions with descriptor-based
registration via qcom_clk_ref_probe().

This keeps the glymur driver focused on clock metadata and reuses common
runtime logic for regulator handling, enable/disable sequencing, and OF
provider wiring.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/clk/qcom/tcsrcc-glymur.c | 340 +++++++++++----------------------------
 1 file changed, 93 insertions(+), 247 deletions(-)

diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-glymur.c
index 9c0edebcdbb1..585f87b23af2 100644
--- a/drivers/clk/qcom/tcsrcc-glymur.c
+++ b/drivers/clk/qcom/tcsrcc-glymur.c
@@ -4,265 +4,115 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/clk/qcom.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,glymur-tcsr.h>
 
-#include "clk-alpha-pll.h"
-#include "clk-branch.h"
-#include "clk-pll.h"
-#include "clk-rcg.h"
-#include "clk-regmap.h"
-#include "clk-regmap-divider.h"
-#include "clk-regmap-mux.h"
-#include "common.h"
-#include "gdsc.h"
-#include "reset.h"
-
-enum {
-	DT_BI_TCXO_PAD,
-};
-
-static struct clk_branch tcsr_edp_clkref_en = {
-	.halt_reg = 0x60,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x60,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "tcsr_edp_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+static const char * const tcsr_pcie_1_regulators[] = {
+	"vdda-refgen-0p9",
+	"vdda-refgen-1p2",
+	"vdda-qrefrx5-0p9",
+	"vdda-qreftx0-0p9",
+	"vdda-qreftx0-1p2",
+};
+
+static const char * const tcsr_pcie_2_regulators[] = {
+	"vdda-refgen-0p9",
+	"vdda-refgen-1p2",
+	"vdda-qreftx1-0p9",
+	"vdda-qrefrpt0-0p9",
+	"vdda-qrefrpt1-0p9",
+	"vdda-qrefrpt2-0p9",
+	"vdda-qrefrx2-0p9",
+};
+
+static const char * const tcsr_pcie_3_regulators[] = {
+	"vdda-refgen-0p9",
+	"vdda-refgen-1p2",
+	"vdda-qreftx1-0p9",
+	"vdda-qrefrpt0-0p9",
+	"vdda-qrefrpt1-0p9",
+	"vdda-qrefrx1-0p9",
+};
+
+static const char * const tcsr_pcie_4_regulators[] = {
+	"vdda-refgen-0p9",
+	"vdda-refgen-1p2",
+	"vdda-qreftx1-0p9",
+	"vdda-qrefrpt0-0p9",
+	"vdda-qrefrpt1-0p9",
+	"vdda-qrefrpt2-0p9",
+	"vdda-qrefrx2-0p9",
+};
+
+static const struct qcom_clk_ref_desc tcsr_cc_glymur_clk_descs[] = {
+	[TCSR_EDP_CLKREF_EN] = {
+		.name = "tcsr_edp_clkref_en",
+		.offset = 0x60,
 	},
-};
-
-static struct clk_branch tcsr_pcie_1_clkref_en = {
-	.halt_reg = 0x48,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x48,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "tcsr_pcie_1_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_PCIE_1_CLKREF_EN] = {
+		.name = "tcsr_pcie_1_clkref_en",
+		.offset = 0x48,
+		.regulator_names = tcsr_pcie_1_regulators,
+		.num_regulators = ARRAY_SIZE(tcsr_pcie_1_regulators),
 	},
-};
-
-static struct clk_branch tcsr_pcie_2_clkref_en = {
-	.halt_reg = 0x4c,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x4c,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "tcsr_pcie_2_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_PCIE_2_CLKREF_EN] = {
+		.name = "tcsr_pcie_2_clkref_en",
+		.offset = 0x4c,
+		.regulator_names = tcsr_pcie_2_regulators,
+		.num_regulators = ARRAY_SIZE(tcsr_pcie_2_regulators),
 	},
-};
-
-static struct clk_branch tcsr_pcie_3_clkref_en = {
-	.halt_reg = 0x54,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x54,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "tcsr_pcie_3_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_PCIE_3_CLKREF_EN] = {
+		.name = "tcsr_pcie_3_clkref_en",
+		.offset = 0x54,
+		.regulator_names = tcsr_pcie_3_regulators,
+		.num_regulators = ARRAY_SIZE(tcsr_pcie_3_regulators),
 	},
-};
-
-static struct clk_branch tcsr_pcie_4_clkref_en = {
-	.halt_reg = 0x58,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x58,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "tcsr_pcie_4_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_PCIE_4_CLKREF_EN] = {
+		.name = "tcsr_pcie_4_clkref_en",
+		.offset = 0x58,
+		.regulator_names = tcsr_pcie_4_regulators,
+		.num_regulators = ARRAY_SIZE(tcsr_pcie_4_regulators),
 	},
-};
-
-static struct clk_branch tcsr_usb2_1_clkref_en = {
-	.halt_reg = 0x6c,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x6c,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "tcsr_usb2_1_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_USB2_1_CLKREF_EN] = {
+		.name = "tcsr_usb2_1_clkref_en",
+		.offset = 0x6c,
 	},
-};
-
-static struct clk_branch tcsr_usb2_2_clkref_en = {
-	.halt_reg = 0x70,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x70,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "tcsr_usb2_2_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_USB2_2_CLKREF_EN] = {
+		.name = "tcsr_usb2_2_clkref_en",
+		.offset = 0x70,
 	},
-};
-
-static struct clk_branch tcsr_usb2_3_clkref_en = {
-	.halt_reg = 0x74,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x74,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "tcsr_usb2_3_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_USB2_3_CLKREF_EN] = {
+		.name = "tcsr_usb2_3_clkref_en",
+		.offset = 0x74,
 	},
-};
-
-static struct clk_branch tcsr_usb2_4_clkref_en = {
-	.halt_reg = 0x88,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x88,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "tcsr_usb2_4_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_USB2_4_CLKREF_EN] = {
+		.name = "tcsr_usb2_4_clkref_en",
+		.offset = 0x88,
 	},
-};
-
-static struct clk_branch tcsr_usb3_0_clkref_en = {
-	.halt_reg = 0x64,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x64,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "tcsr_usb3_0_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_USB3_0_CLKREF_EN] = {
+		.name = "tcsr_usb3_0_clkref_en",
+		.offset = 0x64,
 	},
-};
-
-static struct clk_branch tcsr_usb3_1_clkref_en = {
-	.halt_reg = 0x68,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x68,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "tcsr_usb3_1_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_USB3_1_CLKREF_EN] = {
+		.name = "tcsr_usb3_1_clkref_en",
+		.offset = 0x68,
 	},
-};
-
-static struct clk_branch tcsr_usb4_1_clkref_en = {
-	.halt_reg = 0x44,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x44,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "tcsr_usb4_1_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_USB4_1_CLKREF_EN] = {
+		.name = "tcsr_usb4_1_clkref_en",
+		.offset = 0x44,
 	},
-};
-
-static struct clk_branch tcsr_usb4_2_clkref_en = {
-	.halt_reg = 0x5c,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x5c,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "tcsr_usb4_2_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_USB4_2_CLKREF_EN] = {
+		.name = "tcsr_usb4_2_clkref_en",
+		.offset = 0x5c,
 	},
 };
 
-static struct clk_regmap *tcsr_cc_glymur_clocks[] = {
-	[TCSR_EDP_CLKREF_EN] = &tcsr_edp_clkref_en.clkr,
-	[TCSR_PCIE_1_CLKREF_EN] = &tcsr_pcie_1_clkref_en.clkr,
-	[TCSR_PCIE_2_CLKREF_EN] = &tcsr_pcie_2_clkref_en.clkr,
-	[TCSR_PCIE_3_CLKREF_EN] = &tcsr_pcie_3_clkref_en.clkr,
-	[TCSR_PCIE_4_CLKREF_EN] = &tcsr_pcie_4_clkref_en.clkr,
-	[TCSR_USB2_1_CLKREF_EN] = &tcsr_usb2_1_clkref_en.clkr,
-	[TCSR_USB2_2_CLKREF_EN] = &tcsr_usb2_2_clkref_en.clkr,
-	[TCSR_USB2_3_CLKREF_EN] = &tcsr_usb2_3_clkref_en.clkr,
-	[TCSR_USB2_4_CLKREF_EN] = &tcsr_usb2_4_clkref_en.clkr,
-	[TCSR_USB3_0_CLKREF_EN] = &tcsr_usb3_0_clkref_en.clkr,
-	[TCSR_USB3_1_CLKREF_EN] = &tcsr_usb3_1_clkref_en.clkr,
-	[TCSR_USB4_1_CLKREF_EN] = &tcsr_usb4_1_clkref_en.clkr,
-	[TCSR_USB4_2_CLKREF_EN] = &tcsr_usb4_2_clkref_en.clkr,
-};
-
 static const struct regmap_config tcsr_cc_glymur_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -271,11 +121,12 @@ static const struct regmap_config tcsr_cc_glymur_regmap_config = {
 	.fast_io = true,
 };
 
-static const struct qcom_cc_desc tcsr_cc_glymur_desc = {
-	.config = &tcsr_cc_glymur_regmap_config,
-	.clks = tcsr_cc_glymur_clocks,
-	.num_clks = ARRAY_SIZE(tcsr_cc_glymur_clocks),
-};
+static int tcsr_cc_glymur_probe(struct platform_device *pdev)
+{
+	return qcom_clk_ref_probe(pdev, &tcsr_cc_glymur_regmap_config,
+				  tcsr_cc_glymur_clk_descs,
+				  ARRAY_SIZE(tcsr_cc_glymur_clk_descs));
+}
 
 static const struct of_device_id tcsr_cc_glymur_match_table[] = {
 	{ .compatible = "qcom,glymur-tcsr" },
@@ -283,11 +134,6 @@ static const struct of_device_id tcsr_cc_glymur_match_table[] = {
 };
 MODULE_DEVICE_TABLE(of, tcsr_cc_glymur_match_table);
 
-static int tcsr_cc_glymur_probe(struct platform_device *pdev)
-{
-	return qcom_cc_probe(pdev, &tcsr_cc_glymur_desc);
-}
-
 static struct platform_driver tcsr_cc_glymur_driver = {
 	.probe = tcsr_cc_glymur_probe,
 	.driver = {

-- 
2.34.1

