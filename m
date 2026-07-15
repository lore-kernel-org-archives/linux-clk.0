Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4083A961A
	for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 02:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784083251; cv=none; b=d0PHS4ZtlXwFz4gZPKMiCpFQ69f/0FUmNLl6aS69BUyydQpgUZEi+L3Lt0h/UcaGXukSURrUHCUT+RCdBj4XC7gcmahKWfItE4528UL8czGzzb21qrku8rQoKuEZMB361bJP32jz8r8/fq3tboRI16GwLx3+061Vk+UMnrn8eJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784083251; c=relaxed/simple;
	bh=ihdFPILNani3Ibkuu+huHpL8xJf5HkOPsUpioh5t6jk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FWXkMddBRtSHvUqjOMbIjunu+6pmMc1tqrCGm5fzlSMWzajjujSfXqyhsVQzTFDxqQHK7DPMFfjtXuBnck0zi51LODKFUU/EMtwp0XkiXSzeSNeU0CrhjevvUwkqB6EHWZYI2q7N2I3oMDyeEgaES8keqvd4R6iCVv4Sy4WWGLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f9yQTZ4t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bRls18Ef; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f9yQTZ4t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bRls18Ef"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F0Ifiu2172418
	for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 02:40:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Eq9O/ZH/lB+RqlHtKACGCAmmelni54lJd8E5ukY2rx8=; b=f9yQTZ4t6j48F5jz
	Nn1aElD/LCUeCjq1lbYyOuAVv5Camasz1JXg5Ii6FWlsK8ORjhgBaT8qTHSm5o4M
	E9LRpqSSBorBezNDf1TdYOkA8nuSInIrcZS0Ajuw+H7ZyiW/L2Y2UWIAXYHbeTS1
	lkvf0V/IaM/n368xsptCEadx5ooQlG9miNkLiMmE100DMlwvYdvrOEbdAM7O/X7b
	139vSPe6+0A98u8UaECbMeU9WXYEJ74AYJdp1DologMXT1UaN5IXQUP8UwEObG8r
	zf/M4JYOEneXdsJxlG3Nf1qW748FH9Y9cdJjJrX14X/OcYdMaiWycGMO5i0CK6PL
	7tk3Hg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnqtphy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 02:40:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccd1958e8fso22642295ad.2
        for <linux-clk@vger.kernel.org>; Tue, 14 Jul 2026 19:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784083247; x=1784688047; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Eq9O/ZH/lB+RqlHtKACGCAmmelni54lJd8E5ukY2rx8=;
        b=bRls18Ef7Bkg3gZaf2BzhDI2cmy2gfkkZ21otUgNuxmz47rcQVqnTGL+86IciDa18C
         VEIhW/Qftg7IiZ1k1wvjjvs3UJ9ZPX4yxa/kAlpc4haa82bPmGWjpYOu7OTuS3YUXL8Z
         X5EUgjFsEwOBCDFA4ZPapnx4sJQEjvFPCMn7pRhjZTBntsmqyiFR8Pfoz3V3xaw7tPVE
         tRAsvvIam/xB8Y6c1za2tILhK6dPweMwKB6uoj90qCgb9L9PoKjNV4Tjk2tEPuSYPX2J
         GThGOc3WUENCHKD0SHN4POvbDOVUDUDTq24Q+PAuVejkoSb3MzoYVQ9QtFPZArsdEDjd
         f/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784083247; x=1784688047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eq9O/ZH/lB+RqlHtKACGCAmmelni54lJd8E5ukY2rx8=;
        b=DKzEgH5Rh2vJ7MpFaOfXG30lyo9WVDIF6vYHZZpW4Y/zGw1WMHnZqFWTLAR3R1OiFX
         ighJ2lE5qF4ZZvsX0v5M34fYDHjrDSdvKlbFvbVpSvARla5zoK0aN89sSk1swyyDH4gk
         sKi1qbexIelwhMXv6GGmlPxtFDO3zPjikNTEuSpbkr+MdnT6oGqwAd03dCXp4j8VPvsm
         cgeA0R92kXqI8fWr0LzBFTS32tv+MNK1F4CSp0FWyUrc2whG7IlbZg2NJWN1CBujjBCz
         p8WpSLfBWaPqLltQ8AkMrONCoqYjgo/RWVYEO7OH586pMtun+ZMEfJs+pfh9+10+kIzx
         df4w==
X-Forwarded-Encrypted: i=1; AHgh+Rqhy7/m9NNrY+O1UD5/+FSuSd/FMTb+uBGVawtCBRNkNY6IamJgDKqTDx0KIBiO4ZX76bWfrbR9Icw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvpRrsvkEQuoVSOzR89XFw7ljFOjfOE34+r3o3AU+pJB4bFuq2
	G8yRhuJ4HFNIQsv+oAsKqFx73w32V8nzm/JkJepXXDOb/uHsw6WJQz4gN3I7zAxp9NAb9bVW0NI
	FmAJbwR1tO7E/9EpA//OiL8oHu10/7AN1yTInUHGEdZK6YC9bVmrQaxEhpNkG/r0=
