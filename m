Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F4C45199C
	for <linux-clk@vger.kernel.org>; Fri,  7 Aug 2026 06:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786085618; cv=none; b=D4zEgsTwlBWV7/KhsVhe0PLok4gLVpW88qZ3F2gSZkXFM1WjbO2GsQfOrlLyXskiFl3K+6bgWeRSOLHbZP7ykp5M9Xna6aMlV6/7xDsPvMsxGfc4yirlSbzHDSEtYoKFdVmQ2IG3Z7kaAjoc0b4S6tSKYVtMcqEtRCTwrCtVlDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786085618; c=relaxed/simple;
	bh=V2LE+NwuFXN0cjRJA7Vyc2pkfcmXnw9zsL1vcr1nI9Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FZlmYRsRiUuafV4zS/PlU7eUYPkpgFdxUgssr6QjdeIJrFUF0d28A0WiibNC1/1o0i9qtWKhwh6cx4Bn8rozPbs5XaKNPGc5/JDE8cH8U6TeNSN5EODo7XndD/mPwK+7W5kMCEBv8wj5kg2EWiLWTAeYhFbMiQhzmjTMmwKYVKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cYafjD2D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LNf4sBYU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cYafjD2D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LNf4sBYU"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6770H4jm493694
	for <linux-clk@vger.kernel.org>; Fri, 7 Aug 2026 06:53:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hy3VGr38FFud6JTrVuMWmfRODjr5RStWSJZ1LeZ+Q+c=; b=cYafjD2Dv9W/BCgt
	dBU8d6SuFWCmFBnmz8TjEv1n0WxnGNWGoK9sl7jRzGrqDwvqeUZQ1NIwfqU2cPVn
	61g76MZSihHQOmDBur15soq1Vn5Ubggj8ZbzETjKB16t3JSnT3jrHhCLDL0MfyIm
	dIK89KjLAAmCXAOL7RIEskoyPBIa9d8+OPMGtQFOyl17CyWvbCOls+7BwmcSqDPl
	wkVL3tEmq3xMSNTDFFvflecheLI7b9qq8XtdYnrRmgiCRRWXGWvbFA4Rs7XEH2bS
	LpCz2S719wLaH/2KoCM3wKUdcC3t1O9KC1EiOHmLJqt7uM6b7sMny6rdbnVoNAnU
	aMZNIg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6raky3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 07 Aug 2026 06:53:35 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85798977dcso4469267a12.0
        for <linux-clk@vger.kernel.org>; Thu, 06 Aug 2026 23:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786085615; x=1786690415; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hy3VGr38FFud6JTrVuMWmfRODjr5RStWSJZ1LeZ+Q+c=;
        b=LNf4sBYUbzjST2/oj3d5YfRDZ8VC+0n08ptqe/32mRN7j18nOqpIKUqFVOeU8yjSdB
         hWM/pCw8gVjgmrf8Yc3+ZbpURXlMJk4wRqwegvAVrag9Mb8u+GjYPUjCK8FtYr46BI5l
         zXLBacxi9ucCpEVQyDZsmN3Bl5AuuJb4sEgYq7WYTZ7OXUhFvcLGh+tqYxPS/s9ek7XL
         fI7IeFo6FenZmlgJUPbvKoMArQQAIk3OX+w5+4Vw5zSRquSZFVNc0KLLQhvK7eybpj6D
         /xWsFoG7+fCIYmCHDbYJGYmSs4LUGwQQ2xCqjb9j9qs97xNSoH9jHWpxSNqxNy/AXNAM
         hWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786085615; x=1786690415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hy3VGr38FFud6JTrVuMWmfRODjr5RStWSJZ1LeZ+Q+c=;
        b=GQygibN7PJg2XvgM1e70UrGmb/p7ZpVKQ8pOeerMdkhunt2lDQlF+l7L6MLehYjc/K
         AOTm5uLFbtpDBSRtc+lIDuKXl6FruCo57wC6EG2z/QMMbQt9HkgSgysMZXN7nyozpC2q
         /7f1SZdr6si8ynFWMgmwN1UkKcV7MG2Gulo8n4LlvkD7PO0VApg8MLnn7trUzpABe/68
         +eaF64vmlaXUMIirQCzwUWFi6tNCDfEZvf8n+lITHjOJTfud4sQ1ttHjcJ+ONJL1OWZ2
         U/O8NuipwWMI4qP4BTQ7AYDM3J7QyzYHbKynlRNFpz0/jYZXIIxW4uy8Y/bQD3+TRWKN
         OhOw==
X-Forwarded-Encrypted: i=1; AHgh+RqyBu0XBxvmwWgopIZb02azRKJj7Jwg0wPZYjiiMZsPf6KjhZRLG+pDZKmAtN/bZKeDoAC6u8nTv9w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9yXntAR0unRnDGd1Mn4d1iuqws7n6w5hdd6GvZtJYu8i7b4p8
	dI1+OHW5IDuBKsCqJhOvMVfC0ZDzk2vI2S4mNtwL9ESevKjPA47zIRjPYwbdnVdJAon1Xq/Kndp
	ijedLXQxZbQ2Kx5TdctgHF7uJ1stUJReWYMuOStUmqV4zyjcYcA3kOjTmVR6e6Ok=
