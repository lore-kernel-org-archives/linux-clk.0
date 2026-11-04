Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793768934;
	b=MoUbTJU/hx6iP1GnFjbgcXGZkNpIonabZOzKaP2ULnRnUcf25VGoP9A3SZRpkz0ksB3J
	 p8goqg3JkGnYlVIQgPKcZlqE/tctTx0ZPKwg90x1pjfTE+t6hxym7YW7CmYewPuUxDWNP
	 LFVfrh6OCU3Qblf3rWb9kNU619boPMM07oFQWudoBD8zdvFq/TbEdSQNmOIa3mEIrUquq
	 km63Hb64K8iX7JYVPetlC3A238vT38OLDMu3kINoPhMHP1OuQqAnL2OE5vgLqULKLQMkj
	 WoA7ZBoGhzL9vi4s+otwVb34rqM+heVUWAq8mBhOOGCGN7yRjua2smPWG1rYEn7xLhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793768934;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=33cz/emHwn5wUjHtLiOj2ARrLkGcWsFzEttPuz3/OL0=;
	b=nGgS6WuiGhzIpUuob5agiieRlNsrDJh7ONKssUdSyC9YGm1eZSsustHYGDMFg++Lg82Y
	 pgjE+53DGhD7gu44GKC26f3Ie6Pm0Gg0Iolk4/l2uLpdJM/vNtzoBKwxUB9RKUJUr9nRr
	 wXmuOZUzL4tjT0CTiliAES6D/5Ad3o3SVmmEyq0ozMBE2yMDf6dahppTiCgpfFo79mQkI
	 hgEwQXbTlZcCiem4dizjM3bH10tIQ7pjXyRSgdJi2lSB1ftXHNPHz9lmbYQ1T/xZE9PJq
	 6zLo3NzI4R7UMkOkesDAtYj/RIesd+ZYFiQSnZwQkqV+W0VI4y85QAG3E6TBOmx77CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZR+9gnJb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ioS1X2a6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D9C606A33C
	for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2026 05:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19D9C606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZR+9gnJb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ioS1X2a6
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RrDg809992
	for <linux-clk@vger.kernel.org>; Wed, 4 Nov 2026 05:08:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	33cz/emHwn5wUjHtLiOj2ARrLkGcWsFzEttPuz3/OL0=; b=ZR+9gnJbrBxl85vn
	Rt03WYgTfDMGpM8EP5BxENUCx2j+J3vpp/9U7QP3F0vblvWpZyeLb9R8RBoiYRBP
	eUv3Un66+mde+2xGR55r4OpKTKL9Kb8EbuoKCl/Nd8AXmjHPfoG58N+jz2JAxc9A
	2mSCc4Q52oY+IWFrgjSuQ/3GnNSGM4aTnO13qul7fYrb+MmTB9P+vrsXzw5SydRB
	mBDyyl/0IJZL9MptfEBhmyjcP90zBTaNNa6ahoPxqWJ/vgkH/PjwbV2NRaYAuGwc
	dZv9ieAI40lg9HbrlKt2nG8wYc/B9Ydob8Lzf/kHKJ6pg+XLywZBUiJKXVxV3cwD
	pS5hCQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqkgpant2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 04 Nov 2026 05:08:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ae72da2f57so621906a91.1
        for <linux-clk@vger.kernel.org>; Tue, 03 Nov 2026 21:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793768931; x=1794373731; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=33cz/emHwn5wUjHtLiOj2ARrLkGcWsFzEttPuz3/OL0=;
        b=ioS1X2a6p/1FvRkKcg/ezkQx5fE15ULHUbZIlNFOkCxEKkdY1qFryQbtWZthP9mub0
         JU9VVpV9fmU59odZMJDK355FKb6KHkzA9Y8J34ZpJ5ASc5xT/YLbafhmtB1xo6Qi4+M5
         lgvuFW+SV4+m5nygmKH0gppFR6OgX5r9XGxE/8zNxBsz12oLSNRQViiimCWOr9Jj0E4Z
         7CjCAM2VvpaBTrmyc4up+DFShYbZHE3Ky/eB2j2F+8k2Q75uBhu5g/TLyEa5thojWtdP
         Y5boT689Wmfznes2kjNOcGNiwpyGAHx3Qkvpr6dIjy8rGjLCkk2II0Vna471Kk4eklUZ
         WjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793768931; x=1794373731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=33cz/emHwn5wUjHtLiOj2ARrLkGcWsFzEttPuz3/OL0=;
        b=UuH7fmM5yvfNwBk0QsW/Kpl+lC/LYERDRORh7zVLQgtBW01Uh6kgf7ObVioIStdar5
         qeIeIYJw0AnxTXcRK3xEJRE273iPlwId+dxzcASzI/Q6AQxfJRNxcrBnZGrUmjymVQKY
         zo9E64ZwwE9IY9q6yO/Zdm44jV2eUgqYM03da7M/nRgVAS4TkO0RQm5HKKi6cqx18fB4
         LQmVlo0nqJDj7QQNxL+fR13TtD0mjN+IBb+HIoRmDD0QfYyEE8ttaBaGEB6HRPQ6d/19
         0qmk+HIpfBcGkXMpTvjPAqkEfOx5P9U4TTAh0ntBZ9tgwxqWlbG0t1VYjWt+LBl9XZT/
         tTcQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrUxESw1iRMajIbgt2pggEmtbdojgO1vRbNOSfNGQx0r7kydRI9ZvFdIL2jK4zDX1gdInR/SKcD6M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8A/eIKOQp6ffc+7zmjDz6/dOETzLhlVnFONX3hFASxUL4D2sqv
	8Q8b/WJ4LnRMuI9F56RrCgCPyxHhno+2kGMddUwu59uclIBJethBd1mXvZrKuwqI5LW/LY2cb4b
	QkYXPZOUdiLk7jaKRC7puek80OXppQCr+V3BcYmJFYF/HqHf99Oae+hVFPVbPXqc=
