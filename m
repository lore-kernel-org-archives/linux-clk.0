Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCAD390CAB
	for <linux-clk@vger.kernel.org>; Thu,  6 Aug 2026 05:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785994509; cv=none; b=IoamPYQcdpLGNOHXd8RL6XfGnalHvD3YfatKzFH8BVhyZ7X09Z83ys+DhK9ExaZLGKbtU/GqYwEQ8vZTmxMsPVaMJ+rBuYVq325oy7TeeEiwuz8bAvG22fdnwMpA9FwhoszDyhVZHixFh0yblSI1amL4NK28pUAFIaPREnFkm5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785994509; c=relaxed/simple;
	bh=ihdFPILNani3Ibkuu+huHpL8xJf5HkOPsUpioh5t6jk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JRCREFOFfliToqVai7gP3AB4ghlmAxM8D8rv5x33fTxwgM0rBhish62GqEBvOmnGUKvZHJLUmZERsDA0Nd7eFVs+7wS6etTlooKo5ZqokU6IMG9xFab5A+l2L/zLk2zjYLGmYhGfAqs2XlfKPwPp+MFiTZkFqf8V4caJSBEedjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OUYO7qw0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C47symXR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OUYO7qw0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C47symXR"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6763xXwi1074792
	for <linux-clk@vger.kernel.org>; Thu, 6 Aug 2026 05:35:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Eq9O/ZH/lB+RqlHtKACGCAmmelni54lJd8E5ukY2rx8=; b=OUYO7qw0WAU15UXa
	MWxAM0mJrZ/5kpvi8mV+KNpL0HaRwfSi90c2H5oT2xQxcGqw4CxfGF6dTmSkZ8IA
	5WOzuWLnDzLEqSZFEAlt0H96DJlsIXclxr4EIsCQhGVAhsGe3K/CSDtpO5cgG+Ly
	zN1hPBOyjTwtg+cjEmuEaNQ8g/uoJ9UDyQn/rUZZ5bx8O1CEPhVoFDF+M8Alr96o
	0FcpnzgEqvKFW91qMxN8gdyPE30EN3rphK1nKOdRcq/WbdPNEjkmUnWpLY1nv0a8
	o1JjGQo+i6rGtonVnhI4j3PR1JQtgYo3ZNmctyvByDzTYXrocCM3Gh7iUlNXao4l
	m2YOoA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjucgadq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 06 Aug 2026 05:35:05 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cea6a46766so31948205ad.0
        for <linux-clk@vger.kernel.org>; Wed, 05 Aug 2026 22:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785994505; x=1786599305; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Eq9O/ZH/lB+RqlHtKACGCAmmelni54lJd8E5ukY2rx8=;
        b=C47symXREox5NXEcJsPSrA/artEhNecSuHLjLllwFzYKPjb3VXE4RoSaiDMnXJKdWg
         7Xzz24lDe6yq/Tgt6biXdpyVobWO6WIKLfI+uXMaq1wHRBRpYSgDjXJtfV0A/BL3A+iu
         JadTTFxMKTzVcqzXEAwTV2Ls3W1smqUa6zcNXPhgSD0KHA8h7mnIjNSbZLbIvMvjIR6V
         UIwX2QdbPVmJ/81XDcU6IgTZji3ptQSmmhncJ30zuHwy2XLQvCIQzt8ak/jYLuzsKOpN
         LIyOUfYgYp5UQNE0uZkKzZjhHOpjS5RHMJT7xzbBvNBdQwS/9ZkawYZNC3i5MwcDFk+r
         a9Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785994505; x=1786599305;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eq9O/ZH/lB+RqlHtKACGCAmmelni54lJd8E5ukY2rx8=;
        b=RwuNelIgc2wK/wfMtdMt9DzGfdGKVgb7C4zxBIvSELXsK/x1SbnPaLPEsxKsvlIRLJ
         MVH5EpJaZtjMqMbmRIPopvBG3Raw7gZIn/YQN4oArJzM1DBoDF+xHcHymFs9AKvz1x/z
         1EpMcZUoXRVN8OmFyP4RBi0dlScyZRkiPjvgl/QSii7WRrfwQRnJKaJ38yYV5s6Z91bL
         dRS9Lwr8RIL2V2HExLKy2l+KdyGYKHxv4XQrmWnqdhQYRAfpztDjH9Na9djz3ZjMsREF
         FtFjgbPpqhACMm6XWnP2vbz5Fe/EXwtCm2PAceetB3VG1snzP0V+gVsYC2c9RCbkWYI7
         M9mA==
