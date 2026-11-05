Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884083;
	b=k2z328E0IdGYfGuvBQXlGryRQdPvcz64JGEd4mTvMZfypd7S51q1bog/jEmCgOKx8N24
	 8NEhwVH9U1COc/rkZYEyYOslQkg+n2Im3+Y94oRgPEEm39V+Vh/SFub5pO6PEMiyPHk2F
	 zRR9ClG8pNNMC85kbUeP7ei6vTYmQlm+CWoemt7XM5GAxIYSqPpJpX9NxpHvkqswYdnPW
	 RZHOlC2K60RZoeKOVV5fMA2Qxn7McihaKyyjSQk24xurE4wajQCKzjW5KvdNVIZ6ovAPU
	 FKXYvnj0Wy1MnuV9SDB3djswilS37kYMEiRTsilrZupDDROCAmB7MLcMjpIH9nGHYWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884083;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yTGW40gwwxPzKGaZzuQ61MAtSHFXdlURtLrq2mZDOeo=;
	b=UenPTmuPE6YtuZ8Qx8Y+12zciMm+aNDbCuUfhek+UgNBjeFH9cG8GFNgkLcdLPx1VbF7
	 FFBHfBg0LsuEB6CmTAJSsLiz5FdYIG/BFiKdp7x70hYO1asYWqMjmEpTTCI7AApda3OOS
	 c8FxOEzVhxVR/IOTFo6GSUG6L5Mz8fcIiMc9K66U6gefrVOgbpSAvGuO2Z92FnNq1yPDQ
	 fDJMzsuuR5Th+iZ3dfraz74I6lP0sw1hcB2f+8OXaTlgr8Sx0Y79Z/7W1UNUPd9Dp4ZK/
	 vhJnCBC3xAbxhQRPfO3nP4r9vf6wwApvv3825rodNcYXTcIdfPnGcjf2q2UfbiQ95xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eaZzr4ca;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N08j2xod;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B41606A333
	for <linux-clk@vger.kernel.org>; Thu,  5 Nov 2026 13:08:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66B41606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eaZzr4ca;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N08j2xod
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tYa41053390
	for <linux-clk@vger.kernel.org>; Thu, 5 Nov 2026 13:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yTGW40gwwxPzKGaZzuQ61MAtSHFXdlURtLrq2mZDOeo=; b=eaZzr4caNfA80xtp
	g2HsggaQu97xrwVSS20VSQ8gjMwCd5sDmo5XHW8UXEsKgVVjgJuvuTqzutn37+Ef
	C94rOF7ZBUfUMOVrp7s82MyN0agJRballvBhbUcq4+lt3nuQWCb8e9qCy0IVAco9
	u6H2sdFqEecNCdwoW/cltn7Sbgt30zXGEUlbt7KsWrxHJKGxWjZfd4e/s40nk1aC
	k0VLx5JU8dBb35xIsllywrJpD5jCQ7GpSZ9eB3WCn7bMHGUdWut7dGYTFyQ6HrMx
	0yAZ5j5Thy9iHsxe4Jfq+HyIzoiu2f7KUHkJDmiRyCmTO0dTzW0NLa6ih15GvQQa
	q3AtxQ==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrq9f8tya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 05 Nov 2026 13:08:01 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b2fd108b28so27755447b3.1
        for <linux-clk@vger.kernel.org>; Thu, 05 Nov 2026 05:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793884081; x=1794488881; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yTGW40gwwxPzKGaZzuQ61MAtSHFXdlURtLrq2mZDOeo=;
        b=N08j2xods7OqEbTkgctzIPuFCUMrU/paJZfPRGnSKSn+khp2itY3yxzllgIvFOP9jA
         J6oVNXBxl/HYLFwsCNSp83pCHDJeOT+OkKvZy/xyEXMB7HxQg1UJ/lKSoiKTHdRWBfxD
         NLaVYjPXy5GTiQJWnkHTmicHNX2Ss8zEmyPia9XwnPIXM5HpOMUL0gWbzmEOAGgdWAZp
         02gyaWZFELSV5Kk+I0H2dr69KAoO9/khnAkupiIgI7tu7KzJhmeFiIraSl0cCV/idJoh
         QEHpfFrheLZvzumwyaLlDT3ErTF2nxpivrcvBHSaBOU6wkK45ETpgIlrTh2obBsiNHcV
         +giA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793884081; x=1794488881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yTGW40gwwxPzKGaZzuQ61MAtSHFXdlURtLrq2mZDOeo=;
        b=In6hjTymbcX+PO7iF0R54fbS8BbsqO51c6c+bw+SPomoRENMF96ayertPP3WlG2STu
         O+UnmF+L9ZJDyWP4RZThkKeuWvC/TXvCQQPWhTedRIzFzstTW4wZEijfr3KbKoan/+7M
         q8pzkCpJKy2YOP5iRpgRUog6IsY5jCiEVKG8/pJE04D3WZCHFikkff8gauzvdjVBLvGi
         8v8UvbD190X8SaSBC/clMZJXIHnJYAVr6cK7zaqb5H0o/zpOOfYILadJB1MnT1zwt5hH
         C1AOj6J9cc6AbG/26Kk8KnV2lnewPC336L3YahhpWArcXc0vjcOSOsw+6++ICi0Mt8Gw
         xRKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxr26IvrJVWDvaIBICLFadHbvFXXU5ThGuSzgDGdmdgt+7B2+ada2i4faTTOgTEQJCK8mwnSpjeFQ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Xf4LRxTDMO1zhrnD750j+i6yxMD5XlxNEI0EfBgmH269suwWs
	7GlXoXKFb2JpoVDp03B5xk7ztClci6/BtF9EzIBiOhCWZ6/qlH28rU/iBobTJgtRUXzyGx7w9go
	wbJuxbdRcM6PQAnTsbklaS1QLzFyyK7GWtiqfoD6A4N4p58pWFsUYqTozxuhuaqI=
