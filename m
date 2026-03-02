Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4AD35AC16
	for <linux-clk@vger.kernel.org>; Mon,  2 Mar 2026 10:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772448835; cv=none; b=AqZ6jro/ERgRIwrv6FBIZ/5L4WL8i4o5RuNRRui8BVUW56L00UrIVcxIOgsGGcwZprstIUaLFNjDfvWcb3ZKGC2vMbO5HtHotKPvwPY7e1FU0+AW14PwXfnHIF/gsXiOP4xoF+0oWtwmMloczBP3E31N+3W5S5/m9oVByxfX0zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772448835; c=relaxed/simple;
	bh=j5Ix9t2krSPr+pvE6bRRwSqx5ClVg6lCGBuwRlKrK0E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S5YcJX8L/8rO5teAxP5zNdbdy9xO/b8KiiFqmZwI9WzB0BDhdthQI9nvFRL52EfDUM3NNN7nmaKYruCieIT8LQP3Yhg2A3IT03HmkJWzz8peXz4jUlbnbGpj/wTjjSjmHUSolPiGF4XiZ2AfLYz3LY7B61EapbSP1PLMhSbC3Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oyiKYXFG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bo9PVM2q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oyiKYXFG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bo9PVM2q"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6226h9f32504591
	for <linux-clk@vger.kernel.org>; Mon, 2 Mar 2026 10:53:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wDRzvs4lKe6lzoVo9obMRd5reHDn3pymfPmnNclniRY=; b=oyiKYXFGp00kEBqq
	vm78bXpkKjm5RVM9ydbgdXOB+RC0I31QGP3afH0zKSXELSWQDMiPVDS9ntUuhkrp
	V2kZvo6S3L10betv6DqXINuMwO1nxDaY/ncFvA7tXPBINg0Rcx1Xh7DB/Rd6lATG
	WBGNv3+7pdwkKQioDePx8ZK7AIRB6H5ZQks8po6QrG/vgivr38mA9jP2EnEUW0Ln
	+W7wk0o9/dxgIR2KN0oc0nNvNlbgRlPgUcKo/xntl1bDRipci/mhrREdtljJPhH3
	1uGibIxGXDqZHasnD6vpgmpwE98MunE5LnJWxJlBxT/iRgKAxTRYx3tBs7HROgIu
	XVawBQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn5herwqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 02 Mar 2026 10:53:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3fae6f60so4030414385a.1
        for <linux-clk@vger.kernel.org>; Mon, 02 Mar 2026 02:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772448832; x=1773053632; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wDRzvs4lKe6lzoVo9obMRd5reHDn3pymfPmnNclniRY=;
        b=Bo9PVM2qp2DjzLO/FgAj72qdFfR4nLNx/8qCpiBgUr57TdOOmclP5TLy3I6o1FBsJ7
         jfagaT0pnxSDFYSmUXKS86MzhERuvjIIbKdk21RvVCN+UhR/OE1lP8epfF31H/NVSioF
         tgB6o1VyjjlRt3s7TF8AbQdzDN6fJHowz8PSh1QMJskmSSMghCU0o9BTxZ2+kRNXlrng
         VQQbwquyvKio679Li5mlEKN4kT2nthckc8keDuWGdVH1fKOofFt/2V3XwgcMF68lxJlQ
         K4UycKlR8M1yQJmoEgwphGFU5zYUCV61J+BOuzf+14C9Ix6ybQxVJacIU8hxm9J4JcJk
         +vYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772448832; x=1773053632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wDRzvs4lKe6lzoVo9obMRd5reHDn3pymfPmnNclniRY=;
        b=isER/qat954AkCXbBlOZvUn37D13+EjW7MMVd0Alf93vGQLj8lrUBmZUbw/evhUHWM
         fM15+doh/NgGcVpj5TrxpLdzgPKkow913FLuvci2piqagmy2t/xINbB3yK8Q4LiG7cCC
         ziPdcdtVIGeUu3nshtv3Pv3jXvqId+12ApRHlzQG5vMfN2zPRE+OuRyEo3Ajz9I2WjdK
         qezxdGbJYbP6M2MATcu9cPKUDCFyITF03CCMpbVSC2Cf51epv6P5b++iZSnNWxPVqukO
         RuskL5wachzPnITxer9wrAFbZ8jDTCxPYjy5wF+DoNSTaAHBpvWbZqI5vYbFJoYtDIr8
         xGyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtij9ZsTXzX4KZzuAnkypx5USG6ETZcFViQq9uFH1JlwE/0C4CxXRZeEOA6bjhWHLS/rbJSEsMOic=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7XbXCTSYZCkIheLBj7S/3d0fGHLqj/OQc1h9vIsdI5IvLhNNh
	UyObd9D59i0a0Y9udoMHfgGKFCchSnuju9uUxORkxQTbC4d3UTsM6hm/CdnQEI3HK/xdh6AGFDg
	h8n3mUzs/OXju+aX+T5fa5D7EwClsAVm1N2DaUrmOGkavPbZCpOA3flisuXh42Yw=
