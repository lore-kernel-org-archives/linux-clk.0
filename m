Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F713C2795
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 09:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790242827; cv=none; b=BiPVoaHbVIGmV779eXFgFYDOQqjA6c484rNX3h80OrIkTAamkc78pXBZxStIVtnqOilGVxO2IiZLX16rhbEE1O6cuLLYGZlDLv1Za1YMwj03u8bqZH99Q3eU/mp2AjvMI9myfgGRgKD9UbyUOFbvkud0H/vbZTJsATFln/9NE6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790242827; c=relaxed/simple;
	bh=7kh4ZgB9VWJM1x4v5o80hyppDSt+3VV+HLjLFnM3EMY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aMBtaqyX99S223S1N6duNQMCRkKhARlCmHoIkVF7XE8g5d3QdHdG91mTN1SErllxvX+lmu3KGKTvoWe0KldmuZnaZ7BRmWWpX+94SdNGtiXuhJxsYdj433H9bSJKbLQAGxotILyFJXmRhSKwgawNSHucqcgN6gGSFrJ7SDrwDHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RJUaZlNX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Suh7BX6T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RJUaZlNX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Suh7BX6T"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PkYv1080154
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 09:40:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sKfkfgei71i9bFDAQ/f6qc
	tZa/AzU0W+tjMKL/QROEU=; b=RJUaZlNXmOVatxs3YzlVh9FGKD+4x91N9LOIjd
	uXogjs6c0FNIMg5RkXJdrXsmkydZphQEvLbulNq8ATPGSqq0AAvWkwojf4+pwH37
	m89SGe0QDthlhY5niY9WeH9jwbgAG3SaP4n7hcZYiTq69t+mBSWkrPMV2bLGCh24
	O7MsTGrvAF0tE6mOVq9Wtq18cMg0bdDM3JWq6Xw33iUzccmNQ8UTnk44TrTQHPHg
	6vxoiPnjHcRxtFmT777UsN/XjyzMgbExivbNRKoh+NcGzNfMjJ1HXKfZCKDiKTrw
	gXvBB3yVC2/nTFhp6l9AJ7WsKLGVNslyD/T1xjRJ7rq2dfHQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfmwmccs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 09:40:22 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33bb08e80a8so788546eec.0
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 02:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790242822; x=1790847622; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sKfkfgei71i9bFDAQ/f6qctZa/AzU0W+tjMKL/QROEU=;
        b=Suh7BX6TY8e6qxQWArMN6l24t7LBf7b7/qZNoKdAJ6YngO1G9b9ZHdjLp1qPWNvuJ5
         lHrcp6W4nCm07j1umvyiS8ogXT9eESjrjJdWp7fOJxSQ/x3tB1dn7kgNHaDlA/nXuihR
         m+CV+q667VAiQFbvovaIyCD1EiU1/h2EcKK6xDKe/3DT/zxVjVJBbDEp5J9VDB2twoUf
         3upUpGvbbjsBozQVve+YooFw+Gns02LJM7Ynn6SxYTuEngxWdSlKJmdRr/ZP4Qjtl7D4
         aoOE9zeYxvJpfckCDT1Wex/ukeZljBI3v7beJMeJ9ETq8NfY1xAnOsvxPgVDthIWZqE0
         ry5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790242822; x=1790847622;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sKfkfgei71i9bFDAQ/f6qctZa/AzU0W+tjMKL/QROEU=;
        b=0qreWEqE6A5jtDxmlkNoscUYTk48O1hdn+rdu1qh13jB40+n5qn28tW8YvG7Wo7zke
         6Ilph//WVVTCX5GtyQmiwcMhEWej8/0Wp5eUG001V8zvcKUZDiyEWyycvvTd/X8Y9dBp
         Mn9kQY+q0zq5FpP0rkPewYZu3aD+B3oYNfGWOL0R7qOdyem16Wj7+Wwog4zoP793aUBn
         fm1eyc1UH2p3S119Kl17qz0nzFCNQ9Kwd5f46omRRg6gxXX+0JBDvrnYMDX7xHZ4i5bs
         hS97Qy7n7at63uKDqZHYGgVPqGV85yHq844xYJX83bAyxrMEqm/uKIDIZRQtkrlJF7T+
         hC+w==