X-Gm-Gg: AYBFou2dW0hYik286M+0IPQtX99zmgBt6sq4qRmC9FmQ8DMWikE84XbEdX3bPzKQvQO
	R1swZxVpB2DcmX/je0m2xKxwP30bdnp2YKt0njCiJZ/ChV35tzCguKL2WeoGzq9l1bBZIZI1kys
	wk9bVsPbu4iNGZngSntwJ5wx3fHocMDdc4IIDEOhHzYK7OB0erLmbgzxKiHC0cUKzz5iOny1Pz2
	pCZQTjll5FSmIY3J+kHU0UgvqIhEGEv66HtT7jkvEK7KG9v7r48MIWObfJKPdvI9QE2NLzLDPuY
	ewSpgyZoxnFZr1UZpQMU5HH5/y/SrHt6nfiTH1nQyNkuh5NQehqTN/FwW1Za1SmpMz5KupxFk5U
	zgZ4FALYEL7unpglDAf31RdSTlP65PCNaeKvG4f8w/YDpNxrfKp54lPvUZgy3R+hqZmEDT+GIfl
	oN/RU3hFuitoLB14pU
X-Received: by 2002:a05:690c:e3c3:b0:8ab:42fd:2cc2 with SMTP id 00721157ae682-8b2b65acc18mr115156027b3.3.1793884080900;
        Thu, 05 Nov 2026 05:08:00 -0800 (PST)
X-Received: by 2002:a05:690c:e3c3:b0:8ab:42fd:2cc2 with SMTP id 00721157ae682-8b2b65acc18mr115155817b3.3.1793884080451;
        Thu, 05 Nov 2026 05:08:00 -0800 (PST)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b309bb4406sm38915937b3.40.2026.11.05.05.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:08:00 -0800 (PST)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 05:07:14 -0800
Subject: [PATCH 3/5] arm64: dts: qcom: ipq5210: Add CMN PLL device node
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
Message-Id: <20261105-qcom_ipq5210_nsscc-v1-3-d4fcb5c32b51@oss.qualcomm.com>
References: <20261105-qcom_ipq5210_nsscc-v1-0-d4fcb5c32b51@oss.qualcomm.com>
In-Reply-To: <20261105-qcom_ipq5210_nsscc-v1-0-d4fcb5c32b51@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, netdev@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793884066; l=3090;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=zgBS2poww2eN6YQuXDkYZD4TT7J8e+5Ik+8ytF15e2I=;
 b=UdIpfLGICBaQV6HoxWOkTqQoES5p9W316Z1SYI826I/noIEYzLwWuMevLT5YLOFBisc173p9/
 f8meW0iEpsyAG172l8qgabRvvW8HrrZtom6UnsPuWtdEZYVeBI6hdLi
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MiBTYWx0ZWRfXyPdYl/bRZs9l
 pOFsBOrbe5855Kpe7Dkl/trdaxPylICi7ScJ6xTYD+YzRlXnq5GM87oIdgCVrak6qjbLkzzbn8o
 7TtGd6+Va7LA1hrb+ZLOq5+NNLRPg0A1Ia3H+3ZdQJM0YHivZYxfIexSfq7pUC20PXqDD4Jnlqt
 37T2ScbgCK6jtIePMo3XcG097Qkx5Setzx7wv8gia5aaIlwmQdpB9qbUa3a2hpnUsXdVGSrzglg
 gSTJW1i2BX1yvlayY9D8Fc9cmmAK1CJQtDXlbeIWZKJo2YJPxiqLiPGIrEhxMC+SivFE1rBPA2U
 wXg/AKZjIw8g3Qf9IZd3tc/uSkYCqmeeQ/nA77wu3QobZrr4OrtcjNW2nie3ExUvGMKaCXqE/uS
 aLUJQI22bTNxRQEo1oKppxQ22fgBS+ieIBCJb4ePynNSlkkmQE2IRnyD2x6Qm3A6tGTtdoHZi3i
 q4TX4QyfW1+ZamDvPeQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MiBTYWx0ZWRfX/Kz7Ke6u0zeu
 u0xNiYFFFqrkVuoQy0SW2ZYflE/R/hoL5qkcYrhnWupfudR7l98xcsFErsmVX/5XiS384WiZuv5
 AFPIa4DZZgtbFsWbLHyWiy7hFXnEP6c=
