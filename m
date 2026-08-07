Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD2B44E021
	for <linux-clk@vger.kernel.org>; Fri,  7 Aug 2026 06:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786085602; cv=none; b=VrjFLCmWfbT7efrLRrlZP9zE18Sqg8Rnio7ajfrF75fIjpTUsdWITSYaPlJhbxguRHXE0L4d7T5DCGSe04428040WZUu2G+etyS446WzNvu/gzrDyNT7iCcCyT4wNrW5gBQkJuZneDoh8n2u0oeZgSuJ8XMck8m0vbfQ4yfwcqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786085602; c=relaxed/simple;
	bh=OmaK7bW37P3eyItSwg18nRl9g7bQTw6jSi8315C8gbI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TBd7wekDVvF9/AzdwuqywapadtIUN4wBN1469h1sIIsZTxo14JKFKlUDsYvmOcGyunrUBIFd5a/y4j49ymZxvs7fvk3qCo00oVbYGep9OCoGIzCNd7zGisgdsgotWeYsq4Vk2RwzUocbLde7TPqgs+iNruxCvWxcUViyD4l3dPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h0IrTyXY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FGj0LSLe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h0IrTyXY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FGj0LSLe"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6770GauJ3176962
	for <linux-clk@vger.kernel.org>; Fri, 7 Aug 2026 06:53:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HYw5UkdMRwpjTZEowMSfHMuoGLq532YdN1bxt1k3YXQ=; b=h0IrTyXYv+o96Lqg
	wXeXSYNo+yDJFT0l2Z1bpbBiwWoKlgUKjcC8jfE4/KgStBvVFnW+/tYXQbjqIsIh
	jCVWi6EEp2maQMBfPpiWP/yE6DejTWZXA7jNyaUgolvbLn+4r4w6LHv37in0uXqF
	DAUG4A1/+Y8J02DQoBKJJ5KpUPxKeaY4wm1x9uPLqkaWL8epUKqsPNJrW6Qx+P//
	+N1ne/zI6U4mu1OIHV7BwKPX7g+p/xTI7EMB5K5OxDeyn4B4NFyq5stAgvoS06ys
	1oLNBDOdOb1hNRaMPLKMTy4oqcj9NyQ0hqwAHX4io3K8FtnFsTvJTVqmRJn+GSvi
	7koYSA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6jjkj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 07 Aug 2026 06:53:20 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so6654252a91.2
        for <linux-clk@vger.kernel.org>; Thu, 06 Aug 2026 23:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786085600; x=1786690400; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HYw5UkdMRwpjTZEowMSfHMuoGLq532YdN1bxt1k3YXQ=;
        b=FGj0LSLeJ4PaDPh/dsa3WF8RKLsTVGWjcS/d/SRI1lwHSoLvGWJwYJPVicbcWlGZ2Z
         /vmhDom7Pwq80Bm8ZFOyqlEhcuIS0pfY96m/fWKAptYUDCQLIYgPFdaPa8uRIm+ItBGm
         6twVXVJVjlrIfQGwEF82VbnaX5pfe1oMqtp02x+w5jtGgmwnxQ0JzE7LgND3jpCyHr3x
         SP8eTMAja7v/CE0Nzb5HQrJxHzdSGv2cj5MHV3dJ2bzXYD6TbRkScaGTgXVkdLxzasPz
         UondeDl4E1tE41PV5cS6a7Xfy+udmDjUBV0L0AAeE4lHFhvOGH8XYQA9Sq27kdX4bbQb
         kcTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786085600; x=1786690400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HYw5UkdMRwpjTZEowMSfHMuoGLq532YdN1bxt1k3YXQ=;
        b=da/LlywD1ZDc540/mE2eKpESraq3LOfbyEm7Ui9cS3w7/L08Z5UqRm+PVZ2VDCug/i
         AZ1r6xYhqmL4ZXaqZIzpxZjl98TxxXmIHasxT4c69iTY10Pj4GOHcdBRsc7j+vaUzOQr
         pjkb6mAhr4lNt65I/HzJFeXvLKb+91kqvyDWvo/tBgC87b0ZPNgFTph4W2ym/BuM+CPA
         JwHz/HE7m9+8zG6fBPRcSRsUjrhBRLN7ijAWXDNXcZC/qwsm3vEQto1DFTz8v32BqkLn
         bx/z9mDZIe2j43em5MPVxtjJgIzxpoCgwviJk4GkuZSwAlF4udsXqK88VW53/ZuvcKJM
         BcLg==
