Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AC9304BB3
	for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 06:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784096599; cv=none; b=DHHgKqe5Wirsua/sSoWMIsxX7uQxRy+wVAyn0CaTKL3NAscVR9PK/GoxBabaT5BSGKDAYzP3FaP2R9jBJHJ0pGOhzSp9egvU5f0Ln3B+cQ/AaNc1gWeoZKN7m4SQIMI1JVFKiTbZ8gefNWWQiXS6CB0Av1iCqoEqoVRPXKwrfrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784096599; c=relaxed/simple;
	bh=80rMppBxr7aVVbSmG1tEhmzZwzZslaQo+qJjlFgRLIQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=M5qLc96jXxBoK7PekAo9O0p7n26gNVaO5Iwitem0sy5q3gnUCt3deYMCwtB3itsB4ujuBvWtjtJQVrsG2aqyT3Vv96zjABdgGFSFXq6oL7O4RAb5QhwidKVBUwSkpRPcH9IhkMe70CvX4yIFWpXOR8b1TQTQ1mR/BbPJz6Cyvpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P9rqqRJK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TVne5EaX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P9rqqRJK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TVne5EaX"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3lDM22406018
	for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 06:23:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=g/ZSNMh2ztTjVKC+XxY4aH
	3WK0u8X/7pWi5GQJgqrlE=; b=P9rqqRJKToLWxVmMKGBDQSvcJ5Vq0K7saw9SpD
	Pfy38m9OxD8Z85BZfmziTfvNDAzjcj/+yTrIsofpiLG2InCWRGK4pEqcJiWXPM5T
	8KMc3mvXMNTjkWgrc78VAUusEFQmedaYEzkYDf+FPwyg3BSVjdGG8ZyW3J7/2QRO
	Vi0UaFXosITk2pvsLLojiNb6ad7WhTOF4GvLPkSiqp6sxhJ2PYfysa7ogiIvybys
	xra4oH1oqNjhjomZ7ecuhk96/Cq2EsEKbU9p7r5pI9KVGVJVPXWNjiTm7pMtgPZk
	X/gYzScnWEmEobFJ22tnt4kSdG6pOQZsGLRlGnUT8DE6A5xA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9g28da-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 06:23:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cea6a46766so62733305ad.0
        for <linux-clk@vger.kernel.org>; Tue, 14 Jul 2026 23:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784096595; x=1784701395; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=g/ZSNMh2ztTjVKC+XxY4aH3WK0u8X/7pWi5GQJgqrlE=;
        b=TVne5EaXckWgNeQEqDhBLECHocH1mL5raWP/fonRu408fkCqhtHrktZZQvx9w8E9Nz
         O2EjCcJBwMAxM+H2aInhAJ7dzKq9mbJHerVSNOF4VHcOpfnzuue0PU0g+9xjsw//9g0j
         /snIoCTRw7KFCwhe0CzQCwlnbdEOwqHIjDKq+fMPKdQeBW7QTe4fceiBafsccGspLmt5
         ikDT4CMJKEvwVpK19p1jVMOH6qeTWPZNuGWp3xzizCBl/+6QDeC/QvXt7+R8Mr/ukbKQ
         QGOMeJRAv2vyx+v8JLVXfLiIMQZrkddYddVW9UZqQ0H+uHPMzx+Ztn3eSGPqm+D/1VBY
         ba7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784096595; x=1784701395;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=g/ZSNMh2ztTjVKC+XxY4aH3WK0u8X/7pWi5GQJgqrlE=;
        b=tKulbC575AapY3IZklGW2rTPX73XZKRS8W3A0VfkWuZy/Lj66YD1LlYv0HxQNIXgHC
         m0U4zSyQkBbooZOacrsYHmtccQ5FH9QVPSPRrQ6pqLgQ0Y+8iv8mdLVItWtaVT+rqChW
         njA9h2dBIdA9xX1VaqtTbW/0aHcS+EUoMXf1bKeiIq4zB3chnJ4xteWfKPt9JcwEUcYH
         j/8JVW+YcH6846Oi+Xx6/xLTjOi40Rfs8XUIY0eiwNDkyM94s5ULMaZNctUNaIDjVxrY
         yHbv9jMhT1bZDN1AtF+QR2CaLVWK2t19nr3Z922L1kFfgFJrgIp3YbHFR0PQRoMhIk8e
         1RCg==
