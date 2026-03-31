Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5AD282F06
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 00:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774917315; cv=none; b=sQwjpgddLo+vaM00PCprFpzXw5SNWF5EA0VY/yzW3/lp4aftUgOQsDt3QrkBpYW3xCm9X74q4xKJTGO8HKYkj02n11Htdn86BlIpP3pBHr3V5rla/yNCzjdubaVapmV6HlSOGQUjdEH9arHQSTh5eXyMNTWW69gg1NFHNs0R64E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774917315; c=relaxed/simple;
	bh=uoB/7/VJQCCuz6UU3me/9P7IrBdCZ9zglmK0FhN9UqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tpvo4FjJIfZnDiRdABgIPpoZw7fvAX6BAib+u9RQTzlZne8EQupOyfAjFMP8ZY6uz0XnqxSTDBBH1gpTcmKvmG8Un0yGlUjRzkGk/pNXU24itrQod/4kYzbN07dbLUMiI8wB/mFnFnjMuXXPKtC+PNBEAToNpcRFMDYNzoextMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M183uvYT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jkiA9Uqh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M183uvYT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jkiA9Uqh"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ULkQBC1090309
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 00:35:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FuCz14FjSQ1P7UxRz/XgEzrDV/o5Ui2/RaOcgNLqYns=; b=M183uvYT1tIEtVFZ
	6PsaP+A8NC59pitdFWRtEX01G/yjiSeuseeLZpAsxjp8eWNuG0089wUSHAQZvQSD
	GFnoUdNXj8Yy7CkTsXP1bu7AWwiRAAD7Rac+A5XPuhoLHDJqpL/RrZ/fnTHHHK+g
	FHQ7Sr0nFz3l8+4E2KnPPrF6v73J+U57cgnPAw0PJSl6o10OK6TxISIpCzDDAF86
	vpfOtpNsbqjwGmbzgRaYfDHCL3wdocrEEXxiZp9GyEG5s2Dy2GifAMo1Il1+b5ht
	+J40Bw1t5rb9S6GPelGhreJXyu72972HxoxNiP2O3PXi8r5hYrbdN9ebt3SVis+g
	BfcICA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7trd249f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 00:35:13 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c18175fc54so15450078eec.1
        for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 17:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774917313; x=1775522113; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FuCz14FjSQ1P7UxRz/XgEzrDV/o5Ui2/RaOcgNLqYns=;
        b=jkiA9UqheAbP5O7oCwQnyx4OLYHu3cEtON6uFVl8bm5/6eAM3W0epRCKvqXS/DVHEA
         d6DFSriThJ0Q0lz1dhYPynayRerIpjKca0tPmi530cb4mAzzIsTq21lDZeJ1KCAyL1ZV
         jQD2PDJq2boc97tjJMk6KV37gdOs3JtiqdafCBNYz3M+vLUxJl8UghNBZ5yBDVZAyYb1
         eQLHp/JP7FTa7dTDdceKoqyZ4rvzzagQ/NXwX9ChuUYuCwxif8L8zvJQfItDBJL7iwVw
         +ii8CwZHXfTD1jWQP8NFNhStUZ0rTQe7pzxj4HFEmnhCYvallpPZxTA2TjsQYe4jAHBj
         1ItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774917313; x=1775522113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FuCz14FjSQ1P7UxRz/XgEzrDV/o5Ui2/RaOcgNLqYns=;
        b=VQOD2A9kNOu+cOrRZfm8JyvIhvTsmFsq48/ZKX75nKqvssrUtcXY9T4jp0OkCdNKNu
         z+AqoX+cGmXbPIEDBk/qbbU1QjPpUnRT5uWn3AV5tR2zw17+dUNZMh3vZv/4vHPiwjcV
         f/7OUToqeWqzj+3swEgh00IqgYS+rYJ2ztt9TofsII9Gb7ZRV9j1XXTuoDpzzlQ8qxV6
         sEY/3cqBq79SkDAQd60gwGciL3dN5AxuYB1YhenirRRrQBjfwiC4HUGrGi412v3DMNEW
         eH3l4GKIZ1UYHnsoPtMXTUkEQ7DmOqM5Dqll71P+rUz6FqxNkgHGfrGhA8PniOGURRH6
         0nMw==
X-Forwarded-Encrypted: i=1; AJvYcCUVigC5LGsBifnL6cEd3Ca41uQRkwGki5kxWoaR+lv3ZQHxcXyIUr1pDX9gV8pK/0XE0uSqTx9jX2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKhtAnCk7dnFXMpN+qsjvOgI3Ysg4zAeGI0MLCJelRMTLs2ALO
	4J783RlCjnh7HZT2smZTAgTa8k0oy6WI+Z9ct6pzzCbKwqrtmUEzMBfedxaKNxyadi+02AYmVoo
	EHWi1AozOxvBh+sPeULeTfwNt5poON6O/4jtJsRySznzD/AoZWyuauf2BjUETlUQ=