X-Gm-Gg: ATEYQzxpqbzl9+vOr5P/WDEHSwhwlY2udU2HtlIAAM1d2LhvmnS2F//TLajvEV6iqNO
	fMTzIcmevPis1OzJetLUH0MsqGyDqs6sjinsE+X/TrkNbRpbB7MU8ouC6iXfxWSg1E9xmDfRSYD
	DVzHV2KlfLJ7Qf1osuFa09+ytjFfFKlEvg5E1LCBRIp2RQGDW4JijTBz6vVrCDa7Z99mSplCv4V
	kmiA5lHYFuyydloMWWP1Hr5Cgyayo3ne3RGTAz50tcoMSWB6LWtVPH5T1p31Qn9w/wXto4Ohj5I
	m6N/qA96pSjMGK756mlc9sxPBJzfa/HHH8+if9BjbNn0CQXVK3l2heXOQ4e1AMBS7UrPjEgHy2g
	lWKZHybcBudHcpG179Rp09J7akjeqSg==
X-Received: by 2002:a05:620a:29c6:b0:8c9:eee0:db94 with SMTP id af79cd13be357-8cbbf3edc70mr1828243085a.31.1772448831893;
        Mon, 02 Mar 2026 02:53:51 -0800 (PST)
X-Received: by 2002:a05:620a:29c6:b0:8c9:eee0:db94 with SMTP id af79cd13be357-8cbbf3edc70mr1828238985a.31.1772448831236;
        Mon, 02 Mar 2026 02:53:51 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b59723fesm8399509f8f.38.2026.03.02.02.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 02:53:50 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Mar 2026 12:53:34 +0200