X-Gm-Gg: AYBFou3Vu+STKoxFnt6Q1o/WKUZ51tTumVw5aAtfdlb7glL2aRmy+E9ysi9YvIwMB7B
	9+nPhwYknUENsimhL2G5DFTxar44h89Loh8D173tbIuOAsfoCRv/SidAiMOLt2hDo0l3uGsa7GR
	UZIC+nRrBkNWTiCGSScXIQPgpfQaA4RtgC+gZp5CXNIihHCtYOdJi1HhRA1YqvL+68+6e3zv+YN
	sYmZrm1USEUOSXYXSbah597K7Z79Uuql/CaWV7BgTV4vAOWGz8lpE73inWCTELEZ/2kv2fdaVqh
	x+4dYYgoG/YqXspK8abRsyxwtQHm6EGJaYXjSS3bW3xiE/5PcGeufsjbUP2q3oG8QEgw3kbmXBn
	uon7WFTbUXgQlMjaEhMTd+8kw4Uwt2ncsHDvHpEgbB0MvQXbeQnIcZtJiwBRzOP1hZC63D9vEyn
	u7M5o=
X-Received: by 2002:a17:90a:4084:b0:3b0:9a1b:b6fe with SMTP id 98e67ed59e1d1-3b09a1bb8abmr476674a91.62.1793768930845;
        Tue, 03 Nov 2026 21:08:50 -0800 (PST)
X-Received: by 2002:a17:90a:4084:b0:3b0:9a1b:b6fe with SMTP id 98e67ed59e1d1-3b09a1bb8abmr476654a91.62.1793768930307;
        Tue, 03 Nov 2026 21:08:50 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b095314e85sm1830242a91.15.2026.11.03.21.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 21:08:49 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 10:37:35 +0530
Subject: [PATCH v2 3/4] clk: qcom: av1ecc-glymur: Add AV1E clock controller
 driver
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-glymur-av1ecc-v2-3-7c25a73fe811@oss.qualcomm.com>
References: <20261104-glymur-av1ecc-v2-0-7c25a73fe811@oss.qualcomm.com>
In-Reply-To: <20261104-glymur-av1ecc-v2-0-7c25a73fe811@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyMCBTYWx0ZWRfX4sENubECCalt
 Kx2qQE/uCIXa5Ci/PxDu2rZEHEfH+rD2JLcZxlRpobUnOcqfUs6Zd8QSuL3KgDw5RoiXK4H+AJ1
 K0Osai3YyHmNiYvwk0c33HX5YYKVxGbPDb55tUsyfuCXvhEuakcsHx1R8Z7cYFxYdgbRUVXYdlM
 WvcgAfuj9HPrCIlqd5xhkCPNKb0WoJSI0TIsSqRARwwcWkIjkQP/FIfp3E89ESQKrpO9rRf+baI
 SEMDXHQlqGeyV+edVVkI9uVWZyye7p5GsGjy+HABJ4egh0w7702nxrcNK99H3Qdgj3gNhFSz43U
 rvxFbVNlHjE2mNwhEph8y3EujpLnjlh401C99BKREwEHfryYyQYSDJ0jtWnlzvGnYC/o6fFk4+a
 vcOHarG5yRkn64J1MtiRaNaMbtno5tezNZ0RsPyvhtp/ybAr4rYCc6/gPzyXpcRMhOlaIBPToWy
 vDQT7cw25aUR6F0K4Sw==