X-Gm-Gg: AR+sD11BSeOVaoVXhwaYr9MxfOht+2oU6Y5yzP9V6QL5uY6wpgLQzFTBNTyZnGFeAfC
	gNcFGEX6kuWaVpZP/S+MUyIxoTiNy5qx0h4SMFE5yk6Yi+amA1vLtw4YF7CTVcFYDk6Qy9mO/7t
	mkwEAyTzh8uS9L2H20HSFipLM5RPjdIORtGpLkO2KOAs55Bfnk+Bma79pjmm+y1odvvYSFVkywT
	BgDKEBcYV8IfqESPQhFgJwXgrolQIV/Crfu9KgrRzFsYQbtbW70X7KSaXQDRxMmtMPq14xZSFqb
	qmgWeFOqsAZxlNaRJxQfEXQN8dxchJZV3oRWVrNvfwfuGEnHjrH+k5eUqxkB/gd+6aisTHX4e8s
	CLsCX9zph9FjA/Acy5yy9c1Vy7S6MgAmuuJ5hFadw2sU=
X-Received: by 2002:a05:6a00:4c92:b0:848:2f2c:b2c8 with SMTP id d2e1a72fcca58-84f2e0090ffmr24220648b3a.24.1786085614746;
        Thu, 06 Aug 2026 23:53:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c92:b0:848:2f2c:b2c8 with SMTP id d2e1a72fcca58-84f2e0090ffmr24220591b3a.24.1786085614270;
        Thu, 06 Aug 2026 23:53:34 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f19842bsm223493a12.4.2026.08.06.23.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:53:33 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 23:53:15 -0700
Subject: [PATCH v2 11/12] arm64: dts: qcom: ipq5210: Add CMN PLL device
 node
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-qcom_ipq5210_cmnpll-v2-11-cce718b8ec17@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786085595; l=2863;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=V2LE+NwuFXN0cjRJA7Vyc2pkfcmXnw9zsL1vcr1nI9Y=;
 b=3solTxtwKwZ9MfI5xqNFsBZ8RRz17AAt/zZQ8GwcDLzXcoiPS0MR1grCB/wk1PYZm+ikEFEYc
 sZJn8HT+auLCBhg2YpADTmKEC//vNfew4CYLDCFjkyoJxNXrl0YQjR/
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA1MCBTYWx0ZWRfXxWBlAckJETdr
 v3VzzzROM6EhCMC/E5Q9TvsQahNm/rl76R90oE0mk4c3jfZfHz7R+xrNwPhWR2bslUuyImRGFtV
 Yhbw791Q65Z5Ejrh5ZgjoO8TWpGm84wfdmNcGqhvNRqY83I06Mae6b40b4Rrrw28s89E52qe+ht
 buH0MzzZIQdl0Z8qrIwy/SO33zSQNqG5bxvYNUMy1PoX8ahwXBbIb7axvLq1Kv3qI98it5reTxL
 XF1F9Wlsk6Syj0wJXm2Ay0gfzAhg3zTlHWzgcm/fvfPva5zV/cet+otMmlTpEEFGSylVoqCmrtp
 LYqedaAvZ8qKC4Gw5FbTkgEoct4mJmv3Mu2l9mT81e/eX4LTcxAgM1xF8LoXyvdOeuMahOzCabw
 oXd5EC0f5hymMmaG+aGJdjmGIj1U0IcP4I44A1s+DVhSOj+JgYct3FdGDhzgNbwZs2XCI+q7X6U
 emPh0yCBi9q3VP77H6g==
X-Authority-Analysis: v=2.4 cv=HPXz0Itv c=1 sm=1 tr=0 ts=6a7580ef cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ihdlGfXGyWBHLSVGZBMA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: vbu9HU53jJOfvcWezb0TOLZy0-TbnmE4
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA1MCBTYWx0ZWRfX1DcURWvL+RS0
 UPmWCL8u66vB6s28RsgXfVRQQVPLh5vXJ3lLM9CEn0ULGAaAIZGYmFNrdpQZ1Iv/+AbLUT/6Zwx
 chA8EvzkNoAdwzZ9vmlbobYBQpcY5MU=
X-Proofpoint-GUID: vbu9HU53jJOfvcWezb0TOLZy0-TbnmE4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070050

Add CMN PLL node for enabling output clocks to the networking
hardware blocks on IPQ5210 devices.

The reference clock of CMN PLL is routed from XO to the CMN PLL
through the WiFi block.
XO (48 MHZ or 96 MHZ or 192 MHZ)-->WiFi (multiplier/divider)-->
48 MHZ to CMN PLL.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts | 15 +++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi       | 24 ++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
index 941f866ecfe9..7410d092814e 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
@@ -74,6 +74,21 @@ &uart1 {
 	status = "okay";
 };
 
+/*
+ * The bootstrap pins for the board select the XO clock frequency that
+ * supports 48 MHZ, 96 MHZ or 192 MHZ. This setting automatically
+ * enables the right dividers, to ensure the reference clock output
+ * from WiFi to the CMN PLL is 48 MHZ.
+ */
+&ref_48mhz_clk {
+	clock-div = <1>;
+	clock-mult = <1>;
+};
+
 &xo_board {
 	clock-frequency = <24000000>;
 };
+
+&xo_clk {
+	clock-frequency = <48000000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 2cdc10529c48..7025bdd9036e 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,ipq5210-gcc.h>
+#include <dt-bindings/clock/qcom,ipq5210-cmn-pll.h>
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