X-Forwarded-Encrypted: i=1; AKwUvByETk7WdcsSujs3vglWOqkpUTS8Wxywj9eRWl6ID8qtfCvCa7ac0fXpEya2TzbOaU8KAOpSMADN/oI=@vger.kernel.org
X-Gm-Message-State: AFuF++k0PoPg4vo7iDUTQH/x0MrUDkgwJKvmr3iTnyNL8iTtHPX5bE+E
	4zfwFlJ4snx1sl24FGsDpy0FJVVDyUZJynMXFrt+W5L2NmcDtwTdm99N/elsQHE2ytHKlmaMr7R
	rE/CiRzv3grz2WfhrwUhDiclZy5kDvvv7JYNE6Z0eUYkZVdHTyEK0eqn5TxppE/SHSL/DyYE=
X-Gm-Gg: AYBFou3w8NnR+3WFfHcv2V8rxahH8reTtAfoxPfKgIpnutZFT+xMunA0u/VFutXVEX4
	06TBNch0VfeIxxJdIk465GB6JtIPAmrGTH9sqSo1G5qji6RObNJS6JLYByKT7b2C/zOMFyp3gqN
	yXlHrI/jsDAjfxLvAGWjC2ThyQwSN5yUrUZ5gdY9vDLojPE4EgydbP4/wub5NtsUOxhm/jPo3jW
	3TF3/cTOwCo5K0axQZDy03UpHu8D3Cad+pGVXMc7LPFLtmSmzVV9yN1jBIR/QrNsp5yW61qVLVH
	GMqDINgwHrAYlTwmTY5cLD0lufQeiAPoYUfavYQCuVmMdSPOqfCfsZr9pCnzpUQN1qJ9QzOCPwu
	i1v6GQY/xR3IlAm0PBp8sVnY=
X-Received: by 2002:a05:7300:6b1a:b0:33b:e076:f2e with SMTP id 5a478bee46e88-340040a4b88mr1338581eec.8.1790242821594;
        Thu, 24 Sep 2026 02:40:21 -0700 (PDT)
X-Received: by 2002:a05:7300:6b1a:b0:33b:e076:f2e with SMTP id 5a478bee46e88-340040a4b88mr1338548eec.8.1790242820980;
        Thu, 24 Sep 2026 02:40:20 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fdabcsm13482354eec.3.2026.09.24.02.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 02:40:09 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:09:56 +0530
Subject: [PATCH] clk: qcom: gcc: Fix GPLL enable register offset for Nord
 SoC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-nord_gcc_offset_fix-v1-1-230ffad2dae9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOvvtGoC/x2MQQqAIBAAvyJ7Tigryb4SIeGuthcNjQiivycdZ
 2DmgUKZqcAsHsh0ceEUK3SNALdvMZBkrAyqVbo1apAxZbTBOZu8L3Raz7dE3ZMbJ4UDGqjlkan
 q/7qs7/sBepfH3WUAAAA=
X-Change-ID: 20260924-nord_gcc_offset_fix-d63ec582d4d9
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0MCBTYWx0ZWRfX4Xty6B3ENIku
 0OOF3/tps2HQ7kMpftzTSLYQTEN5LD0Xe2H7f0xYi2fVn2czs9sT5zT+LGCMXAJoOoe3QqWynnY
 r4LxJHM3u8cC8SRZ4/mMjarZT61IIyO1cfuCq0ezO6VbgrKmxYoD5QLYse/nQf3nmCqZ39QwyLM
 GC9XRPwV1EcbENv8y/3XfoRzMIfXSzV1btUo9rYzEguT1D57HqFQ/qDqiIODG3u6hMngtz9HX0p
 n+2C1ElGyEhbD5c4PVq5F62ZcuNWvaMOhrLLGhZZRkmPDDop9srPd8aYwi0A6kpdJBLW4ZfAefP
 6iWE5p5vN4hEKo776MayZ0bT14SeB+rwAlULbMVZtlt5lTcBRC2++EeiWbNYiDodAhwJy9vjxCg
 zwUB6QGK6C9UV8Dp+N3aBvL2ohku/lhXdWm8rmpZni/0tE/olBOnfOChHzXPu5EElQUz36uXf1z
 4y+7WkBJUPj9xXIuNzQ==
X-Authority-Analysis: v=2.4 cv=WK/qzXsR c=1 sm=1 tr=0 ts=6ab4f006 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=tWc-dzksYj5tB7JG_AwA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0MCBTYWx0ZWRfX3PdZCLuojB8y
 J+LYtMCquP/vBBOZhOvBHFug9IIhP8Tj1iIFX9IlS8IIiGszEzjs8WQ5mQE4kiqFdQGXdNUdeIi
 NdcRNKQApOtERUuReqhoRyR3PbgJFL0=