X-Proofpoint-GUID: RufIAqFQWmyrl4Hp26rjWJIyvykfssQs
X-Authority-Analysis: v=2.4 cv=Yoya1IYX c=1 sm=1 tr=0 ts=6aeabde4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=hq77mm9E1D9dZevUziYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyMCBTYWx0ZWRfX1zR2mJ/u6czb
 Qx7bNvcicrpSQ7KE0f7YUzb/bV2rdhiYMRObzUpNk+tzqOjJUZIVPMzDbpxaHzwzcIyk/gkm4ox
 2sr2ecOa5d24OlqyVP+av+OMO6s1J9A=
X-Proofpoint-ORIG-GUID: RufIAqFQWmyrl4Hp26rjWJIyvykfssQs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040020

Add support for the AV1 encoder clock controller (AV1ECC) driver
for clients to be able to request for AV1ECC clocks on Qualcomm
Glymur platform.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig         |  11 ++
 drivers/clk/qcom/Makefile        |   1 +
 drivers/clk/qcom/av1ecc-glymur.c | 393 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 405 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 27d0ab24d50a4ca5587ed8d6085c4d6fcd57eb8c..94f3445f6bd0ecd297d83b5804ff0e4433d48261 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -69,6 +69,17 @@ config CLK_ELIZA_TCSRCC
 	  Support for the TCSR clock controller on Eliza devices.
 	  Say Y if you want to use peripheral devices such as USB/PCIe/UFS.
 
+config CLK_GLYMUR_AV1ECC
+	tristate "Glymur AV1E Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_GLYMUR_GCC
+	default m if ARCH_QCOM
+	help
+	  Support for the video AV1 encoder clock controller on
+	  Qualcomm Technologies, Inc. Glymur devices.
+	  Say Y if you want to support functionality such as AV1
+	  encoding.
+
 config CLK_GLYMUR_CAMCC
 	tristate "Glymur Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 6affb5073f269d18f1b78d6c7f92e14baeade1e5..61d4efb7547146544902dddf52e4853d073d5467 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_CLK_ELIZA_GPUCC) += gpucc-eliza.o
 obj-$(CONFIG_CLK_ELIZA_TCSRCC) += tcsrcc-eliza.o
 obj-$(CONFIG_CLK_ELIZA_VIDEOCC) += videocc-eliza.o
 obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