X-Forwarded-Encrypted: i=1; AHgh+Rr+b4zn8bagdDMH4u6mQMcHaAXKTaPpTNERLSLrsRfCGxleIbESnB8JHKC2iT0ue8CZ/MfzOptxDqg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7DxJNgFv3hXDvfdrDC+JlSMyNQeUoDTJfgUzDsyrHVgNhwNPj
	y5MmGG6jS17GXM4N6lty1w2sLzXERbX46+MqT/UiNzTmLymsoY0XPKE7n/PJ7QqRgkjNdE6YEag
	P2essn8qMT1Jr5x7UyJ9LhiOi/KjhVY/N+FRfzmrny5iKRcPaxSmYtVc4O9IveTg=
X-Gm-Gg: AR+sD11fHCRPLJUqxhWQ7n0G1L0jQrdw6ITrKsUDQZPijBbUxtyoN4v2IT0K+CcaISm
	I7PToBymR7PTMPaVFI1dyCAhoH9NgJrGVeYzf6gRa1UG4ok4Eu1w4l8yx5brIOTo8mDW0R7WW1C
	s2Jf/+xDLUVhx8m0VXgQzMm9oEmWmZlEE2hb43zxCE+2l+RUCiY2nJBsGKaGoHU+rhgcwznz3N8
	Q8Kt/z+1z1Q6wruw9blUVb/mBsI0Wf2nn4Tp1g9jYBXVcaarb87OaAMSAg+X4IbQPWCXm1KehCV
	OMr5TENr98a8iMSPRYT/gJS9Hfi1/p7TdGKjEkV3h7pXQHAG/fPZops/3te6ZhkA5qwI2Sh+u5D
	3wq31Q1hC5o7v60NTqAPeUapqx0pynKZ5WhooIfu/NxE=
X-Received: by 2002:a05:6a20:9f09:b0:3b4:8f57:3205 with SMTP id adf61e73a8af0-3cbc04eb981mr2541193637.36.1786085599996;
        Thu, 06 Aug 2026 23:53:19 -0700 (PDT)
X-Received: by 2002:a05:6a20:9f09:b0:3b4:8f57:3205 with SMTP id adf61e73a8af0-3cbc04eb981mr2541150637.36.1786085599577;
        Thu, 06 Aug 2026 23:53:19 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f19842bsm223493a12.4.2026.08.06.23.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:53:19 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 23:53:06 -0700
Subject: [PATCH v2 02/12] dt-bindings: clock: qcom: Add CMN PLL support for
 IPQ5210 SoC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-qcom_ipq5210_cmnpll-v2-2-cce718b8ec17@oss.qualcomm.com>