X-Forwarded-Encrypted: i=1; AHgh+Rpi7Jf+Hd/41irMEV07RIHhAx4Tg0soM521oChmlYscgpzON568/jiPAGgX6htougKieYWEfUi7h8U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzESw32jf1r0iDA2yr6BU8+iwXerO5cPsh5mkYkzeFE+k+6nlR
	r3jd1xOXjMCneO3/n8oZi26GVUKY8VUwhSPQrmb6wpRwfJB9IhV10/yxOpWiw5X//ndkoIaU8y5
	tCw/RGJ3aRqlriHp386Y4YFucu0VvwJU/Mn/6BpyUES0Md4GRNmjvFyHa3BW4iJA=
X-Gm-Gg: AfdE7ckxTQ/DvlEACPBhCisF9IP6fWtYgtjnxqTyPb9GiyJBU4Npg/czqhiFLrj9Jre
	CHjVPhs3Z9DiIYK9mZulTr4Qr7nkyjVKBs+w7Kr936nvqpZM5SxcU1Wgqcru3wING33cT2LUtP2
	pbNlE4jreQk3U2QgdRGCjVuCCNkWU/EgtyMXQBtqLC1oHBglo1OKLU1WV8/XsEs9P74QOMqs1nz
	iJeX3ZJIeWIxcG7Rv6uEVG1Mx5r7kYtOq4PC7beuyioAxCRi/K51z3qcydUMQLis5UuGdVg0Wxe
	VHKuAsrNXVo5EiIqCJYyPFkql2bq0aySnpxXDIIOx8fuEdiUUXi3+SGKPTaEw4PZ+xlfme8GW9m
	mWWJ4o+7MxKBDqxSvLq/+T+XHNMyz1DRHVXdHN64KB+5OI2bWXDZ02BZNfA==
X-Received: by 2002:a17:902:fda8:b0:2ca:4b7a:4a02 with SMTP id d9443c01a7336-2cef1370d34mr50133815ad.43.1784096595417;
        Tue, 14 Jul 2026 23:23:15 -0700 (PDT)
X-Received: by 2002:a17:902:fda8:b0:2ca:4b7a:4a02 with SMTP id d9443c01a7336-2cef1370d34mr50133575ad.43.1784096594994;
        Tue, 14 Jul 2026 23:23:14 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9c20616sm127945975ad.34.2026.07.14.23.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 23:23:14 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 23:23:13 -0700
Subject: [PATCH] clk: qcom: gcc: Set FORCE_MEM_CORE_ON/FORCE_PERIPH_CORE_ON
 for PCIe pipe clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-mem_on-v1-1-f5bfb6def0a1@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFAnV2oC/2WNQQ6CMBBFr0JmbUmLWMWV9zDElDpIjaXagUZDe
 ndbXLqZ5CXvv1mA0BskOBYLeAyGjBsTiE0BelDjDZm5JoaKV5LvecMs2osbGdd13/Atl7qTkOS
 nx96819C5/THN3R31lNfZGAxNzn/WT0Fk7y8aBBOsU6ms651s8HByROVrVg/trC3TgTbG+AWWi
 rb2tQAAAA==
X-Change-ID: 20260709-mem_on-0c4f90306cb6
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784096594; l=4719;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=80rMppBxr7aVVbSmG1tEhmzZwzZslaQo+qJjlFgRLIQ=;
 b=lwvHAVWpFZNleTYEwBZPeo8+HkfjBkDkboPGZC3KelhDFg+pCsG6aN1bz/Ww8wIYtgA2haHXd
 voAXStQU45xDBo8Kd2CEQsrOgGjDhM48JQaBc++j+e71BC+qzkPfB2J
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA1OSBTYWx0ZWRfXzpdZ1G0VAxfA
 6pAuhWu3s9BQJOSC4nCpI0FHN7b7YAbWMuBzHCGiXwOZU/3BpbuOP978ae46yUUys5sHgvRNCNQ
 wA2X0VPyf7VU9M2uj7ypQpFe5QR5wuo=