+obj-$(CONFIG_CLK_GLYMUR_AV1ECC) += av1ecc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_CAMCC) += camcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_EVACC) += evacc-glymur.o
diff --git a/drivers/clk/qcom/av1ecc-glymur.c b/drivers/clk/qcom/av1ecc-glymur.c
new file mode 100644
index 0000000000000000000000000000000000000000..e59c8ecef44543f6c2c79f3f44f838fca8c142ab
--- /dev/null
+++ b/drivers/clk/qcom/av1ecc-glymur.c
@@ -0,0 +1,393 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,glymur-av1ecc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+enum {
+	DT_BI_TCXO,
+	DT_IFACE,
+};
+
+enum {
+	P_AV1E_CC_PLL0_OUT_EVEN,
+	P_AV1E_CC_PLL0_OUT_MAIN,
+	P_AV1E_CC_PLL0_OUT_ODD,
+	P_BI_TCXO,
+};
+
+static const struct pll_vco taycan_eko_t_vco[] = {
+	{ 249600000, 2500000000, 0 },
+};
+
+/* 600.0 MHz Configuration */
+static const struct alpha_pll_config av1e_cc_pll0_config = {
+	.l = 0x1f,
+	.cal_l = 0x48,
+	.alpha = 0x4000,
+	.config_ctl_val = 0x25c400e7,
+	.config_ctl_hi_val = 0x0a8060e0,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000008,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll av1e_cc_pll0 = {
+	.offset = 0x0,
+	.config = &av1e_cc_pll0_config,
+	.vco_table = taycan_eko_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eko_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "av1e_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eko_t_ops,
+		},
+	},
+};
+
+static const struct parent_map av1e_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_AV1E_CC_PLL0_OUT_MAIN, 1 },
+	{ P_AV1E_CC_PLL0_OUT_ODD, 2 },
+	{ P_AV1E_CC_PLL0_OUT_EVEN, 3 },
+};
+
+static const struct clk_parent_data av1e_cc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &av1e_cc_pll0.clkr.hw },
+	{ .hw = &av1e_cc_pll0.clkr.hw },
+	{ .hw = &av1e_cc_pll0.clkr.hw },
+};
+
+static const struct parent_map av1e_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+};
+
+static const struct clk_parent_data av1e_cc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct freq_tbl ftbl_av1e_cc_av1e_core_clk_src[] = {
+	F(300000000, P_AV1E_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	F(400000000, P_AV1E_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	F(600000000, P_AV1E_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 av1e_cc_av1e_core_clk_src = {
+	.cmd_rcgr = 0x4018,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = av1e_cc_parent_map_0,
+	.freq_tbl = ftbl_av1e_cc_av1e_core_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "av1e_cc_av1e_core_clk_src",
+		.parent_data = av1e_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(av1e_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_av1e_cc_av1e_xo_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 av1e_cc_av1e_xo_clk_src = {
+	.cmd_rcgr = 0x601c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = av1e_cc_parent_map_1,
+	.freq_tbl = ftbl_av1e_cc_av1e_xo_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "av1e_cc_av1e_xo_clk_src",
+		.parent_data = av1e_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(av1e_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_regmap_div av1e_cc_av1e_noc_ahb_div_clk_src = {
+	.reg = 0x5020,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "av1e_cc_av1e_noc_ahb_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&av1e_cc_av1e_core_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch av1e_cc_ahb_clk = {
+	.halt_reg = 0x6000,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x6000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "av1e_cc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&av1e_cc_av1e_noc_ahb_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch av1e_cc_av1e_core_apb_clk = {
+	.halt_reg = 0x4044,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4044,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "av1e_cc_av1e_core_apb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&av1e_cc_av1e_core_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch av1e_cc_av1e_core_axi_clk = {
+	.halt_reg = 0x4040,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4040,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "av1e_cc_av1e_core_axi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&av1e_cc_av1e_core_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch av1e_cc_av1e_core_clk = {
+	.halt_reg = 0x4030,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4030,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "av1e_cc_av1e_core_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&av1e_cc_av1e_core_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch av1e_cc_av1e_gdsc_noc_ahb_clk = {
+	.halt_reg = 0x5024,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5024,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "av1e_cc_av1e_gdsc_noc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&av1e_cc_av1e_noc_ahb_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch av1e_cc_av1e_noc_ahb_clk = {
+	.halt_reg = 0x5028,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x5028,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "av1e_cc_av1e_noc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&av1e_cc_av1e_noc_ahb_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch av1e_cc_av1e_noc_core_axi_clk = {
+	.halt_reg = 0x5004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "av1e_cc_av1e_noc_core_axi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&av1e_cc_av1e_core_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch av1e_cc_av1e_noc_xo_clk = {
+	.halt_reg = 0x6038,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x6038,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "av1e_cc_av1e_noc_xo_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&av1e_cc_av1e_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc av1e_cc_core_gdsc = {
+	.gdscr = 0x4004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "av1e_cc_core_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct clk_regmap *av1e_cc_glymur_clocks[] = {
+	[AV1E_CC_AHB_CLK] = &av1e_cc_ahb_clk.clkr,
+	[AV1E_CC_AV1E_CORE_APB_CLK] = &av1e_cc_av1e_core_apb_clk.clkr,
+	[AV1E_CC_AV1E_CORE_AXI_CLK] = &av1e_cc_av1e_core_axi_clk.clkr,
+	[AV1E_CC_AV1E_CORE_CLK] = &av1e_cc_av1e_core_clk.clkr,
+	[AV1E_CC_AV1E_CORE_CLK_SRC] = &av1e_cc_av1e_core_clk_src.clkr,
+	[AV1E_CC_AV1E_GDSC_NOC_AHB_CLK] = &av1e_cc_av1e_gdsc_noc_ahb_clk.clkr,
+	[AV1E_CC_AV1E_NOC_AHB_CLK] = &av1e_cc_av1e_noc_ahb_clk.clkr,
+	[AV1E_CC_AV1E_NOC_AHB_DIV_CLK_SRC] = &av1e_cc_av1e_noc_ahb_div_clk_src.clkr,
+	[AV1E_CC_AV1E_NOC_CORE_AXI_CLK] = &av1e_cc_av1e_noc_core_axi_clk.clkr,
+	[AV1E_CC_AV1E_NOC_XO_CLK] = &av1e_cc_av1e_noc_xo_clk.clkr,
+	[AV1E_CC_AV1E_XO_CLK_SRC] = &av1e_cc_av1e_xo_clk_src.clkr,
+	[AV1E_CC_PLL0] = &av1e_cc_pll0.clkr,
+};
+
+static struct gdsc *av1e_cc_glymur_gdscs[] = {
+	[AV1E_CC_CORE_GDSC] = &av1e_cc_core_gdsc,
+};
+
+static const struct qcom_reset_map av1e_cc_glymur_resets[] = {
+	[AV1E_CC_AV1E_CORE_AXI_CLK_ARES] = { 0x4040, 2 },
+	[AV1E_CC_AV1E_CORE_CLK_ARES] = { 0x4030, 2 },
+	[AV1E_CC_AV1E_GDSC_NOC_AHB_CLK_ARES] = { 0x5024, 2 },
+	[AV1E_CC_AV1E_NOC_CORE_AXI_CLK_ARES] = { 0x5004, 2 },
+	[AV1E_CC_AV1E_NOC_XO_CLK_ARES] = { 0x6038, 2 },
+	[AV1E_CC_CORE_BCR] = { 0x4000 },
+	[AV1E_CC_NOC_BCR] = { 0x5000 },
+};
+
+static struct clk_alpha_pll *av1e_cc_glymur_plls[] = {
+	&av1e_cc_pll0,
+};
+
+static const u32 av1e_cc_glymur_critical_cbcrs[] = {
+	0x6034, /* AV1E_CC_AV1E_CC_XO_CLK */
+	0x6054, /* AV1E_CC_SLEEP_CLK */
+};
+
+static const struct regmap_config av1e_cc_glymur_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0xa01c,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_driver_data av1e_cc_glymur_driver_data = {
+	.alpha_plls = av1e_cc_glymur_plls,
+	.num_alpha_plls = ARRAY_SIZE(av1e_cc_glymur_plls),
+	.clk_cbcrs = av1e_cc_glymur_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(av1e_cc_glymur_critical_cbcrs),
+};
+
+static const struct qcom_cc_desc av1e_cc_glymur_desc = {
+	.config = &av1e_cc_glymur_regmap_config,
+	.clks = av1e_cc_glymur_clocks,
+	.num_clks = ARRAY_SIZE(av1e_cc_glymur_clocks),
+	.resets = av1e_cc_glymur_resets,
+	.num_resets = ARRAY_SIZE(av1e_cc_glymur_resets),
+	.gdscs = av1e_cc_glymur_gdscs,
+	.num_gdscs = ARRAY_SIZE(av1e_cc_glymur_gdscs),
+	.use_rpm = true,
+	.driver_data = &av1e_cc_glymur_driver_data,
+};
+
+static const struct of_device_id av1e_cc_glymur_match_table[] = {
+	{ .compatible = "qcom,glymur-av1ecc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, av1e_cc_glymur_match_table);
+
+static int av1e_cc_glymur_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &av1e_cc_glymur_desc);
+}
+
+static struct platform_driver av1e_cc_glymur_driver = {
+	.probe = av1e_cc_glymur_probe,
+	.driver = {
+		.name = "av1ecc-glymur",
+		.of_match_table = av1e_cc_glymur_match_table,
+	},
+};
+
+module_platform_driver(av1e_cc_glymur_driver);
+
+MODULE_DESCRIPTION("QTI AV1ECC Glymur Driver");
+MODULE_LICENSE("GPL");

-- 
2.56.0