X-Forwarded-Encrypted: i=1; AHgh+Rq7uFTRDbj9EQBHa+3HKa/V9LiKbCe/fDCRHezLP++g/zS6j4E/Eaj1O+VcmZGqwYUA7a9o8b0Rx44=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYi/eBPdeyEdXDnXBkedC8ueemspp1jAyZ1K2uaJ+DoqLRf74F
	UkJtpd2qOWop8X+iZkSwxwn/ZjEMtWPvdsfTrpzTyXxRK8dZnjeI4xDpZvxmQ9qxinIt4RyOV7B
	jtxwGLApJIYuLKt1EYquhRsbSTxhl0nhXd5o5VzCqX3UBBuipix3dX2ZStvfiuwI=
X-Gm-Gg: AR+sD11BeDZSH4pqsi9SNiD/kGMqDbx1zz7fxm5OQx7e3z9UzV/4GXgpYh95jxNfQho
	WUsZNbjHrQS3Ye4uy5Hin+NnRRJQQxH32/N19hKi9R5FVKTxnQBtpEACU74vhy/3iCuljySG0vD
	uteeoVAYaIXAU6Hbg6Ci03k0nXca3+qWCgapOiItw4sHR1GrgUvLY3pfomeEpqxyekbyPWxAPv5
	gW98NlEtLDzAoMnR2UUr3k5I7BwAGp+WRYFILt1CGSY2QPIFdKmLxf4DCyjylMgpMHhVerzZJcB
	tludqZomhuEiRhwA5zI3GmChngK/14ybQ+zECJZ8wPKjCzBnCHCGx+W/U/lxB/dogzCOrhiR562
	BdFaLBWZhKG9+7RzBEUrkClT0P2VKwKqmvSxvHT96RHSAAe0=
X-Received: by 2002:a17:902:ea01:b0:2c9:bf82:dd11 with SMTP id d9443c01a7336-2d0ca71b505mr129757085ad.7.1785994504948;
        Wed, 05 Aug 2026 22:35:04 -0700 (PDT)
X-Received: by 2002:a17:902:ea01:b0:2c9:bf82:dd11 with SMTP id d9443c01a7336-2d0ca71b505mr129756595ad.7.1785994504505;
        Wed, 05 Aug 2026 22:35:04 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0a9f8fee7sm25780085ad.16.2026.08.05.22.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 22:35:03 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 05 Aug 2026 22:34:56 -0700
Subject: [PATCH v2 2/3] clk: qcom: tcsrcc-x1e80100: Migrate to clk_ref
 helper
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-hamoa_tcsr_qref_0805-v2-2-4f1cfb1fcab2@oss.qualcomm.com>
References: <20260805-hamoa_tcsr_qref_0805-v2-0-4f1cfb1fcab2@oss.qualcomm.com>
In-Reply-To: <20260805-hamoa_tcsr_qref_0805-v2-0-4f1cfb1fcab2@oss.qualcomm.com>
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
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785994500; l=12460;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=ihdFPILNani3Ibkuu+huHpL8xJf5HkOPsUpioh5t6jk=;
 b=V0Om/cpGLWkI5B2ZQcSkMpE7izK/rgjLwJpE8ZGHdSZQ//re9TnsWhawKhor3KzgWiIxqSjpG
 ounkgfmzt4CDFbp4RIgrd8jYNL8adJcnbSoubOk3vVw4eh0Jg0M8w2I
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA0MCBTYWx0ZWRfX1/BJoJrEKnwn
 lX5OioWPrZ82WLiajFt23hmzJGBxRQTLUomFAWSp31LE4c7F99HeL39LlMKnDzE5kkP79RQHDnx
 euBQ9BBU4BiFsOimu9Iv4UTmJdwkZhQ=