Subject: [PATCH v6 6/6] clk: qcom: Add TCSR clock driver for Eliza
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-eliza-clocks-v6-6-6f42d8a9d25c@oss.qualcomm.com>
References: <20260302-eliza-clocks-v6-0-6f42d8a9d25c@oss.qualcomm.com>
In-Reply-To: <20260302-eliza-clocks-v6-0-6f42d8a9d25c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=6765;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=j5Ix9t2krSPr+pvE6bRRwSqx5ClVg6lCGBuwRlKrK0E=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBppWwxt47Gb9KQEcayshhupE6EpQEp9qFjZYUB1
 LYkFHu+tH6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaaVsMQAKCRAbX0TJAJUV
 Vo/oD/9RwcWCJiMSCWNyMEb1U7YtZSRzEIEaBDYMrMio3vupGZw/O9yoRq0sIozDLMip6lcxzJt
 ISRHznVIOZdNcIKnWWrvmZfIOZQBK8LqRfjuVN5IY8m88MqhIqpkLuMOeGhuowPJdN4zbR7lVPC
 pK+QXNXyjGAbM+fKGJ1VtV8Ww/3zsGySsuR6fUYig1vTDm+gePamifhEaQdjW5cjtry/APLxAX3
 /HW1qw0Vgr/DvlH+QIXX+w7gnYMTJjuEotvcU4L3FWVdfG/nyGRQfnV3vXwsuvmySdvLD+ZDs3p
 EE4tXtHlEHAMZc40EJvE81wXmwIZ2JT663tENOcupBLFDz05iVAV1/UX1QEkRKDBw7tA3vuQDw1
 iX5o9JJ6walvaSBy0cERreub5UO1xqADGfDZjfCZlYB1+LFImRLY9HWp3OYVTIwJTB+PYxIaPYl
 dDL0ul4v0/4B9cxWfIBP8O4He1N8/6z62hk1D8/AVnac9QzIgKT+XSYE/5AjiIkNSCPcNr9MaiH
 kBE/vJyt/CvmyUWxRUKq58ByEowQwZPHV4CaZ3uHyxwOIPtoW2GkX4A1921WxV7El4BPFc1XxOG
 D3EJYdee9Mcagr1JhwL92shkTF1EJs/M1+s1iyP0kJ/rl0TyRVMPDdqU2VfleH6NSjPam5pa9sG
 C6KjSNH2aRZ6r8A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=BI++bVQG c=1 sm=1 tr=0 ts=69a56c41 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=xMpycIIAKlYumkEOWPcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: cDHd05D8YmbpaWdqCNMUKZKJ_vAJ3kpW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4OSBTYWx0ZWRfXzOhDD4mC+I/b
 wWOVhZjfX9g8jFokG3bqD6DUqGqasxa8nbmyRJX3zWXmcup5oGxDQ7W3UBm196aiUrSIp3zaf/N
 v5AwcQVEEFI0v3r4h+d/Lik/E76/yJ/179Y7nTEd63OuuUl0sMvaNQ7g9OdRBXFJVwxxXueWXt9
 cfZTYyU/7wtmeXxdRI3txVo1XDoPApt6M6xSFYCkOicxXHmezmm1IoKu6ajIzEGEXfTLZ7Qp3aI
 xh1oF957ZcmEaeOPEwzU7ulmnLXCgFwN3/6Zquqe41gix9XUC6rKFcYCSNNcmUEGUXHpmNWIfLk
 8avgOgsbyWavmQ7DUOZyKMVjrEpjOMyNVh6mzrP16sUXReARzzJEbzh6G81ZGZIsknj7FQq5h/+
 PNVtM2bmXum4Ap/jzdITLG5hAHyRZ6+TdY7oc6+dhi7gXGEBDqNzfzWHlsj6gqad8otKiBGGxFS
 N/A3TbHP3GiP7D0J8Bg==
X-Proofpoint-ORIG-GUID: cDHd05D8YmbpaWdqCNMUKZKJ_vAJ3kpW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020089

Add the TCSR clock controller that provides the refclks on Eliza
platform for PCIe, USB and UFS subsystems.

Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig        |   8 ++
 drivers/clk/qcom/Makefile       |   1 +
 drivers/clk/qcom/tcsrcc-eliza.c | 180 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 189 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index edac919d3aa2..dce21e33e366 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -28,6 +28,14 @@ config CLK_ELIZA_GCC
 	  Say Y if you want to use peripheral devices such as UART, SPI,
 	  I2C, USB, UFS, SDCC, etc.
 
+config CLK_ELIZA_TCSRCC
+	tristate "Eliza TCSR Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select QCOM_GDSC
+	help
+	  Support for the TCSR clock controller on Eliza devices.
+	  Say Y if you want to use peripheral devices such as USB/PCIe/UFS.
+
 config CLK_GLYMUR_DISPCC
 	tristate "GLYMUR Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 98891d19b3ac..2ac9eb14e1ab 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -21,6 +21,7 @@ clk-qcom-$(CONFIG_QCOM_GDSC) += gdsc.o
 obj-$(CONFIG_APQ_GCC_8084) += gcc-apq8084.o
 obj-$(CONFIG_APQ_MMCC_8084) += mmcc-apq8084.o
 obj-$(CONFIG_CLK_ELIZA_GCC) += gcc-eliza.o