X-Gm-Gg: ATEYQzzjxynLEGm7xn/aFcZ2+m/WZApNSsPMScyzxorSelvbF2hywpUgkklRfrfnjkh
	ojKpAx7LKhOrwRf9djmrZO1OhVo9R5ndi66+5GefIpJ+DHhjeaMbHhIt9jMZVacr0n/BI0sKTeO
	JajnfESwJvTx/OBy3s62cHJrZirsKVWSBetSXUMoJVOLi5l+itZX2kQ7W6u3SNK0jWLOVj+IRnd
	OsNtE5xblIKCDzaF4y0Jp+8mXjfl5zOFQJuQGEr98xZV6OxkP34MuqLUSc3r9eO8QuCRqIJ12US
	sJId+vtGQLTW/ALslzCBtGgoX0TSsbQBJk5/UHFvbiMQwdIvQMgrMyTBnozMTvijyo89dp5ZdVD
	D5VKvM8fpkuAe6ja/ovgkj8D0i9zEqH0ijIDbM7gSNVtx4vD1B1IINrH42c9/hoin12HdHYr/Z3
	QX
X-Received: by 2002:a05:7300:6d22:b0:2b7:32a6:82d1 with SMTP id 5a478bee46e88-2c185df79edmr8574223eec.13.1774917313134;
        Mon, 30 Mar 2026 17:35:13 -0700 (PDT)
X-Received: by 2002:a05:7300:6d22:b0:2b7:32a6:82d1 with SMTP id 5a478bee46e88-2c185df79edmr8574208eec.13.1774917312632;
        Mon, 30 Mar 2026 17:35:12 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c6e9c088sm8454529eec.21.2026.03.30.17.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 17:35:12 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 17:34:57 -0700
Subject: [PATCH 2/7] dt-bindings: clock: qcom: Add Hawi TCSR clock
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-clk-hawi-v1-2-c2a663e1d35b@oss.qualcomm.com>
References: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
In-Reply-To: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774917310; l=1964;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=uoB/7/VJQCCuz6UU3me/9P7IrBdCZ9zglmK0FhN9UqY=;
 b=ZL1dkE3tL0WE/2xJ4UE9aNjwD8EM71tvYVh68FemJCc2SdogKJdEYHe+j9x2tIkDU4ccbcFpA
 R1zGZt1ejNiAwAEUju/UCleDyg2VDlr8AOWnmZaT8bQ3ngyJ6TMCZTg
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-GUID: y_UqtXF4_6qqcsY74sDx5EEHK7Lrgczk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDAwMyBTYWx0ZWRfX67wtLP13dXTy
 NRTykf7v/PNMEx3MXpckxeSZ1IaO16FQG28UUJ/YaOI771LCtRY0r9cpgzUil17YrtTlc/BKwdZ
 dqWy+VsHI0SZ8QIbHIeAQdBsTWHE3dX/tu0O8h5wldznfSFscZaPnHk3rs2XI3Mpl2eJKOrAZ68
 i/lF086e3uzcdXuwlJtaXHXiVNPVl5IZpxBX4tH76UCRoc22uqBp0L//2TWgQs6eLCy/iZtbpUL
 MlQOekSjCdtT4xtVtf9u8c6U8qYSPwjkqMYGJR2iimwIpXUffuzpmzx5u1Gc9af+jeXvfE9MlVG
 ZpEfmwSSMjv//kjosvwHMI4CEzM19y1joapStdBDAoAaV2L8X+OZjHr8kPQP7f5As2yLSYKgHeq
 xv8eVq7jnpYbDgTH2i12q2pafvn1fGPF1U9kXueyBUZiZe1x9MAStKf80LmNQvqtlwYf2YiEtOj
 6ZlngS500GSyZt6PsLQ==
X-Proofpoint-ORIG-GUID: y_UqtXF4_6qqcsY74sDx5EEHK7Lrgczk
X-Authority-Analysis: v=2.4 cv=H8/WAuYi c=1 sm=1 tr=0 ts=69cb16c1 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=GhicybczBOgKxo7yvssA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1011 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310003

Add bindings documentation for TCSR clock controller on the Hawi SoC.

Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,sm8550-tcsr.yaml      |  2 ++
 include/dt-bindings/clock/qcom,hawi-tcsrcc.h             | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index ae9aef0e54e8..bec3d8b4c70a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -17,6 +17,7 @@ description: |
   See also:
   - include/dt-bindings/clock/qcom,eliza-tcsr.h
   - include/dt-bindings/clock/qcom,glymur-tcsr.h
+  - include/dt-bindings/clock/qcom,hawi-tcsrcc.h
   - include/dt-bindings/clock/qcom,sm8550-tcsr.h
   - include/dt-bindings/clock/qcom,sm8650-tcsr.h
   - include/dt-bindings/clock/qcom,sm8750-tcsr.h
@@ -27,6 +28,7 @@ properties:
       - enum:
           - qcom,eliza-tcsr
           - qcom,glymur-tcsr
+          - qcom,hawi-tcsrcc
           - qcom,kaanapali-tcsr
           - qcom,milos-tcsr
           - qcom,sar2130p-tcsr
diff --git a/include/dt-bindings/clock/qcom,hawi-tcsrcc.h b/include/dt-bindings/clock/qcom,hawi-tcsrcc.h
new file mode 100644
index 000000000000..957bc5f75bb7
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,hawi-tcsrcc.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_TCSR_CC_HAWI_H
+#define _DT_BINDINGS_CLK_QCOM_TCSR_CC_HAWI_H
+
+/* TCSR_CC clocks */
+#define TCSR_PCIE_0_CLKREF_EN					0
+#define TCSR_PCIE_1_CLKREF_EN					1
+#define TCSR_UFS_CLKREF_EN					2
+#define TCSR_USB2_CLKREF_EN					3
+#define TCSR_USB3_CLKREF_EN					4
+
+#endif

-- 
2.34.1