X-Proofpoint-GUID: EmL1HFIz4QSijW-2TDWxJDTpso_37Gpt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA0MCBTYWx0ZWRfX3wmJtcJ6UZP0
 pC+Skh9sTdTvPugc4HcvVuDknBtzUqaCmtsXeOJhjNa8uuMmPSJLWV8uSf7PYJ4iQ2olill14qw
 q9hbRyFpCG1ytlW8AbnAO4Bh7g+WXfrURV7NYDSPxTQB+/Hw4fJA7Fp3VPOiqSpCP1g/7+JVIFJ
 CrjW7eiWd2fj0sD+xpy02OVsyGeHEx5rfLVc/qHyVfAG0BvbVTP52A5OPYM5A+XxOdBM8MK0Mb/
 IV3ruX3IU0RsLJLfTogEfNBa5urCZsiObh2npouqQ33dg8czhfWkfQAk84DSwY0mHD3RHe8VaTS
 wDYwlL+UcfTih60/IOHfCBLiMjms1fNPszwhuVx1r+aKovwjvpEITereYXM5esw36IkVa4yb5Eg
 mLV4gO/dw8EEoi+G6qCJSdFzGn6darwTgtp35mKUrVoTi8OdVPHLVMb3KVr2YG4qORUSOsZMvE0
 MxOK3oWurXfJsIJmD4Q==
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a741d0a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=48_MYvKuBCZC4ZtyZX0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: EmL1HFIz4QSijW-2TDWxJDTpso_37Gpt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060040

Replace local clk_branch-based clkref definitions with descriptor-based
registration via qcom_clk_ref_probe().

This keeps the x1e80100 driver focused on clock metadata and reuses
common runtime logic for regulator handling, enable/disable sequencing,
and OF provider wiring.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/clk/qcom/tcsrcc-x1e80100.c | 335 +++++++++++++------------------------
 1 file changed, 113 insertions(+), 222 deletions(-)

diff --git a/drivers/clk/qcom/tcsrcc-x1e80100.c b/drivers/clk/qcom/tcsrcc-x1e80100.c
index 0b05c27b619b..ad1f6be83a53 100644
--- a/drivers/clk/qcom/tcsrcc-x1e80100.c
+++ b/drivers/clk/qcom/tcsrcc-x1e80100.c
@@ -5,252 +5,141 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/clk/qcom.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,x1e80100-tcsr.h>
 
-#include "clk-branch.h"
-#include "clk-regmap.h"
-#include "common.h"
-#include "reset.h"
-
-enum {
-	DT_BI_TCXO_PAD,
+static const char * const x1e80100_tcsr_tx1_rpt0_rx0_regulators[] = {
+	"vdda-refgen0-0p9",
+	"vdda-refgen0-1p2",
+	"vdda-qreftx1-0p9",
+	"vdda-qreftx1-1p2",
+	"vdda-qrefrpt0-0p9",
+	"vdda-qrefrx0-0p9",
 };
 
-static struct clk_branch tcsr_edp_clkref_en = {
-	.halt_reg = 0x15130,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x15130,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "tcsr_edp_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
-	},
+static const char * const x1e80100_tcsr_tx1_rpt1_rx1_regulators[] = {
+	"vdda-refgen0-0p9",
+	"vdda-refgen0-1p2",
+	"vdda-qreftx1-0p9",
+	"vdda-qreftx1-1p2",
+	"vdda-qrefrpt1-0p9",
+	"vdda-qrefrx1-0p9",
 };
 
-static struct clk_branch tcsr_pcie_2l_4_clkref_en = {
-	.halt_reg = 0x15100,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x15100,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "tcsr_pcie_2l_4_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
-	},
+static const char * const x1e80100_tcsr_tx1_rpt12_rx2_regulators[] = {
+	"vdda-refgen0-0p9",
+	"vdda-refgen0-1p2",
+	"vdda-qreftx1-0p9",
+	"vdda-qreftx1-1p2",
+	"vdda-qrefrpt1-0p9",
+	"vdda-qrefrpt2-0p9",
+	"vdda-qrefrx2-0p9",
 };
 
-static struct clk_branch tcsr_pcie_2l_5_clkref_en = {
-	.halt_reg = 0x15104,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x15104,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "tcsr_pcie_2l_5_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
-	},
+static const char * const x1e80100_tcsr_tx0_rpt3_rx3_regulators[] = {
+	"vdda-refgen2-0p9",
+	"vdda-refgen2-1p2",
+	"vdda-qreftx0-0p9",
+	"vdda-qreftx0-1p2",
+	"vdda-qrefrpt3-0p9",
+	"vdda-qrefrx3-0p9",
 };
 
-static struct clk_branch tcsr_pcie_8l_clkref_en = {
-	.halt_reg = 0x15108,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x15108,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "tcsr_pcie_8l_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
-	},
+static const char * const x1e80100_tcsr_tx0_rpt4_rx4_regulators[] = {
+	"vdda-refgen2-0p9",
+	"vdda-refgen2-1p2",
+	"vdda-qreftx0-0p9",
+	"vdda-qreftx0-1p2",
+	"vdda-qrefrpt4-0p9",
+	"vdda-qrefrx4-0p9",
 };
 
-static struct clk_branch tcsr_usb3_mp0_clkref_en = {
-	.halt_reg = 0x1510c,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x1510c,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "tcsr_usb3_mp0_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
-	},
+static const struct regmap_config tcsr_cc_x1e80100_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x2f000,
+	.fast_io = true,
 };
 
