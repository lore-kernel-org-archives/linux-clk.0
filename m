Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4E03C37B6
	for <linux-clk@vger.kernel.org>; Tue,  2 Jun 2026 08:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780387706; cv=none; b=a7OSIazgJErs0v1NuIiGwiMm4kXQSRpyujpyjNxS/hbMd0NuWZGOgwt+I4mKAFlIEBGG/LicYkrA920N7VtE+5NEoLDI50BbnPm3rGvoygbFmHAAfALrxJkkXSk4VDXcacv7ERFcL+aL8mmJfSmWMsuAUx5qe8DByJRsOuKw3bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780387706; c=relaxed/simple;
	bh=O3ZxKboNsvmFGx4zTywd6Z8ltIMwvsi+CEsUiesxLPI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EzEHXTPpkNttUx8EIzfYPU2SuGuUcGyHxKS77sDtp9bwcK3w3pZrxwk676Dx0CjqHp+wb/BJ9Cmq4DcfecDLrbcXyYl78OLDo2wA19ErHQTi/I3n8+h+ei7zKWTMFyHnZzrgrupS8ClJjarkWmTbXtZPLfn9/1XCesvkzQncWQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nkNX91GU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G903G95Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nkNX91GU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G903G95Z"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6525tiKJ1854909
	for <linux-clk@vger.kernel.org>; Tue, 2 Jun 2026 08:08:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B4k+mGyVyRRlOob3VXnjECa0j/xNlTNfTtzaql25T1s=; b=nkNX91GUl3BW+Lvl
	7JdbXOmxXZ0cQO6WX8qEoRL2bJjR1MRHJqWM90SMNpJP0bgaMnWb3J1dYPIEwvEJ
	pPqueml1dJOhrPz/WNQ0RuIijkGGDpYWgnkjckobvqm+qkxBHbeog5RKiM6FNHYZ
	OMEh+lo0hqHXO9p60vefZbRW5nEMrghs+kfuAtXz9I9u9ugEy1tDDNQWGde7Uncw
	XTDRXeUy4KOhXqN/xnhC6baiIdFoJVeejcQdm8ZKzF/ITgkDY2WbbHAoeEuJGt48
	aXFSun4whbyh7dAfUgqGG08q7RneRVoCZXVWMBSbDENnAuMWgRtrd6w9bh/MNq/5
	QvZRQA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsf78h1w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 02 Jun 2026 08:08:20 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1365060ac82so9284681c88.1
        for <linux-clk@vger.kernel.org>; Tue, 02 Jun 2026 01:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780387700; x=1780992500; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B4k+mGyVyRRlOob3VXnjECa0j/xNlTNfTtzaql25T1s=;
        b=G903G95Z0xGKklYUixXN7E78Wis9k9uDby+VZwdVrd83bt0VmnqVb3yi0QJv/g5Vpj
         kj8BES9sfx/CaFEOP0+xOYVISCFbfNSPJtHZ8j2fNc4XQGN51Z1yvJzPnYlkxqz7NdqI
         PpnZ51piYIGgYaKlkc57pYqMRUPWIf2oKhOaSnaUG7egAbtveZaRw9AoUidQqdB6n1Ek
         1Wce0c4y5dfK99YflP+cEbTkg4xaJWDBZ1E+VIy9Wne3Exp2Hk27dqbBcSfE3Cd+kDya
         CFlSfx+LZ1ZflLJNnPYJ7N3Qg2TtU/spFHeAFf38kMiB8o2xAqfEDgKGkb/FUWbCodxY
         0sSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780387700; x=1780992500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B4k+mGyVyRRlOob3VXnjECa0j/xNlTNfTtzaql25T1s=;
        b=k32VqCdOH5rE+4NAsfrd17OtyrF3E5/yr55rwuJSxPY2/DNpnWcjarUa1zBAHuA4gI
         63rYznnBLB8lxdL+yr0WWPxd9hkDnjcrQkeZr1dyXJjDi1rx2BpwqZKoa+5DUGzTjFQJ
         cP4LJ0te9GFLzbRKOmD5rkMxxkE//vH3xAQKNVg6N8bVoInM63fFh/kdHJpBSl9blBji
         XPLx/9N4bk8cNTp8lConfwQHYARD5AiQJuqhFznmmnpm0RbdYwrW3Bt3OxltdriX2t7w
         8WWaB2xM0M9JFgcLRVd1qdTjLBtoARDNUNqHh0fr5heMhPOXO2sjkU/CpvNY2LPMPeQ/
         vHVA==
X-Forwarded-Encrypted: i=1; AFNElJ/f+HySH7xxLOfv1irMsCcNYVk1E9OXaMclvUZCTDrncypAMkuNW1QoAOYPA3wOJCGH9tOKzmC+iyg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlQabbel7OV1Z9QVqEMeIENKyJ49aLjwi/sVfQiC8SNgvJVvCH
	YrId4AY1aFKq3ZglMCcUElh9vZnSGLfW/GivdsixonY9gEvThlJvNWITmJzJkjS/bskj83grmet
	bvxgw1H0q1F7toWG8VBMNVueOJ4ez/b1OULpIBT4CsKbKsigOsr0hN09L/ZUhh6M=
