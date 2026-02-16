Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7E9311940
	for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 13:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771249403; cv=none; b=bhRhAAmf7HogYB4KzzhgwdeoTSZMCIArzZxzz5vXkyu7HNLm9PPRJwaLqnGHN9qpG/JHo7UuDU9+spA/T4ICAwz0DACd9ff1t16KDhxiJTrf1SJRkWJKmY8oCzq7KavYDXDIiig9YxvPMlLODbk8J9gNY1NzBeVeuWs9ai8thCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771249403; c=relaxed/simple;
	bh=QVTybmkdt7ET3baJ/2CwGUw6pY0Jc7HwG1B/0cUaPQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ia4G2IAYbSAm6ZRv447KuogecL24RN0TE09tHeL/2PjL9G6StpgSFJdbINHLpUIWg5mxnHraFTEbCCItVFUgFN6EGMYLUTitjvHa6PmPQb+ZdrW2PnDHjRPkbvH04T21rYkOoowamuYr2gCuiI/SUw+rT3RgGB1FKvEcaXYrIyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kYVIh2tA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FPgQYFp5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kYVIh2tA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FPgQYFp5"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GB7lPL3662197
	for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 13:43:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v2Wg2VwBlodi0lED0h/KpQ0d9RtRO+Iy3lC8si0JyDc=; b=kYVIh2tAj3mpP7QT
	rVj/DxDsTfNaw5j0ggR9hvHlqskx9iK8a3cipoyE99/vaSQHZZbMnQAGUgCLaz42
	hCpVrzfLwsDJjjb1p+H2m1/rhnFsHPq50C1PQBP4SEBQ0MilB9hwWThsAjPRw9bn
	MRYyEdjyjneqXRSpgZxg7q7yYVjK3Rh9QDH6WZRj64WNViykFbgmmi0S8tBZf4em
	V6wfRGYtUdBn3ZW1ZAHZkFafPlZ/HifKpnIjpos50B4RHe5uTWtuL3032aQPglw8
	1nis8RqVe4UT2kg+eAEAf307NlifL4J7MptvjG7MSfpxuwyHEDhiRlWEfKNP40rA
	rfw8JA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cag24cqkk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 13:43:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c7166a4643so1941056585a.0
        for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 05:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771249400; x=1771854200; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v2Wg2VwBlodi0lED0h/KpQ0d9RtRO+Iy3lC8si0JyDc=;
        b=FPgQYFp5py6yoP9BE4HdGddw1EvsiJ0o9Ojl3z9UTRLxq6+oNyw835mv7tIS4UWjQF
         4DaJiOcCFoTouADhI8rZKjT8Fv2YEN7roGMhecNnLT8t17ZD4dhcOjDlPrSuIxFi+xiR
         bs2B8uu0Xw6A6LhbT2rq7O0sr/uo5opCsS7FwwDLwoW3iN6Yzw1suuWszK8zI/uEFWj5
         n1QIOGUyIgcdaiBwvNtgl4283nLAbVPVOX3m/hLMcTFw88cfqNRtHseygJ2sUbC3eO/E
         IlEl+T2XvencHSSZPaEWwHX3uGjs5///3FPUQH4WOshFxHYy9fogLeo4B7zIzWcX8z80
         pbEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771249400; x=1771854200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v2Wg2VwBlodi0lED0h/KpQ0d9RtRO+Iy3lC8si0JyDc=;
        b=YkRN+/xUYoLC+ClrWzl/+oOK6ugB5yMIGQU8CQCPRa2Eshss21qS4cXxXtrfZ5k9q4
         3QpaGnxqw7dBxWBrEUq9XJ7izaR22QOG3irj9/ad4JwvBO7tDm2zFsZo1hvMDvbIrq37
         mh+KZ9E/I+zja6z7elwK3jZN3fFbV5AwQTJ0VO/zXy2kNczPEGqv6pQq6ZRSm/jq6g9x
         6htcVJlflsNoNSOzFT/Muag6JSR1+Yh2GLkil1QPUvrpDzjuNypNpkZEMo5rRPVI2HLO
         HsYG05EMcWsDg9svjp+RZ9601jXUOtUm95jX1fIjjvS1Y9cb7EhQHU7chmqSZqKiTXpC
         LTxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyEp5+FV/16nIgZYixRR+C+l0k8sMHErBH4xw03uWyyu7G/KO521t8OV9l02O4ntcKxRKUBbYgAH8=@vger.kernel.org