X-Proofpoint-ORIG-GUID: 3Wro1cUREmJxbK2cgnbtQI3CeQCWOPSQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA1OSBTYWx0ZWRfX7FsPmc+tlkUn
 icqmXEaGd6zRU4/5Y8oyPTxjbwqIO+0RuDkdMv5e9NnAQXR2DVB68RFY0jwjJTpwQBcyTB2A25y
 uewRsAO+kJ5ge5vRYl3vjMkMeFQ8pp5uVxbBMWUa6ZZyagTDYrowWmM1nN9SRzGj7IIzQMA1Jwn
 Mc8kEBb4T1R6rFJPMeTMbyxHtB1FH5QZ4IFiFJdML1561FMQ8NQcwIxcVxTsy7aWzlnkevVZ5jk
 X7xdkBd60MI+Zp0MScHHnJOabkF3c1tztrROaoJik3W+lLFMohQd3UrayMK8NNUZMYFuTFWMslk
 h3oCx2lmR/6JY/CK2R3to/TNyYDDyiJhRgQWS57kEDpZ7xx8Y0GuWJ8HurgezXIQNoTDHdAr97G
 Wsxef6/0gzdSYau7BrMSniHdo/j1baLJV7NjX65aUCf/Jy0UCow/jhvq02qa1NgYdnYIRAhyZqI
 BijQFKJLvI9knvvQuYw==
X-Proofpoint-GUID: 3Wro1cUREmJxbK2cgnbtQI3CeQCWOPSQ
X-Authority-Analysis: v=2.4 cv=VoATxe2n c=1 sm=1 tr=0 ts=6a572754 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Zdl20m3D5pEWJIyXYvkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150059

Setting FORCE_MEM_CORE_ON and FORCE_PERIPH_CORE_ON for the PCIe PIPE
clocks so that the inbound data path works correctly.

Without this, the PCIe link can come up but the endpoint can not access
host memory, with the host sometimes seeing a completion timeout
reported by the EP, even though the host can still read the EP's config
space.