X-Gm-Gg: Acq92OGKK1WLQnGRoHJMI+dqXnfSi567irtpog+FnN0dJAnNavLvXylN3qA3IzZ1Pmo
	375ZgWBYk14B2WKDST6EDsvZSUjXRlrP9BHXRDqPnd3wl6DM0gLDvCN1SwFH1MitpP/vhQhTxfp
	v1zq7DWB8X2KQ9LX1GJMOj1LvHwxBUijeQdolKHyiMk327GOf3ZcBLD9IwcDwgG/W+4cy0qeY7P
	DAibwMTqZ+Yi6U1FGP2NKMmZY3dgDVBdpEnao7RM5Pg5ti6P+J3O7JIwlQOL/+xViKpkmb14g2I
	PBTje1JcmTSf6i4D+sTyhGFL6a215X2idYR2TI3netlYuXnnxZbzK1swnYW/uQeWn9ynNwWBDOq
	TyS3x3vwxOzXvUkyzvnhqFD7uJWL7iVQgnObn8z/hQUU89LCGMNXn0ESKU8UtvkritBTtds0wBG
	lezZc=
X-Received: by 2002:a05:7022:45a5:b0:134:d3bc:b4b4 with SMTP id a92af1059eb24-137ee08a62emr1223332c88.4.1780387700157;
        Tue, 02 Jun 2026 01:08:20 -0700 (PDT)
X-Received: by 2002:a05:7022:45a5:b0:134:d3bc:b4b4 with SMTP id a92af1059eb24-137ee08a62emr1223306c88.4.1780387699583;
        Tue, 02 Jun 2026 01:08:19 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137b3d8f839sm8006025c88.15.2026.06.02.01.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 01:08:17 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 01:02:19 -0700
Subject: [PATCH v5 3/7] clk: qcom: tcsrcc-glymur: Migrate
 tcsr_pcie_N_clkref_en to clk_ref common helper
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-tcsr_qref_0527-v5-3-8ea174a59d7e@oss.qualcomm.com>
References: <20260602-tcsr_qref_0527-v5-0-8ea174a59d7e@oss.qualcomm.com>
In-Reply-To: <20260602-tcsr_qref_0527-v5-0-8ea174a59d7e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780387692; l=11025;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=O3ZxKboNsvmFGx4zTywd6Z8ltIMwvsi+CEsUiesxLPI=;
 b=6DYnC/eNuEdAgwV+SBvye0Qj6AFiBApEa9HEyZbmzx/pTnOcbaefOrCsumFHAYi/UWzi5dnll
 SFBg3JQxq8HDTf07RLKpN+QToSCDfhdcCKe81Z5oV/o5wErLgBxQlkE
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=WKRPmHsR c=1 sm=1 tr=0 ts=6a1e8f74 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=IStsj7P7hPwQKhcmRzYA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: u0nAuuHmG57yQBvD-rO2CmB0Hp6W9WvP
X-Proofpoint-ORIG-GUID: u0nAuuHmG57yQBvD-rO2CmB0Hp6W9WvP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA3NSBTYWx0ZWRfX5ybCPDHbEBza
 AsqL7F2AiVxvV77MgicYnk5mYbUFdzexCE1K/be4/WHtR/h9AqmCUbsklTYs2w4eD5B9I8xKQYQ
 y8bIZIW9kVUYscOPpCbgIZCTw8mqo2xZWYrKOzY2/9YeUs5vphW8RMNAYYZ6xKpQY9218zZp21o
 G/cr5htK1WfAMmHdHw/kQtSrEzw2yhNn+YKiskf8yrc3LCVzm7yvdjpxPpg7ti/OZUXiGcf8u6D
 JvXYVj2bgL8Z+sbRlbgggfwtpOYPIOXrVbJwNNlMOEZpSb4yGWr7MfaDD0qZnxPleMFjxEN6tSV
 pcEOUXDNhCEJJjaiQqw1aEuu9DelStnhn4IaU4JN9M8Q2t8dANY6f8c865ZzzRDYQCZafIFBy/5
 FtuW21G7yJ1vysxK7YHUxHHOIw4fkts6xX8YHvBUV8UDLKHqbxySB5P4HIaRB9esWq0fxRIsaHW
 c9+b3b0sL6vCldEH47Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020075

Replace local clk_branch-based clkref definitions with descriptor-based
registration via qcom_clk_ref_probe().

This keeps the glymur driver focused on clock metadata and reuses common
runtime logic for regulator handling, enable/disable sequencing, and OF
provider wiring.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/clk/qcom/tcsrcc-glymur.c | 330 ++++++++++-----------------------------
 1 file changed, 83 insertions(+), 247 deletions(-)

diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-glymur.c
index 9c0edebcdbb1..e317003398d1 100644
--- a/drivers/clk/qcom/tcsrcc-glymur.c
+++ b/drivers/clk/qcom/tcsrcc-glymur.c
@@ -4,277 +4,111 @@
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
+static const char * const glymur_tcsr_tx0_rx5_regulators[] = {
+	"vdda-refgen3-0p9",
+	"vdda-refgen3-1p2",
+	"vdda-qrefrx5-0p9",
+	"vdda-qreftx0-0p9",
+	"vdda-qreftx0-1p2",
 };
 
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
-	},
+static const char * const glymur_tcsr_tx1_rpt01_rx1_regulators[] = {
+	"vdda-refgen4-0p9",
+	"vdda-refgen4-1p2",
+	"vdda-qreftx1-0p9",
+	"vdda-qrefrpt0-0p9",
+	"vdda-qrefrpt1-0p9",
+	"vdda-qrefrx1-0p9",
 };
 
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
-	},
+static const char * const glymur_tcsr_tx1_rpt012_rx2_regulators[] = {
+	"vdda-refgen4-0p9",
+	"vdda-refgen4-1p2",
+	"vdda-qreftx1-0p9",
+	"vdda-qrefrpt0-0p9",
+	"vdda-qrefrpt1-0p9",
+	"vdda-qrefrpt2-0p9",
+	"vdda-qrefrx2-0p9",
 };
 
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
-	},
+static const struct regmap_config tcsr_cc_glymur_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x94,
+	.fast_io = true,
 };
 
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
+static const struct qcom_clk_ref_desc tcsr_cc_glymur_clk_descs[] = {
+	[TCSR_EDP_CLKREF_EN] = {
+		.name = "tcsr_edp_clkref_en",
+		.offset = 0x60,
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
+	[TCSR_PCIE_1_CLKREF_EN] = {
+		.name = "tcsr_pcie_1_clkref_en",
+		.offset = 0x48,
+		.regulator_names = glymur_tcsr_tx0_rx5_regulators,
+		.num_regulators = ARRAY_SIZE(glymur_tcsr_tx0_rx5_regulators),
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
+	[TCSR_PCIE_2_CLKREF_EN] = {
+		.name = "tcsr_pcie_2_clkref_en",
+		.offset = 0x4c,
+		.regulator_names = glymur_tcsr_tx1_rpt012_rx2_regulators,
+		.num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt012_rx2_regulators),
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
+	[TCSR_PCIE_3_CLKREF_EN] = {
+		.name = "tcsr_pcie_3_clkref_en",
+		.offset = 0x54,
+		.regulator_names = glymur_tcsr_tx1_rpt01_rx1_regulators,
+		.num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt01_rx1_regulators),
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
+	[TCSR_PCIE_4_CLKREF_EN] = {
+		.name = "tcsr_pcie_4_clkref_en",
+		.offset = 0x58,
+		.regulator_names = glymur_tcsr_tx1_rpt012_rx2_regulators,
+		.num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt012_rx2_regulators),
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
+	[TCSR_USB2_1_CLKREF_EN] = {
+		.name = "tcsr_usb2_1_clkref_en",
+		.offset = 0x6c,
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
+	[TCSR_USB2_2_CLKREF_EN] = {
+		.name = "tcsr_usb2_2_clkref_en",
+		.offset = 0x70,
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
+	[TCSR_USB2_3_CLKREF_EN] = {
+		.name = "tcsr_usb2_3_clkref_en",
+		.offset = 0x74,
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
+	[TCSR_USB2_4_CLKREF_EN] = {
+		.name = "tcsr_usb2_4_clkref_en",
+		.offset = 0x88,
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
+	[TCSR_USB3_0_CLKREF_EN] = {
+		.name = "tcsr_usb3_0_clkref_en",
+		.offset = 0x64,
+	},
+	[TCSR_USB3_1_CLKREF_EN] = {
+		.name = "tcsr_usb3_1_clkref_en",
+		.offset = 0x68,
+	},
+	[TCSR_USB4_1_CLKREF_EN] = {
+		.name = "tcsr_usb4_1_clkref_en",
+		.offset = 0x44,
+	},
+	[TCSR_USB4_2_CLKREF_EN] = {
+		.name = "tcsr_usb4_2_clkref_en",
+		.offset = 0x5c,
 	},
-};
-
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
-static const struct regmap_config tcsr_cc_glymur_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = 0x94,
-	.fast_io = true,
-};
-
-static const struct qcom_cc_desc tcsr_cc_glymur_desc = {
-	.config = &tcsr_cc_glymur_regmap_config,
-	.clks = tcsr_cc_glymur_clocks,
-	.num_clks = ARRAY_SIZE(tcsr_cc_glymur_clocks),
 };
 
 static const struct of_device_id tcsr_cc_glymur_match_table[] = {
@@ -285,7 +119,9 @@ MODULE_DEVICE_TABLE(of, tcsr_cc_glymur_match_table);
 
 static int tcsr_cc_glymur_probe(struct platform_device *pdev)
 {
-	return qcom_cc_probe(pdev, &tcsr_cc_glymur_desc);
+	return qcom_clk_ref_probe(pdev, &tcsr_cc_glymur_regmap_config,
+				  tcsr_cc_glymur_clk_descs,
+				  ARRAY_SIZE(tcsr_cc_glymur_clk_descs));
 }
 
 static struct platform_driver tcsr_cc_glymur_driver = {

-- 
2.34.1