X-Gm-Gg: AfdE7clvN4bKojmGj93CGTcZFTg9KB/+7prgDlYSUEN2rZo9N+ahBAjOJgpzlnNKIMJ
	2jU0t0QFWbHUA5A9J2U6GtvJCQqhRF6dwKeQgpC3OvtLvDThzpCdHc0nXoVEv/GaxUQAgF/xPTt
	1KvNOIoYM/GcX0ywYjz12joa+QsqkE0sYVdGc12VUjULunxPfjaQ5hD1+ZsDRpgnRLVk5zTygRH
	QPU9e+qTnfA0+1zMi2Se7hJJhDaME5Mlz9NMjuZr//+HqZOqXvVAWCjjk20JOi90CpsXG5uNx2v
	z5lOkCFqMTwNwIHhhfYOSMKjCGKfHOVsK6IYmjWoR12IwAGECwRBPICVOUrun3yFAmnK/nrcfAs
	7DBmkNIonjHNr6GxKm7SOG6aHTEr17bw2OMGbW+cdUPDW3x5Sxv6TkiUuuQ==
X-Received: by 2002:a05:6a20:9404:b0:3aa:f9cb:d438 with SMTP id adf61e73a8af0-3c1108c003cmr16160482637.21.1784083247313;
        Tue, 14 Jul 2026 19:40:47 -0700 (PDT)
X-Received: by 2002:a05:6a20:9404:b0:3aa:f9cb:d438 with SMTP id adf61e73a8af0-3c1108c003cmr16160448637.21.1784083246863;
        Tue, 14 Jul 2026 19:40:46 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm155285746c88.14.2026.07.14.19.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 19:40:46 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 19:40:42 -0700
Subject: [PATCH 2/3] clk: qcom: tcsrcc-x1e80100: Migrate to clk_ref helper
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-hamoa_tcsr_qref_0714_2-v1-2-13047922a376@oss.qualcomm.com>
References: <20260714-hamoa_tcsr_qref_0714_2-v1-0-13047922a376@oss.qualcomm.com>
In-Reply-To: <20260714-hamoa_tcsr_qref_0714_2-v1-0-13047922a376@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784083243; l=12460;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=ihdFPILNani3Ibkuu+huHpL8xJf5HkOPsUpioh5t6jk=;
 b=mzxoJOQuO/97NegUI3o5gp2Q92oy/M/bv9XB91B7ly2ciFJcLDaOCHyYLKLeNp7ZbM8OTEUK5
 q+1zEsEkPdXDPDMHXZ0ev91ku9MHVyeKnUKuZ/U3QP4a7o+J/byGl0l
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDAyMyBTYWx0ZWRfX1rsdd3Zc+z8r
 jceiE+lWcmEci4Ybt7aQjOHPqIfIoUrPhPgmEscvOds+w9aRWynOQoL75QZ1r9hLGA4lPTGzZ36
 9JIYuRQOwD/2H608HaQHDD11JGoMJiUI6OGCxESb5oRdix7Uj4OW0iKt1L1XcE041AAlixI9qdK
 cUEL69gTa60zkvdUhq2Gvf9ZDqJ9MFOXRhXFjPdQ+doCBJaIuh7Sa5U/DVrggRuaMNizyI8rLrv
 ylJFFHDWM5tewVYCzS7mZkWV1PA6Ln8xqjuMdn21M/17vKi2bjqmjHvJ5bj7JMMgpYgZh9XeaJI
 Y1HcY/HYDbO3qHuOENAme4CagYWgCRnXC3Pf1VbB/pNLHbQqYHCMHk8cMoEjvNqxQojDF6nyKTw
 ip7zbR8YsYz3Q26tqaOyIDC302YMjn94A656u1JIdFzw21urvAVn/jzq5ehigLRTeUTPEC8y00g
 izNoTTj9OdPXKIEJAvg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDAyMyBTYWx0ZWRfXz32pyFKhtd+v
 F6OHpUvggLMdt+FSm8EB26T0rlmUmISCDACmwTESS8eFNgyYyEy4AdYOZs4PF0EXlFJmbiCgv5d
 dGhXxYIvw7Hp2j/ewaZBXdmbbCP4xvU=
X-Authority-Analysis: v=2.4 cv=U+Oiy+ru c=1 sm=1 tr=0 ts=6a56f330 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=48_MYvKuBCZC4ZtyZX0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: S0mKWbRa1MbVBptYBZUooZCrCAF75kFy
X-Proofpoint-ORIG-GUID: S0mKWbRa1MbVBptYBZUooZCrCAF75kFy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_01,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150023

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