References: <20260806-qcom_ipq5210_cmnpll-v2-0-cce718b8ec17@oss.qualcomm.com>
In-Reply-To: <20260806-qcom_ipq5210_cmnpll-v2-0-cce718b8ec17@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luo Jie <jie.luo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786085594; l=2318;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=OmaK7bW37P3eyItSwg18nRl9g7bQTw6jSi8315C8gbI=;
 b=yOoaek9BDb11MNV8USUdJLvsqlMZnxzTiKqvsO00m0m9rGb0cCjxByTIxHbYT+GMJGZd+DDhs
 +JFmoSMfphpDkOTNSVDG5K3IKV5/h3Zx0qsZRmta3UaJ8aQWjL5+zP7
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA1MCBTYWx0ZWRfX5wuZaOWPAxJi
 vWf6FHWIT7iBg7vfPWioAn1S8BvlDpJsFd58A/EXtC2K4OoOurkjC+3wOsW7rTI6rZrh1mkHhvH
 IsnvJApzZVMEp/KjA2p0pSD1pwNFCCRyse5kRWqu4SpzhnjW+rLiahSaZ2attTTnYj66zrsCsL3
 BWiB1M33qws7C3gzCIBrH47w7ECJksWiocTNx0sh9nwe16j9og9rv7Bji08l2FrUU6w6B6kxIJW
 ZOFHVID9BNa2V824vy2OG6oGxLg5CxcetP0r2+wLkm/JXhnMv7BF1KGZlKASLw1vBibI/0qzza5
 9ZKHqgxC9k9bI3P4DEOfTNP3wa+k/Ow8O7n3HQ8Q/YVpYPt9d/0O8kcEDtRwHOGfZ8Tw5Q5EZia
 TBlkOZ1hPSQf9IU+VKIlsNzySyoPDGolq372ZVu18ocimcMpRkJ+/zIeDZMG7M02oMg85SvXt9e
 TWU5mcYO9sI9cuPNmQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA1MCBTYWx0ZWRfX5a1LS9NNQdBw
 ZDOLaekav9TPFk58awcxXMfeIzcFWbpMS5qVhP9WelloAHdKm7Ec7YoXfWuO6jdkLXIEZ/TgLAQ
 Y8hz94mNFcutIaPXle32kHrXGgzik3k=
X-Proofpoint-ORIG-GUID: c9_sI_lltnIfyraQT2jL58R3skTMvrZ5
X-Proofpoint-GUID: c9_sI_lltnIfyraQT2jL58R3skTMvrZ5
X-Authority-Analysis: v=2.4 cv=e5Y2j6p/ c=1 sm=1 tr=0 ts=6a7580e0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=JRX5g_4sfBZTL3UlNIAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070050

Add the compatible string for the IPQ5210 CMN PLL clock controller and
the dt-bindings clock ID header for IPQ5210.

The IPQ5210 CMN PLL supplies configurable clocks to the NSS (network
subsystem), PPE (packet process engine), and PON (passive optical
network) hardware blocks. It also supplies a raw EPHY output clock for
the integrated Ethernet PHY and several gated fixed-rate outputs to
Ethernet PHY and switch devices.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       |  1 +
 include/dt-bindings/clock/qcom,ipq5210-cmn-pll.h   | 30 ++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
index a4f9af8fa187..91e17f126a9b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
@@ -25,6 +25,7 @@ properties:
   compatible:
     enum:
       - qcom,ipq5018-cmn-pll
+      - qcom,ipq5210-cmn-pll
       - qcom,ipq5332-cmn-pll
       - qcom,ipq5424-cmn-pll
       - qcom,ipq6018-cmn-pll
diff --git a/include/dt-bindings/clock/qcom,ipq5210-cmn-pll.h b/include/dt-bindings/clock/qcom,ipq5210-cmn-pll.h
new file mode 100644
index 000000000000..191589fd5311
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,ipq5210-cmn-pll.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_IPQ5210_CMN_PLL_H
+#define _DT_BINDINGS_CLK_QCOM_IPQ5210_CMN_PLL_H
+
+/* Parent clock */
+#define IPQ5210_CMN_PLL_CLK		0
+
+/* Fixed-rate clocks */
+#define IPQ5210_XO_24MHZ_CLK		1
+#define IPQ5210_SLEEP_32KHZ_CLK		2
+
+/* Configurable divider clocks */
+#define IPQ5210_NSS_CLK			3
+#define IPQ5210_PPE_CLK			4
+#define IPQ5210_PON_REFCLK		5
+#define IPQ5210_EPHY_RAW_CLK		6
+
+/* Gate clocks */
+#define IPQ5210_PCS_31P25MHZ_CLK	7
+#define IPQ5210_ETH0_50MHZ_CLK		8
+#define IPQ5210_ETH1_50MHZ_CLK		9
+#define IPQ5210_ETH2_50MHZ_CLK		10
+#define IPQ5210_EPHY_50MHZ_CLK		11
+#define IPQ5210_ETH_25MHZ_CLK		12
+
+#endif

-- 
2.43.0