X-Authority-Analysis: v=2.4 cv=Vdhir1p9 c=1 sm=1 tr=0 ts=6aec7fb1 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ihdlGfXGyWBHLSVGZBMA:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-ORIG-GUID: 5UlbLpg2RIuPog_mXFQNcMge2ZDoU9xD
X-Proofpoint-GUID: 5UlbLpg2RIuPog_mXFQNcMge2ZDoU9xD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050052

Add CMN PLL node for enabling output clocks to the networking hardware
blocks on IPQ5210 devices.

The reference clock of CMN PLL is routed from XO to the CMN PLL through
the WiFi block.
XO (48 MHz or 96 MHz or 192 MHz)-->WiFi (multiplier/divider)--> 48 MHz
to CMN PLL.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts | 15 +++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi       | 26 +++++++++++++++++++++++++-
 2 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
index 941f866ecfe9..61a53361138b 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
@@ -20,6 +20,17 @@ chosen {
 	};
 };
 
+/*
+ * The bootstrap pins for the board select the XO clock frequency that
+ * supports 48 MHz, 96 MHz or 192 MHz. This setting automatically
+ * enables the right dividers, to ensure the reference clock output
+ * from WiFi to the CMN PLL is 48 MHz.
+ */
+&ref_48mhz_clk {
+	clock-div = <1>;
+	clock-mult = <1>;
+};
+
 &sdhc {
 	max-frequency = <192000000>;
 	bus-width = <4>;
@@ -77,3 +88,7 @@ &uart1 {
 &xo_board {
 	clock-frequency = <24000000>;
 };
+
+&xo_clk {
+	clock-frequency = <48000000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 2cdc10529c48..52d851a0dc2b 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -3,8 +3,9 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
-#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,ipq5210-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq5210-gcc.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/reset/qcom,ipq5210-gcc.h>
 
 / {
@@ -13,6 +14,12 @@ / {
 	interrupt-parent = <&intc>;
 
 	clocks {
+		ref_48mhz_clk: ref-48mhz-clk {
+			compatible = "fixed-factor-clock";
+			clocks = <&xo_clk>;
+			#clock-cells = <0>;
+		};
+
 		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
@@ -22,6 +29,11 @@ xo_board: xo-board-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 		};
+
+		xo_clk: xo-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+		};
 	};
 
 	cpus {
@@ -130,6 +142,18 @@ soc@0 {
 		dma-ranges = <0 0 0 0 0x10 0>;
 		ranges = <0 0 0 0 0x10 0>;
 
+		cmn_pll: clock-controller@9b000 {
+			compatible = "qcom,ipq5210-cmn-pll";
+			reg = <0x0 0x0009b000 0x0 0x800>;
+			clocks = <&ref_48mhz_clk>,
+				 <&gcc GCC_CMN_12GPLL_AHB_CLK>,
+				 <&gcc GCC_CMN_12GPLL_SYS_CLK>;
+			clock-names = "ref", "ahb", "sys";
+			#clock-cells = <1>;
+			assigned-clocks = <&cmn_pll IPQ5210_CMN_PLL_CLK>;
+			assigned-clock-rates-u64 = /bits/ 64 <12000000000>;
+		};
+
 		tlmm: pinctrl@1000000 {
 			compatible = "qcom,ipq5210-tlmm";
 			reg = <0x0 0x01000000 0x0 0x300000>;

-- 
2.43.0