X-Proofpoint-ORIG-GUID: 2uRrJ1p7LNAtCvI-XqoRCa7tEoOCLeP0
X-Proofpoint-GUID: 2uRrJ1p7LNAtCvI-XqoRCa7tEoOCLeP0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240040

The GPLLs in the North-East, North-West and South-East global clock
controllers on the Qualcomm Nord SoC were registered with a placeholder
enable register offset of 0x0. As a result the shared PLL voting register
was never programmed, leaving the PLLs' enable state uncontrolled.

Point each GPLL at its actual GPLL_ENABLE register (0x57010 for the
North-East and South-East controllers, 0x76008 for the North-West
controller). Each PLL continues to select its own vote bit through
enable_mask.

Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/negcc-nord.c | 4 ++--
 drivers/clk/qcom/nwgcc-nord.c | 2 +-
 drivers/clk/qcom/segcc-nord.c | 8 ++++----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/negcc-nord.c b/drivers/clk/qcom/negcc-nord.c
index 0db284edc4e41e960adaca8f10cbcd4197352e2d..ef9ff450bcd44baf71e57eaa4f2c59a3c714b2cf 100644
--- a/drivers/clk/qcom/negcc-nord.c
+++ b/drivers/clk/qcom/negcc-nord.c
@@ -46,7 +46,7 @@ static struct clk_alpha_pll ne_gcc_gpll0 = {
 	.offset = 0x0,
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
 	.clkr = {
-		.enable_reg = 0x0,
+		.enable_reg = 0x57010,
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "ne_gcc_gpll0",
@@ -85,7 +85,7 @@ static struct clk_alpha_pll ne_gcc_gpll2 = {
 	.offset = 0x2000,
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
 	.clkr = {
-		.enable_reg = 0x0,
+		.enable_reg = 0x57010,
 		.enable_mask = BIT(2),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "ne_gcc_gpll2",
diff --git a/drivers/clk/qcom/nwgcc-nord.c b/drivers/clk/qcom/nwgcc-nord.c
index 280558f15748c95cfb373c09141b3023d7fcec5c..1eb8e53139120db4b872e7b7985c63e85d6b2013 100644
--- a/drivers/clk/qcom/nwgcc-nord.c
+++ b/drivers/clk/qcom/nwgcc-nord.c
@@ -36,7 +36,7 @@ static struct clk_alpha_pll nw_gcc_gpll0 = {
 	.offset = 0x0,
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
 	.clkr = {
-		.enable_reg = 0x0,
+		.enable_reg = 0x76008,
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "nw_gcc_gpll0",
diff --git a/drivers/clk/qcom/segcc-nord.c b/drivers/clk/qcom/segcc-nord.c
index 51d7f83e21b6b2f2780088f26f547cc48801c6e4..98b53311d333c4ec4b7fcb69e6e2f6815c37319a 100644
--- a/drivers/clk/qcom/segcc-nord.c
+++ b/drivers/clk/qcom/segcc-nord.c
@@ -39,7 +39,7 @@ static struct clk_alpha_pll se_gcc_gpll0 = {
 	.offset = 0x0,
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
 	.clkr = {
-		.enable_reg = 0x0,
+		.enable_reg = 0x57010,
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "se_gcc_gpll0",
@@ -78,7 +78,7 @@ static struct clk_alpha_pll se_gcc_gpll2 = {
 	.offset = 0x2000,
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
 	.clkr = {
-		.enable_reg = 0x0,
+		.enable_reg = 0x57010,
 		.enable_mask = BIT(2),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "se_gcc_gpll2",
@@ -95,7 +95,7 @@ static struct clk_alpha_pll se_gcc_gpll4 = {
 	.offset = 0x4000,
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
 	.clkr = {
-		.enable_reg = 0x0,
+		.enable_reg = 0x57010,
 		.enable_mask = BIT(4),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "se_gcc_gpll4",
@@ -112,7 +112,7 @@ static struct clk_alpha_pll se_gcc_gpll5 = {
 	.offset = 0x5000,
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
 	.clkr = {
-		.enable_reg = 0x0,
+		.enable_reg = 0x57010,
 		.enable_mask = BIT(5),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "se_gcc_gpll5",

---
base-commit: 3d7783543c2646af69ad65825e810060494bea21
change-id: 20260924-nord_gcc_offset_fix-d63ec582d4d9

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