This issue is seen on QDU1000, Kaanapali, Glymur and Nord. Hence, apply
FORCE_MEM_CORE_ON/FORCE_PERIPH_CORE_ON to all PCIe pipe clocks on these
platforms.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-glymur.c    | 11 +++++++++++
 drivers/clk/qcom/gcc-kaanapali.c |  3 +++
 drivers/clk/qcom/gcc-nord.c      | 13 +++++++++++++
 drivers/clk/qcom/gcc-qdu1000.c   |  3 +++
 4 files changed, 30 insertions(+)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index 6925c6865089..1e33160e03fb 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -8530,6 +8530,17 @@ static void clk_glymur_regs_configure(struct device *dev, struct regmap *regmap)
 {
 	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
 	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
+
+	qcom_branch_set_force_mem_core(regmap, gcc_pcie_3a_pipe_clk, true);
+	qcom_branch_set_force_periph_on(regmap, gcc_pcie_3a_pipe_clk, true);
+	qcom_branch_set_force_mem_core(regmap, gcc_pcie_3b_pipe_clk, true);
+	qcom_branch_set_force_periph_on(regmap, gcc_pcie_3b_pipe_clk, true);
+	qcom_branch_set_force_mem_core(regmap, gcc_pcie_4_pipe_clk, true);
+	qcom_branch_set_force_periph_on(regmap, gcc_pcie_4_pipe_clk, true);
+	qcom_branch_set_force_mem_core(regmap, gcc_pcie_5_pipe_clk, true);
+	qcom_branch_set_force_periph_on(regmap, gcc_pcie_5_pipe_clk, true);
+	qcom_branch_set_force_mem_core(regmap, gcc_pcie_6_pipe_clk, true);
+	qcom_branch_set_force_periph_on(regmap, gcc_pcie_6_pipe_clk, true);
 }
 
 static const struct qcom_cc_driver_data gcc_glymur_driver_data = {
diff --git a/drivers/clk/qcom/gcc-kaanapali.c b/drivers/clk/qcom/gcc-kaanapali.c
index 842c1a70c691..4bde2dcfc4fb 100644
--- a/drivers/clk/qcom/gcc-kaanapali.c
+++ b/drivers/clk/qcom/gcc-kaanapali.c
@@ -3482,6 +3482,9 @@ static void clk_kaanapali_regs_configure(struct device *dev, struct regmap *regm
 {
 	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
 	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
+
+	qcom_branch_set_force_mem_core(regmap, gcc_pcie_0_pipe_clk, true);
+	qcom_branch_set_force_periph_on(regmap, gcc_pcie_0_pipe_clk, true);
 }
 
 static const struct qcom_cc_driver_data gcc_kaanapali_driver_data = {
diff --git a/drivers/clk/qcom/gcc-nord.c b/drivers/clk/qcom/gcc-nord.c
index 7c7c2171ac96..66889e9159ec 100644
--- a/drivers/clk/qcom/gcc-nord.c
+++ b/drivers/clk/qcom/gcc-nord.c
@@ -1849,9 +1849,22 @@ static const struct regmap_config gcc_nord_regmap_config = {
 	.fast_io = true,
 };
 
+static void clk_nord_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	qcom_branch_set_force_mem_core(regmap, gcc_pcie_a_pipe_clk, true);
+	qcom_branch_set_force_periph_on(regmap, gcc_pcie_a_pipe_clk, true);
+	qcom_branch_set_force_mem_core(regmap, gcc_pcie_b_pipe_clk, true);
+	qcom_branch_set_force_periph_on(regmap, gcc_pcie_b_pipe_clk, true);
+	qcom_branch_set_force_mem_core(regmap, gcc_pcie_c_pipe_clk, true);
+	qcom_branch_set_force_periph_on(regmap, gcc_pcie_c_pipe_clk, true);
+	qcom_branch_set_force_mem_core(regmap, gcc_pcie_d_pipe_clk, true);
+	qcom_branch_set_force_periph_on(regmap, gcc_pcie_d_pipe_clk, true);
+}
+
 static const struct qcom_cc_driver_data gcc_nord_driver_data = {
 	.dfs_rcgs = gcc_nord_dfs_clocks,
 	.num_dfs_rcgs = ARRAY_SIZE(gcc_nord_dfs_clocks),
+	.clk_regs_configure = clk_nord_regs_configure,
 };
 
 static const struct qcom_cc_desc gcc_nord_desc = {
diff --git a/drivers/clk/qcom/gcc-qdu1000.c b/drivers/clk/qcom/gcc-qdu1000.c
index 915bb9b4ff81..18ed351f2a16 100644
--- a/drivers/clk/qcom/gcc-qdu1000.c
+++ b/drivers/clk/qcom/gcc-qdu1000.c
@@ -2669,6 +2669,9 @@ static int gcc_qdu1000_probe(struct platform_device *pdev)
 	/* Update FORCE_MEM_CORE_ON for gcc_pcie_0_mstr_axi_clk */
 	regmap_update_bits(regmap, 0x9d024, BIT(14), BIT(14));
 
+	qcom_branch_set_force_mem_core(regmap, gcc_pcie_0_pipe_clk, true);
+	qcom_branch_set_force_periph_on(regmap, gcc_pcie_0_pipe_clk, true);
+
 	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
 				       ARRAY_SIZE(gcc_dfs_clocks));
 	if (ret)

---
base-commit: b9810cd75b9fb56a3425d391cba3f608502bd474
change-id: 20260709-mem_on-0c4f90306cb6

Best regards,
--  
Qiang Yu <qiang.yu@oss.qualcomm.com>