X-Gm-Message-State: AOJu0YygzrFHMBxHMhyR9Yqjj0eaWhU78/6597lk3HRKZ3yRKL8eZVcV
	Ltj3CBokpnmWT+0RNWG1yyDpV6nw60YVl89ztfbOGgO4zYCF7tZa8QwE/ZTk8QmAKkW71q4GxkX
	A8g/SRdG18ostFPYSNBRNDV1+3DAd261BkEKQ6MDF2l4+ixN2C8nQmjw2u3v3H+k=
X-Gm-Gg: AZuq6aIPYEIZIdnCmWvk3KpMJyFpnpu5JuzoE3dp2SW+H1rx37DM4YWCNOqnwPSiNKI
	h8hnB8SZI87Uc/BodbARFEvE+ijwCkpSe2HnYtXdQChm5DG6HkYRIKvBfxA8bILK3hWzt52nF6L
	BDKKGK4jnqoid2Txhr63NuC59Fo/ySFeo+5+xjuJw5IHuEU5y7+p4cOTL0wFaLxbDFYflPwHQZ0
	Mq7db0go/YrqitUuZn5AW215sYGEfMExtv59wWwbz5zoLHR3QzR5US5z7+z1dMvLvp+YXej2hIu
	mUHuvK0glBuQNVSlEyfiyob63h3u/RhRMPfrlLoLBrsvzEc8DYBz/pDLKh3XVURat/gragKEvdF
	Nscl1gF+hbwx5UAQtz1HEPhjF8x3J6w==
X-Received: by 2002:a05:620a:454c:b0:8c9:fb68:b942 with SMTP id af79cd13be357-8cb422823famr1145392285a.34.1771249399892;
        Mon, 16 Feb 2026 05:43:19 -0800 (PST)
X-Received: by 2002:a05:620a:454c:b0:8c9:fb68:b942 with SMTP id af79cd13be357-8cb422823famr1145388585a.34.1771249399318;
        Mon, 16 Feb 2026 05:43:19 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a6c1bfsm28883025f8f.13.2026.02.16.05.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 05:43:18 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 15:43:03 +0200
Subject: [PATCH v3 1/6] dt-bindings: clock: qcom: document the Eliza Global
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-eliza-clocks-v3-1-8afc5a7e3a98@oss.qualcomm.com>
References: <20260216-eliza-clocks-v3-0-8afc5a7e3a98@oss.qualcomm.com>
In-Reply-To: <20260216-eliza-clocks-v3-0-8afc5a7e3a98@oss.qualcomm.com>
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
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=10237;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=vxOdVgdl1Oawmc9RM/XHsJZ9J2wuLHt6IlyUoblJpYQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpkx7tD6cJkTAIiVwGXCv545mV5ATLRIHaCyCiu
 UhyFyXzMZ2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZMe7QAKCRAbX0TJAJUV
 VtVvD/96LFE+Gtcdzib0Lj8UNg/BW7gLN6ZM8LoDls2twmVf/XFpoecQIFE82DTadTv+VQucClk
 GAYhKmnGvdLVslPNtriwvgI2pq9bHUMfyzPjJJafkbIipas9w3llGgfo+T+o9aDkH2p13+xlqyR
 iGK56aqrOiq5iQR06xhBdjcRaJl2oWI6PY44hQbBvZCCsDqh6vykgiOIbE0UyoVJ8dsdPoGBGpp
 l4+6eltuG1DHvpgUe8D+ualg0WJzLZhiGDaiPmiS1FKmMjxgnZFfu+AzGC/FatI5lsdecFg8JDW
 /UD82rRSdrCsp93aYBtgvBZXhRY3rMic2TsQzn0DAGw9tjDSS/opPtVdftAD3bAjkPtNNvv7RTf
 WmBaMxCAJqVyknbDK5FOwjPwQh5Pctt5fHyGxbMdCuy0oDpWkmaoQCrmMvZnbJBOk5TkQv3FOyx
 3kBPLJpB2iJ09uRsjI8IYItzcqlQJIt0oF0NyWYZ5zMy2AlO+qjVSvyPah6k9vvsM4MWT+6dR/G
 y+CJTOtHJAFpODvaJlHZIaRt08BZhlj4XHVcOla7aR3XhfiDtDJGCh9seWsBLbMHMi82/itMi6U
 i0ZGSFrZbFaiNIn+Y9jpJOiDzVIYYJQ0wHTm63a9MYVZxg1ctRznDVMeFQ9+j796cGuM/e1igLe
 jQGbT3+F/z4AbbA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: _e2gHCO5ZsVx2CwTShJp2lbH2kvzX_in
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDExNiBTYWx0ZWRfXyFLDpcoPVAIk
 Lv0A/4h1wfb4QDibX0VVA46Q0UbyOzcS9Vr2oBbZpF/r2Xm5WKQflkvAelIHZXLyMy0P2vySaXP
 3Jvw1WeJ3ixANpaY0/hpUeXKOK5h3BVaZ85xf2JaIrwGrLvSAweKm1MojwGg1JRIjq63PfGZnSn
 vDJC5Shc41Xkx6bgRQVjahkc1grwmxGrkcv3OZ0SPHPIM0xwKeieHZB936VkW6AA+SdRxY9y1JZ
 D8c6tajJ156wKw37896wxYhVKnN8WEVSW4HUGxhuAbnwuAnR/wCVbfL/sDU529IgNvpZb93HdvV
 SYCCQoHtyfUTvdIJaRJJn3wEMEZDjguZZ4GfXCdRPSx1VTrwkv+pt6Uv3fVzZwaTA5QqhBe5V24
 1gfVK4FpDGC5LmJr9cGHzo2F0bFUfPGxd9TPpGFUkO6RVdybcStFys/e0qARHQSmBDmEAKRyNaE
 bYvFi2f7X72cHfN8HJQ==