-static struct clk_branch tcsr_usb3_mp1_clkref_en = {
-	.halt_reg = 0x15110,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x15110,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "tcsr_usb3_mp1_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+static const struct qcom_clk_ref_desc * const tcsr_cc_x1e80100_clk_descs[] = {
+	[TCSR_EDP_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_edp_clkref_en",
+		.offset = 0x15130,
+		.regulator_names = x1e80100_tcsr_tx0_rpt3_rx3_regulators,
+		.num_regulators = ARRAY_SIZE(x1e80100_tcsr_tx0_rpt3_rx3_regulators),
 	},
-};
-
-static struct clk_branch tcsr_usb2_1_clkref_en = {
-	.halt_reg = 0x15114,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x15114,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "tcsr_usb2_1_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_PCIE_2L_4_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_pcie_2l_4_clkref_en",
+		.offset = 0x15100,
+		.regulator_names = x1e80100_tcsr_tx1_rpt1_rx1_regulators,
+		.num_regulators = ARRAY_SIZE(x1e80100_tcsr_tx1_rpt1_rx1_regulators),
 	},
-};
-
-static struct clk_branch tcsr_ufs_phy_clkref_en = {
-	.halt_reg = 0x15118,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x15118,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "tcsr_ufs_phy_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_PCIE_2L_5_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_pcie_2l_5_clkref_en",
+		.offset = 0x15104,
+		.regulator_names = x1e80100_tcsr_tx1_rpt12_rx2_regulators,
+		.num_regulators = ARRAY_SIZE(x1e80100_tcsr_tx1_rpt12_rx2_regulators),
 	},
-};
-
-static struct clk_branch tcsr_usb4_1_clkref_en = {
-	.halt_reg = 0x15120,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x15120,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "tcsr_usb4_1_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_PCIE_8L_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_pcie_8l_clkref_en",
+		.offset = 0x15108,
+		.regulator_names = x1e80100_tcsr_tx1_rpt0_rx0_regulators,
+		.num_regulators = ARRAY_SIZE(x1e80100_tcsr_tx1_rpt0_rx0_regulators),
 	},
-};
-
-static struct clk_branch tcsr_usb4_2_clkref_en = {
-	.halt_reg = 0x15124,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x15124,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "tcsr_usb4_2_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_USB3_MP0_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb3_mp0_clkref_en",
+		.offset = 0x1510c,
+		.regulator_names = x1e80100_tcsr_tx1_rpt0_rx0_regulators,
+		.num_regulators = ARRAY_SIZE(x1e80100_tcsr_tx1_rpt0_rx0_regulators),
 	},
-};
-
-static struct clk_branch tcsr_usb2_2_clkref_en = {
-	.halt_reg = 0x15128,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x15128,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "tcsr_usb2_2_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_USB3_MP1_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb3_mp1_clkref_en",
+		.offset = 0x15110,
+		.regulator_names = x1e80100_tcsr_tx1_rpt0_rx0_regulators,
+		.num_regulators = ARRAY_SIZE(x1e80100_tcsr_tx1_rpt0_rx0_regulators),
 	},