+obj-$(CONFIG_CLK_ELIZA_TCSRCC) += tcsrcc-eliza.o
 obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
 obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_GCC) += gcc-glymur.o
diff --git a/drivers/clk/qcom/tcsrcc-eliza.c b/drivers/clk/qcom/tcsrcc-eliza.c
new file mode 100644
index 000000000000..ef9b6393f57e
--- /dev/null
+++ b/drivers/clk/qcom/tcsrcc-eliza.c
@@ -0,0 +1,180 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,eliza-tcsr.h>
+
+#include "clk-branch.h"
+#include "clk-regmap.h"
+#include "common.h"
+
+enum {
+	DT_BI_TCXO_PAD,
+};
+
+static struct clk_branch tcsr_hdmi_clkref_en = {
+	.halt_reg = 0x14,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x14,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_hdmi_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_pcie_0_clkref_en = {
+	.halt_reg = 0x0,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_pcie_0_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_pcie_1_clkref_en = {
+	.halt_reg = 0x1c,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x1c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_pcie_1_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_ufs_clkref_en = {
+	.halt_reg = 0x8,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_ufs_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb2_clkref_en = {
+	.halt_reg = 0x4,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_usb2_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb3_clkref_en = {
+	.halt_reg = 0x10,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x10,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_usb3_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap *tcsr_cc_eliza_clocks[] = {
+	[TCSR_HDMI_CLKREF_EN] = &tcsr_hdmi_clkref_en.clkr,
+	[TCSR_PCIE_0_CLKREF_EN] = &tcsr_pcie_0_clkref_en.clkr,
+	[TCSR_PCIE_1_CLKREF_EN] = &tcsr_pcie_1_clkref_en.clkr,
+	[TCSR_UFS_CLKREF_EN] = &tcsr_ufs_clkref_en.clkr,
+	[TCSR_USB2_CLKREF_EN] = &tcsr_usb2_clkref_en.clkr,
+	[TCSR_USB3_CLKREF_EN] = &tcsr_usb3_clkref_en.clkr,
+};
+
+static const struct regmap_config tcsr_cc_eliza_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x1c,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_desc tcsr_cc_eliza_desc = {
+	.config = &tcsr_cc_eliza_regmap_config,
+	.clks = tcsr_cc_eliza_clocks,
+	.num_clks = ARRAY_SIZE(tcsr_cc_eliza_clocks),
+};
+
+static const struct of_device_id tcsr_cc_eliza_match_table[] = {
+	{ .compatible = "qcom,eliza-tcsr" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tcsr_cc_eliza_match_table);
+
+static int tcsr_cc_eliza_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &tcsr_cc_eliza_desc);
+}
+
+static struct platform_driver tcsr_cc_eliza_driver = {
+	.probe = tcsr_cc_eliza_probe,
+	.driver = {
+		.name = "tcsr_cc-eliza",
+		.of_match_table = tcsr_cc_eliza_match_table,
+	},
+};
+
+static int __init tcsr_cc_eliza_init(void)
+{
+	return platform_driver_register(&tcsr_cc_eliza_driver);
+}
+subsys_initcall(tcsr_cc_eliza_init);
+
+static void __exit tcsr_cc_eliza_exit(void)
+{
+	platform_driver_unregister(&tcsr_cc_eliza_driver);
+}
+module_exit(tcsr_cc_eliza_exit);
+
+MODULE_DESCRIPTION("QTI TCSR_CC Eliza Driver");
+MODULE_LICENSE("GPL");

-- 
2.48.1