X-Proofpoint-ORIG-GUID: _e2gHCO5ZsVx2CwTShJp2lbH2kvzX_in
X-Authority-Analysis: v=2.4 cv=aetsXBot c=1 sm=1 tr=0 ts=69931ef8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=QqclT2NS3jCD4ft7SfEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160116

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add bindings documentation for the Global Clock Controller on Qualcomm
Eliza SoC. Reuse the Milos bindings schema since the controller resources
are exactly the same, even though the controllers are incompatible between
them.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,milos-gcc.yaml  |   9 +-
 include/dt-bindings/clock/qcom,eliza-gcc.h         | 218 +++++++++++++++++++++
 2 files changed, 225 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-gcc.yaml
index cf244c155f9a..60f1c8ca2c13 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-gcc.yaml
@@ -8,16 +8,21 @@ title: Qualcomm Global Clock & Reset Controller on Milos
 
 maintainers:
   - Luca Weiss <luca.weiss@fairphone.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
 
 description: |
   Qualcomm global clock control module provides the clocks, resets and power
   domains on Milos.
 
-  See also: include/dt-bindings/clock/qcom,milos-gcc.h
+  See also:
+   - include/dt-bindings/clock/qcom,eliza-gcc.h
+   - include/dt-bindings/clock/qcom,milos-gcc.h
 
 properties:
   compatible:
-    const: qcom,milos-gcc
+    enum:
+      - qcom,eliza-gcc
+      - qcom,milos-gcc
 
   clocks:
     items:
diff --git a/include/dt-bindings/clock/qcom,eliza-gcc.h b/include/dt-bindings/clock/qcom,eliza-gcc.h
new file mode 100644
index 000000000000..3e0ff3fb69f6
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-gcc.h
@@ -0,0 +1,218 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_ELIZA_H
+
+/* GCC clocks */
+#define GCC_AGGRE_NOC_PCIE_AXI_CLK				0
+#define GCC_AGGRE_UFS_PHY_AXI_CLK				1
+#define GCC_AGGRE_USB3_PRIM_AXI_CLK				2
+#define GCC_BOOT_ROM_AHB_CLK					3
+#define GCC_CAM_BIST_MCLK_AHB_CLK				4
+#define GCC_CAMERA_AHB_CLK					5
+#define GCC_CAMERA_HF_AXI_CLK					6
+#define GCC_CAMERA_SF_AXI_CLK					7
+#define GCC_CAMERA_XO_CLK					8
+#define GCC_CFG_NOC_PCIE_ANOC_AHB_CLK				9
+#define GCC_CFG_NOC_USB3_PRIM_AXI_CLK				10
+#define GCC_CNOC_PCIE_SF_AXI_CLK				11
+#define GCC_DDRSS_GPU_AXI_CLK					12
+#define GCC_DDRSS_PCIE_SF_QTB_CLK				13
+#define GCC_DISP_AHB_CLK					14
+#define GCC_DISP_HF_AXI_CLK					15
+#define GCC_GP1_CLK						16
+#define GCC_GP1_CLK_SRC						17
+#define GCC_GP2_CLK						18
+#define GCC_GP2_CLK_SRC						19
+#define GCC_GP3_CLK						20
+#define GCC_GP3_CLK_SRC						21
+#define GCC_GPLL0						22
+#define GCC_GPLL0_OUT_EVEN					23
+#define GCC_GPLL4						24
+#define GCC_GPLL7						25
+#define GCC_GPLL8						26
+#define GCC_GPLL9						27
+#define GCC_GPU_CFG_AHB_CLK					28
+#define GCC_GPU_GEMNOC_GFX_CLK					29
+#define GCC_GPU_GPLL0_CPH_CLK_SRC				30
+#define GCC_GPU_GPLL0_DIV_CPH_CLK_SRC				31
+#define GCC_GPU_SMMU_VOTE_CLK					32
+#define GCC_MMU_TCU_VOTE_CLK					33
+#define GCC_PCIE_0_AUX_CLK					34
+#define GCC_PCIE_0_AUX_CLK_SRC					35
+#define GCC_PCIE_0_CFG_AHB_CLK					36
+#define GCC_PCIE_0_MSTR_AXI_CLK					37
+#define GCC_PCIE_0_PHY_RCHNG_CLK				38
+#define GCC_PCIE_0_PHY_RCHNG_CLK_SRC				39
+#define GCC_PCIE_0_PIPE_CLK					40
+#define GCC_PCIE_0_PIPE_CLK_SRC					41
+#define GCC_PCIE_0_PIPE_DIV2_CLK				42
+#define GCC_PCIE_0_PIPE_DIV2_CLK_SRC				43
+#define GCC_PCIE_0_SLV_AXI_CLK					44
+#define GCC_PCIE_0_SLV_Q2A_AXI_CLK				45
+#define GCC_PCIE_1_AUX_CLK					46
+#define GCC_PCIE_1_AUX_CLK_SRC					47
+#define GCC_PCIE_1_CFG_AHB_CLK					48
+#define GCC_PCIE_1_MSTR_AXI_CLK					49
+#define GCC_PCIE_1_PHY_RCHNG_CLK				50
+#define GCC_PCIE_1_PHY_RCHNG_CLK_SRC				51
+#define GCC_PCIE_1_PIPE_CLK					52
+#define GCC_PCIE_1_PIPE_CLK_SRC					53
+#define GCC_PCIE_1_PIPE_DIV2_CLK				54
+#define GCC_PCIE_1_PIPE_DIV2_CLK_SRC				55
+#define GCC_PCIE_1_SLV_AXI_CLK					56
+#define GCC_PCIE_1_SLV_Q2A_AXI_CLK				57
+#define GCC_PCIE_RSCC_CFG_AHB_CLK				58
+#define GCC_PCIE_RSCC_XO_CLK					59
+#define GCC_PDM2_CLK						60
+#define GCC_PDM2_CLK_SRC					61
+#define GCC_PDM_AHB_CLK						62
+#define GCC_PDM_XO4_CLK						63
+#define GCC_QMIP_CAMERA_CMD_AHB_CLK				64
+#define GCC_QMIP_CAMERA_NRT_AHB_CLK				65
+#define GCC_QMIP_CAMERA_RT_AHB_CLK				66
+#define GCC_QMIP_GPU_AHB_CLK					67
+#define GCC_QMIP_PCIE_AHB_CLK					68
+#define GCC_QMIP_VIDEO_V_CPU_AHB_CLK				69
+#define GCC_QMIP_VIDEO_VCODEC_AHB_CLK				70
+#define GCC_QUPV3_WRAP1_CORE_2X_CLK				71
+#define GCC_QUPV3_WRAP1_CORE_CLK				72
+#define GCC_QUPV3_WRAP1_QSPI_REF_CLK				73
+#define GCC_QUPV3_WRAP1_QSPI_REF_CLK_SRC			74
+#define GCC_QUPV3_WRAP1_S0_CLK					75
+#define GCC_QUPV3_WRAP1_S0_CLK_SRC				76
+#define GCC_QUPV3_WRAP1_S1_CLK					77
+#define GCC_QUPV3_WRAP1_S1_CLK_SRC				78
+#define GCC_QUPV3_WRAP1_S2_CLK					79
+#define GCC_QUPV3_WRAP1_S2_CLK_SRC				80
+#define GCC_QUPV3_WRAP1_S3_CLK					81
+#define GCC_QUPV3_WRAP1_S3_CLK_SRC				82
+#define GCC_QUPV3_WRAP1_S4_CLK					83
+#define GCC_QUPV3_WRAP1_S4_CLK_SRC				84
+#define GCC_QUPV3_WRAP1_S5_CLK					85
+#define GCC_QUPV3_WRAP1_S5_CLK_SRC				86
+#define GCC_QUPV3_WRAP1_S6_CLK					87
+#define GCC_QUPV3_WRAP1_S6_CLK_SRC				88
+#define GCC_QUPV3_WRAP1_S7_CLK					89
+#define GCC_QUPV3_WRAP1_S7_CLK_SRC				90
+#define GCC_QUPV3_WRAP2_CORE_2X_CLK				91
+#define GCC_QUPV3_WRAP2_CORE_CLK				92
+#define GCC_QUPV3_WRAP2_S0_CLK					93
+#define GCC_QUPV3_WRAP2_S0_CLK_SRC				94
+#define GCC_QUPV3_WRAP2_S1_CLK					95
+#define GCC_QUPV3_WRAP2_S1_CLK_SRC				96
+#define GCC_QUPV3_WRAP2_S2_CLK					97
+#define GCC_QUPV3_WRAP2_S2_CLK_SRC				98
+#define GCC_QUPV3_WRAP2_S3_CLK					99
+#define GCC_QUPV3_WRAP2_S3_CLK_SRC				100
+#define GCC_QUPV3_WRAP2_S4_CLK					101
+#define GCC_QUPV3_WRAP2_S4_CLK_SRC				102
+#define GCC_QUPV3_WRAP2_S5_CLK					103
+#define GCC_QUPV3_WRAP2_S5_CLK_SRC				104
+#define GCC_QUPV3_WRAP2_S6_CLK					105
+#define GCC_QUPV3_WRAP2_S6_CLK_SRC				106
+#define GCC_QUPV3_WRAP2_S7_CLK					107
+#define GCC_QUPV3_WRAP2_S7_CLK_SRC				108
+#define GCC_QUPV3_WRAP_1_M_AHB_CLK				109
+#define GCC_QUPV3_WRAP_1_S_AHB_CLK				110
+#define GCC_QUPV3_WRAP_2_M_AHB_CLK				111
+#define GCC_QUPV3_WRAP_2_S_AHB_CLK				112
+#define GCC_SDCC1_AHB_CLK					113
+#define GCC_SDCC1_APPS_CLK					114
+#define GCC_SDCC1_APPS_CLK_SRC					115
+#define GCC_SDCC1_ICE_CORE_CLK					116
+#define GCC_SDCC1_ICE_CORE_CLK_SRC				117
+#define GCC_SDCC2_AHB_CLK					118
+#define GCC_SDCC2_APPS_CLK					119
+#define GCC_SDCC2_APPS_CLK_SRC					120
+#define GCC_UFS_PHY_AHB_CLK					121
+#define GCC_UFS_PHY_AXI_CLK					122
+#define GCC_UFS_PHY_AXI_CLK_SRC					123
+#define GCC_UFS_PHY_ICE_CORE_CLK				124
+#define GCC_UFS_PHY_ICE_CORE_CLK_SRC				125
+#define GCC_UFS_PHY_PHY_AUX_CLK					126
+#define GCC_UFS_PHY_PHY_AUX_CLK_SRC				127
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK				128
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK_SRC				129
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK				130
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK_SRC				131
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK				132
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK_SRC				133
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK				134
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK_SRC				135
+#define GCC_USB30_PRIM_ATB_CLK					136
+#define GCC_USB30_PRIM_MASTER_CLK				137
+#define GCC_USB30_PRIM_MASTER_CLK_SRC				138
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK				139
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK_SRC			140
+#define GCC_USB30_PRIM_MOCK_UTMI_POSTDIV_CLK_SRC		141
+#define GCC_USB30_PRIM_SLEEP_CLK				142
+#define GCC_USB3_PRIM_PHY_AUX_CLK				143
+#define GCC_USB3_PRIM_PHY_AUX_CLK_SRC				144
+#define GCC_USB3_PRIM_PHY_COM_AUX_CLK				145
+#define GCC_USB3_PRIM_PHY_PIPE_CLK				146
+#define GCC_USB3_PRIM_PHY_PIPE_CLK_SRC				147
+#define GCC_VIDEO_AHB_CLK					148
+#define GCC_VIDEO_AXI0_CLK					149
+#define GCC_VIDEO_AXI1_CLK					150
+#define GCC_VIDEO_XO_CLK					151
+
+/* GCC power domains */
+#define GCC_PCIE_0_GDSC						0
+#define GCC_PCIE_0_PHY_GDSC					1
+#define GCC_PCIE_1_GDSC						2
+#define GCC_PCIE_1_PHY_GDSC					3
+#define GCC_UFS_MEM_PHY_GDSC					4
+#define GCC_UFS_PHY_GDSC					5
+#define GCC_USB30_PRIM_GDSC					6
+#define GCC_USB3_PHY_GDSC					7
+
+/* GCC resets */
+#define GCC_CAMERA_BCR						0
+#define GCC_DISPLAY_BCR						1
+#define GCC_GPU_BCR						2
+#define GCC_PCIE_0_BCR						3
+#define GCC_PCIE_0_LINK_DOWN_BCR				4
+#define GCC_PCIE_0_NOCSR_COM_PHY_BCR				5
+#define GCC_PCIE_0_PHY_BCR					6
+#define GCC_PCIE_0_PHY_NOCSR_COM_PHY_BCR			7
+#define GCC_PCIE_1_BCR						8
+#define GCC_PCIE_1_LINK_DOWN_BCR				9
+#define GCC_PCIE_1_NOCSR_COM_PHY_BCR				10
+#define GCC_PCIE_1_PHY_BCR					11
+#define GCC_PCIE_1_PHY_NOCSR_COM_PHY_BCR			12
+#define GCC_PCIE_PHY_BCR					13
+#define GCC_PCIE_PHY_CFG_AHB_BCR				14
+#define GCC_PCIE_PHY_COM_BCR					15
+#define GCC_PCIE_RSCC_BCR					16
+#define GCC_PDM_BCR						17
+#define GCC_QUPV3_WRAPPER_1_BCR					18
+#define GCC_QUPV3_WRAPPER_2_BCR					19
+#define GCC_QUSB2PHY_PRIM_BCR					20
+#define GCC_QUSB2PHY_SEC_BCR					21
+#define GCC_SDCC1_BCR						22
+#define GCC_SDCC2_BCR						23
+#define GCC_UFS_PHY_BCR						24
+#define GCC_USB30_PRIM_BCR					25
+#define GCC_USB3_DP_PHY_PRIM_BCR				26
+#define GCC_USB3_DP_PHY_SEC_BCR					27
+#define GCC_USB3_PHY_PRIM_BCR					28
+#define GCC_USB3_PHY_SEC_BCR					29
+#define GCC_USB3PHY_PHY_PRIM_BCR				30
+#define GCC_USB3PHY_PHY_SEC_BCR					31
+#define GCC_VIDEO_AXI0_CLK_ARES					32
+#define GCC_VIDEO_AXI1_CLK_ARES					33
+#define GCC_VIDEO_BCR						34
+#define GCC_CAMERA_HF_AXI_SLP_STG_ARES				37
+#define GCC_CAMERA_SF_AXI_SLP_STG_ARES				38
+#define GCC_CAMERA_HF_AXI_SEL_SLP_STG_ARES			39
+#define GCC_CAMERA_SF_AXI_SEL_SLP_STG_ARES			40
+#define GCC_CAMERA_HF_CLK_EN_SLP_STG				41
+#define GCC_CAMERA_SF_CLK_EN_SLP_STG				42
+#define GCC_CAMERA_HF_CLK_EN_SEL_SLP_STG			43
+#define GCC_CAMERA_SF_CLK_EN_SEL_SLP_STG			44
+
+#endif

-- 
2.48.1