-};
-
-static struct clk_branch tcsr_pcie_4l_clkref_en = {
-	.halt_reg = 0x1512c,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x1512c,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "tcsr_pcie_4l_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_USB2_1_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb2_1_clkref_en",
+		.offset = 0x15114,
+		.regulator_names = x1e80100_tcsr_tx0_rpt3_rx3_regulators,
+		.num_regulators = ARRAY_SIZE(x1e80100_tcsr_tx0_rpt3_rx3_regulators),
+	},
+	[TCSR_UFS_PHY_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_ufs_phy_clkref_en",
+		.offset = 0x15118,
+		.regulator_names = x1e80100_tcsr_tx1_rpt12_rx2_regulators,
+		.num_regulators = ARRAY_SIZE(x1e80100_tcsr_tx1_rpt12_rx2_regulators),
+	},
+	[TCSR_USB4_1_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb4_1_clkref_en",
+		.offset = 0x15120,
+		.regulator_names = x1e80100_tcsr_tx0_rpt4_rx4_regulators,
+		.num_regulators = ARRAY_SIZE(x1e80100_tcsr_tx0_rpt4_rx4_regulators),
+	},
+	[TCSR_USB4_2_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb4_2_clkref_en",
+		.offset = 0x15124,
+		.regulator_names = x1e80100_tcsr_tx0_rpt3_rx3_regulators,
+		.num_regulators = ARRAY_SIZE(x1e80100_tcsr_tx0_rpt3_rx3_regulators),
+	},
+	[TCSR_USB2_2_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb2_2_clkref_en",
+		.offset = 0x15128,
+		.regulator_names = x1e80100_tcsr_tx0_rpt3_rx3_regulators,
+		.num_regulators = ARRAY_SIZE(x1e80100_tcsr_tx0_rpt3_rx3_regulators),
+	},
+	[TCSR_PCIE_4L_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_pcie_4l_clkref_en",
+		.offset = 0x1512c,
+		.regulator_names = x1e80100_tcsr_tx0_rpt4_rx4_regulators,
+		.num_regulators = ARRAY_SIZE(x1e80100_tcsr_tx0_rpt4_rx4_regulators),
 	},
-};
-
-static struct clk_regmap *tcsr_cc_x1e80100_clocks[] = {
-	[TCSR_EDP_CLKREF_EN] = &tcsr_edp_clkref_en.clkr,
-	[TCSR_PCIE_2L_4_CLKREF_EN] = &tcsr_pcie_2l_4_clkref_en.clkr,
-	[TCSR_PCIE_2L_5_CLKREF_EN] = &tcsr_pcie_2l_5_clkref_en.clkr,
-	[TCSR_PCIE_8L_CLKREF_EN] = &tcsr_pcie_8l_clkref_en.clkr,
-	[TCSR_USB3_MP0_CLKREF_EN] = &tcsr_usb3_mp0_clkref_en.clkr,
-	[TCSR_USB3_MP1_CLKREF_EN] = &tcsr_usb3_mp1_clkref_en.clkr,
-	[TCSR_USB2_1_CLKREF_EN] = &tcsr_usb2_1_clkref_en.clkr,
-	[TCSR_UFS_PHY_CLKREF_EN] = &tcsr_ufs_phy_clkref_en.clkr,
-	[TCSR_USB4_1_CLKREF_EN] = &tcsr_usb4_1_clkref_en.clkr,
-	[TCSR_USB4_2_CLKREF_EN] = &tcsr_usb4_2_clkref_en.clkr,
-	[TCSR_USB2_2_CLKREF_EN] = &tcsr_usb2_2_clkref_en.clkr,
-	[TCSR_PCIE_4L_CLKREF_EN] = &tcsr_pcie_4l_clkref_en.clkr,
-};
-
-static const struct regmap_config tcsr_cc_x1e80100_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = 0x2f000,
-	.fast_io = true,
-};
-
-static const struct qcom_cc_desc tcsr_cc_x1e80100_desc = {
-	.config = &tcsr_cc_x1e80100_regmap_config,
-	.clks = tcsr_cc_x1e80100_clocks,
-	.num_clks = ARRAY_SIZE(tcsr_cc_x1e80100_clocks),
 };
 
 static const struct of_device_id tcsr_cc_x1e80100_match_table[] = {
@@ -261,7 +150,9 @@ MODULE_DEVICE_TABLE(of, tcsr_cc_x1e80100_match_table);
 
 static int tcsr_cc_x1e80100_probe(struct platform_device *pdev)
 {
-	return qcom_cc_probe(pdev, &tcsr_cc_x1e80100_desc);
+	return qcom_clk_ref_probe(pdev, &tcsr_cc_x1e80100_regmap_config,
+				  tcsr_cc_x1e80100_clk_descs,
+				  ARRAY_SIZE(tcsr_cc_x1e80100_clk_descs));
 }
 
 static struct platform_driver tcsr_cc_x1e80100_driver = {

-- 
2.34.1

